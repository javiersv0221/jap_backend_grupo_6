const { executeQuery } = require('../db');

async function getCommentsByProduct(productId) {
    const query = `
        SELECT
            c.id_product AS product,
            c.score,
            c.description,
            u.username AS user,
            c.dateTime
        FROM Comments c
                 JOIN Users u ON c.id_user = u.id_user
        WHERE c.id_product = ?
        ORDER BY c.dateTime DESC
    `;
    return await executeQuery(query, [productId]);
}

async function createComment(userId, commentData) {
    if (!commentData.score || commentData.score < 1 || commentData.score > 10) {
        const err = new Error("Puntaje inválido");
        err.httpStatus = 400;
        err.messageForUser = "El puntaje debe ser entre 1 y 10";
        throw err;
    }
    const query = "INSERT INTO Comments (id_product, id_user, description, score) VALUES (?, ?, ?, ?)";
    const values = [commentData.id_product, userId, commentData.description, commentData.score];
    return await executeQuery(query, values);
}

module.exports = { getCommentsByProduct, createComment };