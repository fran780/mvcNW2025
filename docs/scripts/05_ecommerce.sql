CREATE TABLE
    `sales` (
        `saleId` int(11) NOT NULL AUTO_INCREMENT,
        `productId` int(11) NOT NULL,
        `salePrice` decimal(10, 2) NOT NULL,
        `saleStart` datetime NOT NULL,
        `saleEnd` datetime NOT NULL,
        PRIMARY KEY (`saleId`),
        KEY `fk_sales_products_idx` (`productId`),
        CONSTRAINT `fk_sales_products` FOREIGN KEY (`productId`) REFERENCES `electronics_products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE TABLE
    `highlights` (
        `highlightId` int(11) NOT NULL AUTO_INCREMENT,
        `productId` int(11) NOT NULL,
        `highlightStart` datetime NOT NULL,
        `highlightEnd` datetime NOT NULL,
        PRIMARY KEY (`highlightId`),
        KEY `fk_highlights_products_idx` (`productId`),
        CONSTRAINT `fk_highlights_products` FOREIGN KEY (`productId`) REFERENCES `electronics_products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        1,
        'Negocios Web Intro',
        'Libro de Introducción a los Negocios Web 70 pg',
        200,
        'https://placehold.co/290x250?text=Negocios-Web-Intro&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        2,
        'Negocios Web 2',
        'Libro de Negocios Web 2 POO 120 pg',
        300,
        'https://placehold.co/290x250?text=Negocios-Web-2&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        3,
        'Negocios Web Advance',
        'Libro de Negocios Web Ingreso Pasivo 170 pg',
        700,
        'https://placehold.co/290x250?text=Negocios-Web-Advance&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        4,
        'Negocios Web Full',
        'Libro de Negocios Web Full Stack 220 pg',
        1000,
        'https://placehold.co/290x250?text=Negocios-Web-Full&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        5,
        'Negocios Web Master',
        'Libro de Negocios Web Master 300 pg',
        1500,
        'https://placehold.co/290x250?text=Negocios-Web-Master&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        6,
        'Negocios Web Expert',
        'Libro de Negocios Web Expert 400 pg',
        2000,
        'https://placehold.co/290x250?text=Negocios-Web-Expert&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        7,
        'Negocios Web Guru',
        'Libro de Negocios Web Guru 500 pg',
        2500,
        'https://placehold.co/290x250?text=Negocios-Web-Guru&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        8,
        'Negocios Web Master Ninha',
        'Libro de Negocios Web Master Ninja 300 pg',
        1500,
        'https://placehold.co/290x250?text=Negocios-Web-Master-Ninja&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        9,
        'Negocios Web Expert Ninja',
        'Libro de Negocios Web Expert Ninja 400 pg',
        2000,
        'https://placehold.co/290x250?text=Negocios-Web-Expert-Ninja&font=roboto',
        'ACT'
    );

INSERT INTO
    `electronics_products` (
        `productId`,
        `productName`,
        `productDescription`,
        `productPrice`,
        `productImgUrl`,
        `productStatus`
    )
VALUES (
        10,
        'Negocios Web Guru Ninja',
        'Libro de Negocios Web Guru Ninja 500 pg',
        2500,
        'https://placehold.co/290x250?text=Negocios-Web-Guru-Ninja&font=roboto',
        'ACT'
    );

INSERT INTO
    `sales` (
        `saleId`,
        `productId`,
        `salePrice`,
        `saleStart`,
        `saleEnd`
    )
VALUES (
        1,
        3,
        500,
        '2023-08-01 00:00:00',
        '2023-10-31 23:59:59'
    );

INSERT INTO
    `sales` (
        `saleId`,
        `productId`,
        `salePrice`,
        `saleStart`,
        `saleEnd`
    )
VALUES (
        2,
        5,
        750,
        '2023-08-01 00:00:00',
        '2023-10-31 23:59:59'
    );

INSERT INTO
    `sales` (
        `saleId`,
        `productId`,
        `salePrice`,
        `saleStart`,
        `saleEnd`
    )
VALUES (
        3,
        7,
        1500,
        '2023-08-01 00:00:00',
        '2023-10-31 23:59:59'
    );

INSERT INTO
    `highlights` (
        `highlightId`,
        `productId`,
        `highlightStart`,
        `highlightEnd`
    )
VALUES (
        1,
        1,
        '2023-08-01 00:00:00',
        '2023-10-31 23:59:59'
    );

INSERT INTO
    `highlights` (
        `highlightId`,
        `productId`,
        `highlightStart`,
        `highlightEnd`
    )
VALUES (
        2,
        4,
        '2023-08-01 00:00:00',
        '2023-10-31 23:59:59'
    );


    INSERT INTO `electronics_products` 
(`productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStock`, `productStatus`) 
VALUES
-- 1
('Laptop HP Pavilion 15', 'Laptop con Intel Core i5, 8GB RAM, 512GB SSD y pantalla Full HD de 15.6".', 599.99, 'https://placehold.co/290x250?text=HP+Pavilion+15', 10, 'ACT'),
-- 2
('Smartphone Samsung Galaxy S24', 'Teléfono inteligente con pantalla AMOLED de 6.8", 256GB de almacenamiento y cámara de 200MP.', 899.00, 'https://placehold.co/290x250?text=Samsung+Galaxy+S24', 15, 'ACT'),
-- 3
('Smart TV LG 55"', 'Televisor inteligente 4K UHD con WebOS, compatible con Alexa y Google Assistant.', 649.50, 'https://placehold.co/290x250?text=LG+Smart+TV+55', 8, 'ACT'),
-- 4
('Audífonos Sony WH-1000XM5', 'Audífonos inalámbricos con cancelación activa de ruido y batería de hasta 30 horas.', 349.00, 'https://placehold.co/290x250?text=Sony+WH-1000XM5', 25, 'ACT'),
-- 5
('Cámara Canon EOS Rebel T7', 'Cámara réflex digital con sensor de 24.1 MP y lente 18-55mm incluida.', 479.99, 'https://placehold.co/290x250?text=Canon+EOS+T7', 5, 'ACT'),
-- 6
('Consola PlayStation 5', 'Consola de videojuegos de última generación con SSD ultra rápido y control DualSense.', 699.00, 'https://placehold.co/290x250?text=PS5+Console', 7, 'ACT'),
-- 7
('Reloj Apple Watch Series 9', 'Reloj inteligente con pantalla Always-On, seguimiento de salud y GPS integrado.', 399.00, 'https://placehold.co/290x250?text=Apple+Watch+S9', 12, 'ACT'),
-- 8
('Tablet Xiaomi Pad 6', 'Tablet con pantalla de 11", procesador Snapdragon 870, 128GB de almacenamiento y batería de larga duración.', 319.90, 'https://placehold.co/290x250?text=Xiaomi+Pad+6', 9, 'ACT'),
-- 9
('Proyector Epson PowerLite X49', 'Proyector XGA con 3600 lúmenes, ideal para presentaciones y clases.', 429.99, 'https://placehold.co/290x250?text=Epson+X49', 6, 'INA'),
-- 10
('Bocina JBL Charge 5', 'Altavoz portátil Bluetooth con sonido potente, batería de 20 horas y resistencia al agua.', 149.99, 'https://placehold.co/290x250?text=JBL+Charge+5', 0, 'INA');

