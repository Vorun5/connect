import mongoose from 'mongoose'

const TagSchema = new mongoose.Schema(
    {
        name: {
            type: String,
            unique: true,
            required: true,
            trim: true,
        },
    },
    {
        versionKey: false,
    },
)

export default mongoose.model('Tag', TagSchema)
