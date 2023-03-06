import express from 'express'
import { login, signup } from '../validations.js'
import { validation } from '../middlewares/index.js'
import { UserController } from '../controllers/index.js'

const authRouter = express.Router()

// работает
authRouter.post('/auth/login', login, validation, UserController.login)
// работает
authRouter.post('/auth/sing-up', signup, validation, UserController.singUp)

export default authRouter
