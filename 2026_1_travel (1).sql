-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Mar 12, 2026 at 10:13 PM
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
(38, 1, 'cccccccccccccccccccccc', 'cccccccccccccccccccccc'),
(39, 1, 'cccccccccccccccccc', 'cccccccccccccccccc'),
(40, 1, 'cccccccccccccccccccccccccccccccccccccccccccccc', 'cccccccccccccccccccccccccccccccccccccccccccccc'),
(41, 1, 'cccccccccccccccccccccccccccccccc', 'cccccccccccccccccccccccccccccccc'),
(42, 1, 'cccccccccccccccccccccccc', 'cccccccccccccccccccccccc'),
(43, 1, 'ccccccccccccccccccccccccccccccccc', 'ccccccccccccccccccccccccccccccccc'),
(44, 1, 'ccccccccccccccccccccccccccc', 'ccccccccccccccccccccccccccc'),
(45, 1, 'cccAcccAcccAcccA', 'cccAcccAcccAcccA'),
(46, 1, 'ccccccccccccccccccccccccccccccccccccccc', 'ccccccccccccccccccccccccccccccccccccccc'),
(47, 1, 'cccccccccccccccccccccccccccccc', 'cccccccccccccccccccccccccccccc'),
(48, 1, 'cccccccccccccccc', 'cccccccccccccccc'),
(49, 1, 'cccccccccccccccccccccccccccccccccccccccccc', 'ccccccccccccccccccccc'),
(50, 3, 'cccccccccccccccccccccccccccccccccccccccccc', 'dd'),
(51, 3, 'cccccccccccccccccccccccccccccccccccccccccc', 'ddaaa'),
(52, 3, 'cccccccccccccccccccccccccccccccccccccccccc', 'ddaaaxxx'),
(53, 46, 'Copenhagen', 'Sjælland'),
(54, 137, 'Manila', 'Luzon');

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
('280cf57b680f4971967ee70cd9eadd64', 'My journey 3', 54, 'a66da8a808884a57bfbe8fab0c3012e8', 1767225600, 1773273600, 'This is a short description to showcase a test 3', 1773353332),
('4c8a55899b0a4458abab8b1bdf68ba1b', 'My journey 1', 53, 'edfff849e4814f19b29af0ae0bce5e18', 1773273600, 1773273600, 'This is a short description to showcase a test', 1773353167),
('91a16ffc125748fa979f86c8c7244e68', 'My journey 2', 3, 'a66da8a808884a57bfbe8fab0c3012e8', 946684800, 1754179200, 'This is a short description to showcase a test 2', 1773353235);

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
('a66da8a808884a57bfbe8fab0c3012e8', 'test@test.dk', 'scrypt:32768:8:1$tRWg7Xu1EGci8t3S$83e744e498451673780cc534a043c5626b11408efef2e55e5fa6f9bbd47cb74314566b31d0b7f5157f2cc0a9a611bb4cf32c90659b4f968bc50ffafcb946229d', 'Test', 'User 2', 1773353196, 1773353332),
('edfff849e4814f19b29af0ae0bce5e18', 'test@user.dk', 'scrypt:32768:8:1$RoavtROvo7OrP5iC$37e124f4aaed85cfced8e89a476dc2b9864fe82c4a70dd60a0083db5ec4cee45084a838f6b9ea8da0e21200ccb9e2ea04c47df990856819834737884ff7610f4', 'Test', 'User', 1773353112, 1773353167);

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
  MODIFY `city_pk` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
