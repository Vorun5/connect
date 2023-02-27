import express from "express";
import {auth, validation} from "../middlewares/index.js";
import {addOrRemoveUsersToEvent, createEvent, updateEvent} from "../validations.js";
import {EventController} from "../controllers/index.js";

const eventRouter = express.Router();

// работает
eventRouter.post('/events', auth, createEvent, validation, EventController.create);
// работатет
eventRouter.patch('/events', auth, updateEvent, validation, EventController.update);
// работате
eventRouter.get('/events/search/:string', auth, EventController.find);
// работает
eventRouter.get('/events/:id', auth, EventController.getById);
// работает
eventRouter.get('/get-all-user-events', auth, EventController.getAllUserEvents);
// работатет
eventRouter.post('/events/add-users', auth, addOrRemoveUsersToEvent, validation, EventController.addUsers);
// работатет
eventRouter.post('/events/remove-users', auth, addOrRemoveUsersToEvent, validation, EventController.removeUsers);
// работает
eventRouter.post('/events/join/:id', auth, EventController.joinToEvent);
// работает
eventRouter.post('/events/leave/:id', auth, EventController.leaveFromEvent);
// работает
eventRouter.post('/events/:id', auth, EventController.remove);

export default eventRouter;
