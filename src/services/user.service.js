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

async function findUserById(userId) {
    const query = `
        SELECT 
            u.id_user, 
            u.username, 
            u.name, 
            u.last_name, 
            u.email, 
            i.url as avatar
        FROM Users u
        LEFT JOIN Images i ON u.id_image = i.id_image
        WHERE u.id_user = ?
    `;

    const results = await executeQuery(query, [userId]);

    if (results.length === 0) return null;

    const user = results[0];

    return {
        id: user.id_user,
        username: user.username,
        password: "",
        name: user.name,
        lastName: user.last_name,
        email: user.email,
        avatar: user.avatar || "img/avatars/avatar0.png"
    };
}

module.exports = { findAllUsers, createUser, loginUser, findUserById };