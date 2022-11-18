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
        return res.json(tag._doc)
    } catch (e) {
        console.log('failed to create tag', e);
        return res.status(500).json({
            message: 'failed to create tag',
        });
    }
}

// искать первые 10 тегов по строке
export const find = async (req, res) => {
    try {
        const s = req.params.string;
        const tags = await TagModel.find({
            name: new RegExp(s, 'i')
        });

        if (!tags) {
            return res.status(404).json({
                message: 'tags not found',
            });
        }

        return res.json(tags)
    } catch (e) {
        console.log('failed to find tags', e);
        return res.status(500).json({
            message: 'failed to find tags',
        });
    }
}

