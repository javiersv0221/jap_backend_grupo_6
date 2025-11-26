const express = require('express');
const router = express.Router();
const cartService = require('../services/cart.service');
const { authenticateToken } = require('../middleware');
const { validateFields } = require('../utils/validations');

router.use(authenticateToken);

router.get('/', async (req, res, next) => {
    try {
        const cart = await cartService.getCartByUser(req.user.id);
        res.json(cart);
    } catch (error) {
        next(error);
    }
});

router.post('/add', async (req, res, next) => {
    try {
        validateFields(req.body, ['id_product']);

        const { id_product, amount } = req.body;
        await cartService.addToCart(req.user.id, id_product, amount || 1);
        res.json({ message: "Producto agregado" });
    } catch (error) {
        next(error);
    }
});

router.put('/:itemId', async (req, res, next) => {
    try {
        validateFields(req.body, ['amount']);

        const { amount } = req.body;
        await cartService.updateCartItem(req.params.itemId, req.user.id, amount);
        res.json({ message: "Cantidad actualizada" });
    } catch (error) {
        next(error);
    }
});

router.delete('/:id', async (req, res, next) => {
    try {
        await cartService.removeFromCart(req.params.id, req.user.id);
        res.json({ message: "Item eliminado" });
    } catch (error) {
        next(error);
    }
});

router.delete('/', async (req, res, next) => {
    try {
        await cartService.clearCart(req.user.id);
        res.json({ message: "Carrito vaciado" });
    } catch (error) {
        next(error);
    }
});

module.exports = router;