import mongoose from 'mongoose'

const EventMessage = new mongoose.Schema({
        id_user: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },
        id_team: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Event',
            required: true,
        },
        text: {
            type: String,
            required: true,
        },
        date: {
            type: Date,
            required: true,
        }
    },
    {
        versionKey: false,
    }
);

export default mongoose.model('EventMessage', EventMessage);
