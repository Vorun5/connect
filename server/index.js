import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose'
import {port} from './config.js';
import * as Validations from './validations.js';
import {TagController, UserController} from "./controllers/index.js";
import {checkAuth, handleValidationErrors} from "./utils/index.js";

mongoose.connect('mongodb://localhost/connect')
    .then(() => console.log('DB connected'))
    .catch((err) => console.log('DB error ', err));

const app = express();
app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads'));


app.post('/auth/login', Validations.login, handleValidationErrors, UserController.login)
app.post('/auth/sing-up', Validations.signup, handleValidationErrors, UserController.singUp);


app.get('/users/:username', UserController.getOneUser);
app.get('/users', checkAuth, UserController.getMe);
app.patch('/users', checkAuth, Validations.updateUser, handleValidationErrors, UserController.update);


app.post('/tags', checkAuth, Validations.createTag, handleValidationErrors, TagController.create);
app.post('/tags/:string', TagController.find);


app.listen(port, (err) => {
    if (err) {
        return console.log(err);
    }
    console.log('Server OK')
});
