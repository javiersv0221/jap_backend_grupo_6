const { executeQuery } = require('../db');

async function findAllCategories() {
    const query = `
        SELECT 
            c.id_category AS id,
            c.name,
            c.description,
            COUNT(p.id_product) AS productCount,
            i.url AS imgSrc
        FROM Categories c
        LEFT JOIN Images i ON c.id_image = i.id_image
        LEFT JOIN Products p ON c.id_category = p.id_category
        GROUP BY c.id_category, c.name, c.description, i.url
    `;

    return await executeQuery(query);
}

module.exports = { findAllCategories };