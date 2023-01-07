import bcrypt from "bcrypt";
import {User} from "../models/index.js";
import jwt from "jsonwebtoken";
import {secretKey} from "../config.js";

export const singUp = async (req, res) => {
    try {
        const password = req.body.password;
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(password, salt);

        const checkUsername = await User.findOne({"username": req.body.username.toLowerCase()});

        if (checkUsername) {
            return res.status(403).json({
                message: 'a user with the same name already exists',
            });
        }

        const doc = new User({
            username: req.body.username.toLowerCase(),
            displayUsername: req.body.username,
            name: req.body.name,
            passwordHash: hash,
        });

        const user = await doc.save(doc);

        const token = jwt.sign(
            {_id: user._id},
            secretKey,
            {expiresIn: '30d'}
        );

        // const {passwordHash, ...userData} = user._doc;
        return  res.json(token);

    } catch (e) {
        console.log('failed to sign up', e);
        res.status(500).json({
            message: 'failed to sign up',
        });
    }
}

export const login = async (req, res) => {
    try {

        const user = await User.findOne({username: req.body.username.toLowerCase()});
        if (!user) {
            return res.status(403).json({
                message: 'wrong username or password',
            });
        }

        const isValidPassword = await bcrypt.compare(req.body.password, user._doc.passwordHash);

        if (!isValidPassword) {
            return res.status(403).json({
                message: 'wrong username or password',
            });
        }

        const token = jwt.sign(
            {_id: user._id},
            secretKey,
            {expiresIn: '30d'}
        );

        return  res.json(token);

    } catch (e) {
        console.log('failed to username', e);
        return res.status(500).json({
            message: 'failed to username',
        });
    }
}

export const getMe = async (req, res) => {
    try {
        const user = await User.findById(req.userId);

        if (!user) {
            return res.status(403).json({
                message: 'not access'
            });
        }

        return res.json(user);
    } catch (e) {
        console.log('error getting personal information', e);
        return res.status(500).json({
            message: 'error getting personal information',
        });
    }
}

export const getOneUser = async (req, res) => {
    try {
        const username = req.params.username.toLowerCase();
        const user = await User.findOne({'username': username});

        if (!user) {
            return res.status(404).json({
                message: 'user is not found'
            });
        }

        const {passwordHash, ...userData} = user._doc;
        res.json(userData);

    } catch (e) {
        console.log('error getting user data', e);
        return res.status(500).json({
            message: 'error getting user data',
        });
    }
}

export const update = async (req, res) => {
    try {
        const userId = req.userId;
        if (userId !== req.body._id) {
            console.log('no access');
            return  res.status(403).json({
                message: 'no access',
            });
        }


        const user = await User.findByIdAndUpdate(userId, {
            username: req.body.username.toLowerCase(),
            displayUsername: req.body.username,
            name: req.body.name,
            profileImageUrl: req.body.profileImageUrl,
            backgroundImageUrl: req.body.backgroundImageUrl,
            description: req.body.description,
        }, {
            returnDocument: "after",
        })

        if (!user) {
            return res.status(404).json({
                message: 'user is not found'
            });
        }

        const {passwordHash,  ...userData} = user._doc;
        res.json(userData);
    } catch (e) {
        console.log('no access', e);
        return  res.status(500).json({
            message: 'no access',
        });
    }
}
