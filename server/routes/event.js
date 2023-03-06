import express from 'express'
import { auth, validation } from '../middlewares/index.js'
import {
    addOrRemoveUsersToEvent,
    createEvent,
    updateEvent,
} from '../validations.js'
import { EventController } from '../controllers/index.js'

const eventRouter = express.Router()

// работает
eventRouter.post(
    '/events',
    auth,
    createEvent,
    validation,
    EventController.create,
)

// работает
eventRouter.patch(
    '/events',
    auth,
    updateEvent,
    validation,
    EventController.update,
)

eventRouter.get('/events/statistic', EventController.getStatistic)

// работает
eventRouter.get('/events/search/:string', auth, EventController.find)

// работает
eventRouter.get('/events/:id', auth, EventController.getById)

// работает
eventRouter.get('/get-all-user-events', auth, EventController.getAllUserEvents)

// работает
eventRouter.post(
    '/events/add-users',
    auth,
    addOrRemoveUsersToEvent,
    validation,
    EventController.addUsers,
)

// работает
eventRouter.post(
    '/events/remove-users',
    auth,
    addOrRemoveUsersToEvent,
    validation,
    EventController.removeUsers,
)

// работает
eventRouter.post('/events/join/:id', auth, EventController.joinToEvent)

// работает
eventRouter.post('/events/leave/:id', auth, EventController.leaveFromEvent)

// работает
eventRouter.post('/events/:id', auth, EventController.remove)

export default eventRouter
