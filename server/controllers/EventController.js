import EventModel from "../models/Event.js";
import {ObjectId} from "mongodb";

export const create = async (req, res) => {
    try {
        const idCreator = req.userId;
        const doc = new EventModel({
            idCreator: idCreator, users: [{
                id: idCreator, date: Date.now(),
            }], ...req.body,
        });

        const event = await doc.save();

        return res.json(event);

    } catch (e) {
        console.log('failed to create event', e);
        res.status(500).json({
            message: 'failed to create event',
        });
    }
}

export const update = async (req, res) => {
    try {
        const userId = req.userId;
        const eventId = req.body._id;
        const event = await EventModel.findById(eventId);

        if (!event) {
            return res.status(404).json({
                message: 'event not found',
            });
        }

        if (userId !== event.idCreator.toString()) {
            return res.status(403).json({
                message: 'not access',
            });
        }

        const {_id, ...options} = req.body;

        console.log(options);


        let usersWhoWantToJoin = [];
        if (options.entryAfterAdminApproval) {
            usersWhoWantToJoin = event.usersWhoWantToJoin;
        }

        const updateEvent = await EventModel.findByIdAndUpdate(eventId, {
            name: options.name,
            description: options.description,
            date: options.date,
            appearInSearch: options.appearInSearch,
            showAllMessage: options.showAllMessage,
            entryAfterAdminApproval: options.entryAfterAdminApproval,
            tags: options.tags,
            idPinnedMessages: options.idPinnedMessages,
            geotag: options.geotag,
            usersWhoWantToJoin: usersWhoWantToJoin,
        }, {
            returnDocument: "after",
        }).populate('tags').exec();
        // .populate('users.id')

        if (!updateEvent) {
            return res.status(404).json({
                message: 'update is not found'
            });
        }

        return res.json(updateEvent);

    } catch (e) {
        console.log('server error', e);
        return res.status(500).json({
            message: 'server error',
        });
    }
}

export const getById = async (req, res) => {
    try {
        const id = req.params.id;
        const userId = req.userId;
        const event = await EventModel.findById(id);
        if (!event) {
            return res.status(404).json({
                message: 'event is not found'
            });
        }

        if (isEventCreator(userId, event)) {
            return res.json(event);
        }

        console.log(event);

        if (event.users.some(e => e.id.toString() === userId)) {
            return res.json(eventInformationForUser(event._doc));
        }

        return res.status(403).json({
            message: 'no access',
        });

    } catch (e) {
        console.log('error getting event data', e);
        return res.status(500).json({
            message: 'error getting event data',
        });
    }
}

export const getAllUserEvents = async (req, res) => {
    try {
        const userId = ObjectId(req.userId);

        console.log(userId);
        const events = await EventModel.find({
            users: {
                $elemMatch: {
                    id: userId
                }
            }
        });

        if (!events) {
            return res.status(404).json({
                message: 'events not found',
            });
        }

        return res.json(events.map(e => eventInformationForUser(e._doc)));

    } catch (e) {
        console.log('error getting event all user events', e);
        return res.status(500).json({
            message: 'error getting event all user events',
        });
    }
}

export const addUsers = async (req, res) => {
    try {
        const userId = req.userId;
        const eventId = req.body.id;
        const users = req.body.users;
        const event = await EventModel.findById(eventId);

        if (!event) {
            return res.status(404).json({
                message: 'events not found',
            });
        }


        if (!isEventCreator(userId, event)) {
            return res.status(403).json({
                message: 'no access',
            });
        }

        if (usersAreOnWaitingList(users, event.usersWhoWantToJoin)) {
            const newEvent = await EventModel.findByIdAndUpdate(eventId, {
                $pullAll: {usersWhoWantToJoin: users},
                $push: {
                    users: users.map(user => ({
                        id: user
                    }))
                },
            }, {
                returnDocument: 'after',
            })

            if (!newEvent) {
                return res.status(500).json({
                    message: 'server error',
                });
            }

            return res.json(newEvent);
        }

        return res.status(400).json({
            message: 'some users are not on the waiting list',
        });


    } catch (e) {
        console.log('server error', e);
        return res.status(500).json({
            message: 'server error',
        });
    }
}

export const removeUsers = async (req, res) => {
    try {
        const userId = req.userId;
        const eventId = req.body.id;
        const users = req.body.users;
        const event = await EventModel.findById(eventId);

        if (!event) {
            return res.status(404).json({
                message: 'events not found',
            });
        }


        if (!isEventCreator(userId, event)) {
            return res.status(403).json({
                message: 'no access',
            });
        }

        if (usersAreOnMemberEvent(users, event)) {
            const newEvent = await EventModel.findByIdAndUpdate(eventId, {
                $pullAll: {
                    users: usersWithDateAndLastDateInChat(users, event),
                },
            }, {
                returnDocument: 'after',
            })

            if (!newEvent) {
                return res.status(500).json({
                    message: 'server error',
                });
            }

            return res.json(newEvent);
        }

        return res.status(400).json({
            message: 'some users are not on the waiting list',
        });


    } catch (e) {
        console.log('server error', e);
        return res.status(500).json({
            message: 'server error',
        });
    }
}

export const joinToEvent = async (req, res) => {
    try {
        const userId = req.userId;
        const eventId = req.params.id;
        const event = await EventModel.findById(eventId);


        if (!event) {
            return res.status(404).json({
                message: 'event not found',
            });
        }

        if (userIsMemberEvent(userId, event)) {
            return res.status(400).json({
                message: 'you are already a member of this event',
            });
        }

        if (event.entryAfterAdminApproval) {
            const newEvent = await EventModel.findByIdAndUpdate(eventId, {
                $push: {usersWhoWantToJoin: userId},
            }, {
                returnDocument: 'after',
            })

            if (!newEvent) {
                return res.status(500).json({
                    message: 'server error',
                });
            }

            return res.status(202).json({
                message: 'application for membership accepted',
            });
        }

        const newEvent = await EventModel.findByIdAndUpdate(eventId, {
            $push: {
                users: {
                    id: userId
                }
            },
        }, {
            returnDocument: 'after',
        })

        if (!newEvent) {
            return res.status(500).json({
                message: 'server error',
            });
        }

        return res.json(eventInformationForUser(newEvent._doc));


    } catch (e) {
        console.log('server error', e);
        return res.status(500).json({
            message: 'server error',
        });
    }
}

export const leaveToEvent = async (req, res) => {
    try {
        const userId = req.userId;
        const eventId = req.params.id;
        const event = await EventModel.findById(eventId);


        if (!event) {
            return res.status(404).json({
                message: 'event not found',
            });
        }

        if (!userIsMemberEvent(userId, event)) {
            return res.status(403).json({
                message: 'no access',
            });
        }

        const newEvent = await EventModel.findByIdAndUpdate(eventId, {
            $pull: {
                users: {
                    id: userId
                }
            },
        }, {
            returnDocument: 'after',
        })

        if (!newEvent) {
            return res.status(500).json({
                message: 'server error',
            });
        }

        return res.json(200);


    } catch (e) {
        console.log('server error', e);
        return res.status(500).json({
            message: 'server error',
        });
    }
}



const eventInformationForUser = (event) => {
    const {appearInSearch, showAllMessage, entryAfterAdminApproval, usersWhoWantToJoin, ...e} = event;

    return e;
}

const isEventCreator = (userId, event) => {
    return userId === event.idCreator.toString();
}

const userIsMemberEvent = (userId, event) => {
    return event.users.some(e => e.id.toString() === userId);
}

const usersAreOnMemberEvent = (users, event) => {
    for (const userId of users) {
        const contain = userIsMemberEvent(userId, event);
        if (!contain) {
            return false;
        }
    }
    return true;
}

const getUserWithDateAndLastDateInChat = (userId, users) => {
    for (const user of users) {
        if (userId === user.id.toString()) {
            return (user);
        }
    }
}

const usersWithDateAndLastDateInChat = (users, event) => {
    return users.map(userId => getUserWithDateAndLastDateInChat(userId, event.users));
}

const usersAreOnWaitingList = (users, waitList) => {
    for (const user of users) {
        const contain = waitList.some(u => u.toString() === user);
        if (!contain) {
            return false;
        }
    }

    return true;
}

