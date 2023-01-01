import express from "express";
import {auth, validation} from "../middlewares/index.js";
import {addOrRemoveUsersToEvent, createEvent, updateEvent} from "../validations.js";
import {EventController} from "../controllers/index.js";

const eventRouter = express.Router();

// работает
eventRouter.post('/events', auth, createEvent, validation, EventController.create);
// работатет
eventRouter.patch('/events', auth, updateEvent, validation, EventController.update);
// работает
eventRouter.get('/events/:id', auth, EventController.getById);
// работает
eventRouter.post('/events/get-all-user-events', auth, EventController.getAllUserEvents);
// работатет
eventRouter.post('/events/add-users', auth, addOrRemoveUsersToEvent, validation, EventController.addUsers);
// работатет
eventRouter.post('/events/remove-users', auth, addOrRemoveUsersToEvent, validation, EventController.removeUsers);
// работает
eventRouter.post('/events/join/:id', auth, EventController.joinToEvent);
// работает
eventRouter.post('/events/leave/:id', auth, EventController.leaveToEvent);

export default eventRouter;
