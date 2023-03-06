import jwt from 'jsonwebtoken'
import { secretKey } from '../config.js'

export default (req, res, next) => {
    const token = req.headers.authorization || ''
    if (token) {
        try {
            const decoded = jwt.verify(token, secretKey, null, null)
            req.userId = decoded._id
            next()
        } catch (e) {
            return res.status(403).json({
                message: 'no access',
            })
        }
    } else {
        return res.status(403).json({
            message: 'no access',
        })
    }
}
