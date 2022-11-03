import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose'
import {port} from './config.js';
import * as Validations from './validations.js';
import * as UserController from "./controllers/UserController.js";
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
app.get('/user/:username', UserController.getOneUser);
app.get('/user', checkAuth, UserController.getMe);
app.patch('/user', checkAuth, Validations.updateUser, handleValidationErrors, UserController.update);

app.listen(port, (err) => {
    if (err) {
        return console.log(err);
    }
    console.log('Server OK')
});
