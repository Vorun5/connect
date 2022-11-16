import mongoose from 'mongoose'

const TeamSchema = new mongoose.Schema({
        idAdmin: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },
        name: {
            type: String,
            required: true,
        },
        showAllMessage: {
            type: Boolean,
            default: true,
        },
        idPinnedMessage: {
            type: Array,
            of: mongoose.Schema.Types.ObjectId,
            ref: 'TeamMessage',
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
                id: {
                    type: mongoose.Schema.Types.ObjectId,
                    ref: 'User',
                    required: true,
                },
                date: {
                    type: Date,
                    required: true,
                },
                lastTimeInChat: {
                    type: Date,
                    default: Date.now,
                }
            },
            required: true,
        },
    },
    {
        versionKey: false,
    }
);

export default mongoose.model('Team', TeamSchema);
