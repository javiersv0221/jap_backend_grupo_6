require('dotenv').config();
const {jwtVerify} = require('jose');

const SECRET_KEY = new TextEncoder().encode(process.env.JWT_SECRET);

async function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(401).json({message: "Acceso denegado: Token no proporcionado"});
    }

    try {
        const {payload} = await jwtVerify(token, SECRET_KEY);
        req.user = payload;
        next();
    } catch (error) {
        return res.status(403).json({
            message: "Token inválido o expirado",
            code: error.code
        });
    }
}

module.exports = {authenticateToken, SECRET_KEY};