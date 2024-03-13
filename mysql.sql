-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 13-03-2024 a las 16:35:23
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `salas`
--
CREATE DATABASE IF NOT EXISTS `salas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `salas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id` int NOT NULL,
  `sala` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `aforo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`id`, `sala`, `provincia`, `municipio`, `direccion`, `telefono`, `email`, `web`, `genero`, `aforo`) VALUES
(1, 'Filomatic', 'A CORU�A', 'A Coru�a', 'R�a San Jos�, 21, 15002', '626716307', 'salafilomatic@gmail.com', 'Sin datos', 'Rock, Metal, Punk', '200-250\r'),
(2, 'Garufa', 'A CORU�A', 'A Coru�a', 'R�a Riazor, 5, 15004', '881883856', 'salagarufacoruna@gmail.com', 'Sin datos', 'Rock, Blues, Jazz', '300\r'),
(3, 'Inn', 'A CORU�A', 'A Coru�a', 'Av. Porto da Coru�a, 3, 15003', '881555255', 'info@salainnclub.com', 'http://salainnclub.com/', 'Rock, Pop', '600\r'),
(4, 'Mardi Gras', 'A CORU�A', 'A Coru�a', 'Tr.� la Torre, 8, 15002', '677428150', 'salamardigras@gmail.com', 'http://www.salamardigras.com/', 'Rock, Pop, Indie', '200\r'),
(5, 'A Reserva', 'A CORU�A', 'Carballo', 'R�a Desiderio Varela, 7, 15100', '674589857', 'salareserva2023@gmail.com', 'Sin datos', 'Rock, Pop, Punk', '140\r'),
(6, 'A Pousada da Galiza Imaxinaria', 'A CORU�A', 'Ferrol', 'R�a Pardo Baixo, 2, 15403', '981845340', 'info@apousada.eu', 'https://apousada.eu/', 'Rock, Pop, Hip-Hop, Indie', '100\r'),
(7, 'La Room', 'A CORU�A', 'Ferrol', 'R. Sol, 142, 15401', '981949786', 'salaroom@salaroom.com', 'https://www.salaroom.com/', 'Rock, Blues, Electr�nica', '100\r'),
(8, 'Ruido', 'A CORU�A', 'Ferrol', 'R. Real, 223, 15401', '616188184', 'info@ruidoblancoferrol.com', 'Sin datos', 'Rock, Metal Folk, Punk', '170\r'),
(9, 'Capitol', 'A CORU�A', 'Santiago de Compostela', 'R�a de Concepci�n Arenal, 5, 15702', '981574399', 'salacapitol@salacapitol.com', 'http://www.salacapitol.com/', 'Rock, Metal, Hip-Hop, Pop, Indie', '800\r'),
(10, 'Malatesta', 'A CORU�A', 'Santiago de Compostela', 'R�a de San Lourenzo, 51-53, 15704', '664493900', 'info@salanasa.com', 'http://www.salamalatesta.net/', 'Rock, Metal', '400\r'),
(11, 'Moon Music', 'A CORU�A', 'Santiago de Compostela', 'R. da Rep�blica Arxentina, 35, 15701', '649968839', 'moonmusicclub@hotmail.com', 'http://www.moonmusicclub.com/', 'Rock, Metal', '300\r'),
(12, 'Riquela', 'A CORU�A', 'Santiago de Compostela', 'R�a do Preguntoiro, 35, 15704', '648478109', 'eventos@riquela.com', 'http://www.riquela.com/', 'Rock, Folk, Blues, Jazz, Flamenco', '100\r'),
(13, 'S�nar', 'A CORU�A', 'Santiago de Compostela', 'R�a de Mazarelos, 4, 5, 15703', '649457919', 'pubsonar@gmail.com', 'http://www.sonarcompostela.com/', 'Rock, Blues, Indie, Electr�nica', '200\r'),
(14, 'Hell Dorado', '�LAVA', 'Vitoria', 'Venta de la Estrella Kalea, 6, 01006', '945230131', 'helldorado@helldorado.net', 'https://www.helldorado.net/', 'Rock, Blues, R&B', '250\r'),
(15, 'Jimmy Jazz Gasteiz', '�LAVA', 'Vitoria', 'Coronacion de la Virgen Blanca Kalea, 4, 01012', '945234960', 'info@jimmyjazzgasteiz.com', 'http://www.jimmyjazzgasteiz.com/', 'Pop, Rock', '800\r'),
(16, 'Le Coup', '�LAVA', 'Vitoria', 'C. Beato Tom�s de Zum�rraga, 19, 01008', '678785658', 'agendalecoup@gmail.com', 'http://www.lecoup.es/', 'Rock, Pop', '100\r'),
(17, 'Urban Rock Concept', '�LAVA', 'Vitoria', 'Gamarrako Atea, 1, 01013', '945774331', 'info@urbanrockconcept.com', 'https://www.urbanrockconcept.com/', 'Rock, Metal, Punk, Hip-Hop', '50-100\r'),
(18, 'ClanDestino', 'ALBACETE', 'Albacete', 'Av. de Espa�a, 47, 02002', '637460553', 'info@salaclandestino.com', 'http://salaclandestino.com/', 'Rock, Indie, Pop', '150\r'),
(19, 'La Cachorra Yey�', 'ALBACETE', 'Albacete', 'C. Tinte, 35, 02002', '627649399', 'lacachorrayeye@gmail.com', 'Sin datos', 'Rock, R&B, Blues', '50-150\r'),
(20, 'Sideral', 'ALBACETE', 'Albacete', 'C. Teodoro Camino, 13, 02002', '967607825', 'mcoloradosideral@gmail.com', 'Sin datos', 'Rock, Metal, Punk', '100\r'),
(21, 'Babel', 'ALICANTE', 'Alicante', 'C. del Comercio, 3, 03008', '629352487', 'salababelalicante@gmail.com', 'https://www.salababel.com/', 'Rock, Metal, Blues, Hip-Hop, Reggae', '300\r'),
(22, 'Marearock', 'ALICANTE', 'Alicante', 'C. del Comercio, 10, 03008', '690351012', 'salamarearock@gmail.com', 'Sin datos', 'Rock, Metal, Punk, Ska, Indie', '300\r'),
(23, 'Ocho y Medio', 'ALICANTE', 'Alicante', 'Plaza Sta. Teresa, 15, 03004', '699005145', 'Sin datos', 'Sin datos', 'Rock, Metal, Punk', '100\r'),
(24, 'Stereo', 'ALICANTE', 'Alicante', 'C/ Pintor Velazquez, 5, 03004', '965143946', 'conciertos@salastereo.com', 'http://www.salastereo.com/', 'Electr�nica, Pop, Indie, Rock', '124\r'),
(25, 'Rockstar Benidorm', 'ALICANTE', 'Benidorm', 'C. Gerona, 17, 03503', '666598844', 'conciertos@rockstarbenidorm.com', 'http://www.rockstarbenidorm.com/', 'Rock', '250\r'),
(26, 'TNT Blues', 'ALICANTE', 'Cox', 'C. Albatera, 7, 03350', '679819900', 'tntbluesbarcox@gmail.com', 'Sin datos', 'Rock, Metal, Punk, Blues', '150\r'),
(27, 'Subway The Pop', 'ALICANTE', 'Elche', 'Carrer Pere Ibarra, 6, 03202', '965454305', 'sbwy06@hotmail.com', 'Sin datos', 'Rock, Pop', '250\r'),
(28, 'La Gramola', 'ALICANTE', 'Orihuela', 'C. Valencia, 21, 03300', 'Sin datos', 'info@lagramola.com', 'http://www.lagramola.com/', 'Rock, Blues', 'Sin datos\r'),
(29, 'Nave Iguana', 'ALICANTE', 'San Vicente del Raspeig', 'Calle Artesanos, 6G, 03690', '965668602', 'naveiguana@hotmail.com', 'Sin datos', 'Rock, Punk, Metal', '100\r'),
(30, 'M�sm�sica �vila', '�VILA', '�vila', 'C. R�o Esla, 28B, 05004', '669124428', 'josemasmusica@gmail.com', 'Sin datos', 'Sin datos', '100-200\r'),
(31, 'Almo2bar', 'BARCELONA', 'Barcelona', '59-61, Carrer de Bruniquer, 08024', '932199345', 'ma3.produccion@gmail.com', 'http://www.grupalmodobar.com/', 'Pop, Rock, Soul, Funk', '300\r'),
(32, 'Apolo', 'BARCELONA', 'Barcelona', 'C/ Nou de la Rambla, 113, 08004', '934414001', 'info@sala-apolo.com', 'https://www.sala-apolo.com/es/', 'Rock, Jazz, Experimental, Indie, Ska', '100-1300\r'),
(33, 'Barts', 'BARCELONA', 'Barcelona', 'Av. del Paral�lel, 62, 08001', '933248494', 'info@barts.cat', 'http://www.barts.cat/', 'Rock, Pop', '130-1500\r'),
(34, 'Big Bang', 'BARCELONA', 'Barcelona', 'Carrer d\'En Botella, 7, 08001', 'Sin datos', 'bigbangbarcelona@gmail.com', 'https://www.bigbangbarcelona.com/', 'Rock, Blues, Pop, Jazz', '76\r'),
(35, 'Bikini', 'BARCELONA', 'Barcelona', 'L\'Illia, Av. Diagonal, 547, 08029', '933220800', 'bikinilive@bikinibcn.com', 'https://www.bikinibcn.com/', 'Rock, Pop, Hip-Hop, Reggae', '660\r'),
(36, 'B�veda', 'BARCELONA', 'Barcelona', 'Carrer de Roc Boronat, 33, 08005', '933004192', 'richard@backgroundnoise.es', 'http://www.salaboveda.com/', 'Rock, Metal', '450\r'),
(37, 'Diobar', 'BARCELONA', 'Barcelona', 'Av. del Marqu�s de l\'Argentera, 27, 08003', '656621145', 'diobar@diobarbcn.cat', 'https://www.diobarbcn.cat/', 'Rock, Cumbia, Funk, Jazz, Salsa', '100\r'),
(38, 'Hangar 05', 'BARCELONA', 'Barcelona', 'Carrer Bassols, 5, 08026', '601265027', 'hangar05bcn@gmail.com', 'http://www.hangar05.com/', 'Rock, Pop, Folk', 'Sin datos\r'),
(39, 'Harlem Jazz Club', 'BARCELONA', 'Barcelona', 'Carrer de la Comtessa de Sobradiel, 8, 08002', '933100755', 'zingariaproduccions@yahoo.es', 'http://www.harlemjazzclub.es/', 'Jazz, Soul, Funk, Blues, Flamenco', '38\r'),
(40, 'Heliog�bal', 'BARCELONA', 'Barcelona', 'C/ de Ram�n y Cajal, 80, 08012', 'Sin datos', 'programacio@ heliogabal.com', 'http://www.heliogabal.com/', 'Rock, Pop, Indie, Hip-Hop, Electr�nica', '100\r'),
(41, 'Jamboree Jazz & Dance Club', 'BARCELONA', 'Barcelona', 'Pl. Reial, 17, 08002', '933191789', 'info-jamboree@masimas.com', 'http://www.jamboreejazz.com/', 'Jazz, Blues, Cumbia, Electr�nica, Soul', 'Sin datos\r'),
(42, 'La Nau', 'BARCELONA', 'Barcelona', 'C. d\'�laba, 30, 08005', '932250314', 'info@lanaubcn.es', 'http://www.lanaubcn.es/', 'Rock, Folk, Pop, Tango', '350\r'),
(43, 'Laut', 'BARCELONA', 'Barcelona', 'Carrer de Vila i Vil�, 63, 08004', 'Sin datos', 'lautconcert@laut.es', 'http://laut.es/', 'Electr�nica, Disco, DJ', '230\r'),
(44, 'Live Music Marula', 'BARCELONA', 'Barcelona', 'Carrer dels Escudellers, 49, 08002', '933187690', 'eventosbcn@marulacafe.com', 'http://www.marulacafe.com/bcn', 'Electr�nica, Disco, Funk, DJ', '200\r'),
(45, 'Luz de Gas', 'BARCELONA', 'Barcelona', 'C/ de Muntaner, 246, 08021', '932097711', 'comunicacio@luzdegas.com', 'http://www.luzdegas.com/', 'Jazz., Soul, Rock', '500-800\r'),
(46, 'New Fizz', 'BARCELONA', 'Barcelona', 'C/ de Balmes, 83, 08008', '606880101', 'newfizzprogramacion@gmail.com', 'http://www.newfizz.es/', 'Autor, Ac�sticos', '50-150\r'),
(47, 'Nota 79', 'BARCELONA', 'Barcelona', 'Carrer de Vallirana, 79, 08006', '669893140', 'management@nota79.cat', 'http://www.nota79.cat/', 'Pop, Rock', '90\r'),
(48, 'Razzmatazz', 'BARCELONA', 'Barcelona', 'C/ dels Almog�vers, 122, 08018', '933208200', 'inforazz@salarazzmatazz.com', 'http://www.salarazzmatazz.com/', 'Rock, Indie, Pop, Techno, Hip-Hop', '150-2000\r'),
(49, 'Sidecar', 'BARCELONA', 'Barcelona', 'Pl. Reial, 7, 08002', '933177666', 'info@sidecar.es', 'http://www.sidecar.es/', 'Electr�nica, R&B, Soul, Rock, Pop', '300\r'),
(50, 'Soda Ac�stic', 'BARCELONA', 'Barcelona', 'Carrer de les Guilleries, 6, 08012', '930165590', 'info@soda.cat', 'http://soda.cat/', 'Jazz, Folk, Pop', '76\r'),
(51, 'Upload', 'BARCELONA', 'Barcelona', 'Av. de Francesc Ferrer i Gu�rdia, 13, 08038', 'Sin datos', 'info@sala-upload.com', 'http://www.sala-upload.com/', 'Rock, Punk, Techno, Trap, DJ', '212\r'),
(52, 'Vivaldi', 'BARCELONA', 'Barcelona', 'C/ de Llan�a, 5, 08015', '667481486', 'info@salavivaldi.com', 'https://www.salavivaldi.com/', 'Latina, Bachata, Salsa, Rock', '250\r'),
(53, 'Vol', 'BARCELONA', 'Barcelona', 'C/ de Sancho de �vila, 78, 08018', 'Sin datos', 'vol@lafluent.com', 'https://salavol.com/', 'Electr�nica, Rock, Pop, Folk', '150\r'),
(54, '23 Robadors', 'BARCELONA', 'Barcelona', 'Carrer d\'En Robador, 23, 08001', 'Sin datos', '23robadors@gmail.com', 'https://23robadors.com/', 'Jazz, Flamenco, Funk, Rock, Latina', 'Sin datos\r'),
(55, 'Lennon\'s Club', 'BARCELONA', 'L\'Hospitalet de Llobregat', 'Av. Fabregada, 91, 08901', '933370250', 'lennonsbcn@gmail.com', 'http://lennonsclub.com/', 'Electr�nica, Rock, Punk, Indie, Pop', '60-170\r'),
(56, 'Salamandra', 'BARCELONA', 'L\'Hospitalet de Llobregat', 'Av. del Carrilet, 235, 08907', '933370602', 'salamandra@salamandra.cat', 'http://www.salamandra.cat/', 'Rock, Metal, Hardcore', '800\r'),
(57, 'The Garage Club', 'BARCELONA', 'L\'Hospitalet de Llobregat', 'Passatge Can Pol�tic, 13, 08907', '937048904', 'thegarage@thebassvalley.com', 'https://thebassvalley.com/the-garage-club/', 'DJ, Electr�nica, Techno', '300\r'),
(58, 'And�n 56', 'BURGOS', 'Burgos', 'C. San Pedro y San Felices, 56, 09001', 'Sin datos', 'contratacion@elanden56.com', 'https://www.elanden56.com/', 'Rock, Metal, Hardcore, Jazz, Hip-Hop', '1200\r'),
(59, 'Rock Beer The New', 'CANTABRIA', 'Santander', 'C. Pe�as Redondas, 15, 39010', '608287067', 'rockbeerthenew@hotmail.com', 'https://rockbeerthenew.es/', 'Rock, Metal, Punk', '150\r'),
(60, 'Monkey Man', 'GUADALAJARA', 'Guadalajara', 'C. del Alam�n, 121, 19005', '616936364', 'salamonkeyman@gmail.com', 'https://cafeteatromonkeyman.com/', 'Rock, Pop', '150\r'),
(61, 'Fundici�n', 'LA RIOJA', 'Logro�o', 'C. de la Fundici�n, 4, 26002', 'Sin datos', 'info@salafundicion.es', 'https://salafundicion.es/', 'Rock, Metal Pop, Funk', '400\r'),
(62, 'Academy', 'MADRID', 'Madrid', 'C. de Fern�ndez de los R�os, 67, 28015', '638370792', 'info@academymadrid.com', 'Sin datos', 'Rock, Pop', '100\r'),
(63, 'Audio Rock', 'MADRID', 'Madrid', 'Cam. de las Hormigueras, 175, puerta 11, 28031', '656930590', 'audiorock.audiorock@gmail.com', 'http://www.audiorock.es/', 'Rock, Metal, Pop', '150\r'),
(64, 'BarCo', 'MADRID', 'Madrid', 'C. del Barco, 34, 28004', '915212447', 'pdejuan@barcobar.com', 'http://www.salabarco.com/', 'Rock, Pop, Reggae, Funk, Latina', '200\r'),
(65, 'Barracudas', 'MADRID', 'Madrid', 'Calle de Brescia, 19, 28028', '693757061', 'agenda.barracudas@gmail.com', 'http://www.barracudasrockbar.com/', 'Rock, Metal', '150\r'),
(66, 'B�ho Real', 'MADRID', 'Madrid', 'C. de Regueros, 5, 28004', '913084851', 'salabuhorealbar@gmail.com', 'http://www.buhoreal.com/', 'Pop, Rock, Folk', '90\r'),
(67, 'But (Sala Paqui)', 'MADRID', 'Madrid', 'C. de Barcel�, 11, Local B, 28004', '914455861', 'info@butmadrid.com', 'Sin datos', 'Indie, Pop, Rock, Hip-Hop, Metal', '1000\r'),
(68, 'Cadillac Solitario', 'MADRID', 'Madrid', 'C. de Ferm�n Caballero, 6, Local C, 28034', '624601032', 'info@cadillacsolitario.com', 'http://www.cadillacsolitario.com/', 'Pop, Rock, Indie', '200\r'),
(69, 'Caf� Central', 'MADRID', 'Madrid', 'Pl. del �ngel, 10, 28012', '913694143', 'info@cafecentralmadrid.com', 'http://www.cafecentralmadrid.com/', 'Jazz', '80\r'),
(70, 'Caf� La Palma', 'MADRID', 'Madrid', 'C. de la Palma, 62, 28015', '915225031', 'cafelapalma@cafelapalma.com', 'http://www.cafelapalma.com/', 'Pop, Indie, Electr�nica, Rock', '150\r'),
(71, 'Caracol', 'MADRID', 'Madrid', 'C. de Bernardino Obreg�n, 18, 28012', '915273594', 'salacaracol@salacaracol.com', 'http://www.salacaracol.com/', 'Rock, Metal, Pop', '500\r'),
(72, 'Charada', 'MADRID', 'Madrid', 'C. de la Bola, 13, 28013', '663230504', 'info@charada.es', 'http://charada.es/', 'Pop, Rock, Indie, Metal', '120-450\r'),
(73, 'Clamores', 'MADRID', 'Madrid', 'C. de Alburquerque, 14, 28010', '914455480', 'info@salaclamores.es', 'http://www.salaclamores.es/', 'Jazz, Rock, Pop, Soul, Funk, Folk', '224\r'),
(74, 'ContraClub', 'MADRID', 'Madrid', 'C. de Bail�n, 16, 28005', '699741885', 'programacion@contraclub.es', 'http://www.contraclub.es/', 'Indie, Pop, Rock', '50-80\r'),
(75, 'Cop�rnico', 'MADRID', 'Madrid', 'C. de Fern�ndez de los R�os, 67, 28015', '665530478', 'info@salacopernico.es', 'http://www.salacopernico.es/', 'Punk, Rock, Jazz, Funk, Electr�nica', '700\r'),
(76, 'El Despertar', 'MADRID', 'Madrid', 'C. de la Torrecilla del Leal, 18, 28012', '915308095', 'programacion@cafeeldespertar.com', 'http://www.cafeeldespertar.com/', 'Jazz', '64\r'),
(77, 'El Juglar', 'MADRID', 'Madrid', 'C. de Lavapi�s, 37, 28012', '915284381', 'info@salajuglar.com', 'http://www.salajuglar.com/', 'Funk, Fusion, Rock, Pop, Indie', '250\r'),
(78, 'El Sol', 'MADRID', 'Madrid', 'C. de los Jardines, 3, 28013', '915224403', 'programacion@salaelsol.com', 'http://www.salaelsol.com/', 'Pop, Rock, Folk', '300\r'),
(79, 'Galileo Galilei', 'MADRID', 'Madrid', 'C. de Galileo, 100, 28015', '915347557', 'prensa@salagalileo.es', 'http://www.salagalileogalilei.com/', 'Pop, Rock', '500\r'),
(80, 'Gruta 77', 'MADRID', 'Madrid', 'C. Cuclillo, 6, 28019', '914712370', 'oficina@gruta77.com', 'http://www.gruta77.com/ ', 'Rock, Metal, Pop', '300\r'),
(81, 'Honky Tonk', 'MADRID', 'Madrid', 'Calle de Covarrubias, 24, 28010', '914456191', 'honky@clubhonky.com', 'http://www.clubhonky.com/', 'Rock, Pop', '350\r'),
(82, 'Independance Club', 'MADRID', 'Madrid', 'C. de Atocha, 125, 28012', '683516474', 'independancemadrid@gmail.com', 'https://www.independanceclub.com/', 'Rock, Pop, Indie, DJ', '750\r'),
(83, 'Intruso Bar', 'MADRID', 'Madrid', 'C. de Augusto Figueroa, 3, 28004', 'Sin datos', 'info@intrusobar.com', 'http://www.intrusobar.com/', 'Funk, Rock, Pop, Indie', '200\r'),
(84, 'Joy Eslava, Teatro', 'MADRID', 'Madrid', 'C. del Arenal, 11, 28013', '915750627', 'hola@teatroeslava.com', 'https://teatroeslava.com/', 'Pop, Rock, metal, Latina, Reggaeton', '1500\r'),
(85, 'Kelly Music Box', 'MADRID', 'Madrid', 'Cmo. de Perales, 24, 28041', '610150402', 'info@kellymusicbox.com', 'https://kellymusicbox.com/', 'Rock, Pop', 'Sin datos\r'),
(86, 'La Caverna', 'MADRID', 'Madrid', 'Calle de Echegaray, 11, 28014', '650879156', 'lacavernaechegaray@gmail.com', 'https://www.salalacaverna.com/', 'Rock, Pop', '75\r'),
(87, 'La Escalera de Jacob', 'MADRID', 'Madrid', 'C. de Lavapi�s, 9, 28012', '625721745', 'programacion@laescaleradejacob.es', 'http://www.laescaleradejacob.es/', 'Pop, Rock, Soul', '65\r'),
(88, 'La Riviera', 'MADRID', 'Madrid', 'P.� Bajo de la Virgen del Puerto, S/N, 28005', '913652415', 'administracion@salariviera.com', 'https://salariviera.com/', 'Rock, Pop, Metal, Indie, Hip-Hop', '2500\r'),
(89, 'Live!!', 'MADRID', 'Madrid', 'Av. de Ntra. Sra. de F�tima, 42, 28047', '915255444', 'conciertos@lasala.biz', 'http://www.lasala.biz/', 'Rock, Metal, Pop', '250\r'),
(90, 'Moby Dick', 'MADRID', 'Madrid', 'Av. de Brasil, 5, 28020', '915557671', 'carolina.pasero@mobydickclub.com', 'http://www.mobydickclub.com/', 'Rock, Metal, Folk, Soul, Jazz', '300-350\r'),
(91, 'Moe', 'MADRID', 'Madrid', 'Av. de Alberto de Alcocer, 32, 28036', 'Sin datos', 'info@moeclub.com', 'https://www.moeclub.com/', 'Blues, Funk, Jazz, Rock', '196\r'),
(92, 'Nazca', 'MADRID', 'Madrid', 'C. de Orense, 24, 28020', '664180494', 'info@salanazcaconciertos.com', 'http://www.salanazcaconciertos.com/', 'Rock, Metal, Pop', '200-500\r'),
(93, 'Olvido', 'MADRID', 'Madrid', 'C. del Olvido, 15, 28026', '619222919', 'theo.bar2@gmail.com', 'http://www.salaolvido15.es/', 'Rock, Pop, R&B, Blues', '200\r'),
(94, 'ReviLive', 'MADRID', 'Madrid', 'C. los Cavilas, 4, 28052', '917751231', 'events@revirock.es', 'https://revi.live/', 'Rock, Metal, Blues, Jazz', '300-1000\r'),
(95, 'Rock Palace', 'MADRID', 'Madrid', 'C. de Vara de Rey, 6, 28045', '914670623', 'programacion@rock-palace.com', 'https://www.rock-palace.com/', 'Rock, Punk, Blues', '250\r'),
(96, 'Rockville', 'MADRID', 'Madrid', 'Av. de Brasil, 3 esquina, C. de Orense, 32, 28020', '638015650', 'programacion@rockville.es', 'http://www.rockville.es/', 'Rock, Metal, Pop', '150-200\r'),
(97, 'Sala 0 Madrid', 'MADRID', 'Madrid', 'C.Gran V�a, 46, 28013', '917370247', 'eventos@super8.es', 'http://www.sala0madrid.com/', 'Rock, Pop', '200-500\r'),
(98, 'Shoko', 'MADRID', 'Madrid', 'C. de Toledo, 86, 28005', '913541680', 'hola@shokomadrid.com', 'http://www.shokomadrid.com/', 'R&B, Soul, Indie, Pop, Rock', '200-1000\r'),
(99, 'Silikona', 'MADRID', 'Madrid', 'Pl. del Encuentro, 1, 28030', '626101034', 'eventos@silikona.es', 'http://www.silikona.es/', 'Rock, Metal, Pop', '150-300\r'),
(100, 'Siroco', 'MADRID', 'Madrid', 'C. de San Dimas, 3, 28015', '915933070', 'programacion@siroco.es', 'http://www.siroco.es/', 'Rock, Metal, Pop', '200\r'),
(101, 'Sixx Rock', 'MADRID', 'Madrid', 'C. de Illescas, 100D, 28047', '604819468', 'sixxrockclub@gmail.com', 'https://sixxrock.negocio.site/', 'Rock', '100\r'),
(102, 'Starving', 'MADRID', 'Madrid', 'C. de Ferm�n Caballero, 67, bajo, 28034', '679900629', 'starvingconcierto@gmail.com', 'Sin datos', 'Rock', '150\r'),
(103, 'Tarambana', 'MADRID', 'Madrid', 'C. Dolores Armengot, 31, 28025', '914618334', 'info@tarambana.net', 'http://www.tarambana.net/', 'Rock, Pop', '100\r'),
(104, 'ThunderCat', 'MADRID', 'Madrid', 'C. de Campoamor, 11, 28004', '654511457', 'info@thundercatclub.com', 'https://thundercatclub.com', 'Rock, Pop', '232\r'),
(105, 'Trash Can Music Club - TCMC', 'MADRID', 'Madrid', 'C. del Cardenal Cisneros, 30, 28010', '649210956', 'tcmcmad@gmail.com', 'Sin datos', 'Rock', '80\r'),
(106, 'Vesta', 'MADRID', 'Madrid', 'C. del Barquillo, 29, 28004', 'Sin datos', 'programacion@salavesta.com', 'http://www.salavesta.com/', 'Jazz, Rock, Pop', '140\r'),
(107, 'Wurlitzer Ballroom', 'MADRID', 'Madrid', 'C. de las Tres Cruces, 12, 28013', '649767676', 'morgenpromo@gmail.com', 'https://www.wurlitzerballroom.com/', 'Rock, Metal, Pop', '170\r'),
(108, '38 Special', 'MADRID', 'Madrid', 'C. del Socorro, 20, 28032', '655084159', 'inforockanddestroy@gmail.com', 'Sin datos', 'Rock, Metal', '50\r'),
(109, 'Ego Live', 'MADRID', 'Alcal� de Henares', 'C. Valladolid, 4, 28804', '641524514', 'info@ego-live.com', 'http://www.ego-live.com/', 'Pop, Rock, Indie, Hip-Hop', '190\r'),
(110, 'La Dulce Harleey', 'MADRID', 'Alcal� de Henares', 'C. Andr�s Saborit, 14, B, 28802', '690953837', 'mariaaef70@gmail.com', 'https://tabernaladulceharleey.wordpress.com/', 'Rock, Metal, Blues', '100-200\r'),
(111, 'Excalibur Sur', 'MADRID', 'Alorc�n', 'C. Campo Santo, 16, 28922', 'Sin datos', 'excalibursurradio@gmail.com', 'Sin datos', 'Rock, Metal', '50-100\r'),
(112, 'Vizzio', 'MADRID', 'Alorc�n', 'C. Industrias, 32, 28923', '696400670', 'Sin datos', 'Sin datos', 'Rock, Metal', '200\r'),
(113, 'TAF Sala Joaqu�n Sabina', 'MADRID', 'Arroyomolinos', 'PI Valdefuentes, C. Fresadores, 35, 28939', '912784782', 'info@taf.es', 'http://www.taf.es/', 'Rock, Pop', '350\r'),
(114, 'Hora Rock', 'MADRID', 'Fuenlabrada', 'C. Islas Brit�nicas, 2C, 28942', '667721954', 'rickybataca48@gmail.com', 'Sin datos', 'Rock, Metal', '150\r'),
(115, 'Derry Irish Tavern', 'MADRID', 'Legan�s', 'Av. Rey Juan Carlos I, 35, 28915', '627521468', 'sala_derryirishtavern@hotmail.com', 'http://www.officialirishpub.es/', 'Blues, Rock, Indie, Pop', '250\r'),
(116, 'Kiosko Puente Viejo', 'MADRID', 'Talamanca de Jarama', 'C. de la Soledad, 7, 28160', '660419820', 'Sin datos', 'Sin datos', 'Rock, Metal, Pop, Blues', '100-300\r'),
(117, 'Eventual Music', 'M�LAGA', 'M�laga', 'C. Cuernavaca, 23, 29006', '951114992', 'info@eventualmusic.com', 'http://www.eventualmusic.com/', 'Folk, Latina, Cumbia, Flamenco, Pop', '1200\r'),
(118, 'La Trinchera', 'M�LAGA', 'M�laga', 'C. Parauta, 25, 29006', '619494993', 'info@salatrinchera.com', 'http://salatrinchera.com/', 'Rock, Metal, Pop', '600\r'),
(119, 'Par�s15', 'M�LAGA', 'M�laga', 'C. la Orotava, 25-27, PI San Lu�s, 29006', '952038626', 'info@paris15.es', 'http://www.paris15.es/', 'Rock, Metal, Pop', '3000\r'),
(120, 'ZZ PUB', 'M�LAGA', 'M�laga', 'C. Tej�n y Rodr�guez, 6, 29008', '678643450', 'info@zzpub.es', 'http://www.zzpub.es/', 'Rock, Pop, Blues', '100\r'),
(121, 'Custom', 'SEVILLA', 'Sevilla', 'Pol. Ind. Calonge, C. Metalurgia, 25, 41007', '608669044', 'contratacion@salacustom.com', 'http://www.salacustom.com/', 'Rock, Metal, Punk', '700\r'),
(122, 'Holl�nder', 'SEVILLA', 'Sevilla', 'Poligono Calonge, C. Uranio, 6, 41007', '620825043', 'a.c.dfhollander@gmail.com', 'http://salahollander.es/', 'Rock, Metal, Punk', '200\r'),
(123, 'Sala X', 'SEVILLA', 'Sevilla', 'C/ Jos� D�az, 7, 41009', '667422219', 'programacion@rocknrollaproducciones.com', 'http://lasalax.com/', 'Rock, Pop', '380\r'),
(124, 'Underground Music Club', 'SEVILLA', 'Alcal� de Guada�ra', 'Rda. de Cabeza Hermosa, 24, 41500', '722180339', 'undergroundsevilla@gmail.com', 'http://undergroundsevilla.wix.com/underground', 'Rock, Metal, Pop, Punk', '175\r'),
(125, 'Palo Palo', 'SEVILLA', 'Marinaleda', 'Av. Libertad, 15B, 41569', '955910082', 'salapalopalo@gmail.com', 'https://palopalo.com.es/', 'Rock', '400\r'),
(126, 'Black Note', 'VALENCIA', 'Valencia', 'C/ de Polo y Peyrol�n, 15, 46021', '619394665', 'info@blacknoteclub.com', 'https://www.blacknoteclub.com/', 'Rock, R&B, Soul, Funk', '250\r'),
(127, 'El Volander', 'VALENCIA', 'Valencia', 'Carrer Navarro Cabanes, 25, 46018', '646910115', 'elvolander@gmail.com', 'Sin datos', 'Rock, Pop', '50-100\r'),
(128, 'George Best Rock Club', 'VALENCIA', 'Valencia', 'C/ d\'Alzira, 12, 46007', '663146526', 'george7rockclub@gmail.com', 'Sin datos', 'Rock, Pop, indie', '50\r'),
(129, 'Loco Club', 'VALENCIA', 'Valencia', 'Carrer de l\'Erudit Orellana, 12, 46008', '963518521', 'info@lococlub.org', 'https://lococlub.es/', 'Rock, Soul, Pop, Indiem DJ', '300\r'),
(130, 'Matisse', 'VALENCIA', 'Valencia', 'C de Campoamor, 60, 46022', '685240014', 'programacion@salamatisse.es', 'http://www.matisseclub.com/', 'Jazz, Soul, Funk, Salsa, Flamenco', '300\r'),
(131, 'Moon', 'VALENCIA', 'Valencia', 'C/ de Sant Vicent M�rtir, 200, 46015', '672619933', 'contacto@salamandraonline.com', 'http://www.moonvalencia.es/web/inicio/', 'Rock, Pop, Indie', '500-600\r'),
(132, 'Peter Rock Club', 'VALENCIA', 'Valencia', 'C/ de Quart, 26, 46001', 'Sin datos', 'peterrockclubvalencia@gmail.com', 'https://peterrockclub.es/', 'Rock, Metal', '300\r'),
(133, '16 Toneladas', 'VALENCIA', 'Valencia', 'C/ de Ricardo Mic�, 3, 46009', '963494584', 'info@16toneladas.com', 'http://www.16toneladas.com/', 'Rock, Pop, Indie, R&B', '250\r'),
(134, 'Rock City', 'VALENCIA', 'Alm�ssera', 'Carrer dels Coheters, 6, 46132', '961856966', 'info@rockcity.es', 'http://www.rockcity.es/', 'Rock, Metal, Pop', '500\r'),
(135, 'Matadero Live Music', 'VALENCIA', 'Ayora', 'C. Matadero, 17, 46620', '646166009', 'salamatadero@gmail.com', 'http://salamatadero.com/', 'Rock, Metal Pop, Electr�nica', '200\r'),
(136, 'Repvblicca', 'VALENCIA', 'Mislata', 'Pol. Ind. Mislata, Carrer Baix Vinalop�, 2, 46920', '963214392', 'gerencia@republicca.com', 'http://www.republicca.com/', 'Rock, Metal, Pop, Indie, Hip-Hop, DJ', '450\r'),
(137, 'Black Pearl Club', 'VALLADOLID', 'Valladolid', 'C. Mac�as Picavea, 7, 47003', 'Sin datos', 'bpheinekenclub@hotmail.es', 'https://grupo8apellidos.es/sala-black-pearl/', 'Rock, Pop', '400\r'),
(138, 'La Cueva del Jazz', 'ZAMORA', 'Zamora', 'C. Prta Nueva, 30, 49002', '980534424', 'sala@lacuevadeljazz.com', 'http://www.lacuevadeljazz.com/', 'Rock, Pop, Jazz, Blues', '200\r'),
(139, 'La Casa del Loco', 'ZARAGOZA', 'Zaragoza', 'Cl. Mayor, 10, 50001', '976293850', 'arenarockzgz@gmail.com', 'https://www.arenarock.es/', 'Rock, Metal, Pop', '350\r'),
(140, 'Sala Z', 'ZARAGOZA', 'Zaragoza', 'C. de F�lix Latassa, 14, 50006', '976567889', 'arenarockzgz@gmail.com', 'https://www.arenarock.es/', 'Rock, Metal, Pop', '220\r'),
(141, 'Utopia', 'ZARAGOZA', 'Zaragoza', 'C. de Luis del Valle, 19, 50005', '628553581', 'salautopiaconciertos@gmail.com', 'Sin datos', 'Rock, Metal, Pop', '100\r');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Manuel Alejandro Romero Miguel', 'a@a.com', NULL, '$2y$12$T16GuOasT3xC.vUWq8dqS.XGp8lThds167P1SOdws6l6CSeqrFI/a', NULL, '2024-03-11 16:23:07', '2024-03-11 16:23:07');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
