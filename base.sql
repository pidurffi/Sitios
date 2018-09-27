SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mensaje` text COLLATE utf8mb4_unicode_ci,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `establecimiento_activo_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `nombre`, `apellido`, `contacto`, `establecimiento_activo_id`, `created`, `updated`) VALUES
(1, 'admin', 'admin', 'admin@mardelaspampas.travel', 'admin@mardelaspampas.travel', 1, NULL, '$2y$13$/Lzvp4AtnpIIFKX/.NZGfeECQRspLOmpZBIcM.XV2l4SBT8TPIXAK', '2018-09-26 03:53:37', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', 'Admin', '', '-', 16, '2017-10-12 12:16:55', '2017-10-12 12:16:55');

CREATE TABLE `galeria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galeria` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `galeria` (`id`, `nombre`, `galeria`) VALUES
(1, 'Galería Principal', 'a:12:{i:0;s:52:\"cropped/ef57a25958f2b8403d7828920fb9c2444aeb59ee.jpg\";i:1;s:52:\"cropped/02d7e2629b66cc1ba3f38763ec766752a031cb2a.jpg\";i:2;s:52:\"cropped/174550fdfd15204713ea20e7166febd55266bd68.jpg\";i:3;s:52:\"cropped/f1bdd8524768d15a15fcfbac70792dfdb3ef2c25.jpg\";i:4;s:52:\"cropped/4d49c0d3ecb73bb404295a784157f4d7f465ec21.jpg\";i:5;s:52:\"cropped/0ec931d476cdcb4bf876cb2a3f96547c08f14302.jpg\";i:6;s:52:\"cropped/b970deb2ad44170b517cb4b75ece567cad00bef0.jpg\";i:7;s:52:\"cropped/9351c1b79849c63d0b3b09266cef1043f869a35a.jpg\";i:8;s:52:\"cropped/11ed7481598e66001f2fe056b02d7b80899276c6.jpg\";i:9;s:52:\"cropped/e68340c607dfc11fd6a6be26051bde134b1a916d.jpg\";i:10;s:52:\"cropped/07b9afc7c11b1d2e7b794c1072f5b4725b6cd35e.jpg\";i:11;s:52:\"cropped/87f4006cd027587412320f43016b9be2d4fb80a4.jpg\";}');

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `generica` tinyint(1) DEFAULT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci,
  `mensaje` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `promocion` (`id`, `nombre`, `fecha_publicacion`, `fecha_vencimiento`, `generica`, `descripcion`, `mensaje`, `imagen`, `orden`) VALUES
(1, 'El nombre', '2011-01-06', '2018-01-11', 1, 'Lineas', NULL, 'cropped/ec862302a2576a5c1637b17fd4c95e9c716a1a90.jpg', 2);


ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`),
  ADD KEY `establecimiento_activo_id` (`establecimiento_activo_id`);

ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
ALTER TABLE `galeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
ALTER TABLE `promocion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;