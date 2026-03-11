-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Mar 11, 2026 at 01:45 PM
-- Server version: 10.6.20-MariaDB-ubu2004
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2026_1_travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_pk` int(10) UNSIGNED NOT NULL,
  `country_fk` int(3) UNSIGNED NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `city_region` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_pk`, `country_fk`, `city_name`, `city_region`) VALUES
(1, 185, 'Springfield', 'Texas'),
(3, 46, 'Køge', 'Sjælland'),
(4, 46, 'Køge', 'test2'),
(6, 46, 'Køge1', 'test2'),
(7, 185, 'New York', 'New York'),
(8, 185, 'Køge', 'New York'),
(9, 128, 'tstststs', 'tststststststs'),
(10, 1, 'dasdasdasd', 'asdassdasdasd'),
(11, 1, 'dsadsadsadsa', 'dsadasdasdsadasd'),
(12, 46, 'Køge', 'Zealand'),
(13, 1, 'This is a test', 'This is a test'),
(14, 4, 'Time Test', 'Time Test'),
(15, 1, 'New test', 'New Test'),
(16, 1, 'etsetstest', 'setsetetsetsetsetsetse'),
(17, 2, 'aaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaa'),
(18, 2, 'aaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaa'),
(19, 1, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaa'),
(20, 4, 'aaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
(21, 5, 'aaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaaaaaaaa'),
(22, 1, 'dddddddddddddddd', 'dddddddddddddddddddddd'),
(23, 1, 'dddddddddddddddd', 'ddddddddddddddddddddddasdasd'),
(24, 3, 'bcccccccccccccccccccccccccccccccc', 'cccddddddddddddddddddddddddddd'),
(25, 1, 'da', 'dan'),
(26, 1, 'xxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxx'),
(27, 1, 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'zzzzzzzzzzzzzzzzzzzzzzzzzzz'),
(28, 1, 'xxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxx'),
(29, 1, 'zzxxxxxxxxxxxxxxxxxxxxx', 'xxxzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
(30, 1, 'zxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'xxzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
(31, 1, 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'ccccccccccccccccccccccccccccccccc'),
(32, 1, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'),
(33, 1, 'ccccccccccccccccccccccccccccccccccccc', 'cccccccccccccccccccccccccccccccccccccccccccccc'),
(34, 1, 'cccccccccccccccccccccccccccccccccccccccc', 'cccccccccccccccccccccccccccccccccccccccc'),
(35, 1, 'ccccccccccccccccc', 'cccccccccccccccccccccccccccccccccc'),
(36, 1, 'cccccccccccccccccccccccccccccccccccccc', 'cccccccccccccccccccccccccccccccccccccc'),
(37, 1, 'cccccccccccccccccccccccccccccccccccc', 'cccccccccccccccccccccccccccccccccccc'),
(38, 1, 'cccccccccccccccccccccc', 'cccccccccccccccccccccc');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_pk` int(3) UNSIGNED NOT NULL,
  `country_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_pk`, `country_name`) VALUES
(1, 'Afghanistan'),
(2, 'Albania'),
(3, 'Algeria'),
(4, 'Andorra'),
(5, 'Angola'),
(6, 'Antigua and Barbuda'),
(7, 'Argentina'),
(8, 'Armenia'),
(9, 'Australia'),
(10, 'Austria'),
(11, 'Azerbaijan'),
(12, 'Bahamas'),
(13, 'Bahrain'),
(14, 'Bangladesh'),
(15, 'Barbados'),
(16, 'Belarus'),
(17, 'Belgium'),
(18, 'Belize'),
(19, 'Benin'),
(20, 'Bhutan'),
(21, 'Bolivia'),
(22, 'Bosnia and Herzegovina'),
(23, 'Botswana'),
(24, 'Brazil'),
(25, 'Brunei'),
(26, 'Bulgaria'),
(27, 'Burkina Faso'),
(28, 'Burundi'),
(29, 'Cabo Verde'),
(30, 'Cambodia'),
(31, 'Cameroon'),
(32, 'Canada'),
(33, 'Central African Republic'),
(34, 'Chad'),
(35, 'Chile'),
(36, 'China'),
(37, 'Colombia'),
(38, 'Comoros'),
(39, 'Congo'),
(40, 'Costa Rica'),
(41, 'Croatia'),
(42, 'Cuba'),
(43, 'Cyprus'),
(44, 'Czechia'),
(45, 'Democratic Republic of the Congo'),
(46, 'Denmark'),
(47, 'Djibouti'),
(48, 'Dominica'),
(49, 'Dominican Republic'),
(50, 'Ecuador'),
(51, 'Egypt'),
(52, 'El Salvador'),
(53, 'Equatorial Guinea'),
(54, 'Eritrea'),
(55, 'Estonia'),
(56, 'Eswatini'),
(57, 'Ethiopia'),
(58, 'Fiji'),
(59, 'Finland'),
(60, 'France'),
(61, 'Gabon'),
(62, 'Gambia'),
(63, 'Georgia'),
(64, 'Germany'),
(65, 'Ghana'),
(66, 'Greece'),
(67, 'Grenada'),
(68, 'Guatemala'),
(69, 'Guinea'),
(70, 'Guinea-Bissau'),
(71, 'Guyana'),
(72, 'Haiti'),
(73, 'Honduras'),
(74, 'Hungary'),
(75, 'Iceland'),
(76, 'India'),
(77, 'Indonesia'),
(78, 'Iran'),
(79, 'Iraq'),
(80, 'Ireland'),
(81, 'Israel'),
(82, 'Italy'),
(83, 'Jamaica'),
(84, 'Japan'),
(85, 'Jordan'),
(86, 'Kazakhstan'),
(87, 'Kenya'),
(88, 'Kiribati'),
(89, 'Kuwait'),
(90, 'Kyrgyzstan'),
(91, 'Laos'),
(92, 'Latvia'),
(93, 'Lebanon'),
(94, 'Lesotho'),
(95, 'Liberia'),
(96, 'Libya'),
(97, 'Liechtenstein'),
(98, 'Lithuania'),
(99, 'Luxembourg'),
(100, 'Madagascar'),
(101, 'Malawi'),
(102, 'Malaysia'),
(103, 'Maldives'),
(104, 'Mali'),
(105, 'Malta'),
(106, 'Marshall Islands'),
(107, 'Mauritania'),
(108, 'Mauritius'),
(109, 'Mexico'),
(110, 'Micronesia'),
(111, 'Moldova'),
(112, 'Monaco'),
(113, 'Mongolia'),
(114, 'Montenegro'),
(115, 'Morocco'),
(116, 'Mozambique'),
(117, 'Myanmar'),
(118, 'Namibia'),
(119, 'Nauru'),
(120, 'Nepal'),
(121, 'Netherlands'),
(122, 'New Zealand'),
(123, 'Nicaragua'),
(124, 'Niger'),
(125, 'Nigeria'),
(126, 'North Korea'),
(127, 'North Macedonia'),
(128, 'Norway'),
(129, 'Oman'),
(130, 'Pakistan'),
(131, 'Palau'),
(132, 'Palestine'),
(133, 'Panama'),
(134, 'Papua New Guinea'),
(135, 'Paraguay'),
(136, 'Peru'),
(137, 'Philippines'),
(138, 'Poland'),
(139, 'Portugal'),
(140, 'Qatar'),
(141, 'Romania'),
(142, 'Russia'),
(143, 'Rwanda'),
(144, 'Saint Kitts and Nevis'),
(145, 'Saint Lucia'),
(146, 'Saint Vincent and the Grenadines'),
(147, 'Samoa'),
(148, 'San Marino'),
(149, 'Sao Tome and Principe'),
(150, 'Saudi Arabia'),
(151, 'Senegal'),
(152, 'Serbia'),
(153, 'Seychelles'),
(154, 'Sierra Leone'),
(155, 'Singapore'),
(156, 'Slovakia'),
(157, 'Slovenia'),
(158, 'Solomon Islands'),
(159, 'Somalia'),
(160, 'South Africa'),
(161, 'South Korea'),
(162, 'South Sudan'),
(163, 'Spain'),
(164, 'Sri Lanka'),
(165, 'Sudan'),
(166, 'Suriname'),
(167, 'Sweden'),
(168, 'Switzerland'),
(169, 'Syria'),
(170, 'Tajikistan'),
(171, 'Tanzania'),
(172, 'Thailand'),
(173, 'Timor-Leste'),
(174, 'Togo'),
(175, 'Tonga'),
(176, 'Trinidad and Tobago'),
(177, 'Tunisia'),
(178, 'Turkey'),
(179, 'Turkmenistan'),
(180, 'Tuvalu'),
(181, 'Uganda'),
(182, 'Ukraine'),
(183, 'United Arab Emirates'),
(184, 'United Kingdom'),
(185, 'United States'),
(186, 'Uruguay'),
(187, 'Uzbekistan'),
(188, 'Vanuatu'),
(189, 'Vatican City'),
(190, 'Venezuela'),
(191, 'Vietnam'),
(192, 'Yemen'),
(193, 'Zambia'),
(194, 'Zimbabwe'),
(195, 'Taiwan');

-- --------------------------------------------------------

--
-- Table structure for table `travels`
--

CREATE TABLE `travels` (
  `travel_pk` char(32) NOT NULL,
  `travel_title` varchar(100) NOT NULL,
  `city_fk` int(10) UNSIGNED NOT NULL,
  `user_fk` char(32) NOT NULL,
  `travel_date_from` bigint(20) NOT NULL,
  `travel_date_to` bigint(20) NOT NULL,
  `travel_description` text NOT NULL,
  `travel_created_at` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travels`
--

INSERT INTO `travels` (`travel_pk`, `travel_title`, `city_fk`, `user_fk`, `travel_date_from`, `travel_date_to`, `travel_description`, `travel_created_at`) VALUES
('1f728a4b333145a48e777543468ad57d', 'New test', 15, '7c52205e966e4f0691c30da5b5c530b8', 1773187200, 1773187200, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1773168278),
('23d69664243c4f289f50edd2d7427d34', 'aaaaaaaaaaaaaaaaaaaaa', 21, '7c52205e966e4f0691c30da5b5c530b8', 1773187200, 1773273600, 'aaaaaaaaaaaaaaaaaaaaaaaaaasssssssssssssssssssss', 1773169514),
('27d455b45dfb4d70ab153d0dad18b077', 'My title', 6, '12341', 1772749347, 1772749348, 'My description', 0),
('2d76c94039ab49309efb0fe97fbb4a3b', 'ddddddddddddddd', 22, '7c52205e966e4f0691c30da5b5c530b8', 1773100800, 1772323200, 'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 1773169862),
('383bac9781f84ffa8c897ade52eed05f', 'ddddddddddddddd', 23, '7c52205e966e4f0691c30da5b5c530b8', 1773100800, 1772323200, 'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 1773169885),
('4e156fa7a20c4e6eacf119eb7431f0ea', 'My title', 7, '12341', 1772749702, 1772749703, 'My description', 0),
('53997568b02b44568f568fe1b0eb974b', 'This is a test', 13, '7c52205e966e4f0691c30da5b5c530b8', 1773187200, 1773273600, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 0),
('66cba7283d8c47969afabd799c680742', 'My title', 7, '12341', 1772750385, 1772750386, 'My description', 0),
('66e192bb364e44e19762f7412d3c54c3', 'My title', 8, '12341', 1772751111, 1772751112, 'My description', 0),
('785bee1e9e4e4997a1c3da7546d83b85', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 18, '7c52205e966e4f0691c30da5b5c530b8', 1773100800, 1773187200, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1773168649),
('7fa65b9e792247e5b82169974ed61acb', 'sadasdsa', 11, '7c52205e966e4f0691c30da5b5c530b8', 1773187200, 1773532800, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 0),
('8893c94fd7e941a3b4fd9a1cfe7b2f37', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 17, '7c52205e966e4f0691c30da5b5c530b8', 1773100800, 1773187200, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1773168526),
('94fb742bfbaf43fea501498255c0b0a0', 'tstststs', 9, '7c52205e966e4f0691c30da5b5c530b8', 1773100800, 1773187200, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 0),
('9ba64f3e6ad04176bbe1cbbe50df09c1', 'My title', 6, '12341', 1772749612, 1772749613, 'My description', 0),
('9f85bd4973064049a327325bde044c30', 'My title', 8, '0ccec45a3f4148dfb35fce680e5ccb2d', 1773100800, 1773100800, 'My description', 1773169094),
('a128a8d1b8c34d3889478804635c4ee3', 'asdasda', 10, '7c52205e966e4f0691c30da5b5c530b8', 1772582400, 1773187200, 'asasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 0),
('b68f979bac494811a9cba8738ad587cf', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 24, '7c52205e966e4f0691c30da5b5c530b8', 1772323200, 1772409600, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1773169934),
('b9fb21b4d2a643588ee1b4cc2af1a462', 'asdasda', 10, '7c52205e966e4f0691c30da5b5c530b8', 1773100800, 1773187200, 'asasdssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 0),
('c4ccecdd3edd47759251c7b0f4bda62a', 'testest', 16, '7c52205e966e4f0691c30da5b5c530b8', 1773187200, 1773360000, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1773168442),
('c87cdf7f42a24646beeb7c1fbd0a8ad1', 'My title', 8, '12341', 1772751129, 1772751130, 'My description', 0),
('c8b60c09be424c26ac4816d64cf50a79', 'AAAAAAAAAAAAAAAA', 20, '7c52205e966e4f0691c30da5b5c530b8', 1772323200, 1772409600, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1773169141),
('dbab6896141a4c118d661674025b44e9', 'This is a test', 12, '7c52205e966e4f0691c30da5b5c530b8', 1773100800, 1773187200, 'Testestestestsetstestestestsetset', 0),
('e442bd525953449c92678fde0a34dff5', 'Time test', 14, '7c52205e966e4f0691c30da5b5c530b8', 1773187200, 1773273600, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 1773166355),
('ed02e651587c460d9fb631e7249555d2', 'aaaaaaaaaaaaaaaaaaaaaaaaaa', 19, '7c52205e966e4f0691c30da5b5c530b8', 1773187200, 1773273600, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 1773168881),
('edae690e808a47cfa49724ae4d394107', 'My title', 8, '12341', 1772750401, 1772750402, 'My description', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_pk` char(32) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_first_name` varchar(20) NOT NULL,
  `user_last_name` varchar(20) NOT NULL,
  `user_created_at` bigint(20) UNSIGNED NOT NULL,
  `user_updated_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `user_email`, `user_password`, `user_first_name`, `user_last_name`, `user_created_at`, `user_updated_at`) VALUES
('0ccec45a3f4148dfb35fce680e5ccb2d', 'aaa@aassaaa.dk', 'scrypt:32768:8:1$UShUmoDSpDte3Zjl$4a29967d20717cb3d94ac3b37d1110e8967a4d24b0331c03fcebf5c662532c99933b06e89670624041104f8004739e36dea5e8c4f8d6943f9047b939e5bd6d17', 'aaaa', 'bbbb', 1772745460, 1773169094),
('12341', 'asdsa', 'dsadsad', 'asdsad', 'asdasd', 1, 1772751129),
('1b656cd88ab0452e952095b212a3e557', '89@89.dk', 'scrypt:32768:8:1$5Xn2WaTdd4KbEgRe$ab82d6365d65a13332f88a0543fafaab2504d08fd27e6c0d6ab720531db88234b7a33a0a7ee198dad98929d64bf2395ab6d9ef0bed5bcac1b8a9f669078fc59c', '89', '89', 1772744907, 1772744907),
('3bce037fd8b54045bc300bb6463d9a38', '12312313@12312.dk', 'scrypt:32768:8:1$5LiuwFX3M0aT6rd6$ff988b682da6bdc660cdef940f379e1c960efcc253aefa63311fb2f6317fb5c432b378c3c7eab779fc1ecbc5f8216771e3a619fb6441817365422853f50bf904', '123131', '12312321', 1772744979, 1772744979),
('7c52205e966e4f0691c30da5b5c530b8', 'aaa@aaa.dk', 'scrypt:32768:8:1$5nXHXzTrbkEPAUTq$412168b44e1b07850f0648a977e5e3dfff2216add7fbe0c8e0d2fe7714b6c52c5c986ca11593b248c813749d376e6bcc1161dcf76c65daf250a17eeb5016147c', 'aaaa', 'bbbb', 1772745097, 1773169934),
('7e5e36635acf46339f1d07b608f48f31', '56@56.dk', 'scrypt:32768:8:1$qoZzbjoIJ1h03AY6$7fb5f44011c7902c05b327e193cffa305d964a468cb5048c486d8c4ac08c31148ca2f1ac0833105916547fbafaf5025974ba23784d156205984c927fd2a76c4b', '56', '56', 1772744883, 1772744883),
('8239667eb8bb4588ac5c6e965957102a', 'asasa@asa.dk', 'scrypt:32768:8:1$f3McSSGTdVCAHThM$cfdb1aa050d6ec2ab38eafeef2029e5ea77713e63acb8377a2e379d3b1d8654e3d4adcc984759b1074500cc39a6b141e39e5375b1797ebb142182b6eaf48f7e5', 'asas', 'asasa', 1772744933, 1772744933),
('8d803e4ee0184505beb53df218f806c7', '12@12.dk', 'scrypt:32768:8:1$PY2aqildRTk0yj4K$e8b813e5bbb43f9d68c341f5c318f43f1ae0fe435f93e33e453e5d6587fd5e04430b3fc5bcf9aa033e52074009d0ec0fa3d369076384c2d41c1d755385f3141d', '12', '12', 1772744523, 1772744523),
('93c4c548ba9049e6b66d04c0c80a5382', '78@781.dk', 'scrypt:32768:8:1$dZFPUTAEmMWmFoR8$11068f3620baf70e3d5580f2f486236fafcaa1a70cce3e487e59d881a3d89ec00faedc0f0b884122dc9c9c8af6b834fb8083b03fcaf62778ac0e2b6fc61d6792', '78', '78', 1772744829, 1772744829),
('9ef6d86172974e3ea55172bb23569bed', 'xz@xz.xz', 'scrypt:32768:8:1$1OxzEF1oBTy7U4qk$dc6c30559ea99b210d1cf4ce744337b532a45b6938e45b6f51ac1a9d4cb2bbc4b464e0cef6f70d78a784d0934d86ac755e471ea86b958fd4727eab321113ebff', 'xz', 'xz', 1773235896, 1773235944),
('e7e6c99c26fd4bc7ab3a6a4fb14ab0f5', 'asdasd@asda.dk', 'scrypt:32768:8:1$z1S3jmEcWeTpim32$1006f823ac8fb90bec774207e806c1821d2f487298ce68c5346c70c1c13447fc57762f58ded145f9b93a71949dd0941fc3f2f0875925c2a4866d8f3d30e22ef6', 'asdad', 'asdasda', 1772745425, 1772745425),
('f1c5458adce84c97b49bca7930af93d0', 'sa@sa.da', 'scrypt:32768:8:1$6kR8B7KjlX8cGi07$ca98ca41cc7a32cbef2885953c83e6dcb3e8493fc2e3ab7122b754448923d98753473eb91337612f53d4393ecc6a0b9af11b52e25c0a8112f691326d102f38fd', 'sa', 'sa', 1772744465, 1772744465),
('f26b91ab5c5448e8a57aa84621e6f82a', '78@78.dk', 'scrypt:32768:8:1$Wy2pjYypXorrC2rN$696a84fd82f40ce2f795232d331a7d6ee0a26137c8060a21c88ffda307c64b6a2472c37976ae210963ca02dfdfdf5da0ec06d63e8798af325ce786adbef7c145', '78', '78', 1772744757, 1772744757),
('f6cd211f68d04c6c9d3f4ca7a49cb738', 'xa@xa.dk', 'scrypt:32768:8:1$7MG9AA5rXQBhps6h$c594147f67cd1e843be791749df864a110cbdea98466148bcc66f40a5485a6fb140b6fccc20f4d23c53d361fa553aa3cac05ce4bf11e4dd4f68b01e01f524c3f', 'xa', 'xa', 1772744410, 1772744410),
('f9420d33f9b447818955d5a32bfaae78', 'd@d.dk', 'scrypt:32768:8:1$u7M3ToP08qAgwoOh$5ae1523aafe935822307dfd7b32fda3eddbe96966c03d82fff8a355420f7c2fedef7d8141b978db51a80be8b3d5bbd40bbb0e84474479702705c7018f041e5c3', 'dan', 'dan', 1773170435, 1773230159),
('fa2ac62e1d244969b49951da138f4e11', '23@23.dk', 'scrypt:32768:8:1$EA9Pp0tnsB5RPghi$68693f15bc4b1c55d21837b30acfd2f8e1110ca9e5e83d3667b73597ade38d943e221d19ff11697ac9bd0a80b715e340e97c8b65619e16e42866cb2a1e7aac39', '23', '23', 1772744554, 1772744554);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_pk`),
  ADD UNIQUE KEY `city_name_region` (`city_name`,`city_region`),
  ADD KEY `cities_ibfk_1` (`country_fk`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_pk`);

--
-- Indexes for table `travels`
--
ALTER TABLE `travels`
  ADD PRIMARY KEY (`travel_pk`),
  ADD UNIQUE KEY `unique_travel_entry` (`user_fk`,`city_fk`,`travel_date_from`,`travel_date_to`),
  ADD KEY `travels_ibfk_2` (`city_fk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_pk`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_pk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_pk` int(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_fk`) REFERENCES `countries` (`country_pk`) ON UPDATE CASCADE;

--
-- Constraints for table `travels`
--
ALTER TABLE `travels`
  ADD CONSTRAINT `travels_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_pk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travels_ibfk_2` FOREIGN KEY (`city_fk`) REFERENCES `cities` (`city_pk`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
