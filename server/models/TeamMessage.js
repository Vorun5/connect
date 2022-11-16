import mongoose from 'mongoose'

const TeamMessage = new mongoose.Schema({
        id_user: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'User',
            required: true,
        },
        id_team: {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'Team',
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

export default mongoose.model('TeamMessage', TeamMessage);
