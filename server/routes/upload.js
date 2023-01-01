import express from "express";
import {auth} from "../middlewares/index.js";
import {FileController} from "../controllers/index.js";

const uploadRouter = express.Router();

uploadRouter.post('/upload', auth, FileController.uploadImage);

export default uploadRouter;
