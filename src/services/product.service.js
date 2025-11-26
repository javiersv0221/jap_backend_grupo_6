const { executeQuery } = require('../db');

async function findAllProducts(catId = null) {
    let query = `
        SELECT p.*, c.name as category_name
        FROM Products p
                 JOIN Categories c ON p.id_category = c.id_category
    `;
    const params = [];
    if (catId) {
        query += " WHERE p.id_category = ?";
        params.push(catId);
    }
    return await executeQuery(query, params);
}

async function findProductById(id) {
    const queryProd = `
        SELECT p.*, c.name as category_name
        FROM Products p
                 JOIN Categories c ON p.id_category = c.id_category
        WHERE p.id_product = ?`;
    const products = await executeQuery(queryProd, [id]);

    if (products.length === 0) return null;
    const product = products[0];

    const queryImages = `
        SELECT i.url
        FROM Images i
                 JOIN Products_Images pi ON i.id_image = pi.id_image
        WHERE pi.id_product = ?`;
    const images = await executeQuery(queryImages, [id]);

    product.images = images.map(img => img.url);
    return product;
}

module.exports = { findAllProducts, findProductById };