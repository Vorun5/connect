import express from 'express'
import { auth, validation } from '../middlewares/index.js'
import { createTag } from '../validations.js'
import { TagController } from '../controllers/index.js'

const tagRouter = express.Router()

// работает
tagRouter.post('/tags', auth, createTag, validation, TagController.create)
// работает
tagRouter.get('/tags/:string', auth, TagController.find)

export default tagRouter
