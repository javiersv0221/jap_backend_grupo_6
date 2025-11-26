/**
 * Valida que los campos requeridos existan en el objeto body.
 * @param {object} body - El req.body o req.query a validar.
 * @param {string[]} requiredFields - Array con los nombres de los campos obligatorios.
 * @throws {Error} - Lanza un error 400 si faltan campos.
 */
function validateFields(body, requiredFields) {
    const missing = requiredFields.filter(field =>
        body[field] === undefined || body[field] === null || body[field] === ''
    );

    if (missing.length > 0) {
        const error = new Error(`Faltan campos obligatorios: ${missing.join(', ')}`);
        error.httpStatus = 400;
        error.code = "MISSING_FIELDS";
        throw error;
    }
}

module.exports = { validateFields };