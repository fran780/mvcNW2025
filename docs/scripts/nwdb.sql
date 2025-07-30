-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2025 a las 02:46:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nwdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `bitacoracod` int(11) NOT NULL,
  `bitacorafch` datetime DEFAULT NULL,
  `bitprograma` varchar(255) DEFAULT NULL,
  `bitdescripcion` varchar(255) DEFAULT NULL,
  `bitobservacion` mediumtext DEFAULT NULL,
  `bitTipo` char(3) DEFAULT NULL,
  `bitusuario` bigint(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretilla`
--

CREATE TABLE `carretilla` (
  `usercod` bigint(10) NOT NULL,
  `productId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carretillaanon`
--

CREATE TABLE `carretillaanon` (
  `anoncod` varchar(128) NOT NULL,
  `productId` int(11) NOT NULL,
  `crrctd` int(5) NOT NULL,
  `crrprc` decimal(12,2) NOT NULL,
  `crrfching` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `electronics_products`
--

CREATE TABLE `electronics_products` (
  `productId` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productImgUrl` varchar(255) NOT NULL,
  `productStock` int(11) NOT NULL DEFAULT 0,
  `productStatus` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `electronics_products`
--

INSERT INTO `electronics_products` (`productId`, `productName`, `productDescription`, `productPrice`, `productImgUrl`, `productStock`, `productStatus`) VALUES
(1, 'Laptop HP Pavilion 15', 'Laptop con procesador Intel Core i5, 8GB RAM, 512GB SSD y pantalla Full HD de 15.6\".', 14700.76, 'public/imagenes/HpPavilion.png', 10, 'ACT'),
(2, 'Samsung Galaxy S24', 'Teléfono inteligente con pantalla AMOLED de 6.8\", 256GB de almacenamiento y cámara de 200MP.', 22027.50, 'public/imagenes/S24Ultra.png', 15, 'ACT'),
(3, 'Smart TV LG 55\"', 'Televisor inteligente 4K UHD con WebOS, compatible con Alexa y Google Assistant.', 15913.75, 'public/imagenes/LG_SmartTV.png', 8, 'ACT'),
(4, 'Audífonos Sony WH-1000XM5', 'Audífonos inalámbricos con cancelación activa de ruido y batería de hasta 30 horas.', 8550.50, 'public/imagenes/Sony_WH1000XM5.png', 25, 'ACT'),
(5, 'Cámara Canon EOS Rebel T7', 'Cámara réflex digital con sensor de 24.1 MP y lente 18-55mm incluida.', 11759.76, 'public/imagenes/Camara.png', 5, 'ACT'),
(6, 'Consola PlayStation 5', 'Consola de videojuegos de última generación con SSD ultra rápido y control DualSense.', 17125.50, 'public/imagenes/PS5.jpg', 7, 'ACT'),
(7, 'Reloj Apple Watch Series 9', 'Reloj inteligente con pantalla Always-On, seguimiento de salud y GPS integrado.', 9775.50, 'public/imagenes/AppleWatch.png', 12, 'ACT'),
(8, 'Tablet Xiaomi Pad 6', 'Tablet con pantalla de 11\", procesador Snapdragon 870, 128GB de almacenamiento y batería de larga duración.', 7832.55, 'public/imagenes/Xiaomi_Pad.png', 9, 'ACT'),
(9, 'Proyector Epson PowerLite X49', 'Proyector XGA con 3600 lúmenes, ideal para presentaciones y clases.', 10567.75, 'public/imagenes/Proyector.png', 6, 'ACT'),
(10, 'Bocina JBL Charge 5', 'Altavoz portátil Bluetooth con sonido potente, batería de 20 horas y resistencia al agua.', 3672.76, 'public/imagenes/JBL.png', 0, 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funciones`
--

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(255) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones`
--

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('Controllers\\Checkout\\Checkout', 'Acceso al Checkout para clientes', 'ACT', 'CTR'),
('Controllers\\Checkout\\History', 'Listado Historial de Transacciones', 'ACT', 'CTR'),
('Controllers\\Checkout\\HistoryDetail', 'Formulario de Historial de Transacciones', 'ACT', 'CTR'),
('Controllers\\Productos\\ProductosForm', 'Formulario de Productos', 'ACT', 'CTR'),
('Controllers\\Productos\\ProductosList', 'Listado de Productos', 'ACT', 'CTR'),
('Controllers\\Usuarios\\Usuario', 'Formulario de Usuarios', 'ACT', 'CTR'),
('Controllers\\Usuarios\\Usuarios', 'Listado de Usuarios', 'ACT', 'CTR'),
('Menu_Productos', 'Menu_Inventario_Productos', 'ACT', 'MNU'),
('Menu_TransHist', 'Menu_Transacciones', 'ACT', 'MNU'),
('Menu_Usuarios', 'Menu_Usuarios', 'ACT', 'MNU'),
('productos_DEL', 'Eliminar Productos', 'ACT', 'FNC'),
('productos_DSP', 'Detalle de Productos', 'ACT', 'FNC'),
('productos_INS', 'Agregar Productos', 'ACT', 'FNC'),
('productos_UPD', 'Editar Productos', 'ACT', 'FNC');

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('Controllers\\Checkout\\History', 'Listado Historial de Transacciones', 'ACT', 'CTR'),
('Controllers\\Checkout\\HistoryDetail', 'Formulario de Historial de Transacciones', 'ACT', 'CTR');
-- --------------------------------------------------------

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('ADMIN', 'Controllers\\Productos\\ProductosForm', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'Controllers\\Productos\\ProductosList', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'Menu_Productos', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_DEL', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_DSP', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_INS', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_UPD', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

--
-- Estructura de tabla para la tabla `funciones_roles`
--

CREATE TABLE `funciones_roles` (
  `rolescod` varchar(128) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `funciones_roles`
--

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('ADMIN', 'Controllers\\Productos\\ProductosForm', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'Controllers\\Productos\\ProductosList', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'Controllers\\Usuarios\\Usuario', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'Controllers\\Usuarios\\Usuarios', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'Menu_Productos', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'Menu_Usuarios', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_DEL', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_DSP', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_INS', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ADMIN', 'productos_UPD', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('CLI', 'Controllers\\Checkout\\Checkout', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('CLI', 'Controllers\\Checkout\\History', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('CLI', 'Controllers\\Checkout\\HistoryDetail', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('CLI', 'Menu_TransHist', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ECI', 'Controllers\\Productos\\ProductosForm', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ECI', 'Controllers\\Productos\\ProductosList', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ECI', 'Menu_Productos', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ECI', 'productos_DSP', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('ECI', 'productos_UPD', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`, `fnexp`) VALUES
('CLI', 'Controllers\\Checkout\\HistoryDetail', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('CLI', 'Controllers\\Checkout\\History', 'ACT',  DATE_ADD(NOW(), INTERVAL 1 YEAR));
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `highlights`
--

CREATE TABLE `highlights` (
  `highlightId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `highlightStart` datetime NOT NULL,
  `highlightEnd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rolescod` varchar(128) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
('ADMIN', 'Administrador', 'ACT'),
('CLI', 'Cliente', 'ACT'),
('ECI', 'Encargado de inventario', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `usercod` bigint(10) NOT NULL,
  `rolescod` varchar(128) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`, `roleuserexp`) VALUES
(1, 'ADMIN', 'ACT', '2025-07-27 03:40:55', '2026-07-27 03:40:55'),
(2, 'ECI', 'ACT', '2025-07-28 12:48:34', '2026-07-28 12:48:34'),
(3, 'CLI', 'ACT', '2025-07-27 03:02:02', '2026-07-27 03:02:02'),
(4, 'CLI', 'ACT', '2025-07-28 12:32:19', '2026-07-28 12:32:19');

INSERT INTO roles_usuario (usercod, rolescod, roleuserest, roleuserfch, roleuserexp) VALUES
(1, 'ADMIN', 'ACT', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR)),
(2, 'CLI', 'ACT', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR)),
(3, 'ECI', 'ACT', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR)),
(4, 'CLI', 'ACT', NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR));

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `saleId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `salePrice` decimal(10,2) NOT NULL,
  `saleStart` datetime NOT NULL,
  `saleEnd` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions`
--

CREATE TABLE `transactions` (
  `transactionId` int(11) NOT NULL,
  `usercod` bigint(10) NOT NULL,
  `orderid` varchar(128) NOT NULL,
  `transdate` datetime NOT NULL,
  `transstatus` varchar(45) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(5) NOT NULL,
  `orderjson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`orderjson`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transactions`
--

INSERT INTO `transactions` (`transactionId`, `usercod`, `orderid`, `transdate`, `transstatus`, `amount`, `currency`, `orderjson`) VALUES
(1, 3, '7P214838U7137153Y', '2025-07-27 16:29:11', 'COMPLETED', 1500.00, 'USD', '{\"id\":\"7P214838U7137153Y\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743655311\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"1TP65445VK9312815\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"1500.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"1500.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"73.80\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"1426.20\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1TP65445VK9312815\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/1TP65445VK9312815\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7P214838U7137153Y\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-27T22:29:11Z\",\"update_time\":\"2025-07-27T22:29:11Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/7P214838U7137153Y\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(2, 3, '75G95400LP349382J', '2025-07-27 17:36:07', 'COMPLETED', 200.00, 'USD', '{\"id\":\"75G95400LP349382J\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743659270\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"51C12417MA470323F\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"200.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"200.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"10.10\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"189.90\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/51C12417MA470323F\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/51C12417MA470323F\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/75G95400LP349382J\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-27T23:36:07Z\",\"update_time\":\"2025-07-27T23:36:07Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/75G95400LP349382J\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(3, 3, '8HE46677XV5124250', '2025-07-27 20:04:16', 'COMPLETED', 3700.00, 'USD', '{\"id\":\"8HE46677XV5124250\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743668176\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"2PC860930F6684618\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"3700.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"3700.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"181.60\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"3518.40\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/2PC860930F6684618\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/2PC860930F6684618\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8HE46677XV5124250\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-28T02:04:17Z\",\"update_time\":\"2025-07-28T02:04:17Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8HE46677XV5124250\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(4, 3, '8GT51686S6368883L', '2025-07-27 21:29:40', 'COMPLETED', 600.00, 'USD', '{\"id\":\"8GT51686S6368883L\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743673330\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"6TU81833VN246674G\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"600.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"600.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"29.70\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"570.30\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6TU81833VN246674G\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/6TU81833VN246674G\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8GT51686S6368883L\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-28T03:29:41Z\",\"update_time\":\"2025-07-28T03:29:41Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/8GT51686S6368883L\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(5, 3, '18K49456MX8237321', '2025-07-27 21:30:26', 'COMPLETED', 400.00, 'USD', '{\"id\":\"18K49456MX8237321\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743673418\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"52D204901U9486153\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"400.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"400.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"19.90\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"380.10\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/52D204901U9486153\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/52D204901U9486153\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/18K49456MX8237321\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-28T03:30:27Z\",\"update_time\":\"2025-07-28T03:30:27Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/18K49456MX8237321\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(6, 3, '07G24676B8700844E', '2025-07-27 22:14:35', 'COMPLETED', 200.00, 'USD', '{\"id\":\"07G24676B8700844E\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743675997\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"8WD91122P8477540L\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"200.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"200.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"10.10\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"189.90\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/8WD91122P8477540L\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/8WD91122P8477540L\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/07G24676B8700844E\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-28T04:14:35Z\",\"update_time\":\"2025-07-28T04:14:35Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/07G24676B8700844E\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(7, 3, '0B4497520K3068116', '2025-07-28 02:26:47', 'COMPLETED', 300.00, 'USD', '{\"id\":\"0B4497520K3068116\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743691199\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"7EJ59804WU959612L\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"300.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"300.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"15.00\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"285.00\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7EJ59804WU959612L\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/7EJ59804WU959612L\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0B4497520K3068116\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-28T08:26:48Z\",\"update_time\":\"2025-07-28T08:26:48Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/0B4497520K3068116\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(8, 3, '5S2761653P393840K', '2025-07-28 03:18:16', 'COMPLETED', 300.00, 'USD', '{\"id\":\"5S2761653P393840K\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743694273\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"5FY03075KK633344P\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"300.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"300.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"15.00\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"285.00\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5FY03075KK633344P\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/5FY03075KK633344P\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/5S2761653P393840K\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-28T09:18:17Z\",\"update_time\":\"2025-07-28T09:18:17Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/5S2761653P393840K\",\"rel\":\"self\",\"method\":\"GET\"}]}'),
(9, 5, '675255070D3692440', '2025-07-28 12:52:39', 'COMPLETED', 300.00, 'USD', '{\"id\":\"675255070D3692440\",\"status\":\"COMPLETED\",\"payment_source\":{\"paypal\":{\"email_address\":\"fran_jf777@gmail.com\",\"account_id\":\"3DL3YE6RNXKEE\",\"account_status\":\"VERIFIED\",\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"address\":{\"country_code\":\"HN\"}}},\"purchase_units\":[{\"reference_id\":\"test1743728725\",\"shipping\":{\"name\":{\"full_name\":\"Francisco Fernandez\"},\"address\":{\"address_line_1\":\"Free Trade Zone\",\"admin_area_2\":\"Tegucigalpa\",\"admin_area_1\":\"Tegucigalpa\",\"postal_code\":\"12345\",\"country_code\":\"HN\"}},\"payments\":{\"captures\":[{\"id\":\"45R72145GL547083A\",\"status\":\"COMPLETED\",\"amount\":{\"currency_code\":\"USD\",\"value\":\"300.00\"},\"final_capture\":true,\"seller_protection\":{\"status\":\"ELIGIBLE\",\"dispute_categories\":[\"ITEM_NOT_RECEIVED\",\"UNAUTHORIZED_TRANSACTION\"]},\"seller_receivable_breakdown\":{\"gross_amount\":{\"currency_code\":\"USD\",\"value\":\"300.00\"},\"paypal_fee\":{\"currency_code\":\"USD\",\"value\":\"15.00\"},\"net_amount\":{\"currency_code\":\"USD\",\"value\":\"285.00\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/45R72145GL547083A\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/payments\\/captures\\/45R72145GL547083A\\/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/675255070D3692440\",\"rel\":\"up\",\"method\":\"GET\"}],\"create_time\":\"2025-07-28T18:52:39Z\",\"update_time\":\"2025-07-28T18:52:39Z\"}]}}],\"payer\":{\"name\":{\"given_name\":\"Francisco\",\"surname\":\"Fernandez\"},\"email_address\":\"fran_jf777@gmail.com\",\"payer_id\":\"3DL3YE6RNXKEE\",\"address\":{\"country_code\":\"HN\"}},\"links\":[{\"href\":\"https:\\/\\/api.sandbox.paypal.com\\/v2\\/checkout\\/orders\\/675255070D3692440\",\"rel\":\"self\",\"method\":\"GET\"}]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usercod` bigint(10) NOT NULL,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usercod`, `useremail`, `username`, `userpswd`, `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`) VALUES
(1, 'guillermoortega29@gmail.com', 'Guillermo Ortega', '$2y$10$7I6zJqit/y5f1kjv.LEjK.EEaR2m9gttLqwRbYyofxd5T3vuffE2C', '2025-07-23 23:30:09', 'ACT', '2025-10-21 00:00:00', 'ACT', '89e20113d8193167f40f4df2bb74b9b3d6477455b41f71c1f7c18d2282110c79', '2025-07-23 23:30:09', 'PBL'),
(2, 'fmfran7777@gmail.com', 'Francisco Fernández', '$2y$10$T4CEiRB0clmUibI83nI0KuhF3rXWvwNJmTGs2o4gbrdnceukuWQjG', '2025-07-27 02:59:24', 'ACT', '2025-10-25 00:00:00', 'ACT', '7fa747755924ca9b72669e270aa202fde38e4da83c77cf0b7ca859fbd329cb5e', '2025-07-27 02:59:24', 'PBL'),
(3, 'alejandropalacios2821@gmail.com', 'Alejandro Palacios', '$2y$10$cKc1YB387uVP/mdm2hKfpO5lu7S3bGt5t70Hcoll0TShz265Ve3om', '2025-07-28 04:34:38', 'ACT', '2025-10-26 00:00:00', 'ACT', 'e69fb72cf7e72c6357f036dd0eeb4a6f727017766730f2aaca7b64b4e36bee47', '2025-07-28 04:34:38', 'PBL'),
(4, 'alefermejia7@gmail.com', 'Alejandra Fernández', '$2y$10$mrS9BJg6WPXPqtYwIARMIuJBgyiXMWJxhYQmXijJjJMKmN/EkFGHK', '2025-07-28 12:24:03', 'ACT', '2025-10-26 00:00:00', 'ACT', '0057e2dafc580e1d8ff1cb6fdd4ea80f3f909906e504668dff7665a97aadd785', '2025-07-28 12:24:03', 'PBL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`bitacoracod`);

--
-- Indices de la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD PRIMARY KEY (`usercod`,`productId`),
  ADD KEY `productId_idx` (`productId`);

--
-- Indices de la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD PRIMARY KEY (`anoncod`,`productId`),
  ADD KEY `productId_idx` (`productId`);

--
-- Indices de la tabla `electronics_products`
--
ALTER TABLE `electronics_products`
  ADD PRIMARY KEY (`productId`);

--
-- Indices de la tabla `funciones`
--
ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

--
-- Indices de la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD PRIMARY KEY (`rolescod`,`fncod`),
  ADD KEY `rol_funcion_key_idx` (`fncod`);

--
-- Indices de la tabla `highlights`
--
ALTER TABLE `highlights`
  ADD PRIMARY KEY (`highlightId`),
  ADD KEY `fk_highlights_products_idx` (`productId`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rolescod`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`usercod`,`rolescod`),
  ADD KEY `rol_usuario_key_idx` (`rolescod`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`saleId`),
  ADD KEY `fk_sales_products_idx` (`productId`);

--
-- Indices de la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionId`),
  ADD KEY `fk_transactions_user_idx` (`usercod`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usercod`),
  ADD UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  ADD KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `bitacoracod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `electronics_products`
--
ALTER TABLE `electronics_products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `highlights`
--
ALTER TABLE `highlights`
  MODIFY `highlightId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usercod` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carretilla`
--
ALTER TABLE `carretilla`
  ADD CONSTRAINT `carretilla_prd_key` FOREIGN KEY (`productId`) REFERENCES `electronics_products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `carretilla_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carretillaanon`
--
ALTER TABLE `carretillaanon`
  ADD CONSTRAINT `carretillaanon_prd_key` FOREIGN KEY (`productId`) REFERENCES `electronics_products` (`productId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `funciones_roles`
--
ALTER TABLE `funciones_roles`
  ADD CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `highlights`
--
ALTER TABLE `highlights`
  ADD CONSTRAINT `fk_highlights_products` FOREIGN KEY (`productId`) REFERENCES `electronics_products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_products` FOREIGN KEY (`productId`) REFERENCES `electronics_products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_user` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
