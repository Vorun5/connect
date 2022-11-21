import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose'
import {port} from './config.js';
import * as Validations from './validations.js';
import {EventController, TagController, UserController, FileController} from "./controllers/index.js";
import {checkAuth, handleValidationErrors} from "./utils/index.js";
import fileUpload from 'express-fileupload';

mongoose.connect('mongodb://localhost/connect')
    .then(() => console.log('DB connected'))
    .catch((err) => console.log('DB error ', err));

const app = express();

app.use(fileUpload({
    createParentPath: true,
    limits: {
        width: 700,

        fileSize: 2 * 1024 * 1024 * 1024 //2MB max file(s) size
    },
}));

app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads'));

app.post('/upload/avatar', checkAuth, FileController.uploadAvatar);

app.post('/upload/background', checkAuth, FileController.uploadBackground);


// работает
app.post('/auth/login', Validations.login, handleValidationErrors, UserController.login)
// работает
app.post('/auth/sing-up', Validations.signup, handleValidationErrors, UserController.singUp);

// работает
app.get('/users/:username', checkAuth, UserController.getOneUser);
// работает
app.get('/users', checkAuth, UserController.getMe);
// работает
app.patch('/users', checkAuth, Validations.updateUser, handleValidationErrors, UserController.update);

// работает
app.post('/tags', checkAuth, Validations.createTag, handleValidationErrors, TagController.create);
// работает
app.post('/tags/:string', checkAuth, TagController.find);

// работает
app.post('/events', checkAuth, Validations.createEvent, handleValidationErrors, EventController.create);
// работатет
app.patch('/events', checkAuth, Validations.updateEvent, handleValidationErrors, EventController.update);
// работает
app.get('/events/:id', checkAuth, EventController.getById);
// работает
app.post('/events/get-all-user-events', checkAuth, EventController.getAllUserEvents);
// работатет
app.post('/events/add-users', checkAuth, Validations.addOrRemoveUsersToEvent, handleValidationErrors, EventController.addUsers);
// работатет
app.post('/events/remove-users', checkAuth, Validations.addOrRemoveUsersToEvent, handleValidationErrors, EventController.removeUsers);
// работает
app.post('/events/join/:id', checkAuth, EventController.joinToEvent);
// работает
app.post('/events/leave/:id', checkAuth, EventController.leaveToEvent);


app.listen(port, (err) => {
    if (err) {
        return console.log(err);
    }
    console.log('Server OK')
});
