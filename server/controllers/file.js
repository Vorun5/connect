import { domain } from '../config.js'

const isImage = (file) => {
    return file.mimetype.startsWith('image/')
}

// TODO: установить минимальный размер фотографий (ширана и высота)
export const uploadImage = async (req, res) => {
    try {
        // console.log(req);
        if (!req.files) {
            res.status(400).send({
                message: 'No file uploaded',
            })
        } else {
            let image = req.files.image

            if (!isImage(image)) {
                res.status(400).message({
                    message: 'Is not image',
                })
            }
            const path = `/uploads/${Date.now()}-${image.name}`

            image.mv('.' + path)

            res.send({
                url: domain + path,
                mimetype: image.mimetype,
                size: image.size,
            })
        }
    } catch (e) {
        res.status(500).send({
            message: 'server error',
        })
    }
}
