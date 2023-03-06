import express from 'express'
import { auth, validation } from '../middlewares/index.js'
import { UserController } from '../controllers/index.js'
import { updateUser } from '../validations.js'

const userRouter = express.Router()

// работает
userRouter.get('/users/:username', auth, UserController.getOneUser)
// работает
userRouter.get('/users', auth, UserController.getMe)
// работает
userRouter.patch('/users', auth, updateUser, validation, UserController.update)

export default userRouter
