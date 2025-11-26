const express = require('express');
const router = express.Router();
const userService = require('../services/user.service');
const { SignJWT } = require("jose");
const { SECRET_KEY } = require("../middleware");
const { validateFields } = require('../utils/validations');

router.post('/login', async (req, res, next) => {
    try {
        validateFields(req.body, ['username', 'password']);

        const { username, password } = req.body;

        const user = await userService.loginUser(username, password);

        if (!user) {
            const err = new Error("Auth fallida");
            err.httpStatus = 401;
            err.messageForUser = "Credenciales inválidas (usuario o contraseña incorrectos)";
            throw err;
        }

        const token = await new SignJWT({
            id: user.id_user, email: user.email, username: user.username
        })
            .setProtectedHeader({ alg: 'HS256' })
            .setIssuedAt()
            .setExpirationTime('2h')
            .sign(SECRET_KEY);

        res.json({
            message: "Login exitoso",
            token,
            user: { id: user.id_user, username: user.username }
        });
    } catch (error) {
        next(error);
    }
});

router.post('/register', async (req, res, next) => {
    try {
        validateFields(req.body, ['username', 'password', 'name', 'last_name', 'email']);

        const result = await userService.createUser(req.body);
        res.status(201).json({ id: Number(result.insertId), message: "Usuario registrado" });
    } catch (error) {
        next(error);
    }
});

router.get('/', async (req, res, next) => {
    try {
        const users = await userService.findAllUsers();
        res.json(users);
    } catch (error) {
        next(error);
    }
});

module.exports = router;