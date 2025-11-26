const express = require('express');
const router = express.Router();
const purchaseService = require('../services/purchase.service');
const { authenticateToken } = require('../middleware');
const { validateFields } = require('../utils/validations');

router.use(authenticateToken);

router.get('/', async (req, res, next) => {
    try {
        const purchases = await purchaseService.getPurchasesByUser(req.user.id);
        res.json(purchases);
    } catch (error) {
        next(error);
    }
});

router.post('/', async (req, res, next) => {
    try {
        validateFields(req.body, ['address', 'department', 'city', 'postal_code', 'type_shipment']);

        const id = await purchaseService.createPurchase(req.user.id, req.body);
        res.status(201).json({ message: "Compra exitosa", id });
    } catch (error) {
        next(error);
    }
});

module.exports = router;