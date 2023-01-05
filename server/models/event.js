import mongoose from 'mongoose'

const Event = new mongoose.Schema({
        idCreator: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },
        name: {
            type: String,
            required: true,
        },
        imageUrl: String,
        description: String,
        date: Date,
        appearInSearch: {
            type: Boolean,
            default: true,
        },
        showAllMessage: {
            type: Boolean,
            default: true,
        },
        idPinnedMessages: {
            type: Array,
            of: mongoose.Schema.Types.ObjectId,
            ref: 'EventMessage',
        },
        entryAfterAdminApproval: {
            type: Boolean,
            default: false,
        },
        usersWhoWantToJoin: {
            type: Array,
            of: mongoose.Schema.Types.ObjectId,
            ref: 'User',
        },
        users: {
            type: Array,
            of: {
                _id: false,
                // TODO: переименовать поле id в user
                id: {
                    type: mongoose.Schema.Types.ObjectId,
                    ref: 'User',
                    required: true,
                },
                date: {
                    type: Date,
                    default: Date.now,
                },
                lastTimeInChat: {
                    type: Date,
                    default: Date.now,
                },
            },
            required: true,
        },
        teams: {
            type: Array,
            of:  mongoose.Schema.Types.ObjectId,
            ref: 'Team',
            required: false,
        },
        tags: {
            type: Array,
            of: {type: mongoose.Schema.Types.ObjectId, ref: 'Tag'},
        },
        geotag: {
            latitude: Number,
            longitude: Number,
        },
    },
    {
        versionKey: false,
    }
);

export default mongoose.model('Event', Event);
