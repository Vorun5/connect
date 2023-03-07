import { Event } from '../models/index.js'
import { ObjectId } from 'mongodb'

export const getStatistic = async (req, res) => {
    try {
        let docs = await Event.aggregate().group({
            _id: '$entryAfterAdminApproval',
            count: { $sum: 1 },
        })
        const result = docs.map((el) => ({
            entryAfterAdminApproval: el._id,
            count: el.count,
        }))

        res.json(result)
    } catch (e) {
        console.log('failed to get statistic', e)
        res.status(500).json({
            message: 'failed to get statistic',
        })
    }
}

export const create = async (req, res) => {
    try {
        const idCreator = req.userId
        const doc = await new Event({
            idCreator: idCreator,
            numberOfParticipants: 1,
            users: [
                {
                    user: idCreator,
                    date: Date.now(),
                },
            ],
            ...req.body,
        }).populate(['users.user', 'tags'])

        const event = await doc.save()

        return res.json(event)
    } catch (e) {
        console.log('failed to create event', e)
        res.status(500).json({
            message: 'failed to create event',
        })
    }
}

export const find = async (req, res) => {
    try {
        const s = req.params.string
        console.log(s)
        const events = await Event.find({
            name: new RegExp(s, 'i'),
        }).populate(['users.user', 'tags'])

        if (!events) {
            return res.status(404).json({
                message: 'events not found',
            })
        }

        return res.json(events.map((e) => previewEventInformation(e._doc)))
    } catch (e) {
        console.log('failed to find events', e)
        return res.status(500).json({
            message: 'failed to find events',
        })
    }
}

export const remove = async (req, res) => {
    try {
        const userId = req.userId
        const eventId = req.params.id
        const event = await Event.findById(eventId)

        if (!event) {
            return res.status(404).json({
                message: 'event not found',
            })
        }

        if (userId !== event.idCreator.toString()) {
            return res.status(403).json({
                message: 'not access',
            })
        }

        const { _id, ...options } = req.body

        let usersWhoWantToJoin = []
        if (options.entryAfterAdminApproval) {
            usersWhoWantToJoin = event.usersWhoWantToJoin
        }

        const result = await Event.findByIdAndDelete(eventId)
        if (result) {
            return res.json(200)
        }
        return res.status(500).json({
            message: 'failed to delete event',
        })
    } catch (e) {
        console.log('server error', e)
        return res.status(500).json({
            message: 'server error',
        })
    }
}

export const update = async (req, res) => {
    try {
        const userId = new ObjectId(req.userId)
        const eventId = req.body.id
        const event = await Event.findById(eventId)

        if (!event) {
            return res.status(404).json({
                message: 'event not found',
            })
        }

        if (!isEventCreator(userId, event)) {
            return res.status(403).json({
                message: 'not access',
            })
        }

        const { id, ...options } = req.body

        let usersWhoWantToJoin = []
        if (options.entryAfterAdminApproval) {
            usersWhoWantToJoin = event.usersWhoWantToJoin
        }

        const updateEvent = await Event.findByIdAndUpdate(
            eventId,
            {
                name: options.name,
                description: options.description,
                entryAfterAdminApproval: options.entryAfterAdminApproval,
                tags: options.tags,
                imageUrl: options.imageUrl,
                usersWhoWantToJoin: usersWhoWantToJoin,
            },
            {
                returnDocument: 'after',
            },
        )
            .populate(['users.user', 'tags'])
            .exec()

        if (!updateEvent) {
            return res.status(404).json({
                message: 'update is not found',
            })
        }

        return res.json(updateEvent)
    } catch (e) {
        console.log('server error', e)
        return res.status(500).json({
            message: 'server error',
        })
    }
}

export const getById = async (req, res) => {
    try {
        const id = req.params.id
        const userId = ObjectId(req.userId)
        const event = await Event.findById(id).populate([
            'users.user',
            'tags',
            'usersWhoWantToJoin',
        ])
        if (!event) {
            return res.status(404).json({
                message: 'event is not found',
            })
        }

        if (isEventCreator(userId, event)) {
            return res.json(event._doc)
        }
        if (
            event.users.some((user) => {
                return user.user._id.toString() === userId.toString()
            })
        ) {
            return res.json(eventInformationForUser(event._doc))
        }

        return res.status(403).json({
            message: 'no access',
        })
    } catch (e) {
        console.log('error getting event data', e)
        return res.status(500).json({
            message: 'error getting event data',
        })
    }
}

export const getAllUserEvents = async (req, res) => {
    try {
        const userId = ObjectId(req.userId)
        const events = await Event.find({
            users: {
                $elemMatch: {
                    user: userId,
                },
            },
        }).populate(['users.user', 'tags'])

        if (!events) {
            return res.status(404).json({
                message: 'events not found',
            })
        }

        return res.json(events.map((e) => previewEventInformation(e._doc)))
    } catch (e) {
        console.log('error getting event all user events', e)
        return res.status(500).json({
            message: 'error getting event all user events',
        })
    }
}

export const getTopEvents = async (req, res) => {
    try {
        const top = await Event.aggregate([
            {
                $project: {
                    count: {
                        $cond: {
                            if: { $isArray: '$users' },
                            then: { $size: '$users' },
                            else: '0',
                        },
                    },
                },
            },
        ])
            .sort({ count: -1 })
            .limit(5)

        let result = []
        for (const topItem of top) {
            const event = await Event.findById(topItem._id).populate(['tags'])
            result.push({
                ...event._doc,
                userCount: topItem.count,
            })
        }

        return res.json(result)
    } catch (e) {
        console.log('server error', e)
        return res.status(500).json({
            message: 'server error',
        })
    }
}

export const addUsers = async (req, res) => {
    try {
        const userId = new ObjectId(req.userId)
        const eventId = req.body.id
        const users = req.body.users
        const event = await Event.findById(eventId)

        if (!event) {
            return res.status(404).json({
                message: 'events not found',
            })
        }

        if (!isEventCreator(userId, event)) {
            return res.status(403).json({
                message: 'no access',
            })
        }

        if (usersAreOnWaitingList(users, event.usersWhoWantToJoin)) {
            const newEvent = await Event.findByIdAndUpdate(
                eventId,
                {
                    $pullAll: { usersWhoWantToJoin: users },
                    $push: {
                        users: users.map((user) => ({
                            user: user,
                        })),
                    },
                },
                {
                    returnDocument: 'after',
                },
            )

            if (!newEvent) {
                return res.status(500).json({
                    message: 'server error',
                })
            }

            return res.json(newEvent)
        }

        return res.status(400).json({
            message: 'some users are not on the waiting list',
        })
    } catch (e) {
        console.log('server error', e)
        return res.status(500).json({
            message: 'server error',
        })
    }
}

export const removeUsers = async (req, res) => {
    try {
        const userId = ObjectId(req.userId)
        const eventId = req.body.id
        const users = req.body.users
        const event = await Event.findById(eventId)

        if (!event) {
            return res.status(404).json({
                message: 'events not found',
            })
        }

        if (!isEventCreator(userId, event)) {
            return res.status(403).json({
                message: 'no access',
            })
        }

        if (usersAreOnMemberEvent(users, event)) {
            const newEvent = await Event.findByIdAndUpdate(
                eventId,
                {
                    $pullAll: {
                        users: usersWithDateAndLastDateInChat(users, event),
                    },
                },
                {
                    returnDocument: 'after',
                },
            )

            if (!newEvent) {
                return res.status(500).json({
                    message: 'server error',
                })
            }

            return res.json(newEvent)
        }

        return res.status(400).json({
            message: 'some users are not on events',
        })
    } catch (e) {
        console.log('server error', e)
        return res.status(500).json({
            message: 'server error',
        })
    }
}

export const joinToEvent = async (req, res) => {
    try {
        const userId = ObjectId(req.userId)
        const eventId = req.params.id
        const event = await Event.findById(eventId)
        if (!event) {
            return res.status(404).json({
                message: 'event not found',
            })
        }
        if (event.idCreator == userId || userIsMemberEvent(userId, event)) {
            return res.status(400).json({
                message: 'you are already a member of this event',
            })
        }
        if (event.entryAfterAdminApproval) {
            if (
                event.usersWhoWantToJoin.some(
                    (u) => u.toString() === userId.toString(),
                )
            ) {
                return res.status(400).json({
                    message:
                        'you are already a member in wait list of this event',
                })
            }
            const newEvent = await Event.findByIdAndUpdate(
                eventId,
                {
                    $push: { usersWhoWantToJoin: userId },
                },
                {
                    returnDocument: 'after',
                },
            )

            if (!newEvent) {
                return res.status(500).json({
                    message: 'server error',
                })
            }

            return res.status(202).json({
                message: 'application for membership accepted',
            })
        }

        const newEvent = await Event.findByIdAndUpdate(
            eventId,
            {
                $push: {
                    users: {
                        user: userId,
                    },
                },
            },
            {
                returnDocument: 'after',
            },
        )

        if (!newEvent) {
            return res.status(500).json({
                message: 'server error',
            })
        }

        return res.json(previewEventInformation(newEvent._doc))
    } catch (e) {
        console.log('server error', e)
        return res.status(500).json({
            message: 'server error',
        })
    }
}

export const leaveFromEvent = async (req, res) => {
    try {
        const userId = new ObjectId(req.userId)
        const eventId = req.params.id
        const event = await Event.findById(eventId)

        if (!event) {
            return res.status(404).json({
                message: 'event not found',
            })
        }

        if (!userIsMemberEvent(userId, event)) {
            return res.status(403).json({
                message: 'no access',
            })
        }

        const newEvent = await Event.findByIdAndUpdate(
            eventId,
            {
                $pull: {
                    users: {
                        user: userId,
                    },
                },
            },
            {
                returnDocument: 'after',
            },
        )

        if (!newEvent) {
            return res.status(500).json({
                message: 'server error',
            })
        }

        return res.json(200)
    } catch (e) {
        console.log('server error', e)
        return res.status(500).json({
            message: 'server error',
        })
    }
}

// UTILS
const eventInformationForUser = (event) => {
    const { usersWhoWantToJoin, ...e } = event
    e.usersWhoWantToJoin = []
    e.unreadMessages = 39

    return e
}

const previewEventInformation = (event) => {
    const {
        appearInSearch,
        showAllMessage,
        usersWhoWantToJoin,
        users,
        idCreator,
        ...e
    } = event
    if (users.length < 3) {
        e.users = users
    } else {
        e.users = users.slice(2)
    }

    e.userCount = users.length

    return e
}

const isEventCreator = (userId, event) => {
    return userId.toString() === event.idCreator.toString()
}

const userIsMemberEvent = (userId, event) => {
    return event.users.some((e) => {
        return e.user.toString() === userId.toString()
    })
}

const usersAreOnMemberEvent = (users, event) => {
    for (const userId of users) {
        const contain = userIsMemberEvent(userId, event)
        if (!contain) {
            return false
        }
    }
    return true
}

const getUserWithDateAndLastDateInChat = (userId, users) => {
    for (const user of users) {
        if (userId.toString() === user.user.toString()) {
            return user
        }
    }
}

const usersWithDateAndLastDateInChat = (users, event) => {
    return users.map((userId) =>
        getUserWithDateAndLastDateInChat(userId, event.users),
    )
}

const usersAreOnWaitingList = (users, waitList) => {
    for (const user of users) {
        const contain = waitList.some((u) => u.toString() === user)
        if (!contain) {
            return false
        }
    }

    return true
}
