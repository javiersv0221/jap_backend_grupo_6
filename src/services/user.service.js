const { executeQuery } = require('../db');
const bcrypt = require('bcryptjs');

/**
 * Busca usuario por email O username y verifica contraseña.
 */
async function loginUser(identifier, password) {
    const query = "SELECT * FROM Users WHERE email = ? OR username = ?";
    const users = await executeQuery(query, [identifier, identifier]);

    if (users.length === 0) return null;

    const user = users[0];
    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) return null;

    return user;
}

async function findAllUsers() {
    return await executeQuery("SELECT id_user, username, name, last_name, email, id_image FROM Users");
}

async function createUser(userData) {
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(userData.password, salt);

    const query = `INSERT INTO Users (username, name, last_name, email, password, id_image) VALUES (?, ?, ?, ?, ?, ?)`;
    const values = [
        userData.username,
        userData.name,
        userData.last_name,
        userData.email,
        hashedPassword,
        userData.id_image || null
    ];
    return await executeQuery(query, values);
}

module.exports = { findAllUsers, createUser, loginUser };