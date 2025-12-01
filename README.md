# Backend Proyecto E-commerce - Jóvenes a Programar

Backend para el proyecto final de Jóvenes a Programar (Entrega 8). 
Es una API RESTful construida con Node.js y Express que gestiona la lógica de negocio, autenticación y datos del E-commerce.

## 👥 Equipo de Desarrollo
**Grupo: 314 | Subgrupo: 6**

| Integrante | GitHub |
| :--- | :--- |
| **Javier Salvatierra** | [@javiersv0221](https://github.com/javiersv0221) |
| **Jonathan Gomez** | [@devJonathanGomez](https://github.com/devJonathanGomez) |
| **Verónica Alvez** | [@VeronicaAlvez](https://github.com/VeronicaAlvez) |
| **Leandro Chevalier** | [@leeachevalier](https://github.com/leeachevalier) |

---

## 🚀 Tecnologías Utilizadas

* **Entorno:** Node.js
* **Framework:** Express.js (v5)
* **Base de Datos:** MariaDB / MySQL
* **Autenticación:** JWT (JSON Web Tokens) vía librería `jose`
* **Seguridad:** Hashing de contraseñas con `bcryptjs`

## 🛠️ Instalación y Configuración

### 1. Clonar el repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
cd jap_backend_grupo_6
````

### 2. Instalar dependencias

Ejecuta el siguiente comando para descargar las librerías necesarias:

```bash
npm install
```

### 3. Configuración de la Base de Datos

El proyecto incluye scripts SQL en la carpeta `bd/`.

1.  Accede a tu gestor de base de datos (phpMyAdmin, Workbench, HeidiSQL, etc.).
2.  Ejecuta el script **`bd/BD_DDL.sql`** para crear la estructura de la base de datos `ecommerce_db` y sus tablas.
3.  (Opcional) Ejecuta **`bd/BD_DDL-DDL-SEED-TEST.sql`** para limpiar e insertar datos de prueba (categorías, productos, usuarios).

### 4. Variables de Entorno (.env)

Configura las credenciales del sistema. Crea un archivo `.env` en la raíz (basándote en `.env.example`):

```env
PORT=3000
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=tu_contraseña
DB_NAME=ecommerce_db
JWT_SECRET=clave_secreta_aqui
```

### 5. Ejecutar el Servidor

  * **Modo Desarrollo (con Nodemon):**
    ```bash
    npm run dev
    ```
  * **Modo Producción:**
    ```bash
    npm start
    ```

El servidor iniciará en: `http://localhost:3000`

## 🔌 Endpoints Principales

La API define las siguientes rutas base:

| Ruta Base | Descripción | Requiere Auth |
| :--- | :--- | :---: |
| `/users` | Login (`/login`), Registro (`/register`) y perfil (`/self`) | Parcial |
| `/products` | Obtener todos los productos o por ID | No |
| `/cart` | Gestión del carrito (agregar, borrar, listar) | Sí |
| `/categories` | Listado de categorías disponibles | No |
| `/purchases` | Historial de compras y finalizar compra | Sí |
| `/comments` | Ver y publicar comentarios en productos | Parcial |

## 🔗 Enlaces Relacionados

* **Frontend del Proyecto:** [Ir al repositorio Frontend (jap_proyecto_final_grupo6)](https://github.com/javiersv0221/jap_proyecto_final_grupo6)
    * *Desde aquí se consume esta API.*
