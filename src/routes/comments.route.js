const express = require('express');
const router = express.Router();
const commentService = require('../services/comment.service');
const { authenticateToken } = require('../middleware');
const { validateFields } = require('../utils/validations');

router.get('/product/:id', async (req, res, next) => {
    try {
        const comments = await commentService.getCommentsByProduct(req.params.id);
        res.json(comments);
    } catch (error) {
        next(error);
    }
});

router.post('/', authenticateToken, async (req, res, next) => {
    try {
        validateFields(req.body, ['id_product', 'description', 'score']);

        await commentService.createComment(req.user.id, req.body);
        res.status(201).json({ message: "Comentario agregado" });
    } catch (error) {
        next(error);
    }
});

module.exports = router;