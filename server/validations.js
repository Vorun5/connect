import {body} from 'express-validator';

const minNumChPassword = 6;

export const login = [
    body('username', 'username must be alphanumeric and lowercase').isAlphanumeric().isAscii(),
    body('password', 'password must not be less than 6 characters').isLength({min: minNumChPassword}),
]

export const signup = [
    body('displayUsername', 'username must be alphanumeric').isAlphanumeric().isAscii(),
    body('password', 'password must not be less than 6 characters').isLength({min: minNumChPassword}),
    body('name', 'name needed').isLength({min: 3}),
]

export const updateUser = [
    body('id', 'is not id').isMongoId(),
    body('username', 'username must be alphanumeric and lowercase').isAlphanumeric().isAscii().isLowercase(),
    body('displayUsername', 'displayUsername must be alphanumeric').isAlphanumeric().isAscii(),
    body('name', 'name needed').isLength({min: 3}),
    body('profileImageUrl', 'wrong photo link').optional().isURL(),
    body('backgroundImageUrl', 'wrong photo link').optional().isURL(),
    body('geotag.latitude', 'geotag.latitude must be a number').optional().isFloat(),
    body('geotag.longitude', 'geotag.longitude must be a number').optional().isFloat(),
]

