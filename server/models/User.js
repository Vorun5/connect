import mongoose from 'mongoose'

const UserSchema = new mongoose.Schema({
        username: {
            type: String,
            required: true,
            unique: true,
        },
        displayUsername: {
            type: String,
            required: true,
            unique: true,
        },
        name: {
            type: String,
            required: true,
        },
        passwordHash: {
            type: String,
            required: true,
        },
        geotag: {
            latitude: Number,
            longitude: Number,
        },
        profileImageUrl: String,
        backgroundImageUrl: String,
    },
    {
        versionKey: false,
    }
);

export default mongoose.model('User', UserSchema);