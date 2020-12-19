-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2020 at 06:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pgi_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` int(11) NOT NULL,
  `log_date` datetime NOT NULL,
  `log_type` varchar(20) NOT NULL COMMENT 'log type = UPDATE, DELETE',
  `log_file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`log_file`)),
  `user_id` int(11) NOT NULL,
  `fr_table` varchar(50) NOT NULL,
  `fr_mod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL,
  `category_description` text DEFAULT NULL,
  `image_src` varchar(255) DEFAULT NULL,
  `image_alt_text` varchar(255) DEFAULT NULL,
  `image_height` int(11) NOT NULL DEFAULT 300,
  `image_width` int(11) NOT NULL DEFAULT 300,
  `is_coming_soon` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_title`, `category_description`, `image_src`, `image_alt_text`, `image_height`, `image_width`, `is_coming_soon`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(1, 'Shoes', 'Highcut', NULL, '', 150, 70, 0, 1, '2020-02-20 12:20:00', '2020-02-20 12:20:00', 'Initial Entry', 0),
(2, 'Bags', 'Sling Bag', '[NULL]', '', 300, 70, 0, 1, '2020-02-20 12:20:00', '2020-02-20 12:20:00', 'Initial Entry', 0),
(3, 'Cap', 'Mid Cap', '[NULL]', '', 30, 50, 0, 1, '2020-02-20 12:20:00', '2020-02-20 12:20:00', 'Initial Entry', 0),
(4, 'Furniture', 'Door', '[NULL]', '', 400, 1000, 0, 1, '2020-02-20 12:20:00', '2020-02-20 12:20:00', 'Initial Entry', 0);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `counter_for` varchar(100) NOT NULL,
  `counter_code` varchar(100) NOT NULL,
  `current_value` int(11) NOT NULL DEFAULT 0,
  `counter_length` int(11) NOT NULL DEFAULT 0,
  `prefix` varchar(10) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `iso` char(2) NOT NULL,
  `country_name` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `phonecode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `iso`, `country_name`, `iso3`, `phonecode`) VALUES
(1, 'AF', 'Afghanistan', 'AFG', 93),
(2, 'AX', 'Aland Islands', 'ALA', 358),
(3, 'AL', 'Albania', 'ALB', 355),
(4, 'DZ', 'Algeria', 'DZA', 213),
(5, 'AS', 'American Samoa', 'ASM', 1684),
(6, 'AD', 'Andorra', 'AND', 376),
(7, 'AO', 'Angola', 'AGO', 244),
(8, 'AI', 'Anguilla', 'AIA', 1264),
(9, 'AQ', 'Antarctica', 'ATA', 0),
(10, 'AG', 'Antigua and Barbuda', 'ATG', 1268),
(11, 'AR', 'Argentina', 'ARG', 54),
(12, 'AM', 'Armenia', 'ARM', 374),
(13, 'AW', 'Aruba', 'ABW', 297),
(14, 'AU', 'Australia', 'AUS', 61),
(15, 'AT', 'Austria', 'AUT', 43),
(16, 'AZ', 'Azerbaijan', 'AZE', 994),
(17, 'BS', 'Bahamas', 'BHS', 1242),
(18, 'BH', 'Bahrain', 'BHR', 973),
(19, 'BD', 'Bangladesh', 'BGD', 880),
(20, 'BB', 'Barbados', 'BRB', 1246),
(21, 'BY', 'Belarus', 'BLR', 375),
(22, 'BE', 'Belgium', 'BEL', 32),
(23, 'BZ', 'Belize', 'BLZ', 501),
(24, 'BJ', 'Benin', 'BEN', 229),
(25, 'BM', 'Bermuda', 'BMU', 1441),
(26, 'BT', 'Bhutan', 'BTN', 975),
(27, 'BO', 'Bolivia', 'BOL', 591),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'BES', 599),
(29, 'BA', 'Bosnia and Herzegovina', 'BIH', 387),
(30, 'BW', 'Botswana', 'BWA', 267),
(31, 'BV', 'Bouvet Island', 'BVT', 0),
(32, 'BR', 'Brazil', 'BRA', 55),
(33, 'IO', 'British Indian Ocean Territory', 'IOT', 246),
(34, 'BN', 'Brunei Darussalam', 'BRN', 673),
(35, 'BG', 'Bulgaria', 'BGR', 359),
(36, 'BF', 'Burkina Faso', 'BFA', 226),
(37, 'BI', 'Burundi', 'BDI', 257),
(38, 'KH', 'Cambodia', 'KHM', 855),
(39, 'CM', 'Cameroon', 'CMR', 237),
(40, 'CA', 'Canada', 'CAN', 1),
(41, 'CV', 'Cape Verde', 'CPV', 238),
(42, 'KY', 'Cayman Islands', 'CYM', 1345),
(43, 'CF', 'Central African Republic', 'CAF', 236),
(44, 'TD', 'Chad', 'TCD', 235),
(45, 'CL', 'Chile', 'CHL', 56),
(46, 'CN', 'China', 'CHN', 86),
(47, 'CX', 'Christmas Island', 'CXR', 61),
(48, 'CC', 'Cocos (Keeling) Islands', 'CCK', 672),
(49, 'CO', 'Colombia', 'COL', 57),
(50, 'KM', 'Comoros', 'COM', 269),
(51, 'CG', 'Congo', 'COG', 242),
(52, 'CD', 'Congo, the Democratic Republic of the', 'COD', 242),
(53, 'CK', 'Cook Islands', 'COK', 682),
(54, 'CR', 'Costa Rica', 'CRI', 506),
(55, 'CI', 'Cote D\'Ivoire', 'CIV', 225),
(56, 'HR', 'Croatia', 'HRV', 385),
(57, 'CU', 'Cuba', 'CUB', 53),
(58, 'CW', 'Curacao', 'CUW', 599),
(59, 'CY', 'Cyprus', 'CYP', 357),
(60, 'CZ', 'Czech Republic', 'CZE', 420),
(61, 'DK', 'Denmark', 'DNK', 45),
(62, 'DJ', 'Djibouti', 'DJI', 253),
(63, 'DM', 'Dominica', 'DMA', 1767),
(64, 'DO', 'Dominican Republic', 'DOM', 1809),
(65, 'EC', 'Ecuador', 'ECU', 593),
(66, 'EG', 'Egypt', 'EGY', 20),
(67, 'SV', 'El Salvador', 'SLV', 503),
(68, 'GQ', 'Equatorial Guinea', 'GNQ', 240),
(69, 'ER', 'Eritrea', 'ERI', 291),
(70, 'EE', 'Estonia', 'EST', 372),
(71, 'ET', 'Ethiopia', 'ETH', 251),
(72, 'FK', 'Falkland Islands (Malvinas)', 'FLK', 500),
(73, 'FO', 'Faroe Islands', 'FRO', 298),
(74, 'FJ', 'Fiji', 'FJI', 679),
(75, 'FI', 'Finland', 'FIN', 358),
(76, 'FR', 'France', 'FRA', 33),
(77, 'GF', 'French Guiana', 'GUF', 594),
(78, 'PF', 'French Polynesia', 'PYF', 689),
(79, 'TF', 'French Southern Territories', 'ATF', 0),
(80, 'GA', 'Gabon', 'GAB', 241),
(81, 'GM', 'Gambia', 'GMB', 220),
(82, 'GE', 'Georgia', 'GEO', 995),
(83, 'DE', 'Germany', 'DEU', 49),
(84, 'GH', 'Ghana', 'GHA', 233),
(85, 'GI', 'Gibraltar', 'GIB', 350),
(86, 'GR', 'Greece', 'GRC', 30),
(87, 'GL', 'Greenland', 'GRL', 299),
(88, 'GD', 'Grenada', 'GRD', 1473),
(89, 'GP', 'Guadeloupe', 'GLP', 590),
(90, 'GU', 'Guam', 'GUM', 1671),
(91, 'GT', 'Guatemala', 'GTM', 502),
(92, 'GG', 'Guernsey', 'GGY', 44),
(93, 'GN', 'Guinea', 'GIN', 224),
(94, 'GW', 'Guinea-Bissau', 'GNB', 245),
(95, 'GY', 'Guyana', 'GUY', 592),
(96, 'HT', 'Haiti', 'HTI', 509),
(97, 'HM', 'Heard Island and Mcdonald Islands', 'HMD', 0),
(98, 'VA', 'Holy See (Vatican City State)', 'VAT', 39),
(99, 'HN', 'Honduras', 'HND', 504),
(100, 'HK', 'Hong Kong', 'HKG', 852),
(101, 'HU', 'Hungary', 'HUN', 36),
(102, 'IS', 'Iceland', 'ISL', 354),
(103, 'IN', 'India', 'IND', 91),
(104, 'ID', 'Indonesia', 'IDN', 62),
(105, 'IR', 'Iran, Islamic Republic of', 'IRN', 98),
(106, 'IQ', 'Iraq', 'IRQ', 964),
(107, 'IE', 'Ireland', 'IRL', 353),
(108, 'IM', 'Isle of Man', 'IMN', 44),
(109, 'IL', 'Israel', 'ISR', 972),
(110, 'IT', 'Italy', 'ITA', 39),
(111, 'JM', 'Jamaica', 'JAM', 1876),
(112, 'JP', 'Japan', 'JPN', 81),
(113, 'JE', 'Jersey', 'JEY', 44),
(114, 'JO', 'Jordan', 'JOR', 962),
(115, 'KZ', 'Kazakhstan', 'KAZ', 7),
(116, 'KE', 'Kenya', 'KEN', 254),
(117, 'KI', 'Kiribati', 'KIR', 686),
(118, 'KP', 'Korea, Democratic People\"s Republic of', 'PRK', 850),
(119, 'KR', 'Korea, Republic of', 'KOR', 82),
(120, 'XK', 'Kosovo', 'XKX', 381),
(121, 'KW', 'Kuwait', 'KWT', 965),
(122, 'KG', 'Kyrgyzstan', 'KGZ', 996),
(123, 'LA', 'Lao People\'s Democratic Republic', 'LAO', 856),
(124, 'LV', 'Latvia', 'LVA', 371),
(125, 'LB', 'Lebanon', 'LBN', 961),
(126, 'LS', 'Lesotho', 'LSO', 266),
(127, 'LR', 'Liberia', 'LBR', 231),
(128, 'LY', 'Libyan Arab Jamahiriya', 'LBY', 218),
(129, 'LI', 'Liechtenstein', 'LIE', 423),
(130, 'LT', 'Lithuania', 'LTU', 370),
(131, 'LU', 'Luxembourg', 'LUX', 352),
(132, 'MO', 'Macao', 'MAC', 853),
(133, 'MK', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 389),
(134, 'MG', 'Madagascar', 'MDG', 261),
(135, 'MW', 'Malawi', 'MWI', 265),
(136, 'MY', 'Malaysia', 'MYS', 60),
(137, 'MV', 'Maldives', 'MDV', 960),
(138, 'ML', 'Mali', 'MLI', 223),
(139, 'MT', 'Malta', 'MLT', 356),
(140, 'MH', 'Marshall Islands', 'MHL', 692),
(141, 'MQ', 'Martinique', 'MTQ', 596),
(142, 'MR', 'Mauritania', 'MRT', 222),
(143, 'MU', 'Mauritius', 'MUS', 230),
(144, 'YT', 'Mayotte', 'MYT', 269),
(145, 'MX', 'Mexico', 'MEX', 52),
(146, 'FM', 'Micronesia, Federated States of', 'FSM', 691),
(147, 'MD', 'Moldova, Republic of', 'MDA', 373),
(148, 'MC', 'Monaco', 'MCO', 377),
(149, 'MN', 'Mongolia', 'MNG', 976),
(150, 'ME', 'Montenegro', 'MNE', 382),
(151, 'MS', 'Montserrat', 'MSR', 1664),
(152, 'MA', 'Morocco', 'MAR', 212),
(153, 'MZ', 'Mozambique', 'MOZ', 258),
(154, 'MM', 'Myanmar', 'MMR', 95),
(155, 'NA', 'Namibia', 'NAM', 264),
(156, 'NR', 'Nauru', 'NRU', 674),
(157, 'NP', 'Nepal', 'NPL', 977),
(158, 'NL', 'Netherlands', 'NLD', 31),
(159, 'AN', 'Netherlands Antilles', 'ANT', 599),
(160, 'NC', 'New Caledonia', 'NCL', 687),
(161, 'NZ', 'New Zealand', 'NZL', 64),
(162, 'NI', 'Nicaragua', 'NIC', 505),
(163, 'NE', 'Niger', 'NER', 227),
(164, 'NG', 'Nigeria', 'NGA', 234),
(165, 'NU', 'Niue', 'NIU', 683),
(166, 'NF', 'Norfolk Island', 'NFK', 672),
(167, 'MP', 'Northern Mariana Islands', 'MNP', 1670),
(168, 'NO', 'Norway', 'NOR', 47),
(169, 'OM', 'Oman', 'OMN', 968),
(170, 'PK', 'Pakistan', 'PAK', 92),
(171, 'PW', 'Palau', 'PLW', 680),
(172, 'PS', 'Palestinian Territory, Occupied', 'PSE', 970),
(173, 'PA', 'Panama', 'PAN', 507),
(174, 'PG', 'Papua New Guinea', 'PNG', 675),
(175, 'PY', 'Paraguay', 'PRY', 595),
(176, 'PE', 'Peru', 'PER', 51),
(177, 'PH', 'Philippines', 'PHL', 63),
(178, 'PN', 'Pitcairn', 'PCN', 0),
(179, 'PL', 'Poland', 'POL', 48),
(180, 'PT', 'Portugal', 'PRT', 351),
(181, 'PR', 'Puerto Rico', 'PRI', 1787),
(182, 'QA', 'Qatar', 'QAT', 974),
(183, 'RE', 'Reunion', 'REU', 262),
(184, 'RO', 'Romania', 'ROM', 40),
(185, 'RU', 'Russian Federation', 'RUS', 70),
(186, 'RW', 'Rwanda', 'RWA', 250),
(187, 'BL', 'Saint Barthelemy', 'BLM', 590),
(188, 'SH', 'Saint Helena', 'SHN', 290),
(189, 'KN', 'Saint Kitts and Nevis', 'KNA', 1869),
(190, 'LC', 'Saint Lucia', 'LCA', 1758),
(191, 'MF', 'Saint Martin', 'MAF', 590),
(192, 'PM', 'Saint Pierre and Miquelon', 'SPM', 508),
(193, 'VC', 'Saint Vincent and the Grenadines', 'VCT', 1784),
(194, 'WS', 'Samoa', 'WSM', 684),
(195, 'SM', 'San Marino', 'SMR', 378),
(196, 'ST', 'Sao Tome and Principe', 'STP', 239),
(197, 'SA', 'Saudi Arabia', 'SAU', 966),
(198, 'SN', 'Senegal', 'SEN', 221),
(199, 'RS', 'Serbia', 'SRB', 381),
(200, 'CS', 'Serbia and Montenegro', 'SCG', 381),
(201, 'SC', 'Seychelles', 'SYC', 248),
(202, 'SL', 'Sierra Leone', 'SLE', 232),
(203, 'SG', 'Singapore', 'SGP', 65),
(204, 'SX', 'Sint Maarten', 'SXM', 1),
(205, 'SK', 'Slovakia', 'SVK', 421),
(206, 'SI', 'Slovenia', 'SVN', 386),
(207, 'SB', 'Solomon Islands', 'SLB', 677),
(208, 'SO', 'Somalia', 'SOM', 252),
(209, 'ZA', 'South Africa', 'ZAF', 27),
(210, 'GS', 'South Georgia and the South Sandwich Islands', 'SGS', 0),
(211, 'SS', 'South Sudan', 'SSD', 211),
(212, 'ES', 'Spain', 'ESP', 34),
(213, 'LK', 'Sri Lanka', 'LKA', 94),
(214, 'SD', 'Sudan', 'SDN', 249),
(215, 'SR', 'Suriname', 'SUR', 597),
(216, 'SJ', 'Svalbard and Jan Mayen', 'SJM', 47),
(217, 'SZ', 'Swaziland', 'SWZ', 268),
(218, 'SE', 'Sweden', 'SWE', 46),
(219, 'CH', 'Switzerland', 'CHE', 41),
(220, 'SY', 'Syrian Arab Republic', 'SYR', 963),
(221, 'TW', 'Taiwan, Province of China', 'TWN', 886),
(222, 'TJ', 'Tajikistan', 'TJK', 992),
(223, 'TZ', 'Tanzania, United Republic of', 'TZA', 255),
(224, 'TH', 'Thailand', 'THA', 66),
(225, 'TL', 'Timor-Leste', 'TLS', 670),
(226, 'TG', 'Togo', 'TGO', 228),
(227, 'TK', 'Tokelau', 'TKL', 690),
(228, 'TO', 'Tonga', 'TON', 676),
(229, 'TT', 'Trinidad and Tobago', 'TTO', 1868),
(230, 'TN', 'Tunisia', 'TUN', 216),
(231, 'TR', 'Turkey', 'TUR', 90),
(232, 'TM', 'Turkmenistan', 'TKM', 7370),
(233, 'TC', 'Turks and Caicos Islands', 'TCA', 1649),
(234, 'TV', 'Tuvalu', 'TUV', 688),
(235, 'UG', 'Uganda', 'UGA', 256),
(236, 'UA', 'Ukraine', 'UKR', 380),
(237, 'AE', 'United Arab Emirates', 'ARE', 971),
(238, 'GB', 'United Kingdom', 'GBR', 44),
(239, 'US', 'United States', 'USA', 1),
(240, 'UM', 'United States Minor Outlying Islands', 'UMI', 1),
(241, 'UY', 'Uruguay', 'URY', 598),
(242, 'UZ', 'Uzbekistan', 'UZB', 998),
(243, 'VU', 'Vanuatu', 'VUT', 678),
(244, 'VE', 'Venezuela', 'VEN', 58),
(245, 'VN', 'Viet Nam', 'VNM', 84),
(246, 'VG', 'Virgin Islands, British', 'VGB', 1284),
(247, 'VI', 'Virgin Islands, U.s.', 'VIR', 1340),
(248, 'WF', 'Wallis and Futuna', 'WLF', 681),
(249, 'EH', 'Western Sahara', 'ESH', 212),
(250, 'YE', 'Yemen', 'YEM', 967),
(251, 'ZM', 'Zambia', 'ZMB', 260),
(252, 'ZW', 'Zimbabwe', 'ZWE', 263);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `is_registered` tinyint(4) NOT NULL DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `accepts_marketing_update` tinyint(4) NOT NULL DEFAULT 0,
  `is_mlm_member` tinyint(4) NOT NULL DEFAULT 0,
  `mlm_member_username` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `fistname` varchar(100) DEFAULT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `postal_code` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL COMMENT 'Region',
  `country` varchar(100) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `legal_pages`
--

CREATE TABLE `legal_pages` (
  `page` varchar(100) NOT NULL,
  `content` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `legal_pages`
--

INSERT INTO `legal_pages` (`page`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
('Privacy Policy', '<div class=\"section-header text-center\">\r\n<p style=\"text-align: left;\">This Privacy Policy describes how your personal information is collected, used, and shared when you visit or make a purchase from<span> </span><em><strong>www.pgihealthandwellness.com</strong></em><span> </span>(the “Site”).</p>\r\n</div>\r\n<div class=\"rte\"><br /><strong>PERSONAL INFORMATION WE COLLECT</strong><br /><br />When you visit the Site, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products that you view, what websites or search terms referred you to the Site, and information about how you interact with the Site. We refer to this automatically-collected information as “Device Information.”<br /><br />We collect Device Information using the following technologies:<br /><br />- “Cookies” are data files that are placed on your device or computer and often include an anonymous unique identifier. For more information about cookies, and how to disable cookies, visit http://www.allaboutcookies.org.<br /><br />- “Log files” track actions occurring on the Site, and collect data including your IP address, browser type, Internet service provider, referring/exit pages, and date/time stamps.<br />- “Web beacons,” “tags,” and “pixels” are electronic files used to record information about how you browse the Site.<br /><br />Additionally when you make a purchase or attempt to make a purchase through the Site, we collect certain information from you, including your name, billing address, shipping address, payment information (including credit card numbers, email address, and phone number. We refer to this information as “Order Information.”<br /><br />When we talk about “Personal Information” in this Privacy Policy, we are talking both about Device Information and Order Information.<br /><br /><strong>HOW DO WE USE YOUR PERSONAL INFORMATION?</strong><br /><br />We use the Order Information that we collect generally to fulfill any orders placed through the Site (including processing your payment information, arranging for shipping, and providing you with invoices and/or order confirmations). Additionally, we use this Order Information to:<br />Communicate with you;<br />Screen our orders for potential risk or fraud; and<br />When in line with the preferences you have shared with us, provide you with information or advertising relating to our products or services.<br /><br />We use the Device Information that we collect to help us screen for potential risk and fraud (in particular, your IP address), and more generally to improve and optimize our Site (for example, by generating analytics about how our customers browse and interact with the Site, and to assess the success of our marketing and advertising campaigns).<br /><br /><strong>SHARING YOUR PERSONAL INFORMATION</strong><br /><br />We share your Personal Information with third parties to help us use your Personal Information, as described above. For example, we use Shopify to power our online store--you can read more about how Shopify uses your Personal Information here: https://www.shopify.com/legal/privacy. We also use Google Analytics to help us understand how our customers use the Site--you can read more about how Google uses your Personal Information here: https://www.google.com/intl/en/policies/privacy/. You can also opt-out of Google Analytics here: https://tools.google.com/dlpage/gaoptout.<br /><br />Finally, we may also share your Personal Information to comply with applicable laws and regulations, to respond to a subpoena, search warrant or other lawful request for information we receive, or to otherwise protect our rights.<br /><br />As described above, we use your Personal Information to provide you with targeted advertisements or marketing communications we believe may be of interest to you. For more information about how targeted advertising works, you can visit the Network Advertising Initiative’s (“NAI”) educational page at http://www.networkadvertising.org/understanding-online-advertising/how-does-it-work.<br /><br />Additionally, you can opt out of some of these services by visiting the Digital Advertising Alliance’s opt-out portal at: http://optout.aboutads.info/.<br /><br /><strong>DO NOT TRACK</strong><br />Please note that we do not alter our Site’s data collection and use practices when we see a Do Not Track signal from your browser.<br /><br /><strong>DATA RETENTION</strong><br /><br />When you place an order through the Site, we will maintain your Order Information for our records unless and until you ask us to delete this information.<br /><br /><strong>CHANGES</strong><br /><br />We may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal or regulatory reasons.</div>', 99999, '2020-12-12 00:00:00', '2020-12-12 00:00:00'),
('Refund Policy', '<p>We have a 30-day return policy, which means you have 30 days after receiving your item to request a return. <br /><br />To be eligible for a return, your item must be in the same condition that you received it, unworn or unused, with tags, and in its original packaging. You’ll also need the receipt or proof of purchase. <br /><br />To start a return, you can contact us at <span>SUPPORT@PGICOMMERCE.TRADE</span>. If your return is accepted, we’ll send you a return shipping label, as well as instructions on how and where to send your package. Items sent back to us without first requesting a return will not be accepted. <br /><br />You can always contact us for any return question at <span>SUPPORT@PGICOMMERCE.TRADE</span>.</p>\r\n<br />\r\n<p><strong>Damages and issues</strong> <br />Please inspect your order upon reception and contact us immediately if the item is defective, damaged or if you receive the wrong item, so that we can evaluate the issue and make it right.</p>\r\n<br />\r\n<p><strong>Exceptions / non-returnable items</strong> <br />Certain types of items cannot be returned, like perishable goods (such as food, flowers, or plants), custom products (such as special orders or personalized items), and personal care goods (such as beauty products). We also do not accept returns for hazardous materials, flammable liquids, or gases. Please get in touch if you have questions or concerns about your specific item. <br /><br />Unfortunately, we cannot accept returns on sale items or gift cards.</p>\r\n<br />\r\n<p><strong>Exchanges</strong> <br />The fastest way to ensure you get what you want is to return the item you have, and once the return is accepted, make a separate purchase for the new item.</p>\r\n<br />\r\n<p><strong>Refunds</strong> <br />We will notify you once we’ve received and inspected your return, and let you know if the refund was approved or not. If approved, you’ll be automatically refunded on your original payment method. Please remember it can take some time for your bank or credit card company to process and post the refund too.</p>', 99999, '2020-12-12 00:00:00', '2020-12-12 00:00:00'),
('Shipping Policy', '<div class=\"section-header text-center\">\r\n<p><strong>SECTION 1 - GENERAL SHIPPING INFORMATION</strong></p>\r\n<p>PGI Health &amp; Wellness delivers within the continental United States. It is our goal to ship all orders within 48 hours of receipt. Other factors may delay processing 2 to 3 additional days, such as weekends, holidays, and item availability.</p>\r\n</div>\r\n<div class=\"rte\"><br />Should items not be in stock, we will notify you via email. We will wait 48 hours for a response. If we do not receive a response from you within this time, we will proceed to ship the order.<br /><br /><strong><em><span>PGI Health &amp; Wellness</span> does not ship to PO boxes at this time.</em></strong><br /><br /><strong><em><span>PGI Health &amp; Wellness</span> does ship to APO/FPO addresses. All APO/FPO orders must be shipped via USPS Priority. We will not be able to track shipments after the package enters the Military Mail System, and are then unable to determine delivery time. Shipments to APO/FPO may take up to 60 days. Additional charges may apply.</em></strong><br /><br /><strong>SECTION 2 - SHIPPING RATES</strong><br /><br />All orders within the continental United States, over $49.00 and under 30 pounds will be shipped via FedEx Ground or USPS Priority free of charge.<br /><br />For orders within the continental United States, under $49.00 and under 30 pounds will be shipped via FedEx Ground or USPS Priority for a flat rate of $8.99.<br /><br />APO/FPO orders may incur additional shipping charges set by the carrier.<br /><br />Expedited options are available at additional shipping cost. The additional cost will be calculated at checkout and offered to you as options.<br /><br />For overweight items, additional shipping costs will also apply.<br /><br />Additional charges may apply if packages are redirected, an incorrect address was provided, or is undeliverable. We are not responsible for shipping charges related to incorrect or missing information.<br /><br />The minimum free shipping dollar amount excludes discounts, promotions, sales tax, and shipping.<br /><br /><strong>SECTION 3 - TAXES</strong><br /><br />Items sold through our Site may be subject to taxes and other governmental charges. If an item is subject to taxes, prior to submitting your purchase request, an estimated tax will be calculated and displayed at checkout.<br /><br /><strong>SECTION 4 - SHIPPING METHODS</strong><br /><br />We use Federal Express (“FedEx”) and United States Parcel Service (“USPS”). Both FedEx and USPS provide estimated delivery times. The estimated delivery times are not guaranteed. Neither we nor FedEx or USPS are able to provide 100% guarantees on arrival.<br /><br />When your order is shipped, an order update will be emailed to you with a tracking number. You may track your order via the FedEx or USPS websites. <br /><br /><strong>SECTION 5 - CHANGING SHIPPING ADDRESS</strong><br /><br />If you wish to change your shipping address after you have submitted your order, please email us immediately at support@filipinofooddepot.com. If the order has not been processed, we will update the delivery address. Unfortunately, should the order be shipped already, you will not be able to change it. It is our goal to provide prompt delivery service, which includes fulfilling your quickly.<br /><br /><strong>SECTION 6 - UNDELIVERABLE PACKAGES OR MISSING ITEMS</strong><br /><br /><span>Filipino Food Depot</span><span> </span>shall work with our partner shipping carriers to promptly deliver packages to you. In the event packages are delayed, damaged, re-routed, and/or incorrectly delivered, we shall work with the shipping carriers to rectify. This process may significantly delay the delivery of your package.<br /><br />We make every effort to help ensure there are no incorrect or missing items in your order. Should this occur, within 3 days of the receipt of shipment, please notify us at<span> SUPPORT@PGICOMMERCE.TRADE</span>. Any adjustments thereafter shall be at the sole discretion of<span> </span><span>Filipino Food Depot</span>.</div>', 99999, '2020-12-12 00:00:00', '2020-12-12 00:00:00'),
('Terms of Service', '<strong>OVERVIEW</strong> <br /> This website is operated by PGI Health &amp; Wellness. Throughout the site, the terms “we”, “us” and “our” refer to PGI Health &amp; Wellness. PGI Health &amp; Wellness offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here. <br /> <br /> By visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content. <br /> <br /> Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service. <br /> <br /> Any new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes. <br /> <br /> Our store is hosted on Shopify Inc. They provide us with the online e-commerce platform that allows us to sell our products and services to you. <br /> <br /> <strong>SECTION 1 - ONLINE STORE TERMS</strong> <br /> By agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site. <br /> You may not use our products for any illegal or unauthorized purpose nor may you, in the use of the Service, violate any laws in your jurisdiction (including but not limited to copyright laws). <br /> You must not transmit any worms or viruses or any code of a destructive nature. <br /> A breach or violation of any of the Terms will result in an immediate termination of your Services. <br /> <br /> <strong>SECTION 2 - GENERAL CONDITIONS</strong> <br /> We reserve the right to refuse service to anyone for any reason at any time. <br /> You understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks. <br /> You agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Service, use of the Service, or access to the Service or any contact on the website through which the service is provided, without express written permission by us. <br /> The headings used in this agreement are included for convenience only and will not limit or otherwise affect these Terms. <br /> <br /> <strong>SECTION 3 - ACCURACY, COMPLETENESS AND TIMELINESS OF INFORMATION</strong> <br /> We are not responsible if information made available on this site is not accurate, complete or current. The material on this site is provided for general information only and should not be relied upon or used as the sole basis for making decisions without consulting primary, more accurate, more complete or more timely sources of information. Any reliance on the material on this site is at your own risk. <br /> This site may contain certain historical information. Historical information, necessarily, is not current and is provided for your reference only. We reserve the right to modify the contents of this site at any time, but we have no obligation to update any information on our site. You agree that it is your responsibility to monitor changes to our site. <br /> <br /> <strong>SECTION 4 - MODIFICATIONS TO THE SERVICE AND PRICES</strong> <br /> Prices for our products are subject to change without notice. <br /> We reserve the right at any time to modify or discontinue the Service (or any part or content thereof) without notice at any time. <br /> We shall not be liable to you or to any third-party for any modification, price change, suspension or discontinuance of the Service. <br /> <br /> <strong>SECTION 5 - PRODUCTS OR SERVICES (if applicable)</strong> <br /> Certain products or services may be available exclusively online through the website. These products or services may have limited quantities and are subject to return or exchange only according to our Return Policy. <br /> We have made every effort to display as accurately as possible the colors and images of our products that appear at the store. We cannot guarantee that your computer monitor\'s display of any color will be accurate. <br /> We reserve the right, but are not obligated, to limit the sales of our products or Services to any person, geographic region or jurisdiction. We may exercise this right on a case-by-case basis. We reserve the right to limit the quantities of any products or services that we offer. All descriptions of products or product pricing are subject to change at anytime without notice, at the sole discretion of us. We reserve the right to discontinue any product at any time. Any offer for any product or service made on this site is void where prohibited. <br /> We do not warrant that the quality of any products, services, information, or other material purchased or obtained by you will meet your expectations, or that any errors in the Service will be corrected. <br /> <br /> <strong>SECTION 6 - ACCURACY OF BILLING AND ACCOUNT INFORMATION</strong> <br /> We reserve the right to refuse any order you place with us. We may, in our sole discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, and/or orders that use the same billing and/or shipping address. In the event that we make a change to or cancel an order, we may attempt to notify you by contacting the e‑mail and/or billing address/phone number provided at the time the order was made. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers or distributors. <br /> <br /> You agree to provide current, complete and accurate purchase and account information for all purchases made at our store. You agree to promptly update your account and other information, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed. <br /> <br /> For more detail, please review our Returns Policy. <br /> <br /> <strong>SECTION 7 - OPTIONAL TOOLS</strong> <br /> We may provide you with access to third-party tools over which we neither monitor nor have any control nor input. <br /> You acknowledge and agree that we provide access to such tools ”as is” and “as available” without any warranties, representations or conditions of any kind and without any endorsement. We shall have no liability whatsoever arising from or relating to your use of optional third-party tools. <br /> Any use by you of optional tools offered through the site is entirely at your own risk and discretion and you should ensure that you are familiar with and approve of the terms on which tools are provided by the relevant third-party provider(s). <br /> We may also, in the future, offer new services and/or features through the website (including, the release of new tools and resources). Such new features and/or services shall also be subject to these Terms of Service. <br /> <br /> <strong>SECTION 8 - THIRD-PARTY LINKS</strong> <br /> Certain content, products and services available via our Service may include materials from third-parties. <br /> Third-party links on this site may direct you to third-party websites that are not affiliated with us. We are not responsible for examining or evaluating the content or accuracy and we do not warrant and will not have any liability or responsibility for any third-party materials or websites, or for any other materials, products, or services of third-parties. <br /> We are not liable for any harm or damages related to the purchase or use of goods, services, resources, content, or any other transactions made in connection with any third-party websites. Please review carefully the third-party\'s policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third-party. <br /> <br /> <strong>SECTION 9 - USER COMMENTS, FEEDBACK AND OTHER SUBMISSIONS</strong> <br /> If, at our request, you send certain specific submissions (for example contest entries) or without a request from us you send creative ideas, suggestions, proposals, plans, or other materials, whether online, by email, by postal mail, or otherwise (collectively, \'comments\'), you agree that we may, at any time, without restriction, edit, copy, publish, distribute, translate and otherwise use in any medium any comments that you forward to us. We are and shall be under no obligation (1) to maintain any comments in confidence; (2) to pay compensation for any comments; or (3) to respond to any comments. <br /> We may, but have no obligation to, monitor, edit or remove content that we determine in our sole discretion are unlawful, offensive, threatening, libelous, defamatory, pornographic, obscene or otherwise objectionable or violates any party’s intellectual property or these Terms of Service. <br /> You agree that your comments will not violate any right of any third-party, including copyright, trademark, privacy, personality or other personal or proprietary right. You further agree that your comments will not contain libelous or otherwise unlawful, abusive or obscene material, or contain any computer virus or other malware that could in any way affect the operation of the Service or any related website. You may not use a false e‑mail address, pretend to be someone other than yourself, or otherwise mislead us or third-parties as to the origin of any comments. You are solely responsible for any comments you make and their accuracy. We take no responsibility and assume no liability for any comments posted by you or any third-party. <br /> <br /> <strong>SECTION 10 - PERSONAL INFORMATION</strong> <br /> Your submission of personal information through the store is governed by our Privacy Policy. To view our Privacy Policy. <br /> <br /> <strong>SECTION 11 - ERRORS, INACCURACIES AND OMISSIONS</strong> <br /> Occasionally there may be information on our site or in the Service that contains typographical errors, inaccuracies or omissions that may relate to product descriptions, pricing, promotions, offers, product shipping charges, transit times and availability. We reserve the right to correct any errors, inaccuracies or omissions, and to change or update information or cancel orders if any information in the Service or on any related website is inaccurate at any time without prior notice (including after you have submitted your order). <br /> We undertake no obligation to update, amend or clarify information in the Service or on any related website, including without limitation, pricing information, except as required by law. No specified update or refresh date applied in the Service or on any related website, should be taken to indicate that all information in the Service or on any related website has been modified or updated. <br /> <br /> <strong>SECTION 12 - PROHIBITED USES</strong> <br /> In addition to other prohibitions as set forth in the Terms of Service, you are prohibited from using the site or its content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Service or of any related website, other websites, or the Internet; (h) to collect or track the personal information of others; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for any obscene or immoral purpose; or (k) to interfere with or circumvent the security features of the Service or any related website, other websites, or the Internet. We reserve the right to terminate your use of the Service or any related website for violating any of the prohibited uses. <br /> <br /> <strong>SECTION 13 - DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY</strong> <br /> We do not guarantee, represent or warrant that your use of our service will be uninterrupted, timely, secure or error-free. <br /> We do not warrant that the results that may be obtained from the use of the service will be accurate or reliable. <br /> You agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you. <br /> You expressly agree that your use of, or inability to use, the service is at your sole risk. The service and all products and services delivered to you through the service are (except as expressly stated by us) provided \'as is\' and \'as available\' for your use, without any representation, warranties or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement. <br /> In no case shall PGI Health &amp; Wellness, our directors, officers, employees, affiliates, agents, contractors, interns, suppliers, service providers or licensors be liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the service or any products procured using the service, or for any other claim related in any way to your use of the service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the service or any content (or product) posted, transmitted, or otherwise made available via the service, even if advised of their possibility. Because some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law. <br /> <br /> <strong>SECTION 14 - INDEMNIFICATION</strong> <br /> You agree to indemnify, defend and hold harmless PGI Health &amp; Wellness and our parent, subsidiaries, affiliates, partners, officers, directors, agents, contractors, licensors, service providers, subcontractors, suppliers, interns and employees, harmless from any claim or demand, including reasonable attorneys’ fees, made by any third-party due to or arising out of your breach of these Terms of Service or the documents they incorporate by reference, or your violation of any law or the rights of a third-party. <br /> <br /> <strong>SECTION 15 - SEVERABILITY</strong> <br /> In the event that any provision of these Terms of Service is determined to be unlawful, void or unenforceable, such provision shall nonetheless be enforceable to the fullest extent permitted by applicable law, and the unenforceable portion shall be deemed to be severed from these Terms of Service, such determination shall not affect the validity and enforceability of any other remaining provisions. <br /> <br /> <strong>SECTION 16 - TERMINATION</strong> <br /> The obligations and liabilities of the parties incurred prior to the termination date shall survive the termination of this agreement for all purposes. <br /> These Terms of Service are effective unless and until terminated by either you or us. You may terminate these Terms of Service at any time by notifying us that you no longer wish to use our Services, or when you cease using our site. <br /> If in our sole judgment you fail, or we suspect that you have failed, to comply with any term or provision of these Terms of Service, we also may terminate this agreement at any time without notice and you will remain liable for all amounts due up to and including the date of termination; and/or accordingly may deny you access to our Services (or any part thereof). <br /> <br /> <strong>SECTION 17 - ENTIRE AGREEMENT</strong> <br /> The failure of us to exercise or enforce any right or provision of these Terms of Service shall not constitute a waiver of such right or provision. <br /> These Terms of Service and any policies or operating rules posted by us on this site or in respect to The Service constitutes the entire agreement and understanding between you and us and govern your use of the Service, superseding any prior or contemporaneous agreements, communications and proposals, whether oral or written, between you and us (including, but not limited to, any prior versions of the Terms of Service). <br /> Any ambiguities in the interpretation of these Terms of Service shall not be construed against the drafting party. <br /> <br /> <strong>SECTION 18 - GOVERNING LAW</strong> <br /> These Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of Philippines. <br /> <br /> <strong>SECTION 19 - CHANGES TO TERMS OF SERVICE</strong> <br /> You can review the most current version of the Terms of Service at any time at this page. <br /> We reserve the right, at our sole discretion, to update, change or replace any part of these Terms of Service by posting updates and changes to our website. It is your responsibility to check our website periodically for changes. Your continued use of or access to our website or the Service following the posting of any changes to these Terms of Service constitutes acceptance of those changes. <br /> <br /> <strong>SECTION 20 - CONTACT INFORMATION</strong> <br /> Questions about the Terms of Service should be sent to us at <span>SUPPORT@PGICOMMERCE.TRADE</span>.', 99999, '2020-12-12 00:00:00', '2020-12-12 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module_group` varchar(150) NOT NULL,
  `module` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_group`, `module`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(1, 'home', 'dashboard', 1, '2020-12-12 01:01:01', '2020-12-12 01:01:01', 'MANUAL ENTRY', 0),
(2, 'orders', 'order list', 1, '2020-12-12 01:01:01', '2020-12-12 01:01:01', 'MANUAL ENTRY', 0),
(3, 'orders', 'abandoned checkouts', 1, '2020-12-12 01:01:01', '2020-12-12 01:01:01', 'MANUAL ENTRY', 0),
(4, 'products', 'all products', 1, '2020-12-12 01:01:01', '2020-12-12 01:01:01', 'MANUAL ENTRY', 0),
(5, 'products', 'inventory', 1, '2020-12-12 01:01:01', '2020-12-12 01:01:01', 'MANUAL ENTRY', 0),
(17, 'products', 'categories', 1, '2020-12-12 01:01:01', '2020-12-12 01:01:01', 'MANUAL ENTRY', 0),
(18, 'TEST 2', 'TEST 2', 99999, '2020-12-11 20:05:10', '2020-12-11 20:17:45', 'SETTINGS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `cart_token` varchar(100) DEFAULT NULL,
  `checkout_token` varchar(100) DEFAULT NULL,
  `order_no` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `browser_ip` varchar(20) DEFAULT NULL,
  `app_id` varchar(100) DEFAULT NULL,
  `device_os` varchar(20) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_gateway_names` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` double(9,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(11) NOT NULL,
  `order_status` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_history`
--

CREATE TABLE `order_status_history` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `order_status_reason` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active, 2 = draft',
  `category_id` int(11) DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `product_image_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `price` double(9,2) NOT NULL DEFAULT 0.00,
  `member_price` double(9,2) NOT NULL DEFAULT 0.00,
  `promo_price` double(9,2) DEFAULT 0.00,
  `member_promo_price` double(9,2) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `weight` double(4,2) DEFAULT NULL COMMENT 'used to calculate shipping rates',
  `weight_unit` varchar(20) DEFAULT NULL COMMENT 'g = grams, kg = kilograms',
  `slug` varchar(255) NOT NULL COMMENT 'Permalink',
  `seo_meta_description` varchar(160) DEFAULT NULL,
  `seo_title` varchar(150) DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `status`, `category_id`, `product_type_id`, `product_image_id`, `supplier_id`, `price`, `member_price`, `promo_price`, `member_promo_price`, `sku`, `barcode`, `weight`, `weight_unit`, `slug`, `seo_meta_description`, `seo_title`, `is_featured`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(22, 'TEST 1', 'TEST 2', 1, 2, 2, NULL, 1, 3.00, 1.00, 300.00, 600.00, '232524', '124121512', 99.99, '1500', '1600', '400', 'TEST SEO 2', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `height` int(11) NOT NULL DEFAULT 300,
  `width` int(11) NOT NULL DEFAULT 300,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `source`, `alt_text`, `position`, `height`, `width`, `is_default`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(36, 22, 'product1608188677slide1.jpg', NULL, NULL, 300, 300, 0, 4, NULL, '2020-12-17 15:04:37', '', 0),
(37, 22, 'product1608188677slide5.jpg', NULL, NULL, 300, 300, 0, 4, NULL, '2020-12-17 15:04:37', '', 0),
(38, 22, 'product1608188677slide6.jpg', NULL, NULL, 300, 300, 0, 4, NULL, '2020-12-17 15:04:37', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory`
--

CREATE TABLE `product_inventory` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `cost` double(9,2) NOT NULL,
  `min_level` int(11) NOT NULL DEFAULT 0,
  `sku` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `product_type` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(100) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_types`
--

INSERT INTO `product_types` (`id`, `product_type`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(1, 'Type 1', 1, '2020-02-02 12:04:02', '2020-02-02 12:04:02', 'Initial Entry', 0),
(2, 'Type 2', 1, '2020-02-02 12:04:02', '2020-02-02 12:04:02', 'Initial Entry', 0),
(3, 'Type 3', 1, '2020-02-02 12:04:02', '2020-02-02 12:04:02', 'Initial Entry', 0);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_address` varchar(255) DEFAULT NULL,
  `supplier_phone` varchar(255) DEFAULT NULL,
  `supplier_email` varchar(255) DEFAULT NULL,
  `supplier_website` varchar(255) DEFAULT NULL,
  `supplier_contact_person` varchar(255) DEFAULT NULL,
  `supplier_contact_phone` varchar(255) DEFAULT NULL,
  `supplier_contact_email` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplier_name`, `supplier_address`, `supplier_phone`, `supplier_email`, `supplier_website`, `supplier_contact_person`, `supplier_contact_phone`, `supplier_contact_email`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(1, 'supplier 1', 'supplier makati', '7588464004', 'supplier1@gmail.com', 'www.supplier1.com', 'Juan Dela Cruz', '889879744', 'supplier1_contact@gmail.com', 1, '2020-01-02 02:20:02', '2020-01-02 02:20:02', 'Initial Data', 0),
(3, 'supplier 2', 'supplier quezon city', '7538453304', 'supplier2@gmail.com', 'www.supplier2.com', 'Cardo Dalisay', '885245744', 'supplier2_contact@gmail.com', 1, '2020-01-02 02:20:02', '2020-01-02 02:20:02', 'Initial Data', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `user_type_id`, `is_active`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(4, 'user1', '$2y$10$RdmlOAPf.LPNqb8AvqE9leqPnasEOAmAERZtYXpNEdH4jUdcptemG', '', 1, 1, 1, '2020-12-16 07:10:12', '2020-12-23 07:10:12', '', 1),
(6, 'pentavia06', '$2y$10$8Z5xzhwI9tXROpntXTxhGuZxoawpHx2YplCE3fXKcJ73yzvxxlKrS', 'andolino baisac', 2, 1, 0, '2020-12-11 10:46:21', '2020-12-14 17:08:41', '', 0),
(7, 'queenie', '$2y$10$SLt9yl74YwUNYt094MOBg.tdfO6wRtHNWxlJVrZka1cEci7dzHVBm', 'queenie casera', 1, 1, 0, '2020-12-11 11:04:04', '0000-00-00 00:00:00', '', 0),
(8, 'peter', '$2y$10$BI4w5NKlOCuIyuvIo5/uGeCRprNU9qqsq17.YDh53fQBGrLbajJjG', 'peter mora', 1, 1, 0, '2020-12-11 11:06:27', '0000-00-00 00:00:00', '', 1),
(9, 'vanz', '$2y$10$3US0sgQrApUoxfV5w7//9uuc.xksGYQIPSjesLqSsSpoQdHjWxpK2', 'vanz parker', 1, 1, 0, '2020-12-11 11:10:53', '0000-00-00 00:00:00', '', 0),
(10, 'sharon', '$2y$10$Wl4v3/jF4Q0/qOcK90GG4.mkKgxf28pb187Md/5No5/G5vcP/63Pe', 'sharon cuneta', 2, 1, 0, '2020-12-14 17:09:57', '0000-00-00 00:00:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_level`
--

CREATE TABLE `user_access_level` (
  `id` int(11) NOT NULL,
  `user_type_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `access_read` tinyint(4) NOT NULL DEFAULT 1,
  `access_write` tinyint(4) NOT NULL DEFAULT 0,
  `no_access` tinyint(4) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_level`
--

INSERT INTO `user_access_level` (`id`, `user_type_id`, `module_id`, `access_read`, `access_write`, `no_access`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(2, 4, 4, 1, 1, 0, 99999, '2020-12-11 22:36:56', '2020-12-14 16:09:25', 'SETTINGS', 0),
(3, 1, 1, 1, 1, 0, 99999, '2020-12-14 16:09:16', '2020-12-14 18:03:14', 'SETTINGS', 0),
(4, 1, 2, 1, 0, 0, 99999, '2020-12-14 16:09:35', '0000-00-00 00:00:00', 'SETTINGS', 0),
(5, 4, 4, 1, 1, 0, 99999, '2020-12-14 16:40:27', '0000-00-00 00:00:00', 'SETTINGS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `user_type` varchar(100) NOT NULL COMMENT 'super admin (IT), admin (owner), executives, cashier, ecommerce staff, etc...',
  `remarks` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `user_type`, `remarks`, `user_id`, `created_at`, `updated_at`, `fr_mod`, `is_deleted`) VALUES
(1, 'super', 'Super user (IT Team)', 99999, '2020-12-10 00:00:00', '2020-12-10 00:00:00', 'Initial Data', 0),
(2, 'admin', 'Owner', 99999, '2020-12-10 00:00:00', '2020-12-10 00:00:00', 'Initial Data', 0),
(3, 'executive', NULL, 99999, '2020-12-10 00:00:00', '2020-12-10 00:00:00', 'Initial Data', 0),
(4, 'cashier', NULL, 99999, '2020-12-10 00:00:00', '2020-12-10 00:00:00', 'Initial Data', 0),
(5, 'staff1', 'E-Commerce Staff', 99999, '2020-12-10 00:00:00', '2020-12-10 00:00:00', 'Initial Data', 0),
(6, 'TEST 1', 'test 22', 0, '2020-12-11 19:33:37', '2020-12-11 19:43:44', 'SETTINGS', 0),
(7, 'test 3', 'test 3', 99999, '2020-12-11 20:04:41', '2020-12-11 20:04:56', 'SETTINGS', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_all_products`
-- (See below for the actual view)
--
CREATE TABLE `v_all_products` (
`id` int(11)
,`title` varchar(255)
,`description` text
,`status` tinyint(4)
,`category_id` int(11)
,`product_type_id` int(11)
,`product_image_id` int(11)
,`supplier_id` int(11)
,`price` double(9,2)
,`member_price` double(9,2)
,`promo_price` double(9,2)
,`member_promo_price` double(9,2)
,`sku` varchar(100)
,`barcode` varchar(100)
,`weight` double(4,2)
,`weight_unit` varchar(20)
,`slug` varchar(255)
,`seo_meta_description` varchar(160)
,`seo_title` varchar(150)
,`user_id` int(11)
,`created_at` datetime
,`updated_at` datetime
,`fr_mod` varchar(255)
,`is_deleted` tinyint(4)
,`category_title` varchar(100)
,`product_type` varchar(100)
,`source` mediumtext
,`supplier_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_users_access_level`
-- (See below for the actual view)
--
CREATE TABLE `v_users_access_level` (
`id` int(11)
,`user_type_id` int(11)
,`module_id` int(11)
,`access_read` tinyint(4)
,`access_write` tinyint(4)
,`no_access` tinyint(4)
,`user_id` int(11)
,`created_at` datetime
,`updated_at` datetime
,`fr_mod` varchar(255)
,`is_deleted` tinyint(4)
,`module_group` varchar(150)
,`module` varchar(255)
,`user_type` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `warehouse_location` varchar(255) NOT NULL,
  `warehouse_address` varchar(255) NOT NULL,
  `warehouse_contact_person` varchar(255) DEFAULT NULL,
  `warehouse_contact_number` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `fr_mod` varchar(255) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `v_all_products`
--
DROP TABLE IF EXISTS `v_all_products`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_all_products`  AS  select `p`.`id` AS `id`,`p`.`title` AS `title`,`p`.`description` AS `description`,`p`.`status` AS `status`,`p`.`category_id` AS `category_id`,`p`.`product_type_id` AS `product_type_id`,`p`.`product_image_id` AS `product_image_id`,`p`.`supplier_id` AS `supplier_id`,`p`.`price` AS `price`,`p`.`member_price` AS `member_price`,`p`.`promo_price` AS `promo_price`,`p`.`member_promo_price` AS `member_promo_price`,`p`.`sku` AS `sku`,`p`.`barcode` AS `barcode`,`p`.`weight` AS `weight`,`p`.`weight_unit` AS `weight_unit`,`p`.`slug` AS `slug`,`p`.`seo_meta_description` AS `seo_meta_description`,`p`.`seo_title` AS `seo_title`,`p`.`user_id` AS `user_id`,`p`.`created_at` AS `created_at`,`p`.`updated_at` AS `updated_at`,`p`.`fr_mod` AS `fr_mod`,`p`.`is_deleted` AS `is_deleted`,`c`.`category_title` AS `category_title`,`pt`.`product_type` AS `product_type`,group_concat(distinct `pi2`.`source` order by `pi2`.`source` DESC separator '||') AS `source`,`s`.`supplier_name` AS `supplier_name` from ((((`products` `p` left join `categories` `c` on(`c`.`id` = `p`.`category_id`)) left join `product_types` `pt` on(`pt`.`id` = `p`.`product_type_id`)) left join `product_images` `pi2` on(`pi2`.`product_id` = `p`.`id`)) left join `suppliers` `s` on(`s`.`id` = `p`.`supplier_id`)) group by `p`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_users_access_level`
--
DROP TABLE IF EXISTS `v_users_access_level`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_users_access_level`  AS  select `ual`.`id` AS `id`,`ual`.`user_type_id` AS `user_type_id`,`ual`.`module_id` AS `module_id`,`ual`.`access_read` AS `access_read`,`ual`.`access_write` AS `access_write`,`ual`.`no_access` AS `no_access`,`ual`.`user_id` AS `user_id`,`ual`.`created_at` AS `created_at`,`ual`.`updated_at` AS `updated_at`,`ual`.`fr_mod` AS `fr_mod`,`ual`.`is_deleted` AS `is_deleted`,`m`.`module_group` AS `module_group`,`m`.`module` AS `module`,`ut`.`user_type` AS `user_type` from ((`user_access_level` `ual` left join `modules` `m` on(`m`.`id` = `ual`.`module_id`)) left join `user_types` `ut` on(`ut`.`id` = `ual`.`user_type_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD UNIQUE KEY `audit_log_id_IDX` (`id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_UN` (`category_title`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`counter_code`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_lastname_IDX` (`lastname`) USING BTREE,
  ADD KEY `customers_firstname_IDX` (`firstname`) USING BTREE,
  ADD KEY `customers_email_IDX` (`email`) USING BTREE;

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_address_FK` (`customer_id`);

--
-- Indexes for table `legal_pages`
--
ALTER TABLE `legal_pages`
  ADD PRIMARY KEY (`page`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_group` (`module_group`);
ALTER TABLE `modules` ADD FULLTEXT KEY `module_group_2` (`module_group`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_FK_1` (`customer_id`),
  ADD KEY `orders_order_no_IDX` (`order_no`) USING BTREE;

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_FK` (`order_id`),
  ADD KEY `order_details_FK_1` (`product_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_status_UN` (`order_status`);

--
-- Indexes for table `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_history_order_id_IDX` (`order_id`,`order_status_id`) USING BTREE,
  ADD KEY `order_history_FK` (`order_status_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_UN_title` (`title`),
  ADD KEY `products_FK` (`product_type_id`),
  ADD KEY `products_FK_1` (`category_id`),
  ADD KEY `products_FK_2` (`supplier_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_FK` (`product_id`);

--
-- Indexes for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_inventory_product_id_IDX` (`product_id`) USING BTREE,
  ADD KEY `product_inventory_FK_1` (`warehouse_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_types_UN` (`product_type`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_UN` (`supplier_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_UN` (`username`),
  ADD KEY `users_FK` (`user_type_id`);

--
-- Indexes for table `user_access_level`
--
ALTER TABLE `user_access_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_access_level_FK` (`module_id`),
  ADD KEY `user_access_level_FK_1` (`user_type_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_history`
--
ALTER TABLE `order_status_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product_inventory`
--
ALTER TABLE `product_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_access_level`
--
ALTER TABLE `user_access_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `customer_address_FK` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_FK_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD CONSTRAINT `order_history_FK` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `order_history_FK_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_FK` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`),
  ADD CONSTRAINT `products_FK_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_FK_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD CONSTRAINT `product_inventory_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_inventory_FK_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_FK` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);

--
-- Constraints for table `user_access_level`
--
ALTER TABLE `user_access_level`
  ADD CONSTRAINT `user_access_level_FK` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `user_access_level_FK_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
