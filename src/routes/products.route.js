const express = require('express');
const router = express.Router();
const productService = require('../services/product.service');

router.get('/', async (req, res, next) => {
    try {
        const products = await productService.findAllProducts(req.query.cat_id);
        res.json(products);
    } catch (error) {
        next(error);
    }
});

router.get('/:id', async (req, res, next) => {
    try {
        const product = await productService.findProductById(req.params.id);
        if (!product) {
            const err = new Error("No encontrado");
            err.httpStatus = 404;
            throw err;
        }
        res.json(product);
    } catch (error) {
        next(error);
    }
});

module.exports = router;