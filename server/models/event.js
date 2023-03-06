import mongoose from 'mongoose'

const Event = new mongoose.Schema(
    {
        idCreator: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },
        name: {
            type: String,
            index: true,
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
                user: {
                    type: mongoose.Schema.Types.ObjectId,
                    ref: 'User',
                    required: true,
                },
                date: {
                    type: Date,
                    default: Date.now,
                },
            },
            required: true,
        },
        tags: {
            type: Array,
            of: { type: mongoose.Schema.Types.ObjectId, ref: 'Tag' },
        },
    },
    {
        versionKey: false,
    },
)

export default mongoose.model('Event', Event)
