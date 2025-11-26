require('dotenv').config();
const mariadb = require("mariadb");

const pool = mariadb.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    connectionLimit: 5,
    bigIntAsNumber: true,
    insertIdAsNumber: true
});

async function getConnection() {
    return pool.getConnection();
}

async function executeQuery(query, values = []) {
    let conn;
    try {
        conn = await pool.getConnection();
        return await conn.query(query, values);
    } catch (err) {
        throw classifyDatabaseError(err);
    } finally {
        if (conn) await conn.release();
    }
}

function classifyDatabaseError(err) {
    const error = new Error(err.message);

    error.code = err.code;
    error.sqlMessage = err.sqlMessage;
    error.errno = err.errno;
    error.httpStatus = 500; // Internal Server Error

    if (['ECONNREFUSED', 'ETIMEDOUT', 'ER_ACCESS_DENIED_ERROR'].includes(err.code)) {
        error.messageForUser = "No se pudo conectar a la base de datos.";
        error.httpStatus = 503; // Service Unavailable
    } else if (err.sqlState) {
        error.httpStatus = 400; // Bad Request

        if (err.code === 'ER_DUP_ENTRY') {
            error.httpStatus = 409; // Conflict
        } else if (err.code === 'ER_NO_REFERENCED_ROW_2' || err.code === 'ER_ROW_IS_REFERENCED_2') {
            error.httpStatus = 422; // Unprocessable Entity
        }
    }

    return error;
}

module.exports = {executeQuery, getConnection};