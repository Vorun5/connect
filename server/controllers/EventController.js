import EventModel from "../models/Event.js";
import  {ObjectId} from "mongodb";

export const create = async (req, res) => {
    try {
        const idCreator = req.userId;
        const idCreatorObj = ObjectId(idCreator);
        const doc = new EventModel({
            idCreator: idCreator,
            users: [{
                id: idCreator,
                date: Date.now(),
            }],
            ...req.body,
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

        const updateEvent = await EventModel.findByIdAndUpdate(eventId, {
            options
        }, {
            returnDocument: "after",
        })

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

        if (event.idCreator.toString() === userId) {
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
        const events = await EventModel.find({users: {$elemMatch: {
            id: userId
        }}});

        if (!events) {
            return res.status(404).json({
                message: 'events not found',
            });
        }

        return  res.json(events.map(e => eventInformationForUser(e._doc)));

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

        const event = await EventModel.findById(req.body.id);

        if (!event) {
            return res.status(404).json({
                message: 'events not found',
            });
        }

        console.log(event);

        if (userId !== event.idCreator.toString()) {
            return res.status(403).json({
                message: 'not access',
            });
        }

        const usersWhoWantToJoin = event.usersWhoWantToJoin;

        console.log(usersWhoWantToJoin);

        res.status(200);

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
