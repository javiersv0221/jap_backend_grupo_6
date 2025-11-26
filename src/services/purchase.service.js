const { executeQuery, getConnection } = require('../db');

async function getPurchasesByUser(userId) {
    return await executeQuery("SELECT * FROM Purchases WHERE id_user = ? ORDER BY id_purchase DESC", [userId]);
}

async function createPurchase(userId, purchaseData) {
    let conn;
    try {
        conn = await getConnection();
        await conn.beginTransaction();

        const cartItems = await conn.query("SELECT * FROM Carts_Items WHERE id_user = ?", [userId]);
        if (cartItems.length === 0) {
            const err = new Error("Carrito vacío");
            err.httpStatus = 400;
            err.messageForUser = "No puedes comprar con el carrito vacío.";
            throw err;
        }

        const queryHeader = `
            INSERT INTO Purchases (id_user, address, department, city, postal_code, type_shipment)
            VALUES (?, ?, ?, ?, ?, ?)
        `;
        const resHeader = await conn.query(queryHeader, [
            userId, purchaseData.address, purchaseData.department,
            purchaseData.city, purchaseData.postal_code, purchaseData.type_shipment
        ]);
        const purchaseId = Number(resHeader.insertId);

        const queryDetail = "INSERT INTO Purchases_Products (id_purchase, id_product, amount) VALUES (?, ?, ?)";
        const queryUpdateStock = "UPDATE Products SET sold_count = sold_count + ? WHERE id_product = ?";

        for (const item of cartItems) {
            await conn.query(queryDetail, [purchaseId, item.id_product, item.amount]);
            await conn.query(queryUpdateStock, [item.amount, item.id_product]);
        }

        await conn.query("DELETE FROM Carts_Items WHERE id_user = ?", [userId]);

        await conn.commit();
        return purchaseId;

    } catch (error) {
        if (conn) await conn.rollback();
        throw error;
    } finally {
        if (conn) await conn.release();
    }
}

module.exports = { getPurchasesByUser, createPurchase };