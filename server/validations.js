import {body} from 'express-validator';

const minNumChPassword = 6;
const maxNumChPassword = 30;
const maxNumChUsername = 20;
const minNumChUsername = 3;
const maxNumChName = 30;
const minNumChName = 3;

const maxDescriptionChUsername = 256;

export const login = [
    body('username', 'username must be alphanumeric and lowercase').isAlphanumeric().isAscii().isLength({
        min: minNumChUsername,
        max: maxNumChUsername
    }),
    body('password', 'password must not be less than 6 characters').isAlphanumeric().isLength({
        min: minNumChPassword,
        max: maxNumChPassword
    }),
]

export const signup = [
    body('username', 'username must be alphanumeric').isAlphanumeric().isAscii().isLength({
        min: minNumChUsername,
        max: maxNumChUsername
    }),
    body('password', 'password must not be less than 6 characters').isAlphanumeric().isLength({
        min: minNumChPassword,
        max: maxNumChPassword
    }),
    body('name', 'name needed').isLength({min: minNumChName, max: maxNumChName}),
]

export const updateUser = [
    body('_id', 'is not _id').isMongoId(),
    body('username', 'username must be alphanumeric and lowercase').isAlphanumeric().isAscii().isLength({
        min: minNumChUsername,
        max: maxNumChUsername
    }),
    body('name', 'name needed').isString().isLength({min: minNumChName, max: maxNumChName}),
    body('profileImageUrl', 'wrong photo link').optional().isURL(),
    body('description', 'description must be string').optional().isString().isLength({max: maxDescriptionChUsername}),
    body('backgroundImageUrl', 'wrong photo link').optional().isURL(),
]

export const createTag = [
    body('name', 'should be a line').isString(),
]

export const createEvent = [
    // body('name', 'name needed').isString().replace(/\s+/g, ' ').trim().isLength({min: minNumChName, max: maxNumChName}),
    body('name', 'name needed').isString().isLength({min: minNumChName, max: maxNumChName}),
    body('imageUrl', 'imageUrl must be url').optional().isString(),
    body('description', 'description must be string').optional().isString().isLength({max: maxDescriptionChUsername}),
    body('date', 'date must be date string').optional().isDate(),
    body('tags', 'tags must be array tags id').optional().isArray(),
    body('geotag.latitude', 'geotag.latitude must be a number').optional().isFloat(),
    body('geotag.longitude', 'geotag.longitude must be a number').optional().isFloat(),
]

// мы не можешь добавлять в мероприятие любых людей, а только тех кто был в списке желающих
// может лучше отдельные endpoint-ы для добавления/удаления пользователей и команд?
export const updateEvent = [
    // body('name', 'name needed').isString().replace(/\s+/g, ' ').trim().isLength({min: minNumChName, max: maxNumChName}),
    ...createEvent,
    body('_id', '_id must be id').isMongoId(),
    body('idPinnedMessages', 'idPinnedMessage must be id').optional().isArray(),
    body('imageUrl', 'imageUrl must be url').optional().isString(),
    body('appearInSearch', 'appearInSearch must be bool').isBoolean(),
    body('showAllMessage', 'appearInSearch must be bool').isBoolean(),
    body('entryAfterAdminApproval', 'entryAfterAdminApproval must be bool').isBoolean(),
]

export const addOrRemoveUsersToEvent = [
    body('id', 'id must be id').isMongoId(),
    body('users', 'users must be id').isArray(),
]
