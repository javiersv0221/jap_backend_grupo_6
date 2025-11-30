const { executeQuery } = require('../db');

async function getCartByUser(userId) {
    const query = `
        SELECT
            ci.id_product as id,
            p.name,
            ci.amount as count,
            p.cost as unitCost,
            p.currency,
            (SELECT url FROM Images i JOIN Products_Images pi ON i.id_image = pi.id_image WHERE pi.id_product = p.id_product LIMIT 1) as image
        FROM Carts_Items ci
                 JOIN Products p ON ci.id_product = p.id_product
        WHERE ci.id_user = ?
    `;

    const articles = await executeQuery(query, [userId]);

    return {
        user: userId,
        articles: articles
    };
}

async function addToCart(userId, productId, amount) {
    if (amount <= 0) {
        const err = new Error("Cantidad inválida");
        err.httpStatus = 400;
        throw err;
    }
    const query = `
        INSERT INTO Carts_Items (id_user, id_product, amount)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE amount = amount + ?
    `;
    return await executeQuery(query, [userId, productId, amount, amount]);
}

async function updateCartItem(cartItemId, userId, newAmount) {
    if (newAmount <= 0) return removeFromCart(cartItemId, userId);

    const query = "UPDATE Carts_Items SET amount = ? WHERE id_cart_item = ? AND id_user = ?";
    const result = await executeQuery(query, [newAmount, cartItemId, userId]);

    if (result.affectedRows === 0) {
        const err = new Error("Item no encontrado");
        err.httpStatus = 404;
        throw err;
    }
    return result;
}

async function removeFromCart(cartItemId, userId) {
    const query = "DELETE FROM Carts_Items WHERE id_cart_item = ? AND id_user = ?";
    return await executeQuery(query, [cartItemId, userId]);
}

async function clearCart(userId) {
    return await executeQuery("DELETE FROM Carts_Items WHERE id_user = ?", [userId]);
}

module.exports = { getCartByUser, addToCart, removeFromCart, updateCartItem, clearCart };