const express = require('express');
const router = express.Router();
const categoryService = require('../services/category.service');

router.get('/', async (req, res, next) => {
    try {
        const categories = await categoryService.findAllCategories();
        res.json(categories);
    } catch (error) {
        next(error);
    }
});

module.exports = router;