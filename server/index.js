import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose'
import {port} from './config.js';
import fileUpload from 'express-fileupload';
import {authRouter, eventRouter, tagRouter, uploadRouter, userRouter} from "./routes/index.js";

const PORT = process.env.PORT | port;

mongoose.connect('mongodb://localhost/connect')
    .then(() => console.log('DB connected'))
    .catch((err) => console.log('DB error ', err));

const app = express();

app.use(cors());
app.use(express.json());

app.use(fileUpload({
    createParentPath: true,
    limits: {
        width: 700,
        fileSize: 2 * 1024 * 1024 * 1024 //2MB max file(s) size
    },
}));
app.use('/uploads', express.static('uploads'));


app.use(authRouter);
app.use(userRouter);
app.use(tagRouter);
app.use(eventRouter);
app.use(uploadRouter);


app.listen(PORT, (err) => {
    if (err) {
        return console.log(err);
    }
    console.log('Server OK')
});
