import TagModel from "../models/Tag.js";

// создать тег, но если тег с таким названием уже создан, то он просто вернёт его
export const create = async (req, res) => {
    try {
        const tagName = req.body.name;
        const tag = await TagModel.findOne({'name': tagName});
        if (!tag) {
            const doc = new TagModel({name: tagName});
            const newTag = await doc.save();

            return res.json(newTag._doc)
        }
        res.json(tag._doc)
    } catch (e) {
        console.log('failed to create tag', e);
        res.status(500).json({
            message: 'failed to create tag',
        });
    }
}

// искать первые 10 тегов по строке
export const find = async (req, res) => {
    try {
        const s = req.params.string;
        console.log(s);
        const tags = await TagModel.find({
             name: new RegExp(s, 'i')
        });

        if (!tags) {
            res.status(404).json({
                message: 'tags not found',
            });
        }

        res.json(tags)
    } catch (e) {
        console.log('failed to find tags', e);
        res.status(500).json({
            message: 'failed to find tags',
        });
    }
}

