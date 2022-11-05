import {body} from 'express-validator';

const minNumChPassword = 6;
const maxNumChPassword = 30;
const maxNumChUsername = 20;
const minNumChUsername = 3;
const maxNumChName = 30;
const minNumChName = 3;

const maxDescriptionChUsername = 256;

export const login = [
    body('username', 'username must be alphanumeric and lowercase').isAlphanumeric().isAscii().isLength({min: minNumChUsername, max: maxNumChUsername}),
    body('password', 'password must not be less than 6 characters').isAlphanumeric().isLength({min: minNumChPassword, max: maxNumChPassword}),
]

export const signup = [
    body('username', 'username must be alphanumeric').isAlphanumeric().isAscii().isLength({min: minNumChUsername, max: maxNumChUsername}),
    body('password', 'password must not be less than 6 characters').isAlphanumeric().isLength({min: minNumChPassword, max: maxNumChPassword}),
    body('name', 'name needed').replace(/\s+/g, ' ').trim().isLength({min: minNumChName, max: maxNumChName}),
]

export const updateUser = [
    body('id', 'is not id').isMongoId(),
    body('username', 'username must be alphanumeric and lowercase').isAlphanumeric().isAscii().isLength({min: minNumChUsername, max: maxNumChUsername}),
    body('name', 'name needed').isAlphanumeric().isLength({min: minNumChName, max: maxNumChName}),
    body('profileImageUrl', 'wrong photo link').optional().isURL(),
    body('description', 'description must be string').optional().isString().replace(/\s+/g, ' ').trim().isLength({max: maxDescriptionChUsername}),
    body('backgroundImageUrl', 'wrong photo link').optional().isURL(),
    body('geotag.latitude', 'geotag.latitude must be a number').optional().isFloat(),
    body('geotag.longitude', 'geotag.longitude must be a number').optional().isFloat(),
]

