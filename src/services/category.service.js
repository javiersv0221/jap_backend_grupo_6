const { executeQuery } = require('../db');

async function findAllCategories() {
    return await executeQuery("SELECT * FROM Categories");
}

module.exports = { findAllCategories };