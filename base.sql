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
(1, 'admin', 'admin', 'admin@mardelaspampas.travel', 'admin@mardelaspampas.travel', 1, NULL, '$2y$13$vi9jSSiM5xX9OlgXUcacYusQvph65eewVnEse0pW03C5hda7xXjVe', '2018-10-09 00:35:02', NULL, NULL, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', 'Admin', '', '-', 16, '2017-10-12 12:16:55', '2017-10-12 12:16:55');

CREATE TABLE `galeria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galeria` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `galeria` (`id`, `nombre`, `galeria`) VALUES
(1, 'El hotel', 'a:6:{i:0;s:52:\"cropped/57dcd626f8fd95bc459c72c0c74b682a5db781c5.jpg\";i:1;s:52:\"cropped/6eaa6782ac7970f344760a8febdb08a0ae8d1bc1.jpg\";i:2;s:52:\"cropped/83cdac3ad92fe16e064010cd2c16f6a6a7f608da.jpg\";i:3;s:52:\"cropped/6eae516c22ec144fb22d60dac3b2bd679f32f14c.jpg\";i:4;s:52:\"cropped/a3e1f2a4a59148a289e00d0bbed93a8490e4a11e.jpg\";i:5;s:52:\"cropped/e7861464d82e6599808dc9d6f41492c222b54d0b.jpg\";}'),
(2, 'Las habitaciones', 'a:3:{i:0;s:52:\"cropped/2aa3aa29ec54b467bda648d7097e613e100ed0f3.jpg\";i:1;s:52:\"cropped/9733c1f19b0b0ba9557588397de674927f4dbea0.jpg\";i:2;s:52:\"cropped/67523cf648c815ebf25ceb88e29cc00ff3b301c0.jpg\";}');

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
(1, 'Feriado Octubre', '2011-01-06', '2018-01-11', 1, 'En una ubicación privilegiada a metros del mar, Arenas de Mar cuanta con un total de 12 confortables departamentos', NULL, 'cropped/de1a3c7d6ea7e069897667475929e22a3ec10605.jpg', 1),
(2, 'Feriado Noviembre', '2018-10-01', '2022-03-30', 1, 'A muy pocos pasos de la playa y algunas cuadras del centro comercial de Villa Gesell, se encuentran los departamentos Arenas de Mar', NULL, 'cropped/9a18e0e83200cd667c646abf266ad6190e04a12b.jpg', 2),
(3, 'Diciembre en Merimar', '2018-10-01', '2022-10-31', 1, 'Villa Gesell no solo cuenta con las playas mas lindas de la costa atlántica. Arenas finas, medanos, bosque, historia, aventura, diversión...', NULL, 'cropped/790a2762d54cb433f659b8ae9b312558fd01ebea.jpg', 3);


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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;