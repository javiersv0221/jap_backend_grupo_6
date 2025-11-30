require('dotenv').config();
const express = require('express');
const cors = require('cors');

const usersRouter = require('./src/routes/users.route');
const productsRouter = require('./src/routes/products.route');
const cartRouter = require('./src/routes/cart.route');
const categoriesRouter = require('./src/routes/categories.route');
const commentsRouter = require('./src/routes/comments.route');
const purchasesRouter = require('./src/routes/purchases.route');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use((req, res, next) => {
    console.log(`[REQUEST] ${req.method} ${req.path}`);
    next();
});

app.use(express.json());

app.use('/users', usersRouter);
app.use('/products', productsRouter);
app.use('/cart', cartRouter);
app.use('/categories', categoriesRouter);
app.use('/comments', commentsRouter);
app.use('/purchases', purchasesRouter);


app.use((req, res) => res.status(404).json({message: "Ruta no encontrada"}));

// Captura de errores
app.use((err, req, res, next) => {
    console.error("Error:", err);
    const status = err.httpStatus ?? 500;
    res.status(status).json({
        message: err.message ?? "Error interno del servidor",
        error: {
            code: err.code ?? 'INTERNAL_ERROR',
            sqlMessage: err.sqlMessage ?? null
        }
    });
});

app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});

module.exports = app;