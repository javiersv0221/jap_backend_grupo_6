-- Creación de la BD
DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecommerce_db;

-- Creación de tablas
CREATE TABLE Images (
    id_image BIGINT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(2048) NOT NULL
);

CREATE TABLE Users (
    id_user BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(40) NOT NULL,
    name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    id_image BIGINT,
    CONSTRAINT uk_users_username UNIQUE (username),
    CONSTRAINT uk_users_email UNIQUE (email),
    CONSTRAINT fk_users_images FOREIGN KEY (id_image) REFERENCES Images(id_image)
);

CREATE TABLE Categories (
    id_category BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    description TEXT,
    id_image BIGINT NOT NULL,
    CONSTRAINT uk_categories_name UNIQUE (name),
    CONSTRAINT fk_categories_images FOREIGN KEY (id_image) REFERENCES Images(id_image)
);

CREATE TABLE Products (
    id_product BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    description TEXT,
    cost DECIMAL(15, 2) NOT NULL,
    currency ENUM('UYU', 'USD') NOT NULL,
    sold_count SMALLINT NOT NULL DEFAULT 0,
    id_category BIGINT NOT NULL,
    CONSTRAINT fk_products_categories FOREIGN KEY (id_category) REFERENCES Categories(id_category)
);

CREATE TABLE Products_Images (
    id_pro_images BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_product BIGINT NOT NULL,
    id_image BIGINT NOT NULL,
    CONSTRAINT fk_prodimg_products FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE,
    CONSTRAINT fk_prodimg_images FOREIGN KEY (id_image) REFERENCES Images(id_image) ON DELETE CASCADE,
    CONSTRAINT uk_prodimg_unique UNIQUE (id_product, id_image)
);

CREATE TABLE Products_Relates (
    id_pro_relates BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_product BIGINT NOT NULL,
    id_product_related BIGINT NOT NULL,
    CONSTRAINT fk_prodrel_product FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE,
    CONSTRAINT fk_prodrel_related FOREIGN KEY (id_product_related) REFERENCES Products(id_product) ON DELETE CASCADE
);

CREATE TABLE Carts_Items (
    id_cart_item BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_user BIGINT NOT NULL,
    id_product BIGINT NOT NULL,
    amount SMALLINT NOT NULL DEFAULT 1,
    CONSTRAINT fk_cartitems_users FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE,
    CONSTRAINT fk_cartitems_products FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE,
    CONSTRAINT uk_carts_items_unique UNIQUE (id_user, id_product)
);

CREATE TABLE Purchases (
    id_purchase BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_user BIGINT NOT NULL,
    address VARCHAR(255) NOT NULL,
    department ENUM(
        'ARTIGAS', 'CANELONES', 'CERRO_LARGO', 'COLONIA', 'DURAZNO',
        'FLORES', 'FLORIDA', 'LAVALLEJA', 'MALDONADO', 'MONTEVIDEO',
        'PAYSANDU', 'RIO_NEGRO', 'RIVERA', 'ROCHA', 'SALTO',
        'SAN_JOSE', 'SORIANO', 'TACUAREMBO', 'TREINTA_Y_TRES'
    ) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(5) NOT NULL,
    type_shipment ENUM('PREMIUM', 'EXPRESS', 'STANDARD') NOT NULL,
    CONSTRAINT fk_purc_users FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

CREATE TABLE Purchases_Products (
    id_pur_products BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_purchase BIGINT NOT NULL,
    id_product BIGINT NOT NULL,
    amount SMALLINT NOT NULL,
    CONSTRAINT fk_purprod_purchases FOREIGN KEY (id_purchase) REFERENCES Purchases(id_purchase) ON DELETE CASCADE,
    CONSTRAINT fk_purprod_products FOREIGN KEY (id_product) REFERENCES Products(id_product),
    CONSTRAINT uk_purc_products_unique UNIQUE (id_purchase, id_product)
);

CREATE TABLE Comments (
    id_comment BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_product BIGINT NOT NULL,
    id_user BIGINT NOT NULL,
    description TEXT NOT NULL,
    score TINYINT NOT NULL CHECK (score BETWEEN 1 AND 10),
    dateTime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comm_products FOREIGN KEY (id_product) REFERENCES Products(id_product) ON DELETE CASCADE,
    CONSTRAINT fk_comm_users FOREIGN KEY (id_user) REFERENCES Users(id_user) ON DELETE CASCADE
);