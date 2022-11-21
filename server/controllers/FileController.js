import {domain} from "../config.js";

const isImage = (file) => {
    return file.mimetype.startsWith('image/');
}

// TODO: установить минимальный размер фотографий (ширана и высота)
export const uploadAvatar = async (req, res) => {
    try {
        // console.log(req);
        if (!req.files) {
            res.status(400).send({
                message: 'No file uploaded'
            });
        } else {
            //Use the name of the input field (i.e. "avatar") to retrieve the uploaded file
            let avatar = req.files.avatar;

            if (!isImage(avatar)) {
                res.status(400).message({
                    message: 'Is not image',
                });
            }
            const path = `/uploads/avatars/${Date.now()}-${avatar.name}`;

            avatar.mv('.' + path);

            res.send({
                url: domain + path,
                mimetype: avatar.mimetype,
                size: avatar.size
            });
        }
    } catch (e) {
        res.status(500).send({
            message: 'server error'
        });
    }
}

export const uploadBackground = async (req, res) => {
    try {
        // console.log(req);
        if (!req.files) {
            res.status(400).send({
                message: 'No file uploaded'
            });
        } else {
            //Use the name of the input field (i.e. "avatar") to retrieve the uploaded file
            let background = req.files.background;

            if (!isImage(background)) {
                res.status(400).message({
                    message: 'Is not image',
                });
            }
            const path = `/uploads/backgrounds/${Date.now()}-${background.name}`;

            background.mv('.' + path);

            res.send({
                url: domain + path,
                mimetype: background.mimetype,
                size: background.size
            });
        }
    } catch (e) {
        res.status(500).send({
            message: 'server error'
        });
    }
}
