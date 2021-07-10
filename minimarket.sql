-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2021 a las 16:28:22
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `minimarket`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `almacenxProd` ()  select * from almacen,stock_almacen,producto where almacen.id_alma=stock_almacen.id_alma and stock_almacen.id_prod=producto.id_prod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorCatpProd` (`Cat` INT)  SELECT * FROM producto WHERE id_categ = cat$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorCodProd` (IN `codBarra` VARCHAR(20))  SELECT * FROM producto WHERE cod_barra_prod LIKE '%'+ codBarra +'%'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorDescripProd` (IN `detalle` VARCHAR(70))  SELECT * FROM producto WHERE detalle_prod LIKE concat('%',detalle,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorDNICliente` (IN `dni` INT)  SELECT * FROM persona WHERE num_doc_per = dni & tipo_per = 'CLIENTE'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorDNIUsuario` (IN `dni` INT)  SELECT * FROM usuario_rol WHERE num_doc_u = dni$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorIDCLiente` (`id` INT)  SELECT * FROM persona WHERE id_persona = id & tipo_per = 'CLIENTE'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorIDLote` (`id` INT)  SELECT * FROM persona WHERE id_lote = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorIDRol` (`id` INT)  SELECT * FROM rol WHERE id_rol = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorIDUsuario` (`id` INT)  SELECT * FROM usuario WHERE id_usuario = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorNombreRol` (IN `nombre` VARCHAR(50))  SELECT * FROM rol WHERE nombre_rol like concat('%',nombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorNomCliente` (IN `nombre` VARCHAR(50))  SELECT * FROM persona WHERE nombre_per like concat('%',nombre,'%') & tipo_per = 'CLIENTE'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorNomProd` (IN `nombre` VARCHAR(50))  SELECT * FROM producto WHERE nombre_prod LIKE concat('%',nombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorNomUsuario` (IN `nombre` VARCHAR(50))  SELECT * FROM usuario_rol WHERE nombre_u LIKE CONCAT('%',nombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorProductoLote` (`producto` VARCHAR(50))  SELECT * FROM persona WHERE id_prod LIKE '%' + producto + '%'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorRIDCategoria` (`id` INT)  SELECT * FROM persona WHERE id_categ = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorRIDProveedor` (`id` INT)  SELECT * FROM persona WHERE id_persona = id & tipo_per = 'PROVEEDOR'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorRNombreCategoria` (IN `nombre` VARCHAR(20))  SELECT * FROM persona WHERE nombre_categ LIKE concat('%',nombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorRNomProveedor` (IN `nombre` VARCHAR(50))  SELECT * FROM persona WHERE nombre_per like concat('%',nombre,'%' ) & tipo_per = 'PROVEEDOR'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorRUCProveedor` (`ruc` INT)  SELECT * FROM persona WHERE num_doc_per = ruc & tipo_per = 'PROVEEDOR'$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPorSerieLote` (IN `nombre` VARCHAR(20))  SELECT * FROM persona WHERE serie_lote LIKE concat('%',nombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Lotexproducto` ()  SELECT * FROM lote,producto WHERE lote.id_prod = producto.id_prod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductoTotal` ()  select * from almacen,stock_almacen,producto,lote where almacen.id_alma=stock_almacen.id_alma and stock_almacen.id_prod=producto.id_prod and lote.id_prod=producto.id_prod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuarioxRol` ()  SELECT * FROM usuario,rol where usuario.id_rol = rol.id_rol$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id_alma` int(11) NOT NULL,
  `nombre_alma` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion_alma` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono_alma` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_alma`, `nombre_alma`, `direccion_alma`, `telefono_alma`) VALUES
(1, 'almacen1', 'wewqe', '151653'),
(2, 'almacen2', '', ''),
(3, 'almacen3', 'eqwasdas', 'qweqw'),
(6, 'almacen3', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fn` date DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `email`, `fn`, `nombre`) VALUES
(1, 'correo1', '2020-02-05', 'nombre1'),
(2, 'correo2', '2020-02-05', 'nombre2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_sequence`
--

CREATE TABLE `alumno_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `alumno_sequence`
--

INSERT INTO `alumno_sequence` (`next_val`) VALUES
(3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categ` int(11) NOT NULL,
  `nombre_categ` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion_categ` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_categ` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categ`, `nombre_categ`, `descripcion_categ`, `estado_categ`) VALUES
(1, 'Cereales', NULL, b'1'),
(4, 'CERA', '', b'1'),
(5, 'nombnre', '', b'0'),
(6, 'dasda', '', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `id_det_venta` int(11) NOT NULL,
  `cantidad_deting` int(11) NOT NULL,
  `precio_deting` decimal(11,2) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `id_ingreso` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_det_venta` int(11) NOT NULL,
  `cantidad_detventa` int(11) NOT NULL,
  `precio_detventa` decimal(11,2) NOT NULL,
  `descuento_detventa` decimal(11,2) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id_ingreso` int(11) NOT NULL,
  `tipo_ing` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `serie_ing` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `num_ing` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_ing` date NOT NULL,
  `impuesto_ing` decimal(11,2) NOT NULL,
  `total_ing` decimal(11,2) NOT NULL,
  `estado_ing` bit(1) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_lote` int(11) NOT NULL,
  `serie_lote` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_venc_lote` date NOT NULL,
  `estado_lote` bit(1) NOT NULL,
  `id_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id_lote`, `serie_lote`, `fecha_venc_lote`, `estado_lote`, `id_prod`) VALUES
(1, 'qweqwe', '2021-05-31', b'1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre_per` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_per` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tipo_per` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tipo_doc_per` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `num_doc_per` int(11) DEFAULT NULL,
  `sexo_per` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_nac_per` date DEFAULT NULL,
  `direccion_per` varchar(70) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono_per` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email_per` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado_per` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre_per`, `apellido_per`, `tipo_per`, `tipo_doc_per`, `num_doc_per`, `sexo_per`, `fecha_nac_per`, `direccion_per`, `telefono_per`, `email_per`, `estado_per`) VALUES
(1, 'awewafdsa', 'ewarrasffsa', 'CLIENTE', 'DNI', 123332, 'F', NULL, '', '2132', 'asfasfas@safasf.dsa', b'1'),
(3, 'weqwe', '', 'CLIENTE', 'DNI', 213, 'M', NULL, '', '', '', b'0'),
(4, 'sadsdas', '', 'CLIENTE', 'DNI', NULL, 'M', NULL, '', '', '', b'1'),
(5, 'qaweqw', '', 'CLIENTE', 'DNI', NULL, 'M', NULL, '', '', '', b'0'),
(7, 'dasdazdd', '', 'CLIENTE', 'DNI', NULL, 'F', '2021-06-09', '', '', '', b'1'),
(8, 'cliente', 'jejee', 'CLIENTE', 'DNI', NULL, 'M', NULL, '', '', '', b'1'),
(9, 'asdasd', NULL, 'PROVEEDOR', 'DNI', NULL, NULL, NULL, '', '', '', b'1'),
(10, 'sdfasfdas', NULL, 'PROVEEDOR', 'DNI', NULL, NULL, NULL, '', '', '', b'1'),
(11, 'nombre', NULL, 'PROVEEDOR', 'RUC', 123213, NULL, '2021-06-09', 'direcc', '12312', 'sadasd', b'0'),
(12, 'dsasdasd', NULL, 'PROVEEDOR', 'DNI', 213233, NULL, NULL, '', '', '', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_prod` int(11) NOT NULL,
  `nombre_prod` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cod_barra_prod` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `precio_prod` decimal(11,2) NOT NULL,
  `imagen_prod` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_prod` bit(1) NOT NULL,
  `detalle_prod` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `id_categ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_prod`, `nombre_prod`, `cod_barra_prod`, `precio_prod`, `imagen_prod`, `estado_prod`, `detalle_prod`, `id_categ`) VALUES
(1, 'producto1', '12185456', '12.00', '', b'1', 'sadasdsad', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `productos_totales`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `productos_totales` (
`cod_barra_prod` varchar(50)
,`nombre_categ` varchar(20)
,`nombre_prod` varchar(20)
,`detalle_prod` varchar(100)
,`precio_prod` decimal(11,2)
,`stock_almacen` int(11)
,`serie_lote` varchar(20)
,`fecha_venc_lote` date
,`nombre_alma` varchar(20)
,`estado_prod` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `reg_venta_rol` bit(1) DEFAULT NULL,
  `reg_ing_rol` bit(1) DEFAULT NULL,
  `reg_prod_rol` bit(1) DEFAULT NULL,
  `reg_prov_rol` bit(1) DEFAULT NULL,
  `reg_cli_rol` bit(1) DEFAULT NULL,
  `reg_cat_rol` bit(1) DEFAULT NULL,
  `reg_lote_rol` bit(1) DEFAULT NULL,
  `reg_rol_rol` bit(1) DEFAULT NULL,
  `anular_venta_rol` bit(1) DEFAULT NULL,
  `anular_ing_rol` bit(1) DEFAULT NULL,
  `info_venta_rol` bit(1) DEFAULT NULL,
  `info_ingreso_rol` bit(1) DEFAULT NULL,
  `respaldarBD_rol` bit(1) DEFAULT NULL,
  `restaurarBD_rol` bit(1) DEFAULT NULL,
  `info_caja_rol` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `reg_venta_rol`, `reg_ing_rol`, `reg_prod_rol`, `reg_prov_rol`, `reg_cli_rol`, `reg_cat_rol`, `reg_lote_rol`, `reg_rol_rol`, `anular_venta_rol`, `anular_ing_rol`, `info_venta_rol`, `info_ingreso_rol`, `respaldarBD_rol`, `restaurarBD_rol`, `info_caja_rol`) VALUES
(7, 'ADMIN', b'1', b'1', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(8, 'VENDEDOR', b'1', b'1', b'0', b'0', b'1', b'1', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(9, 'FRIEND', b'1', b'0', b'0', b'0', b'0', b'1', b'0', b'0', b'0', b'1', b'1', b'1', b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_almacen`
--

CREATE TABLE `stock_almacen` (
  `id_stock_alma` int(11) NOT NULL,
  `stock_almacen` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `id_alma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `stock_almacen`
--

INSERT INTO `stock_almacen` (`id_stock_alma`, `stock_almacen`, `id_prod`, `id_alma`) VALUES
(1, 20, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_u` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_u` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `tipo_doc_u` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `num_doc_u` int(11) NOT NULL,
  `fecha_nac_u` date DEFAULT NULL,
  `email_u` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion_u` varchar(70) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono_u` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `user_u` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `password_u` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `estado_u` bit(1) NOT NULL,
  `id_rol_u` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_u`, `apellido_u`, `tipo_doc_u`, `num_doc_u`, `fecha_nac_u`, `email_u`, `direccion_u`, `telefono_u`, `user_u`, `password_u`, `estado_u`, `id_rol_u`) VALUES
(36, 'dasd', 'dasdas', 'DNI', 21323, NULL, '', '', '', 'admin', 'admin', b'1', 7),
(37, 'Hola', '', 'DNI', 1231232, NULL, '', '', '', 'asdasd', 'asdasd', b'1', 9);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuario_rol`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuario_rol` (
`id_usuario` int(11)
,`nombre_u` varchar(50)
,`apellido_u` varchar(50)
,`tipo_doc_u` varchar(10)
,`num_doc_u` int(11)
,`fecha_nac_u` date
,`email_u` varchar(50)
,`direccion_u` varchar(70)
,`telefono_u` varchar(15)
,`user_u` varchar(20)
,`password_u` varchar(8)
,`estado_u` bit(1)
,`id_rol_u` int(11)
,`id_rol` int(11)
,`nombre_rol` varchar(20)
,`reg_venta_rol` bit(1)
,`reg_ing_rol` bit(1)
,`reg_prod_rol` bit(1)
,`reg_prov_rol` bit(1)
,`reg_cli_rol` bit(1)
,`reg_cat_rol` bit(1)
,`reg_lote_rol` bit(1)
,`reg_rol_rol` bit(1)
,`anular_venta_rol` bit(1)
,`anular_ing_rol` bit(1)
,`info_venta_rol` bit(1)
,`info_ingreso_rol` bit(1)
,`respaldarBD_rol` bit(1)
,`restaurarBD_rol` bit(1)
,`info_caja_rol` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `tipo_venta` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `serie_venta` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `num_venta` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_venta` date NOT NULL,
  `impuesto_venta` decimal(11,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura para la vista `productos_totales`
--
DROP TABLE IF EXISTS `productos_totales`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productos_totales`  AS SELECT `producto`.`cod_barra_prod` AS `cod_barra_prod`, `categoria`.`nombre_categ` AS `nombre_categ`, `producto`.`nombre_prod` AS `nombre_prod`, `producto`.`detalle_prod` AS `detalle_prod`, `producto`.`precio_prod` AS `precio_prod`, `stock_almacen`.`stock_almacen` AS `stock_almacen`, `lote`.`serie_lote` AS `serie_lote`, `lote`.`fecha_venc_lote` AS `fecha_venc_lote`, `almacen`.`nombre_alma` AS `nombre_alma`, `producto`.`estado_prod` AS `estado_prod` FROM ((((`almacen` join `stock_almacen` on(`almacen`.`id_alma` = `stock_almacen`.`id_alma`)) join `producto` on(`stock_almacen`.`id_prod` = `producto`.`id_prod`)) join `lote` on(`producto`.`id_prod` = `lote`.`id_prod`)) join `categoria` on(`producto`.`id_categ` = `categoria`.`id_categ`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usuario_rol`
--
DROP TABLE IF EXISTS `usuario_rol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_rol`  AS SELECT `usuario`.`id_usuario` AS `id_usuario`, `usuario`.`nombre_u` AS `nombre_u`, `usuario`.`apellido_u` AS `apellido_u`, `usuario`.`tipo_doc_u` AS `tipo_doc_u`, `usuario`.`num_doc_u` AS `num_doc_u`, `usuario`.`fecha_nac_u` AS `fecha_nac_u`, `usuario`.`email_u` AS `email_u`, `usuario`.`direccion_u` AS `direccion_u`, `usuario`.`telefono_u` AS `telefono_u`, `usuario`.`user_u` AS `user_u`, `usuario`.`password_u` AS `password_u`, `usuario`.`estado_u` AS `estado_u`, `usuario`.`id_rol_u` AS `id_rol_u`, `rol`.`id_rol` AS `id_rol`, `rol`.`nombre_rol` AS `nombre_rol`, `rol`.`reg_venta_rol` AS `reg_venta_rol`, `rol`.`reg_ing_rol` AS `reg_ing_rol`, `rol`.`reg_prod_rol` AS `reg_prod_rol`, `rol`.`reg_prov_rol` AS `reg_prov_rol`, `rol`.`reg_cli_rol` AS `reg_cli_rol`, `rol`.`reg_cat_rol` AS `reg_cat_rol`, `rol`.`reg_lote_rol` AS `reg_lote_rol`, `rol`.`reg_rol_rol` AS `reg_rol_rol`, `rol`.`anular_venta_rol` AS `anular_venta_rol`, `rol`.`anular_ing_rol` AS `anular_ing_rol`, `rol`.`info_venta_rol` AS `info_venta_rol`, `rol`.`info_ingreso_rol` AS `info_ingreso_rol`, `rol`.`respaldarBD_rol` AS `respaldarBD_rol`, `rol`.`restaurarBD_rol` AS `restaurarBD_rol`, `rol`.`info_caja_rol` AS `info_caja_rol` FROM (`usuario` join `rol` on(`usuario`.`id_rol_u` = `rol`.`id_rol`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id_alma`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categ`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`id_det_venta`),
  ADD KEY `id_prod` (`id_prod`),
  ADD KEY `id_ingreso` (`id_ingreso`),
  ADD KEY `id_stock` (`id_stock`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_det_venta`),
  ADD KEY `id_prod` (`id_prod`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_stock` (`id_stock`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_lote`),
  ADD KEY `id_prod` (`id_prod`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_prod`),
  ADD KEY `id_categ` (`id_categ`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `stock_almacen`
--
ALTER TABLE `stock_almacen`
  ADD PRIMARY KEY (`id_stock_alma`),
  ADD KEY `id_prod` (`id_prod`),
  ADD KEY `id_alma` (`id_alma`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `usuario_ibfk_1` (`id_rol_u`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id_alma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `id_det_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_det_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id_ingreso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `stock_almacen`
--
ALTER TABLE `stock_almacen`
  MODIFY `id_stock_alma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `detalle_ingreso_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`),
  ADD CONSTRAINT `detalle_ingreso_ibfk_2` FOREIGN KEY (`id_ingreso`) REFERENCES `ingreso` (`id_ingreso`),
  ADD CONSTRAINT `id_stock` FOREIGN KEY (`id_stock`) REFERENCES `stock_almacen` (`id_stock_alma`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_4` FOREIGN KEY (`id_stock`) REFERENCES `stock_almacen` (`id_stock_alma`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categ`) REFERENCES `categoria` (`id_categ`);

--
-- Filtros para la tabla `stock_almacen`
--
ALTER TABLE `stock_almacen`
  ADD CONSTRAINT `stock_almacen_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`),
  ADD CONSTRAINT `stock_almacen_ibfk_2` FOREIGN KEY (`id_alma`) REFERENCES `almacen` (`id_alma`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol_u`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
