const { executeQuery } = require('../db');

async function findAllProducts(catId = null) {
    // 1. Si hay categoría, necesitamos sus datos para el encabezado del JSON
    let catData = null;
    if (catId) {
        const catResult = await executeQuery("SELECT id_category, name FROM Categories WHERE id_category = ?", [catId]);
        if (catResult.length > 0) {
            catData = catResult[0];
        }
    }

    // 2. Consulta de productos (para el listado)
    // Nota: Usamos una subconsulta para 'image' para obtener solo la primera y devolverla como string
    let query = `
        SELECT 
            p.id_product AS id,
            p.name,
            p.description,
            p.cost,
            p.currency,
            p.sold_count AS soldCount,
            (SELECT url FROM Images i 
             JOIN Products_Images pi ON i.id_image = pi.id_image 
             WHERE pi.id_product = p.id_product 
             LIMIT 1) AS image
        FROM Products p
    `;

    const params = [];
    if (catId) {
        query += " WHERE p.id_category = ?";
        params.push(catId);
    }

    const products = await executeQuery(query, params);

    // 3. Estructura de retorno según si es filtro por categoría o listado general
    if (catId && catData) {
        return {
            catID: catData.id_category,
            catName: catData.name,
            products: products
        };
    } else {
        return products;
    }
}

async function findProductById(id) {
    const queryProd = `
        SELECT
            p.id_product AS id,
            p.name,
            p.description,
            p.cost,
            p.currency,
            p.sold_count AS soldCount,
            c.name AS category
        FROM Products p
                 JOIN Categories c ON p.id_category = c.id_category
        WHERE p.id_product = ?`;

    const products = await executeQuery(queryProd, [id]);

    if (products.length === 0) return null;
    const product = products[0];

    // Array de imágenes
    const queryImages = `
        SELECT i.url
        FROM Images i
                 JOIN Products_Images pi ON i.id_image = pi.id_image
        WHERE pi.id_product = ?`;
    const images = await executeQuery(queryImages, [id]);
    product.images = images.map(img => img.url);

    // Productos relacionados
    const queryRelated = `
        SELECT
            p.id_product AS id,
            p.name,
            (SELECT i.url
             FROM Images i
                      JOIN Products_Images pi ON i.id_image = pi.id_image
             WHERE pi.id_product = p.id_product
             LIMIT 1) AS image
        FROM Products_Relates pr
                 JOIN Products p ON pr.id_product_related = p.id_product
        WHERE pr.id_product = ?`;

    product.relatedProducts = await executeQuery(queryRelated, [id]);

    return product;
}

module.exports = { findAllProducts, findProductById };