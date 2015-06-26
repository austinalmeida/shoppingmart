-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2015 at 04:36 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping_mart`
--
CREATE DATABASE IF NOT EXISTS `shopping_mart` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shopping_mart`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'Sample', 'sam', '', '', '', '', '', 0, 0, ''),
(2, 2, 'jp', 'k', '', 'bangalore gopalan mall', '', 'bangalore', '560078', 99, 1489, ''),
(3, 3, 'daily', 'needs', '', '', '', '', '', 0, 0, ''),
(4, 4, 'big', 'bazar', '', '', '', '', '', 0, 0, ''),
(5, 5, 'fbb', 'fbb', '', '', '', '', '', 0, 0, ''),
(6, 6, 'shoper', 'stop', '', '', '', '', '', 0, 0, ''),
(7, 8, 'fbb', 'fashion', '', '', '', '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate`
--

CREATE TABLE IF NOT EXISTS `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_login`
--

CREATE TABLE IF NOT EXISTS `affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE IF NOT EXISTS `api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`api_id`, `username`, `firstname`, `lastname`, `password`, `status`, `date_added`, `date_modified`) VALUES
(1, '8bHIQUcFf2pMacNjN3Exnhs71PGpoVr9LqeiNl6a67ANFFKA2yXZBfIeuAX1uokm', '', '', 'RStVCQRIPZNlnF8yZHiXR1ZYeJgbtVVmPR0fuSfObPSWDcpAyxmtakjpHphXlZ89Fo0DUsmrfcQfWNPiF0hdbqmTmjbrU1dtyXs8wekhbCFAgVqePQVjUJgV90NZ6p10ZebQGobuP9x3j0AxREBDF9TuOd1da1HV28E5TLKV6TYJesMdLPj4tN8gWfX5waPNN0i8XGvSfB0xR8Qh7xAIPygpW3wuAWQcaF5YUXPn6GLx7lN8msTtnw5MOpD6HqIE', 1, '2015-05-23 09:54:52', '2015-05-23 09:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(27, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_description`
--

CREATE TABLE IF NOT EXISTS `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute_description`
--

INSERT INTO `attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(12, 1, 'Small'),
(13, 1, 'Medium'),
(14, 1, 'Large'),
(15, 1, 'Monitor Vendor'),
(16, 1, 'Monitor Vendor'),
(17, 1, 'Monitor Vendor'),
(18, 1, 'Monitor Vendor'),
(19, 1, 'Monitor Vendor'),
(20, 1, 'Monitor Vendor'),
(21, 1, 'Monitor Vendor'),
(22, 1, 'Monitor Vendor'),
(23, 1, 'Monitor Vendor'),
(24, 1, 'Monitor Vendor'),
(25, 1, 'Monitor Vendor'),
(26, 1, 'Monitor Vendor'),
(27, 1, '5 gb');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group`
--

CREATE TABLE IF NOT EXISTS `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `attribute_group`
--

INSERT INTO `attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute_group_description`
--

INSERT INTO `attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'GENERAL FEATURES'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(7, 1, 'Monitor');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `banner_image`
--

CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `banner_image`
--

INSERT INTO `banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(100, 7, '', 'catalog/slide.jpg', 0),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(99, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/slide.jpg', 0),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `banner_image_description`
--

CREATE TABLE IF NOT EXISTS `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner_image_description`
--

INSERT INTO `banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(100, 1, 7, 'MacBookAir'),
(87, 1, 6, 'HP Banner'),
(93, 1, 8, 'Canon'),
(92, 1, 8, 'Burger King'),
(91, 1, 8, 'Coca Cola'),
(90, 1, 8, 'Disney'),
(89, 1, 8, 'Dell'),
(99, 1, 7, 'iPhone 6'),
(88, 1, 8, 'Harley Davidson'),
(94, 1, 8, 'NFL'),
(95, 1, 8, 'RedBull'),
(96, 1, 8, 'Sony'),
(97, 1, 8, 'Starbucks'),
(98, 1, 8, 'Nintendo');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2015-06-16 18:39:10'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2015-06-09 15:02:02'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2015-06-09 15:01:49'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2015-06-09 14:24:54'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2015-06-09 14:17:34'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2015-06-09 15:02:41'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2015-06-09 14:17:10'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2015-06-25 11:32:58'),
(59, '', 57, 1, 1, 0, 1, '2015-06-13 14:41:58', '2015-06-13 14:41:58'),
(64, '', 62, 1, 1, 0, 1, '2015-06-18 16:43:29', '2015-06-18 16:43:29'),
(63, '', 61, 1, 1, 0, 1, '2015-06-18 16:37:59', '2015-06-18 16:37:59'),
(62, '', 61, 1, 1, 0, 1, '2015-06-18 16:37:31', '2015-06-18 16:37:31'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2015-06-09 14:26:39'),
(46, '', 18, 1, 0, 0, 1, '2010-09-24 18:29:31', '2015-06-09 14:26:17'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(67, '', 63, 1, 1, 0, 1, '2015-06-18 18:02:01', '2015-06-18 18:02:01'),
(66, '', 57, 1, 1, 0, 1, '2015-06-18 17:29:16', '2015-06-18 17:29:16'),
(65, '', 62, 1, 1, 0, 1, '2015-06-18 16:43:59', '2015-06-18 16:43:59'),
(57, 'catalog/3.png', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2015-06-20 12:43:37'),
(60, '', 59, 1, 1, 0, 1, '2015-06-13 14:42:26', '2015-06-13 14:42:26'),
(61, 'catalog/1.png', 0, 1, 1, 0, 1, '2015-06-18 14:13:56', '2015-06-18 14:13:56'),
(68, '', 0, 1, 1, 0, 1, '2015-06-18 18:04:08', '2015-06-18 18:04:08'),
(69, '', 0, 1, 1, 0, 1, '2015-06-18 18:04:51', '2015-06-18 18:04:51'),
(70, '', 0, 1, 1, 0, 1, '2015-06-18 18:05:26', '2015-06-18 18:05:26'),
(71, '', 0, 1, 1, 0, 1, '2015-06-18 18:06:10', '2015-06-18 18:06:10'),
(72, '', 0, 1, 1, 0, 1, '2015-06-18 18:06:53', '2015-06-18 18:06:53'),
(73, '', 0, 1, 1, 0, 1, '2015-06-18 18:07:25', '2015-06-18 18:07:25'),
(74, '', 0, 1, 1, 0, 1, '2015-06-18 18:08:18', '2015-06-18 18:08:18');

-- --------------------------------------------------------

--
-- Table structure for table `category_description`
--

CREATE TABLE IF NOT EXISTS `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_description`
--

INSERT INTO `category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(33, 1, 'Cameras', '', '', '', ''),
(32, 1, 'Web Cameras', '', '', '', ''),
(31, 1, 'Scanners', '', '', '', ''),
(30, 1, 'Printers', '', '', '', ''),
(29, 1, 'Mice and Trackballs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Mice and Trackballs', '', ''),
(27, 1, 'Mac', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Mac', '', ''),
(26, 1, 'PC', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'PCv', '', ''),
(17, 1, 'Software', '', '', '', ''),
(25, 1, 'Components', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Components', '', ''),
(24, 1, 'Phones &amp; PDAs', '', '', '', ''),
(20, 1, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Desktops', 'Example of category description', ''),
(62, 1, 'Electronics sub', '&lt;p&gt;Electronics sub&lt;br&gt;&lt;/p&gt;', 'Electronics sub', '', ''),
(43, 1, 'test 11', '', '', '', ''),
(34, 1, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 Players', '', ''),
(18, 1, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Laptops &amp; Notebooks', '', ''),
(44, 1, 'test 12', '', '', '', ''),
(45, 1, 'Windows', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Windows', '', ''),
(46, 1, 'Macs', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Macs', '', ''),
(47, 1, 'test 15', '', '', '', ''),
(48, 1, 'test 16', '', '', '', ''),
(49, 1, 'test 17', '', '', '', ''),
(50, 1, 'test 18', '', '', '', ''),
(51, 1, 'test 19', '', '', '', ''),
(63, 1, 'Electronics sub 1', '&lt;p&gt;Electronics sub1&lt;br&gt;&lt;/p&gt;', 'Electronics sub1', '', ''),
(28, 1, 'Monitors', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Monitor', '', ''),
(59, 1, 'tablet sub1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'tablet sub1', '', ''),
(60, 1, 'tablet sub sub1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'tablet sub sub1', '', ''),
(57, 1, 'Tablets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Tablets', '', ''),
(61, 1, 'Electronics', '&lt;p&gt;Electronics&lt;br&gt;&lt;/p&gt;', 'Electronics', '', ''),
(64, 1, 'Electronics sub sub 1', '&lt;p&gt;Electronics sub sub 1&lt;br&gt;&lt;/p&gt;', 'Electronics sub sub 1', '', ''),
(65, 1, 'Electronics sub sub 2', '&lt;p&gt;Electronics sub sub 1&lt;br&gt;&lt;/p&gt;', 'Electronics sub sub 1', '', ''),
(66, 1, 'tablet sub 2', '&lt;p&gt;tablet sub 2&lt;br&gt;&lt;/p&gt;', 'tablet sub 2', '', ''),
(67, 1, 'Electronics sub sub 3', '&lt;p&gt;Electronics sub sub 3&lt;br&gt;&lt;/p&gt;', 'Electronics sub sub 3', '', ''),
(68, 1, 'Sports &amp; Outdoors', '&lt;p&gt;Sports &amp;amp; Outdoors&lt;br&gt;&lt;/p&gt;', 'Sports &amp; Outdoors', '', ''),
(69, 1, 'Smartphone &amp; Tablets', '&lt;p&gt;Smartphone &amp;amp; Tablets&lt;br&gt;&lt;/p&gt;', 'Smartphone &amp; Tablets', '', ''),
(70, 1, 'Health &amp; Beauty Bags', '&lt;p&gt;Health &amp;amp; Beauty Bags&lt;br&gt;&lt;/p&gt;', 'Health &amp; Beauty Bags', '', ''),
(71, 1, 'Shoes &amp; Accessories', '&lt;p&gt;Shoes &amp;amp; Accessories&lt;br&gt;&lt;/p&gt;', 'Shoes &amp; Accessories', '', ''),
(72, 1, 'Toys &amp; Hobbies', '&lt;p&gt;Toys &amp;amp; Hobbies&lt;br&gt;&lt;/p&gt;', 'Toys &amp; Hobbies', '', ''),
(73, 1, 'Computers &amp; Networking', '&lt;p&gt;Computers &amp;amp; Networking&lt;br&gt;&lt;/p&gt;', 'Computers &amp; Networking', '', ''),
(74, 1, 'Jewelry &amp; Watches', '&lt;p&gt;Jewelry &amp;amp; Watches&lt;br&gt;&lt;/p&gt;', 'Jewelry &amp; Watches', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `category_filter`
--

CREATE TABLE IF NOT EXISTS `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_filter`
--

INSERT INTO `category_filter` (`category_id`, `filter_id`) VALUES
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(28, 5),
(34, 1),
(34, 3),
(34, 4),
(34, 5),
(57, 1),
(57, 2),
(57, 3),
(57, 4),
(57, 5);

-- --------------------------------------------------------

--
-- Table structure for table `category_path`
--

CREATE TABLE IF NOT EXISTS `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_path`
--

INSERT INTO `category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(61, 61, 0),
(60, 60, 2),
(60, 59, 1),
(60, 57, 0),
(59, 59, 1),
(59, 57, 0),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(65, 65, 2),
(65, 62, 1),
(66, 66, 1),
(66, 57, 0),
(65, 61, 0),
(64, 64, 2),
(64, 62, 1),
(64, 61, 0),
(63, 63, 1),
(63, 61, 0),
(62, 62, 1),
(62, 61, 0),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(74, 74, 0),
(73, 73, 0),
(72, 72, 0),
(71, 71, 0),
(70, 70, 0),
(69, 69, 0),
(68, 68, 0),
(67, 67, 2),
(67, 63, 1),
(67, 61, 0),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_to_layout`
--

CREATE TABLE IF NOT EXISTS `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_to_layout`
--

INSERT INTO `category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(28, 0, 0),
(25, 0, 0),
(25, 2, 0),
(29, 0, 0),
(29, 2, 0),
(28, 2, 0),
(18, 0, 0),
(18, 2, 0),
(46, 0, 0),
(46, 2, 0),
(45, 0, 0),
(45, 2, 0),
(20, 0, 0),
(20, 2, 0),
(27, 0, 0),
(27, 2, 0),
(26, 0, 0),
(26, 2, 0),
(59, 0, 0),
(59, 2, 0),
(60, 0, 0),
(60, 2, 0),
(25, 3, 0),
(57, 3, 0),
(57, 2, 0),
(57, 0, 0),
(61, 0, 0),
(61, 2, 0),
(61, 3, 0),
(62, 0, 0),
(62, 2, 0),
(62, 3, 0),
(63, 0, 0),
(63, 2, 0),
(63, 3, 0),
(64, 0, 0),
(64, 2, 0),
(64, 3, 0),
(65, 0, 0),
(65, 2, 0),
(65, 3, 0),
(66, 0, 0),
(66, 2, 0),
(66, 3, 0),
(67, 0, 0),
(67, 2, 0),
(67, 3, 0),
(68, 0, 0),
(68, 2, 0),
(68, 3, 0),
(69, 0, 0),
(69, 2, 0),
(69, 3, 0),
(70, 0, 0),
(70, 2, 0),
(70, 3, 0),
(71, 0, 0),
(71, 2, 0),
(71, 3, 0),
(72, 0, 0),
(72, 2, 0),
(72, 3, 0),
(73, 0, 0),
(73, 2, 0),
(73, 3, 0),
(74, 0, 0),
(74, 2, 0),
(74, 3, 0),
(34, 0, 0),
(34, 2, 0),
(34, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_to_store`
--

CREATE TABLE IF NOT EXISTS `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_to_store`
--

INSERT INTO `category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 2),
(20, 2),
(24, 0),
(25, 2),
(25, 3),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(43, 0),
(44, 0),
(45, 2),
(46, 2),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(57, 0),
(57, 3),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1521 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city_name`, `zone_id`, `status`) VALUES
(549, 'Bangalore', 17, 1),
(575, 'Mangalore', 17, 1),
(1520, 'Mumbai', 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'India', 'IN', 'IND', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_category`
--

CREATE TABLE IF NOT EXISTS `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_history`
--

CREATE TABLE IF NOT EXISTS `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_product`
--

CREATE TABLE IF NOT EXISTS `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.63720000, 1, '2015-06-25 04:31:24'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2015-06-25 14:27:44'),
(3, 'Euro', 'EUR', '', '€', '2', 0.89219999, 1, '2015-06-25 04:31:24');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 1, 0, 'Sample', 'sam', 'sample1@sampl.com', '', '', '98ea4fa0e0e613f282e4dc236214c0cdd394261f', 'edd46e7e3', 'a:0:{}', '', 0, 1, '', '127.0.0.1', 1, 1, 0, '', '2015-05-23 10:12:14'),
(2, 1, 0, 'jp', 'k', 'smv1@sample.com', '6785543232', '', '256ebcc5155acd033a4d2bc097755af3f60b8200', '6354b8173', 'a:0:{}', '', 0, 2, '', '127.0.0.1', 1, 1, 0, '', '2015-05-23 10:18:21'),
(3, 1, 0, 'daily', 'needs', 'daily@demo.com', '', '', '28e5e89cc93ffc04f504924e8dd09d6f3ee242db', 'f302ac44a', 'a:0:{}', '', 0, 3, '', '127.0.0.1', 1, 1, 0, '', '2015-05-23 11:50:04'),
(4, 1, 0, 'big', 'bazar', 'big@demo.com', '', '', '70d26939aa601c1a07c172e09378a72f390532da', '7c49f0482', 'a:0:{}', '', 0, 4, '', '127.0.0.1', 1, 1, 0, '', '2015-06-04 10:44:14'),
(6, 1, 0, 'shoper', 'stop', 'shoper@demo.com', '', '', 'dac520fed7c5e7dd8e76b245e12eb94da0600e5e', 'da4475705', 'a:0:{}', '', 0, 6, '', '127.0.0.1', 1, 1, 0, '', '2015-06-05 18:13:42'),
(7, 1, 0, 'fbb', 'fbb', 'fbbb@demo.com', '', '', 'ff3ff5782563774a6226fd33e735cb9d7f9c1c03', 'cc900fcde', NULL, NULL, 1, 0, '', '', 1, 1, 1, '', '2015-06-17 16:27:21'),
(8, 1, 0, 'fbb', 'fashion', 'fbb@demo.com', '', '', 'bbf57555852a54cf6c3881d72b0e69da3a0052cd', 'fb4c11926', 'a:1:{s:40:"YToxOntzOjEwOiJwcm9kdWN0X2lkIjtpOjMzO30=";i:6;}', '', 0, 7, '', '127.0.0.1', 1, 1, 0, '', '2015-06-17 18:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `customer_activity`
--

CREATE TABLE IF NOT EXISTS `customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `customer_activity`
--

INSERT INTO `customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:10:"Sample sam";}', '127.0.0.1', '2015-05-23 10:12:14'),
(2, 2, 'register', 'a:2:{s:11:"customer_id";i:2;s:4:"name";s:4:"jp k";}', '127.0.0.1', '2015-05-23 10:18:21'),
(3, 2, 'login', 'a:2:{s:11:"customer_id";s:1:"2";s:4:"name";s:4:"jp k";}', '127.0.0.1', '2015-05-23 10:19:07'),
(4, 3, 'register', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:11:"daily needs";}', '127.0.0.1', '2015-05-23 11:50:04'),
(5, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:11:"daily needs";}', '127.0.0.1', '2015-05-23 12:16:59'),
(6, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:11:"daily needs";}', '127.0.0.1', '2015-05-28 14:26:49'),
(7, 3, 'login', 'a:2:{s:11:"customer_id";s:1:"3";s:4:"name";s:11:"daily needs";}', '127.0.0.1', '2015-06-01 17:01:20'),
(8, 4, 'register', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-04 10:44:15'),
(9, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-05 11:10:30'),
(10, 5, 'register', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:7:"fbb fbb";}', '127.0.0.1', '2015-06-05 17:22:42'),
(11, 6, 'register', 'a:2:{s:11:"customer_id";s:1:"6";s:4:"name";s:11:"shoper stop";}', '127.0.0.1', '2015-06-05 18:13:43'),
(12, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-05 18:57:08'),
(13, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:7:"fbb fbb";}', '127.0.0.1', '2015-06-06 11:27:17'),
(14, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:7:"fbb fbb";}', '127.0.0.1', '2015-06-08 11:39:27'),
(15, 2, 'order_account', 'a:3:{s:11:"customer_id";s:1:"2";s:4:"name";s:4:"jp k";s:8:"order_id";i:1;}', '127.0.0.1', '2015-06-08 13:07:17'),
(16, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:7:"fbb fbb";}', '127.0.0.1', '2015-06-08 13:09:28'),
(17, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-09 15:05:45'),
(18, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-10 15:46:37'),
(19, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-13 12:43:03'),
(20, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-15 17:58:00'),
(21, 4, 'login', 'a:2:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";}', '127.0.0.1', '2015-06-16 14:12:44'),
(22, 4, 'order_account', 'a:3:{s:11:"customer_id";s:1:"4";s:4:"name";s:9:"big bazar";s:8:"order_id";i:2;}', '127.0.0.1', '2015-06-16 14:13:27'),
(23, 5, 'login', 'a:2:{s:11:"customer_id";s:1:"5";s:4:"name";s:7:"fbb fbb";}', '127.0.0.1', '2015-06-16 14:28:15'),
(24, 8, 'register', 'a:2:{s:11:"customer_id";s:1:"8";s:4:"name";s:11:"fbb fashion";}', '127.0.0.1', '2015-06-17 18:12:40'),
(25, 8, 'login', 'a:2:{s:11:"customer_id";s:1:"8";s:4:"name";s:11:"fbb fashion";}', '127.0.0.1', '2015-06-17 18:13:56'),
(26, 8, 'login', 'a:2:{s:11:"customer_id";s:1:"8";s:4:"name";s:11:"fbb fashion";}', '127.0.0.1', '2015-06-19 16:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group_description`
--

CREATE TABLE IF NOT EXISTS `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_group_description`
--

INSERT INTO `customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `customer_history`
--

CREATE TABLE IF NOT EXISTS `customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer_ip`
--

INSERT INTO `customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2015-05-23 10:12:15'),
(2, 2, '127.0.0.1', '2015-05-23 10:18:21'),
(3, 3, '127.0.0.1', '2015-05-23 11:50:04'),
(4, 4, '127.0.0.1', '2015-06-04 10:44:55'),
(5, 5, '127.0.0.1', '2015-06-05 17:23:26'),
(6, 6, '127.0.0.1', '2015-06-05 18:13:53'),
(7, 8, '127.0.0.1', '2015-06-17 18:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `customer_login`
--

CREATE TABLE IF NOT EXISTS `customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_online`
--

CREATE TABLE IF NOT EXISTS `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_reward`
--

CREATE TABLE IF NOT EXISTS `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `customer_reward`
--

INSERT INTO `customer_reward` (`customer_reward_id`, `customer_id`, `order_id`, `description`, `points`, `date_added`) VALUES
(1, 4, 2, 'Order ID: #2', 200, '2015-06-16 14:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `customer_transaction`
--

CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE IF NOT EXISTS `custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_description`
--

CREATE TABLE IF NOT EXISTS `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value`
--

CREATE TABLE IF NOT EXISTS `custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `download_description`
--

CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=447 ;

--
-- Dumping data for table `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow'),
(443, 'module', 'multiseller'),
(429, 'module', 'webrotate360'),
(430, 'module', 'filter'),
(437, 'module', 'price_slider'),
(438, 'module', 'bestseller'),
(439, 'module', 'latest'),
(440, 'module', 'special'),
(444, 'module', 'home_tabs'),
(446, 'module', 'home_category');

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE IF NOT EXISTS `filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 0),
(5, 2, 0),
(4, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filter_description`
--

CREATE TABLE IF NOT EXISTS `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_description`
--

INSERT INTO `filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(1, 1, 1, 'Medium'),
(2, 1, 1, 'Small'),
(3, 1, 1, 'Large'),
(5, 1, 2, 'Hindi'),
(4, 1, 2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `filter_group`
--

CREATE TABLE IF NOT EXISTS `filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `filter_group`
--

INSERT INTO `filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 2),
(2, 3),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `filter_group_description`
--

CREATE TABLE IF NOT EXISTS `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_group_description`
--

INSERT INTO `filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Monitor Size'),
(2, 1, 'Language'),
(3, 1, 'Price Slider');

-- --------------------------------------------------------

--
-- Table structure for table `geo_zone`
--

CREATE TABLE IF NOT EXISTS `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `geo_zone`
--

INSERT INTO `geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(5, 'India', 'India', '0000-00-00 00:00:00', '2015-05-27 11:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `information_description`
--

CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `information_to_layout`
--

CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `information_to_store`
--

CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `layout`
--

CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, '[MultiMerch] Seller Account Pages'),
(15, '[MultiMerch] Sellers List'),
(17, '[MultiMerch] Seller Products List'),
(20, 'Vendor'),
(23, '[MultiMerch] Seller Profile Page');

-- --------------------------------------------------------

--
-- Table structure for table `layout_module`
--

CREATE TABLE IF NOT EXISTS `layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=188 ;

--
-- Dumping data for table `layout_module`
--

INSERT INTO `layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(117, 20, 'special.33', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(124, 3, 'filter', 'column_left', 3),
(123, 3, 'category', 'column_left', 1),
(122, 3, 'price_slider', 'column_left', 2),
(187, 2, 'category', 'column_left', 0),
(183, 1, 'home_category.37', 'content_top', 3),
(182, 1, 'home_tabs.36', 'content_top', 2),
(116, 20, 'carousel.29', 'content_top', 0),
(181, 1, 'slideshow.27', 'content_top', 1),
(118, 20, 'latest.32', 'content_top', 2);

-- --------------------------------------------------------

--
-- Table structure for table `layout_route`
--

CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=192 ;

--
-- Dumping data for table `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(141, 20, 2, 'common/home'),
(190, 2, 2, 'product/product'),
(24, 11, 0, 'information/information'),
(118, 7, 2, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(120, 4, 2, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(156, 3, 0, 'product/category'),
(150, 15, 0, 'seller/catalog-seller'),
(96, 12, 2, 'product/compare'),
(95, 5, 2, 'product/manufacturer'),
(119, 4, 0, ''),
(93, 9, 2, 'information/sitemap'),
(92, 8, 2, 'information/contact'),
(117, 7, 0, 'checkout/%'),
(90, 11, 2, 'information/information'),
(191, 2, 0, 'product/product'),
(182, 1, 0, 'common/home'),
(155, 3, 2, 'product/category'),
(86, 10, 2, 'affiliate/%'),
(85, 6, 2, 'account/%'),
(97, 13, 2, 'product/search'),
(144, 23, 0, 'seller/catalog-seller/profile'),
(149, 17, 0, 'seller/catalog-seller/products'),
(121, 6, 3, 'account/%'),
(122, 10, 3, 'affiliate/%'),
(154, 3, 3, 'product/category'),
(181, 1, 3, 'common/home'),
(125, 11, 3, 'information/information'),
(126, 8, 3, 'information/contact'),
(127, 9, 3, 'information/sitemap'),
(128, 5, 3, 'product/manufacturer'),
(129, 12, 3, 'product/compare'),
(130, 13, 3, 'product/search'),
(133, 4, 3, ''),
(134, 7, 3, 'checkout/%'),
(148, 14, 0, 'seller/account-%'),
(189, 2, 3, 'product/product');

-- --------------------------------------------------------

--
-- Table structure for table `length_class`
--

CREATE TABLE IF NOT EXISTS `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `length_class`
--

INSERT INTO `length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `length_class_description`
--

CREATE TABLE IF NOT EXISTS `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `length_class_description`
--

INSERT INTO `length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `name`, `address`, `telephone`, `fax`, `geocode`, `image`, `open`, `comment`) VALUES
(1, 'Shopping Mart', 'Shopping Mart\r\nSource One \r\nBanagalore', '1234567890', '', '', '', '10 -6', '');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manufacturer_to_store`
--

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `marketing`
--

CREATE TABLE IF NOT EXISTS `marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `modification`
--

CREATE TABLE IF NOT EXISTS `modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', 'a:5:{s:4:"name";s:17:"Banner - Category";s:9:"banner_id";s:1:"6";s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:6:"status";s:1:"1";}'),
(29, 'Home Page', 'carousel', 'a:5:{s:4:"name";s:20:"Carousel - Home Page";s:9:"banner_id";s:1:"8";s:5:"width";s:3:"130";s:6:"height";s:3:"100";s:6:"status";s:1:"1";}'),
(28, 'Featured - Home Page', 'featured', 'a:6:{s:4:"name";s:20:"Featured - Home Page";s:7:"product";a:5:{i:0;s:2:"43";i:1;s:2:"40";i:2;s:2:"42";i:3;s:2:"41";i:4;s:2:"30";}s:5:"limit";s:1:"4";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(27, 'Slideshow - Home Page', 'slideshow', 'a:5:{s:4:"name";s:21:"Slideshow - Home Page";s:9:"banner_id";s:1:"7";s:5:"width";s:3:"666";s:6:"height";s:3:"450";s:6:"status";s:1:"1";}'),
(31, 'Best Sellers', 'bestseller', 'a:5:{s:4:"name";s:12:"Best Sellers";s:5:"limit";s:1:"5";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(32, 'Latest', 'latest', 'a:5:{s:4:"name";s:6:"Latest";s:5:"limit";s:1:"5";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(33, ' Specials', 'special', 'a:5:{s:4:"name";s:9:" Specials";s:5:"limit";s:1:"5";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(36, 'Home Tabs', 'home_tabs', 'a:6:{s:4:"name";s:9:"Home Tabs";s:7:"section";a:4:{i:0;s:8:"featured";i:1;s:10:"bestseller";i:2;s:6:"latest";i:3;s:7:"special";}s:5:"limit";s:2:"16";s:5:"width";s:3:"300";s:6:"height";s:3:"366";s:6:"status";s:1:"1";}'),
(37, 'Category Module', 'home_category', 'a:6:{s:4:"name";s:15:"Category Module";s:8:"category";a:3:{i:0;s:2:"34";i:1;s:2:"61";i:2;s:2:"57";}s:5:"limit";s:1:"5";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}');

-- --------------------------------------------------------

--
-- Table structure for table `ms_attribute`
--

CREATE TABLE IF NOT EXISTS `ms_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_type` int(11) NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT '0',
  `multilang` tinyint(4) NOT NULL DEFAULT '0',
  `tab_display` tinyint(4) NOT NULL DEFAULT '0',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_attribute_attribute`
--

CREATE TABLE IF NOT EXISTS `ms_attribute_attribute` (
  `ms_attribute_id` int(11) NOT NULL DEFAULT '0',
  `oc_attribute_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ms_attribute_id`,`oc_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ms_attribute_description`
--

CREATE TABLE IF NOT EXISTS `ms_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ms_attribute_value`
--

CREATE TABLE IF NOT EXISTS `ms_attribute_value` (
  `attribute_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_attribute_value_description`
--

CREATE TABLE IF NOT EXISTS `ms_attribute_value_description` (
  `attribute_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`attribute_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ms_balance`
--

CREATE TABLE IF NOT EXISTS `ms_balance` (
  `balance_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `withdrawal_id` int(11) DEFAULT NULL,
  `balance_type` int(11) DEFAULT NULL,
  `amount` decimal(15,4) NOT NULL,
  `balance` decimal(15,4) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`balance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_commission`
--

CREATE TABLE IF NOT EXISTS `ms_commission` (
  `commission_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`commission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ms_commission`
--

INSERT INTO `ms_commission` (`commission_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `ms_commission_rate`
--

CREATE TABLE IF NOT EXISTS `ms_commission_rate` (
  `rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `rate_type` int(11) NOT NULL,
  `commission_id` int(11) NOT NULL,
  `flat` decimal(15,4) DEFAULT NULL,
  `percent` decimal(15,2) DEFAULT NULL,
  `payment_method` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ms_commission_rate`
--

INSERT INTO `ms_commission_rate` (`rate_id`, `rate_type`, `commission_id`, `flat`, `percent`, `payment_method`) VALUES
(1, 1, 1, '0.0000', '0.00', 1),
(2, 3, 1, '0.0000', '0.00', 1),
(3, 2, 1, '0.0000', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ms_criteria`
--

CREATE TABLE IF NOT EXISTS `ms_criteria` (
  `criteria_id` int(11) NOT NULL AUTO_INCREMENT,
  `criteria_type` tinyint(4) NOT NULL,
  `range_id` int(11) NOT NULL,
  PRIMARY KEY (`criteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_db_schema`
--

CREATE TABLE IF NOT EXISTS `ms_db_schema` (
  `schema_change_id` int(11) NOT NULL AUTO_INCREMENT,
  `major` tinyint(4) NOT NULL,
  `minor` tinyint(4) NOT NULL,
  `build` tinyint(4) NOT NULL,
  `revision` smallint(6) NOT NULL,
  `date_applied` datetime NOT NULL,
  PRIMARY KEY (`schema_change_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ms_db_schema`
--

INSERT INTO `ms_db_schema` (`schema_change_id`, `major`, `minor`, `build`, `revision`, `date_applied`) VALUES
(1, 1, 0, 2, 0, '2015-06-17 16:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `ms_order_comment`
--

CREATE TABLE IF NOT EXISTS `ms_order_comment` (
  `order_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`order_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_order_product_data`
--

CREATE TABLE IF NOT EXISTS `ms_order_product_data` (
  `order_product_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `store_commission_flat` decimal(15,4) NOT NULL,
  `store_commission_pct` decimal(15,4) NOT NULL,
  `seller_net_amt` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_product_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_payment`
--

CREATE TABLE IF NOT EXISTS `ms_payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_data` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL,
  `date_paid` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_product`
--

CREATE TABLE IF NOT EXISTS `ms_product` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `number_sold` int(11) NOT NULL DEFAULT '0',
  `product_status` tinyint(4) NOT NULL,
  `product_approved` tinyint(4) NOT NULL,
  `list_until` date DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ms_product`
--

INSERT INTO `ms_product` (`product_id`, `seller_id`, `number_sold`, `product_status`, `product_approved`, `list_until`) VALUES
(33, 8, 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ms_product_attribute`
--

CREATE TABLE IF NOT EXISTS `ms_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`attribute_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ms_range_date`
--

CREATE TABLE IF NOT EXISTS `ms_range_date` (
  `range_id` int(11) NOT NULL AUTO_INCREMENT,
  `from` datetime DEFAULT NULL,
  `to` datetime NOT NULL,
  PRIMARY KEY (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_range_decimal`
--

CREATE TABLE IF NOT EXISTS `ms_range_decimal` (
  `range_id` int(11) NOT NULL AUTO_INCREMENT,
  `from` decimal(15,4) NOT NULL,
  `to` decimal(15,4) NOT NULL,
  PRIMARY KEY (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_range_int`
--

CREATE TABLE IF NOT EXISTS `ms_range_int` (
  `range_id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  PRIMARY KEY (`range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_seller`
--

CREATE TABLE IF NOT EXISTS `ms_seller` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(32) NOT NULL DEFAULT '',
  `website` varchar(2083) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `paypal` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `seller_status` tinyint(4) NOT NULL,
  `seller_approved` tinyint(4) NOT NULL,
  `product_validation` tinyint(4) NOT NULL DEFAULT '1',
  `seller_group` int(11) NOT NULL DEFAULT '1',
  `commission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `ms_seller`
--

INSERT INTO `ms_seller` (`seller_id`, `nickname`, `company`, `website`, `description`, `country_id`, `zone_id`, `city_id`, `address`, `avatar`, `banner`, `paypal`, `date_created`, `seller_status`, `seller_approved`, `product_validation`, `seller_group`, `commission_id`) VALUES
(8, 'fashion', '', '', '', 1, 17, 549, '', '', '', '', '2015-06-17 18:21:07', 1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ms_seller_group`
--

CREATE TABLE IF NOT EXISTS `ms_seller_group` (
  `seller_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_id` int(11) DEFAULT NULL,
  `product_period` int(5) DEFAULT '0',
  `product_quantity` int(5) DEFAULT '0',
  PRIMARY KEY (`seller_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ms_seller_group`
--

INSERT INTO `ms_seller_group` (`seller_group_id`, `commission_id`, `product_period`, `product_quantity`) VALUES
(1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ms_seller_group_criteria`
--

CREATE TABLE IF NOT EXISTS `ms_seller_group_criteria` (
  `seller_group_criteria_id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_id` int(11) NOT NULL,
  `criteria_id` int(11) NOT NULL,
  PRIMARY KEY (`seller_group_criteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_seller_group_description`
--

CREATE TABLE IF NOT EXISTS `ms_seller_group_description` (
  `seller_group_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_group_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`seller_group_description_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ms_seller_group_description`
--

INSERT INTO `ms_seller_group_description` (`seller_group_description_id`, `seller_group_id`, `name`, `description`, `language_id`) VALUES
(1, 1, 'Default', 'Default seller group', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ms_shop_location`
--

CREATE TABLE IF NOT EXISTS `ms_shop_location` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `shop_name` varchar(32) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `address` varchar(250) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `shop_timing` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `shop_status` tinyint(4) NOT NULL DEFAULT '1',
  `shop_approved` tinyint(4) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ms_shop_location`
--

INSERT INTO `ms_shop_location` (`shop_id`, `seller_id`, `shop_name`, `country_id`, `zone_id`, `city_id`, `latitude`, `longitude`, `address`, `phone_number`, `email_address`, `shop_timing`, `description`, `shop_status`, `shop_approved`, `date_created`) VALUES
(1, 5, 'fbb bannerghatta', 1, 17, 549, '12.911186914322368', '77.59903601586916', '1st Main Road, 3rd Phase, J. P. Nagar, Bengaluru, Karnataka 560078, India', '1234567890', 'fbbbnght@demo.com', '10 AM - 9 PM', 'fbb bannerghatta', 1, 1, '2015-06-16 00:00:00'),
(2, 5, 'fbb btm', 1, 17, 549, '12.916729', '77.60895900000003', 'Udupi Garden Bus Stop, Outer Ring Road, BTM Layout, Bengaluru, Karnataka, India', '1234567890', 'fbbbtm@demo.com', '10 AM - 9 PM', 'fbb btm', 1, 1, '2015-06-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ms_suborder`
--

CREATE TABLE IF NOT EXISTS `ms_suborder` (
  `suborder_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  PRIMARY KEY (`suborder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ms_suborder_history`
--

CREATE TABLE IF NOT EXISTS `ms_suborder_history` (
  `suborder_history_id` int(5) NOT NULL AUTO_INCREMENT,
  `suborder_id` int(5) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`suborder_history_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ms_suborder_history`
--

INSERT INTO `ms_suborder_history` (`suborder_history_id`, `suborder_id`, `order_status_id`, `comment`, `date_added`) VALUES
(1, 1, 0, 'Order created', '2015-06-08 13:07:09'),
(2, 1, 3, '', '2015-06-08 13:10:13'),
(3, 1, 2, '', '2015-06-08 13:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11),
(13, 'radio', 1);

-- --------------------------------------------------------

--
-- Table structure for table `option_description`
--

CREATE TABLE IF NOT EXISTS `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `option_description`
--

INSERT INTO `option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(13, 1, 'Color');

-- --------------------------------------------------------

--
-- Table structure for table `option_value`
--

CREATE TABLE IF NOT EXISTS `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `option_value`
--

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(49, 13, 'catalog/1.png', 0),
(50, 13, 'catalog/3.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `option_value_description`
--

CREATE TABLE IF NOT EXISTS `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `option_value_description`
--

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(49, 1, 13, 'Grey Color'),
(50, 1, 13, 'Red');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 1, 'INV-2013-00', 0, 'Shopping Mart', 'http://shoppingmart.lcl/', 2, 1, 'jp', 'k', 'smv1@sample.com', '6785543232', '', 'b:0;', 'jp', 'k', '', 'bangalore gopalan mall', '', 'bangalore', '560078', '', 99, '', 1489, '', 'b:0;', 'Cash On Delivery', 'cod', 'jp', 'k', '', 'bangalore gopalan mall', '', 'bangalore', '560078', '', 99, '', 1489, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '205.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'en-US,en;q=0.5', '2015-06-08 13:07:09', '2015-06-08 13:07:16'),
(2, 2, 'INV-2013-00', 2, 'Shopping Mart', 'http://electronics.shoppingmart.lcl/', 4, 1, 'big', 'bazar', 'big@demo.com', '', '', 'b:0;', 'big', 'bazar', '', '', '', '', '', '', 0, '', 0, '', 'b:0;', 'Cash On Delivery', 'cod', 'big', 'bazar', '', '', '', '', '', '', 0, '', 0, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '233.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'en-US,en;q=0.5', '2015-06-16 14:13:08', '2015-06-16 14:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_custom_field`
--

CREATE TABLE IF NOT EXISTS `order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_fraud`
--

CREATE TABLE IF NOT EXISTS `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 0, '', '2015-06-08 13:07:16'),
(2, 2, 1, 0, '', '2015-06-16 14:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `order_option`
--

CREATE TABLE IF NOT EXISTS `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `order_option`
--

INSERT INTO `order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(1, 2, 2, 227, 17, 'Radio', 'Small', 'radio'),
(2, 2, 2, 228, 20, 'Checkbox', 'Checkbox 1', 'checkbox'),
(3, 2, 2, 230, 24, 'Select', 'Red', 'select');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 33, 'Samsung SyncMaster 941BW', 'Product 6', 1, '200.0000', '200.0000', '0.0000', 0),
(2, 2, 42, 'Apple Cinema 30&quot;', 'Product 15', 2, '114.0000', '228.0000', '0.0000', 200);

-- --------------------------------------------------------

--
-- Table structure for table `order_recurring`
--

CREATE TABLE IF NOT EXISTS `order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `order_total`
--

CREATE TABLE IF NOT EXISTS `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `order_total`
--

INSERT INTO `order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Sub-Total', '200.0000', 1),
(2, 1, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(3, 1, 'total', 'Total', '205.0000', 9),
(4, 2, 'sub_total', 'Sub-Total', '228.0000', 1),
(5, 2, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(6, 2, 'total', 'Total', '233.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `order_voucher`
--

CREATE TABLE IF NOT EXISTS `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(51, 'Redmi 1s', '', '', '', '', '', '', '', 999, 6, 'catalog/p37.jpg', 0, 0, '2000.0000', 0, 0, '2015-06-09', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 1, '2015-06-10 15:47:52', '2015-06-23 11:31:51'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 2, '2009-02-03 16:42:17', '2015-06-24 18:34:46'),
(30, 'Product 3', '', '', '', '', '', '', '', 0, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 93, '2009-02-03 16:59:00', '2015-06-25 19:12:07'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 1, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 0, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 0, 1, 0, 1, 145, '2009-02-03 17:08:31', '2015-06-20 13:37:01'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, 'catalog/p34.jpg', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 18:08:31', '2015-06-25 19:56:09'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 5, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 40, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 3, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Product 15', '', '', '', '', '', '', '', 999, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '100.0000', 400, 10, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 0, 2, 0, 1, 24, '2009-02-03 21:07:37', '2015-06-25 19:53:48'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 1, '2009-02-03 21:07:49', '2015-06-09 15:03:21'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2015-06-09 15:03:38'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 0, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2015-06-09 15:03:55'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 4, '2009-02-03 21:08:40', '2015-06-25 19:55:27'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 27, '2009-02-08 17:21:51', '2015-06-25 12:41:25'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23'),
(50, 'iPhone', '', '', '', '', '', '', '', 999, 6, 'catalog/p35.jpg', 0, 0, '300.0000', 0, 0, '2015-05-22', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 5, '2015-05-23 10:13:42', '2015-06-25 19:55:46'),
(52, 'demo product', '', '', '', '', '', '', '', 999, 6, 'catalog/p39.jpg', 0, 0, '1000.0000', 0, 0, '2015-06-14', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 10, '2015-06-15 17:59:28', '2015-06-25 19:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_attribute`
--

INSERT INTO `product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(30, 27, 1, '5GB Memory Card');

-- --------------------------------------------------------

--
-- Table structure for table `product_description`
--

CREATE TABLE IF NOT EXISTS `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_description`
--

INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight. It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you’re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile® 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm® MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS — 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM — 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you''re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '	Imagine the advantages of going big without slowing down. The big 19&quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it''s not hard to imagine.&lt;br&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '	The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to ', '', 'ghgfh', '', ''),
(51, 1, 'Redmi 1s', 'Redmi 1s china Redmi 1s chinaRedmi 1s chinaRedmi 1s chinaRedmi 1s china', '', 'Redmi 1s', '', ''),
(52, 1, 'demo product', 'demo product demo productdemo productdemo product', '', 'demo product', '', ''),
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'Canon EOS 5D', '', ''),
(50, 1, 'iPhone', 'sample this product and working good', 'iphone', 'iPhone', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

CREATE TABLE IF NOT EXISTS `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=474 ;

--
-- Dumping data for table `product_discount`
--

INSERT INTO `product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(473, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(472, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(471, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00'),
(470, 48, 1, 2, 10, '60.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `product_filter`
--

CREATE TABLE IF NOT EXISTS `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_filter`
--

INSERT INTO `product_filter` (`product_id`, `filter_id`) VALUES
(33, 1),
(33, 3),
(42, 1),
(42, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2438 ;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2430, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2436, 47, 'catalog/demo/hp_3.jpg', 0),
(2432, 42, 'catalog/demo/canon_logo.jpg', 1),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(2392, 43, 'catalog/demo/macbook_3.jpg', 0),
(2391, 43, 'catalog/demo/macbook_2.jpg', 0),
(2395, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(2394, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(2398, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(2397, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(2409, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(2420, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(2419, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2429, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2437, 47, 'catalog/demo/hp_2.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(2418, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(2390, 43, 'catalog/demo/macbook_4.jpg', 0),
(2389, 43, 'catalog/demo/macbook_5.jpg', 0),
(2393, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(2396, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(2408, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2435, 42, 'catalog/demo/canon_eos_5d_1.jpg', 4),
(2434, 42, 'catalog/demo/compaq_presario.jpg', 3),
(2433, 42, 'catalog/demo/hp_1.jpg', 2),
(2431, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2407, 51, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

CREATE TABLE IF NOT EXISTS `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=238 ;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(227, 42, 1, '', 1),
(228, 42, 2, '', 1),
(229, 42, 4, '', 0),
(230, 42, 5, '', 1),
(231, 42, 6, '', 0),
(237, 30, 13, '', 1),
(232, 42, 7, '', 0),
(233, 42, 8, '', 0),
(234, 42, 9, '', 0),
(235, 42, 10, '', 0),
(236, 30, 5, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_option_value`
--

CREATE TABLE IF NOT EXISTS `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `product_option_value`
--

INSERT INTO `product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(30, 237, 30, 13, 49, 2, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(22, 228, 42, 2, 44, 2696, 0, '30.0000', '+', 0, '+', '0.00000000', '+'),
(23, 228, 42, 2, 45, 3998, 0, '40.0000', '+', 0, '+', '0.00000000', '+'),
(21, 228, 42, 2, 24, 194, 0, '20.0000', '+', 0, '+', '0.00000000', '+'),
(20, 228, 42, 2, 23, 48, 0, '10.0000', '+', 0, '+', '0.00000000', '+'),
(17, 227, 42, 1, 32, 96, 0, '10.0000', '+', 0, '+', '0.00000000', '+'),
(18, 227, 42, 1, 31, 146, 0, '20.0000', '+', 0, '+', '0.00000000', '+'),
(19, 227, 42, 1, 43, 300, 0, '30.0000', '+', 0, '+', '0.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(31, 237, 30, 13, 50, 1, 1, '6.0000', '+', 0, '+', '0.00000000', '+'),
(29, 236, 30, 5, 42, 1, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(27, 230, 42, 5, 42, 200, 0, '2.0000', '+', 0, '+', '0.00000000', '+'),
(26, 230, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '0.00000000', '+'),
(25, 230, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '0.00000000', '+'),
(24, 230, 42, 5, 39, 92, 0, '4.0000', '+', 0, '+', '0.00000000', '+'),
(28, 236, 30, 5, 41, 2, 1, '10.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `product_recurring`
--

CREATE TABLE IF NOT EXISTS `product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_related`
--

CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_related`
--

INSERT INTO `product_related` (`product_id`, `related_id`) VALUES
(30, 35),
(30, 42),
(30, 47),
(30, 50),
(30, 52),
(35, 30),
(40, 42),
(41, 42),
(42, 30),
(42, 40),
(42, 41),
(47, 30),
(50, 30),
(52, 30);

-- --------------------------------------------------------

--
-- Table structure for table `product_reward`
--

CREATE TABLE IF NOT EXISTS `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=567 ;

--
-- Dumping data for table `product_reward`
--

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(565, 42, 1, 100),
(566, 47, 1, 300),
(554, 43, 1, 600),
(335, 40, 1, 0),
(564, 30, 1, 200),
(555, 44, 1, 700),
(556, 45, 1, 800),
(337, 31, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `product_special`
--

CREATE TABLE IF NOT EXISTS `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=466 ;

--
-- Dumping data for table `product_special`
--

INSERT INTO `product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(465, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(464, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(463, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00'),
(454, 48, 1, 0, '70.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `product_to_category`
--

CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
(29, 20),
(29, 24),
(29, 62),
(30, 20),
(30, 33),
(30, 43),
(31, 33),
(32, 34),
(33, 57),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57),
(50, 24),
(50, 66),
(51, 24),
(52, 24),
(52, 44);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_download`
--

CREATE TABLE IF NOT EXISTS `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_layout`
--

CREATE TABLE IF NOT EXISTS `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_to_layout`
--

INSERT INTO `product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(33, 0, 0),
(42, 2, 0),
(47, 2, 0),
(47, 0, 0),
(43, 0, 0),
(43, 2, 0),
(44, 0, 0),
(44, 2, 0),
(45, 0, 0),
(45, 2, 0),
(42, 0, 0),
(33, 2, 0),
(30, 0, 0),
(30, 2, 0),
(30, 3, 0),
(33, 3, 0),
(52, 3, 0),
(52, 2, 0),
(52, 0, 0),
(50, 0, 0),
(50, 2, 0),
(50, 3, 0),
(35, 3, 0),
(35, 2, 0),
(35, 0, 0),
(51, 0, 0),
(51, 2, 0),
(51, 3, 0),
(29, 0, 0),
(29, 2, 0),
(29, 3, 0),
(48, 0, 0),
(48, 2, 0),
(48, 3, 0),
(42, 3, 0),
(47, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_to_store`
--

CREATE TABLE IF NOT EXISTS `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_to_store`
--

INSERT INTO `product_to_store` (`product_id`, `store_id`) VALUES
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(33, 2),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 0),
(47, 0),
(47, 2),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0);

-- --------------------------------------------------------

--
-- Table structure for table `recurring`
--

CREATE TABLE IF NOT EXISTS `recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_description`
--

CREATE TABLE IF NOT EXISTS `recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `return_action`
--

CREATE TABLE IF NOT EXISTS `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `return_action`
--

INSERT INTO `return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `return_history`
--

CREATE TABLE IF NOT EXISTS `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `return_reason`
--

CREATE TABLE IF NOT EXISTS `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `return_reason`
--

INSERT INTO `return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `return_status`
--

CREATE TABLE IF NOT EXISTS `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `return_status`
--

INSERT INTO `return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 42, 3, 'austin', 'good product. best to buy', 4, 0, '2015-05-28 16:29:43', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3661 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(2817, 0, 'msconf', 'msconf_allow_inactive_seller_products', '0', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(2654, 2, 'config', 'config_image_location_height', '180', 0),
(2655, 2, 'config', 'config_secure', '0', 0),
(2653, 2, 'config', 'config_image_location_width', '240', 0),
(3644, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(3660, 0, 'config', 'config_google_captcha_status', '0', 0),
(3650, 0, 'config', 'config_password', '1', 0),
(3651, 0, 'config', 'config_encryption', '998641048073e55881a3e424c39795f3', 0),
(3652, 0, 'config', 'config_compression', '0', 0),
(3653, 0, 'config', 'config_error_display', '1', 0),
(3654, 0, 'config', 'config_error_log', '1', 0),
(3655, 0, 'config', 'config_error_filename', 'error.log', 0),
(3656, 0, 'config', 'config_google_analytics', '', 0),
(3657, 0, 'config', 'config_google_analytics_status', '0', 0),
(3658, 0, 'config', 'config_google_captcha_public', '', 0),
(3659, 0, 'config', 'config_google_captcha_secret', '', 0),
(3649, 0, 'config', 'config_maintenance', '0', 0),
(3648, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(3645, 0, 'config', 'config_seo_url', '1', 0),
(3646, 0, 'config', 'config_file_max_size', '300000', 0),
(3647, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(3643, 0, 'config', 'config_shared', '0', 0),
(3642, 0, 'config', 'config_secure', '0', 0),
(3641, 0, 'config', 'config_fraud_status_id', '7', 0),
(3640, 0, 'config', 'config_fraud_score', '', 0),
(3639, 0, 'config', 'config_fraud_key', '', 0),
(3638, 0, 'config', 'config_fraud_detection', '0', 0),
(3637, 0, 'config', 'config_mail_alert', '', 0),
(3636, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(3635, 0, 'config', 'config_mail_smtp_port', '25', 0),
(3634, 0, 'config', 'config_mail_smtp_password', '', 0),
(3633, 0, 'config', 'config_mail_smtp_username', '', 0),
(3632, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(3631, 0, 'config', 'config_mail_parameter', '', 0),
(3630, 0, 'config', 'config_mail_protocol', 'mail', 0),
(3629, 0, 'config', 'config_ftp_status', '0', 0),
(3628, 0, 'config', 'config_ftp_root', '', 0),
(3627, 0, 'config', 'config_ftp_password', '', 0),
(3626, 0, 'config', 'config_ftp_username', '', 0),
(3625, 0, 'config', 'config_ftp_port', '21', 0),
(3624, 0, 'config', 'config_ftp_hostname', 'shoppingmart.lcl', 0),
(3623, 0, 'config', 'config_image_location_height', '50', 0),
(3622, 0, 'config', 'config_image_location_width', '268', 0),
(3621, 0, 'config', 'config_image_cart_height', '47', 0),
(3620, 0, 'config', 'config_image_cart_width', '47', 0),
(3619, 0, 'config', 'config_image_wishlist_height', '47', 0),
(3618, 0, 'config', 'config_image_wishlist_width', '47', 0),
(3617, 0, 'config', 'config_image_compare_height', '90', 0),
(3616, 0, 'config', 'config_image_compare_width', '90', 0),
(3615, 0, 'config', 'config_image_related_height', '488', 0),
(3614, 0, 'config', 'config_image_related_width', '400', 0),
(3613, 0, 'config', 'config_image_additional_height', '74', 0),
(3612, 0, 'config', 'config_image_additional_width', '74', 0),
(3611, 0, 'config', 'config_image_product_height', '228', 0),
(3610, 0, 'config', 'config_image_product_width', '228', 0),
(3609, 0, 'config', 'config_image_popup_height', '500', 0),
(3608, 0, 'config', 'config_image_popup_width', '500', 0),
(3607, 0, 'config', 'config_image_thumb_height', '488', 0),
(3606, 0, 'config', 'config_image_thumb_width', '400', 0),
(3605, 0, 'config', 'config_image_category_height', '14', 0),
(3604, 0, 'config', 'config_image_category_width', '16', 0),
(3603, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(3602, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(3601, 0, 'config', 'config_return_status_id', '2', 0),
(3600, 0, 'config', 'config_return_id', '0', 0),
(3599, 0, 'config', 'config_affiliate_mail', '0', 0),
(3598, 0, 'config', 'config_affiliate_id', '4', 0),
(3597, 0, 'config', 'config_affiliate_commission', '5', 0),
(3596, 0, 'config', 'config_affiliate_auto', '0', 0),
(2650, 2, 'config', 'config_image_wishlist_height', '50', 0),
(2652, 2, 'config', 'config_image_cart_height', '80', 0),
(2816, 0, 'msconf', 'msconf_product_validation', '1', 0),
(2815, 0, 'msconf', 'msconf_credit_order_statuses', 'a:1:{i:0;s:1:"5";}', 1),
(2814, 0, 'msconf', 'msconf_debit_order_statuses', 'a:1:{i:0;s:1:"8";}', 1),
(2651, 2, 'config', 'config_image_cart_width', '80', 0),
(2813, 0, 'msconf', 'msconf_display_order_statuses', 'a:14:{i:0;s:1:"7";i:1;s:1:"9";i:2;s:2:"13";i:3;s:1:"5";i:4;s:1:"8";i:5;s:2:"14";i:6;s:2:"10";i:7;s:1:"1";i:8;s:2:"15";i:9;s:1:"2";i:10;s:2:"11";i:11;s:2:"12";i:12;s:1:"3";i:13;s:2:"16";}', 1),
(2812, 0, 'msconf', 'msconf_minimum_withdrawal_amount', '50', 0),
(2811, 0, 'msconf', 'msconf_paypal_sandbox', '1', 0),
(2810, 0, 'msconf', 'msconf_allow_partial_withdrawal', '1', 0),
(2809, 0, 'msconf', 'msconf_paypal_address', '', 0),
(2807, 0, 'msconf', 'msconf_allowed_image_types', 'png,jpg,jpeg', 0),
(2808, 0, 'msconf', 'msconf_allow_withdrawal_requests', '1', 0),
(2806, 0, 'msconf', 'msconf_allowed_download_types', 'zip,rar,pdf', 0),
(2805, 0, 'msconf', 'msconf_minimum_product_price', '0', 0),
(2803, 0, 'msconf', 'msconf_notification_email', '', 0),
(2804, 0, 'msconf', 'msconf_maximum_product_price', '0', 0),
(2800, 0, 'msconf', 'msconf_images_limits', 'a:2:{i:0;s:1:"0";i:1;s:1:"0";}', 1),
(2801, 0, 'msconf', 'msconf_allow_multiple_categories', '0', 0),
(2802, 0, 'msconf', 'msconf_allow_free_products', '0', 0),
(2799, 0, 'msconf', 'msconf_product_included_fields', 'a:0:{}', 1),
(2798, 0, 'msconf', 'msconf_restrict_categories', 'a:0:{}', 1),
(2797, 0, 'msconf', 'msconf_additional_category_restrictions', '0', 0),
(2796, 0, 'msconf', 'msconf_enable_shipping', '0', 0),
(2795, 0, 'msconf', 'msconf_downloads_limits', 'a:2:{i:0;s:1:"0";i:1;s:1:"0";}', 1),
(2793, 0, 'msconf', 'msconf_enable_quantities', '0', 0),
(2794, 0, 'msconf', 'msconf_provide_buyerinfo', '0', 0),
(2792, 0, 'msconf', 'msconf_enable_categories', '0', 0),
(2791, 0, 'msconf', 'msconf_physical_product_categories', 'a:0:{}', 1),
(2790, 0, 'msconf', 'msconf_digital_product_categories', 'a:0:{}', 1),
(2788, 0, 'msconf', 'msconf_allow_relisting', '0', 0),
(2789, 0, 'msconf', 'msconf_disable_product_after_quantity_depleted', '0', 0),
(2787, 0, 'msconf', 'msconf_enable_seo_urls_seller', '1', 0),
(2785, 0, 'msconf', 'msconf_enable_update_seo_urls', '0', 0),
(2786, 0, 'msconf', 'msconf_enable_seo_urls_product', '1', 0),
(2784, 0, 'msconf', 'msconf_enable_non_alphanumeric_seo', '0', 0),
(2783, 0, 'msconf', 'msconf_product_image_path', 'sellers/', 0),
(2782, 0, 'msconf', 'msconf_predefined_avatars_path', 'avatars/', 0),
(2781, 0, 'msconf', 'msconf_temp_image_path', 'tmp/', 0),
(2780, 0, 'msconf', 'msconf_temp_download_path', 'tmp/', 0),
(2779, 0, 'msconf', 'msconf_default_seller_group_id', '1', 0),
(2778, 0, 'msconf', 'msconf_seller_terms_page', '0', 0),
(2777, 0, 'msconf', 'msconf_withdrawal_waiting_period', '0', 0),
(2776, 0, 'msconf', 'msconf_allow_discounts', '1', 0),
(2775, 0, 'msconf', 'msconf_allow_specials', '1', 0),
(2774, 0, 'msconf', 'msconf_enable_rte', '0', 0),
(2773, 0, 'msconf', 'msconf_graphical_sellermenu', '1', 0),
(2772, 0, 'msconf', 'msconf_enable_seller_banner', '1', 0),
(2771, 0, 'msconf', 'msconf_rte_whitelist', '', 0),
(2770, 0, 'msconf', 'msconf_seller_avatar_seller_profile_image_width', '100', 0),
(2769, 0, 'msconf', 'msconf_seller_avatar_seller_profile_image_height', '100', 0),
(2768, 0, 'msconf', 'msconf_seller_avatar_seller_list_image_width', '228', 0),
(2767, 0, 'msconf', 'msconf_seller_avatar_seller_list_image_height', '228', 0),
(2766, 0, 'msconf', 'msconf_seller_avatar_product_page_image_width', '100', 0),
(2765, 0, 'msconf', 'msconf_seller_avatar_dashboard_image_width', '100', 0),
(2764, 0, 'msconf', 'msconf_seller_avatar_product_page_image_height', '100', 0),
(2763, 0, 'msconf', 'msconf_seller_avatar_dashboard_image_height', '100', 0),
(2762, 0, 'msconf', 'msconf_preview_seller_avatar_image_width', '100', 0),
(403, 0, 'webrotate360', 'webrotate360_skinCSS', 'round', 0),
(404, 0, 'webrotate360', 'webrotate360_prettyPhotoSkin', 'light_rounded', 0),
(402, 0, 'webrotate360', 'webrotate360_configFileURL', '', 0),
(400, 0, 'webrotate360', 'webrotate360_viewerInPopup', 'on', 0),
(401, 0, 'webrotate360', 'webrotate360_baseWidth', '', 0),
(399, 0, 'webrotate360', 'webrotate360_viewerHeight', '400px', 0),
(398, 0, 'webrotate360', 'webrotate360_viewerWidth', '550px', 0),
(397, 0, 'webrotate360', 'webrotate360_divID', '#wr360embed', 0),
(396, 0, 'webrotate360', 'webrotate360_status', '1', 0),
(405, 0, 'webrotate360', 'webrotate360_licensePath', '', 0),
(2649, 2, 'config', 'config_image_wishlist_width', '50', 0),
(2648, 2, 'config', 'config_image_compare_height', '90', 0),
(2647, 2, 'config', 'config_image_compare_width', '90', 0),
(2646, 2, 'config', 'config_image_related_height', '80', 0),
(2645, 2, 'config', 'config_image_related_width', '80', 0),
(2644, 2, 'config', 'config_image_additional_height', '74', 0),
(2643, 2, 'config', 'config_image_additional_width', '74', 0),
(2642, 2, 'config', 'config_image_product_height', '80', 0),
(2641, 2, 'config', 'config_image_product_width', '80', 0),
(2640, 2, 'config', 'config_image_popup_height', '500', 0),
(2639, 2, 'config', 'config_image_popup_width', '500', 0),
(2638, 2, 'config', 'config_image_thumb_height', '228', 0),
(2637, 2, 'config', 'config_image_thumb_width', '228', 0),
(2636, 2, 'config', 'config_image_category_height', '80', 0),
(2634, 2, 'config', 'config_icon', '', 0),
(2635, 2, 'config', 'config_image_category_width', '80', 0),
(2633, 2, 'config', 'config_logo', '', 0),
(2632, 2, 'config', 'config_stock_checkout', '0', 0),
(2631, 2, 'config', 'config_stock_display', '0', 0),
(2630, 2, 'config', 'config_order_status_id', '7', 0),
(2629, 2, 'config', 'config_checkout_id', '0', 0),
(2628, 2, 'config', 'config_checkout_guest', '0', 0),
(2627, 2, 'config', 'config_cart_weight', '0', 0),
(2626, 2, 'config', 'config_account_id', '0', 0),
(2625, 2, 'config', 'config_customer_price', '0', 0),
(2624, 2, 'config', 'config_customer_group_id', '1', 0),
(2623, 2, 'config', 'config_tax_customer', '', 0),
(2622, 2, 'config', 'config_tax_default', '', 0),
(2621, 2, 'config', 'config_tax', '0', 0),
(2620, 2, 'config', 'config_product_description_length', '100', 0),
(2619, 2, 'config', 'config_product_limit', '15', 0),
(2618, 2, 'config', 'config_currency', 'USD', 0),
(2617, 2, 'config', 'config_language', 'en', 0),
(2616, 2, 'config', 'config_zone_id', '17', 0),
(2615, 2, 'config', 'config_country_id', '1', 0),
(2614, 2, 'config', 'config_layout_id', '20', 0),
(2612, 2, 'config', 'config_meta_keyword', '', 0),
(2613, 2, 'config', 'config_template', 'electronics', 0),
(2611, 2, 'config', 'config_meta_description', '', 0),
(2610, 2, 'config', 'config_meta_title', 'Electronics', 0),
(2609, 2, 'config', 'config_comment', '', 0),
(2608, 2, 'config', 'config_open', '', 0),
(2607, 2, 'config', 'config_image', '', 0),
(2606, 2, 'config', 'config_fax', '', 0),
(2604, 2, 'config', 'config_email', 'austin.almeida@msourceone.com', 0),
(2605, 2, 'config', 'config_telephone', '1234567890', 0),
(2603, 2, 'config', 'config_geocode', '', 0),
(1049, 0, 'category', 'category_status', '1', 0),
(1051, 0, 'price_slider', 'price_slider_status', '1', 0),
(2761, 0, 'msconf', 'msconf_preview_seller_avatar_image_height', '100', 0),
(2760, 0, 'msconf', 'msconf_preview_product_image_width', '100', 0),
(2759, 0, 'msconf', 'msconf_preview_product_image_height', '100', 0),
(2758, 0, 'msconf', 'msconf_product_seller_profile_image_width', '100', 0),
(2757, 0, 'msconf', 'msconf_product_seller_profile_image_height', '100', 0),
(2756, 0, 'msconf', 'msconf_product_seller_products_image_height', '100', 0),
(2755, 0, 'msconf', 'msconf_product_seller_product_list_seller_area_image_width', '40', 0),
(2754, 0, 'msconf', 'msconf_product_seller_products_image_width', '100', 0),
(2753, 0, 'msconf', 'msconf_product_seller_product_list_seller_area_image_height', '40', 0),
(2752, 0, 'msconf', 'msconf_product_seller_banner_width', '750', 0),
(2751, 0, 'msconf', 'msconf_product_seller_banner_height', '100', 0),
(2750, 0, 'msconf', 'msconf_min_uploaded_image_height', '0', 0),
(2744, 0, 'msconf', 'msconf_hide_emails_in_emails', '0', 0),
(2745, 0, 'msconf', 'msconf_attribute_display', '1', 0),
(2746, 0, 'msconf', 'msconf_sellers_slug', 'sellers', 0),
(2747, 0, 'msconf', 'msconf_max_uploaded_image_height', '0', 0),
(2748, 0, 'msconf', 'msconf_max_uploaded_image_width', '0', 0),
(2749, 0, 'msconf', 'msconf_min_uploaded_image_width', '0', 0),
(2743, 0, 'msconf', 'msconf_hide_customer_email', '0', 0),
(2742, 0, 'msconf', 'msconf_hide_sellers_product_count', '1', 0),
(2741, 0, 'msconf', 'msconf_avatars_for_sellers', '0', 0),
(2740, 0, 'msconf', 'msconf_change_seller_nickname', '1', 0),
(2739, 0, 'msconf', 'msconf_enable_private_messaging', '2', 0),
(2738, 0, 'msconf', 'msconf_enable_one_page_seller_registration', '0', 0),
(961, 0, 'filter', 'filter_status', '1', 0),
(3595, 0, 'config', 'config_affiliate_approval', '0', 0),
(3594, 0, 'config', 'config_stock_checkout', '0', 0),
(3592, 0, 'config', 'config_stock_display', '0', 0),
(3593, 0, 'config', 'config_stock_warning', '0', 0),
(3591, 0, 'config', 'config_order_mail', '0', 0),
(3590, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1),
(3589, 0, 'config', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1),
(3588, 0, 'config', 'config_order_status_id', '1', 0),
(3587, 0, 'config', 'config_checkout_id', '5', 0),
(3586, 0, 'config', 'config_checkout_guest', '1', 0),
(3585, 0, 'config', 'config_cart_weight', '1', 0),
(3584, 0, 'config', 'config_api_id', '1', 0),
(3583, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(3582, 0, 'config', 'config_account_mail', '0', 0),
(3577, 0, 'config', 'config_customer_group_id', '1', 0),
(3578, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(3579, 0, 'config', 'config_customer_price', '0', 0),
(3580, 0, 'config', 'config_login_attempts', '5', 0),
(3581, 0, 'config', 'config_account_id', '3', 0),
(3576, 0, 'config', 'config_customer_online', '0', 0),
(3575, 0, 'config', 'config_tax_customer', 'shipping', 0),
(3574, 0, 'config', 'config_tax_default', 'shipping', 0),
(3573, 0, 'config', 'config_tax', '1', 0),
(3572, 0, 'config', 'config_voucher_max', '1000', 0),
(3571, 0, 'config', 'config_voucher_min', '1', 0),
(3570, 0, 'config', 'config_review_mail', '0', 0),
(3569, 0, 'config', 'config_review_guest', '1', 0),
(3567, 0, 'config', 'config_limit_admin', '20', 0),
(3568, 0, 'config', 'config_review_status', '1', 0),
(3566, 0, 'config', 'config_product_description_length', '100', 0),
(3565, 0, 'config', 'config_product_limit', '15', 0),
(3564, 0, 'config', 'config_product_count', '1', 0),
(3563, 0, 'config', 'config_weight_class_id', '1', 0),
(3562, 0, 'config', 'config_length_class_id', '1', 0),
(3559, 0, 'config', 'config_admin_language', 'en', 0),
(3560, 0, 'config', 'config_currency', 'USD', 0),
(3561, 0, 'config', 'config_currency_auto', '1', 0),
(3558, 0, 'config', 'config_language', 'en', 0),
(3557, 0, 'config', 'config_zone_id', '17', 0),
(3556, 0, 'config', 'config_country_id', '1', 0),
(3555, 0, 'config', 'config_layout_id', '4', 0),
(3554, 0, 'config', 'config_template', 'default', 0),
(3551, 0, 'config', 'config_meta_title', 'Your Store', 0),
(2602, 2, 'config', 'config_address', 'Source One', 0),
(2601, 2, 'config', 'config_owner', 'Source One', 0),
(2600, 2, 'config', 'config_name', 'Shopping Mart', 0),
(2599, 2, 'config', 'config_ssl', '', 0),
(2598, 2, 'config', 'config_url', 'http://electronics.shoppingmart.lcl/', 0),
(3553, 0, 'config', 'config_meta_keyword', '', 0),
(3552, 0, 'config', 'config_meta_description', 'My Store', 0),
(3550, 0, 'config', 'config_comment', '', 0),
(3549, 0, 'config', 'config_open', '', 0),
(3548, 0, 'config', 'config_image', '', 0),
(3547, 0, 'config', 'config_fax', '', 0),
(3546, 0, 'config', 'config_telephone', '123456789', 0),
(3545, 0, 'config', 'config_email', 'jayaprakasha@msourceone.com', 0),
(3544, 0, 'config', 'config_geocode', '', 0),
(3543, 0, 'config', 'config_address', 'Address 1', 0),
(3542, 0, 'config', 'config_owner', 'Your Name', 0),
(2593, 3, 'config', 'config_image_cart_width', '80', 0),
(2592, 3, 'config', 'config_image_wishlist_height', '50', 0),
(2591, 3, 'config', 'config_image_wishlist_width', '50', 0),
(2590, 3, 'config', 'config_image_compare_height', '90', 0),
(2588, 3, 'config', 'config_image_related_height', '80', 0),
(2589, 3, 'config', 'config_image_compare_width', '90', 0),
(2587, 3, 'config', 'config_image_related_width', '80', 0),
(2586, 3, 'config', 'config_image_additional_height', '74', 0),
(2585, 3, 'config', 'config_image_additional_width', '74', 0),
(2584, 3, 'config', 'config_image_product_height', '80', 0),
(2583, 3, 'config', 'config_image_product_width', '80', 0),
(2582, 3, 'config', 'config_image_popup_height', '500', 0),
(2581, 3, 'config', 'config_image_popup_width', '500', 0),
(2580, 3, 'config', 'config_image_thumb_height', '228', 0),
(2579, 3, 'config', 'config_image_thumb_width', '228', 0),
(2578, 3, 'config', 'config_image_category_height', '80', 0),
(2577, 3, 'config', 'config_image_category_width', '80', 0),
(2576, 3, 'config', 'config_icon', '', 0),
(2575, 3, 'config', 'config_logo', 'catalog/27517442.cms.jpg', 0),
(2574, 3, 'config', 'config_stock_checkout', '0', 0),
(2573, 3, 'config', 'config_stock_display', '0', 0),
(2571, 3, 'config', 'config_checkout_id', '0', 0),
(2572, 3, 'config', 'config_order_status_id', '7', 0),
(2570, 3, 'config', 'config_checkout_guest', '0', 0),
(2569, 3, 'config', 'config_cart_weight', '0', 0),
(2568, 3, 'config', 'config_account_id', '0', 0),
(2567, 3, 'config', 'config_customer_price', '0', 0),
(2565, 3, 'config', 'config_tax_customer', '', 0),
(2566, 3, 'config', 'config_customer_group_id', '1', 0),
(2564, 3, 'config', 'config_tax_default', '', 0),
(2563, 3, 'config', 'config_tax', '0', 0),
(2562, 3, 'config', 'config_product_description_length', '100', 0),
(2561, 3, 'config', 'config_product_limit', '15', 0),
(2560, 3, 'config', 'config_currency', 'USD', 0),
(2559, 3, 'config', 'config_language', 'en', 0),
(2557, 3, 'config', 'config_country_id', '1', 0),
(2558, 3, 'config', 'config_zone_id', '17', 0),
(2555, 3, 'config', 'config_template', 'electronics', 0),
(2556, 3, 'config', 'config_layout_id', '4', 0),
(2553, 3, 'config', 'config_meta_description', '', 0),
(2554, 3, 'config', 'config_meta_keyword', '', 0),
(2552, 3, 'config', 'config_meta_title', 'Fashion Big Bazar', 0),
(2551, 3, 'config', 'config_comment', '', 0),
(2550, 3, 'config', 'config_open', '', 0),
(2549, 3, 'config', 'config_image', '', 0),
(2548, 3, 'config', 'config_fax', '', 0),
(2547, 3, 'config', 'config_telephone', '1234567890', 0),
(2546, 3, 'config', 'config_email', 'fbb@demo.com', 0),
(2545, 3, 'config', 'config_geocode', '', 0),
(2544, 3, 'config', 'config_address', 'Fashion Big Bazar', 0),
(2543, 3, 'config', 'config_owner', 'Fashion Big Bazar', 0),
(2542, 3, 'config', 'config_name', 'Fashion Big Bazar', 0),
(2541, 3, 'config', 'config_ssl', '', 0),
(2540, 3, 'config', 'config_url', 'http://fbb.shoppingmart.lcl/', 0),
(2594, 3, 'config', 'config_image_cart_height', '80', 0),
(2595, 3, 'config', 'config_image_location_width', '240', 0),
(2596, 3, 'config', 'config_image_location_height', '180', 0),
(2597, 3, 'config', 'config_secure', '0', 0),
(2818, 0, 'msconf', 'msconf_nickname_rules', '0', 0),
(2819, 0, 'msconf', 'msconf_seller_validation', '1', 0),
(3541, 0, 'config', 'config_name', 'Shopping Mart', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_status`
--

CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `name`, `url`, `ssl`) VALUES
(2, 'Shopping Mart', 'http://electronics.shoppingmart.lcl/', ''),
(3, 'Fashion Big Bazar', 'http://fbb.shoppingmart.lcl/', '');

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate`
--

CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `tax_rate`
--

INSERT INTO `tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax_rate_to_customer_group`
--

INSERT INTO `tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_rule`
--

CREATE TABLE IF NOT EXISTS `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `tax_rule`
--

INSERT INTO `tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE IF NOT EXISTS `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`upload_id`, `name`, `filename`, `code`, `date_added`) VALUES
(1, 'addons.jpg', 'addons.jpg.079cf9bf0974305fd8e5ff1f87cbe064', 'c5e1b2e9552a38c86bcae729b80ff942b4be8ce4', '2015-05-27 15:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=934 ;

--
-- Dumping data for table `url_alias`
--

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(925, 'product_id=48', 'ipod-classic'),
(882, 'category_id=20', 'desktops'),
(884, 'category_id=26', 'pc'),
(883, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(931, 'product_id=42', 'test'),
(922, 'category_id=34', 'mp3-players'),
(893, 'seller_id=4', '66'),
(878, 'category_id=18', 'laptop-notebook'),
(879, 'category_id=46', 'macs'),
(880, 'category_id=45', 'windows'),
(894, 'category_id=25', 'component'),
(876, 'category_id=29', 'mouse'),
(877, 'category_id=28', 'monitor'),
(782, 'category_id=30', 'printer'),
(783, 'category_id=31', 'scanner'),
(784, 'category_id=32', 'web-camera'),
(917, 'category_id=57', 'tablet'),
(786, 'category_id=17', 'software'),
(787, 'category_id=24', 'smartphone'),
(788, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(912, 'category_id=72', ''),
(911, 'category_id=71', ''),
(910, 'category_id=70', ''),
(909, 'category_id=69', ''),
(908, 'category_id=68', ''),
(907, 'category_id=67', ''),
(906, 'category_id=66', ''),
(905, 'category_id=65', ''),
(904, 'category_id=64', ''),
(903, 'category_id=63', ''),
(902, 'category_id=62', ''),
(930, 'product_id=30', 'canon-eos-5d'),
(932, 'product_id=47', 'hp-lp3065'),
(864, 'seller_id=1', '65'),
(885, 'product_id=43', 'macbook'),
(886, 'product_id=44', 'macbook-air'),
(887, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(920, 'product_id=29', 'palm-treo-pro'),
(933, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(918, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(823, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(845, 'seller_id=3', '67'),
(891, 'category_id=59', ''),
(892, 'category_id=60', ''),
(896, 'seller_id=0', 'fbb'),
(897, 'seller_id=0', 'fbbb'),
(898, 'seller_id=0', 'fashion'),
(899, 'seller_id=8', 'fashion1'),
(900, 'category_id=61', 'electronics'),
(913, 'category_id=73', ''),
(914, 'category_id=74', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '2130b016c8590d219f44b64e36ba6be249ea5111', '662e1b02c', 'John', 'Doe', 'jayaprakasha@msourceone.com', '', '', '127.0.0.1', 1, '2015-05-23 09:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', 'a:2:{s:6:"access";a:199:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:13:"design/banner";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:19:"extension/installer";i:20;s:22:"extension/modification";i:21;s:16:"extension/module";i:22;s:17:"extension/openbay";i:23;s:17:"extension/payment";i:24;s:18:"extension/shipping";i:25;s:15:"extension/total";i:26;s:16:"feed/google_base";i:27;s:19:"feed/google_sitemap";i:28;s:15:"feed/openbaypro";i:29;s:17:"localisation/city";i:30;s:20:"localisation/country";i:31;s:21:"localisation/currency";i:32;s:21:"localisation/geo_zone";i:33;s:21:"localisation/language";i:34;s:25:"localisation/length_class";i:35;s:21:"localisation/location";i:36;s:25:"localisation/order_status";i:37;s:26:"localisation/return_action";i:38;s:26:"localisation/return_reason";i:39;s:26:"localisation/return_status";i:40;s:25:"localisation/stock_status";i:41;s:22:"localisation/tax_class";i:42;s:21:"localisation/tax_rate";i:43;s:25:"localisation/weight_class";i:44;s:17:"localisation/zone";i:45;s:19:"marketing/affiliate";i:46;s:17:"marketing/contact";i:47;s:16:"marketing/coupon";i:48;s:19:"marketing/marketing";i:49;s:21:"master/master_product";i:50;s:14:"module/account";i:51;s:16:"module/affiliate";i:52;s:20:"module/amazon_button";i:53;s:13:"module/banner";i:54;s:17:"module/bestseller";i:55;s:15:"module/carousel";i:56;s:15:"module/category";i:57;s:15:"module/featured";i:58;s:13:"module/filter";i:59;s:22:"module/google_hangouts";i:60;s:11:"module/html";i:61;s:18:"module/information";i:62;s:13:"module/latest";i:63;s:18:"module/multiseller";i:64;s:16:"module/pp_button";i:65;s:15:"module/pp_login";i:66;s:19:"module/price_slider";i:67;s:16:"module/slideshow";i:68;s:14:"module/special";i:69;s:12:"module/store";i:70;s:19:"module/webrotate360";i:71;s:21:"multiseller/attribute";i:72;s:16:"multiseller/base";i:73;s:21:"multiseller/dashboard";i:74;s:19:"multiseller/payment";i:75;s:19:"multiseller/product";i:76;s:24:"multiseller/seller-group";i:77;s:18:"multiseller/seller";i:78;s:23:"multiseller/transaction";i:79;s:14:"openbay/amazon";i:80;s:22:"openbay/amazon_listing";i:81;s:22:"openbay/amazon_product";i:82;s:16:"openbay/amazonus";i:83;s:24:"openbay/amazonus_listing";i:84;s:24:"openbay/amazonus_product";i:85;s:12:"openbay/ebay";i:86;s:20:"openbay/ebay_profile";i:87;s:21:"openbay/ebay_template";i:88;s:12:"openbay/etsy";i:89;s:20:"openbay/etsy_product";i:90;s:21:"openbay/etsy_shipping";i:91;s:17:"openbay/etsy_shop";i:92;s:23:"payment/amazon_checkout";i:93;s:24:"payment/authorizenet_aim";i:94;s:24:"payment/authorizenet_sim";i:95;s:21:"payment/bank_transfer";i:96;s:22:"payment/bluepay_hosted";i:97;s:24:"payment/bluepay_redirect";i:98;s:14:"payment/cheque";i:99;s:11:"payment/cod";i:100;s:17:"payment/firstdata";i:101;s:24:"payment/firstdata_remote";i:102;s:21:"payment/free_checkout";i:103;s:22:"payment/klarna_account";i:104;s:22:"payment/klarna_invoice";i:105;s:14:"payment/liqpay";i:106;s:14:"payment/nochex";i:107;s:15:"payment/paymate";i:108;s:16:"payment/paypoint";i:109;s:13:"payment/payza";i:110;s:26:"payment/perpetual_payments";i:111;s:18:"payment/pp_express";i:112;s:18:"payment/pp_payflow";i:113;s:25:"payment/pp_payflow_iframe";i:114;s:14:"payment/pp_pro";i:115;s:21:"payment/pp_pro_iframe";i:116;s:19:"payment/pp_standard";i:117;s:14:"payment/realex";i:118;s:21:"payment/realex_remote";i:119;s:22:"payment/sagepay_direct";i:120;s:22:"payment/sagepay_server";i:121;s:18:"payment/sagepay_us";i:122;s:24:"payment/securetrading_pp";i:123;s:24:"payment/securetrading_ws";i:124;s:14:"payment/skrill";i:125;s:19:"payment/twocheckout";i:126;s:28:"payment/web_payment_software";i:127;s:16:"payment/worldpay";i:128;s:16:"report/affiliate";i:129;s:25:"report/affiliate_activity";i:130;s:22:"report/affiliate_login";i:131;s:24:"report/customer_activity";i:132;s:22:"report/customer_credit";i:133;s:21:"report/customer_login";i:134;s:22:"report/customer_online";i:135;s:21:"report/customer_order";i:136;s:22:"report/customer_reward";i:137;s:16:"report/marketing";i:138;s:24:"report/product_purchased";i:139;s:21:"report/product_viewed";i:140;s:18:"report/sale_coupon";i:141;s:17:"report/sale_order";i:142;s:18:"report/sale_return";i:143;s:20:"report/sale_shipping";i:144;s:15:"report/sale_tax";i:145;s:17:"sale/custom_field";i:146;s:13:"sale/customer";i:147;s:20:"sale/customer_ban_ip";i:148;s:19:"sale/customer_group";i:149;s:10:"sale/order";i:150;s:14:"sale/recurring";i:151;s:11:"sale/return";i:152;s:12:"sale/voucher";i:153;s:18:"sale/voucher_theme";i:154;s:15:"setting/setting";i:155;s:13:"setting/store";i:156;s:16:"shipping/auspost";i:157;s:17:"shipping/citylink";i:158;s:14:"shipping/fedex";i:159;s:13:"shipping/flat";i:160;s:13:"shipping/free";i:161;s:13:"shipping/item";i:162;s:23:"shipping/parcelforce_48";i:163;s:15:"shipping/pickup";i:164;s:19:"shipping/royal_mail";i:165;s:12:"shipping/ups";i:166;s:13:"shipping/usps";i:167;s:15:"shipping/weight";i:168;s:11:"tool/backup";i:169;s:14:"tool/error_log";i:170;s:11:"tool/upload";i:171;s:12:"total/coupon";i:172;s:12:"total/credit";i:173;s:14:"total/handling";i:174;s:16:"total/klarna_fee";i:175;s:19:"total/low_order_fee";i:176;s:12:"total/reward";i:177;s:14:"total/shipping";i:178;s:15:"total/sub_total";i:179;s:9:"total/tax";i:180;s:11:"total/total";i:181;s:13:"total/voucher";i:182;s:8:"user/api";i:183;s:9:"user/user";i:184;s:20:"user/user_permission";i:185;s:14:"module/sellers";i:186;s:14:"module/sellers";i:187;s:18:"module/multiseller";i:188;s:16:"multiseller/base";i:189;s:19:"multiseller/product";i:190;s:21:"multiseller/attribute";i:191;s:19:"multiseller/payment";i:192;s:18:"multiseller/seller";i:193;s:23:"multiseller/transaction";i:194;s:21:"multiseller/dashboard";i:195;s:24:"multiseller/seller-group";i:196;s:16:"module/home_tabs";i:197;s:20:"module/home_category";i:198;s:20:"module/home_category";}s:6:"modify";a:199:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:13:"design/banner";i:17;s:13:"design/layout";i:18;s:14:"extension/feed";i:19;s:19:"extension/installer";i:20;s:22:"extension/modification";i:21;s:16:"extension/module";i:22;s:17:"extension/openbay";i:23;s:17:"extension/payment";i:24;s:18:"extension/shipping";i:25;s:15:"extension/total";i:26;s:16:"feed/google_base";i:27;s:19:"feed/google_sitemap";i:28;s:15:"feed/openbaypro";i:29;s:17:"localisation/city";i:30;s:20:"localisation/country";i:31;s:21:"localisation/currency";i:32;s:21:"localisation/geo_zone";i:33;s:21:"localisation/language";i:34;s:25:"localisation/length_class";i:35;s:21:"localisation/location";i:36;s:25:"localisation/order_status";i:37;s:26:"localisation/return_action";i:38;s:26:"localisation/return_reason";i:39;s:26:"localisation/return_status";i:40;s:25:"localisation/stock_status";i:41;s:22:"localisation/tax_class";i:42;s:21:"localisation/tax_rate";i:43;s:25:"localisation/weight_class";i:44;s:17:"localisation/zone";i:45;s:19:"marketing/affiliate";i:46;s:17:"marketing/contact";i:47;s:16:"marketing/coupon";i:48;s:19:"marketing/marketing";i:49;s:21:"master/master_product";i:50;s:14:"module/account";i:51;s:16:"module/affiliate";i:52;s:20:"module/amazon_button";i:53;s:13:"module/banner";i:54;s:17:"module/bestseller";i:55;s:15:"module/carousel";i:56;s:15:"module/category";i:57;s:15:"module/featured";i:58;s:13:"module/filter";i:59;s:22:"module/google_hangouts";i:60;s:11:"module/html";i:61;s:18:"module/information";i:62;s:13:"module/latest";i:63;s:18:"module/multiseller";i:64;s:16:"module/pp_button";i:65;s:15:"module/pp_login";i:66;s:19:"module/price_slider";i:67;s:16:"module/slideshow";i:68;s:14:"module/special";i:69;s:12:"module/store";i:70;s:19:"module/webrotate360";i:71;s:21:"multiseller/attribute";i:72;s:16:"multiseller/base";i:73;s:21:"multiseller/dashboard";i:74;s:19:"multiseller/payment";i:75;s:19:"multiseller/product";i:76;s:24:"multiseller/seller-group";i:77;s:18:"multiseller/seller";i:78;s:23:"multiseller/transaction";i:79;s:14:"openbay/amazon";i:80;s:22:"openbay/amazon_listing";i:81;s:22:"openbay/amazon_product";i:82;s:16:"openbay/amazonus";i:83;s:24:"openbay/amazonus_listing";i:84;s:24:"openbay/amazonus_product";i:85;s:12:"openbay/ebay";i:86;s:20:"openbay/ebay_profile";i:87;s:21:"openbay/ebay_template";i:88;s:12:"openbay/etsy";i:89;s:20:"openbay/etsy_product";i:90;s:21:"openbay/etsy_shipping";i:91;s:17:"openbay/etsy_shop";i:92;s:23:"payment/amazon_checkout";i:93;s:24:"payment/authorizenet_aim";i:94;s:24:"payment/authorizenet_sim";i:95;s:21:"payment/bank_transfer";i:96;s:22:"payment/bluepay_hosted";i:97;s:24:"payment/bluepay_redirect";i:98;s:14:"payment/cheque";i:99;s:11:"payment/cod";i:100;s:17:"payment/firstdata";i:101;s:24:"payment/firstdata_remote";i:102;s:21:"payment/free_checkout";i:103;s:22:"payment/klarna_account";i:104;s:22:"payment/klarna_invoice";i:105;s:14:"payment/liqpay";i:106;s:14:"payment/nochex";i:107;s:15:"payment/paymate";i:108;s:16:"payment/paypoint";i:109;s:13:"payment/payza";i:110;s:26:"payment/perpetual_payments";i:111;s:18:"payment/pp_express";i:112;s:18:"payment/pp_payflow";i:113;s:25:"payment/pp_payflow_iframe";i:114;s:14:"payment/pp_pro";i:115;s:21:"payment/pp_pro_iframe";i:116;s:19:"payment/pp_standard";i:117;s:14:"payment/realex";i:118;s:21:"payment/realex_remote";i:119;s:22:"payment/sagepay_direct";i:120;s:22:"payment/sagepay_server";i:121;s:18:"payment/sagepay_us";i:122;s:24:"payment/securetrading_pp";i:123;s:24:"payment/securetrading_ws";i:124;s:14:"payment/skrill";i:125;s:19:"payment/twocheckout";i:126;s:28:"payment/web_payment_software";i:127;s:16:"payment/worldpay";i:128;s:16:"report/affiliate";i:129;s:25:"report/affiliate_activity";i:130;s:22:"report/affiliate_login";i:131;s:24:"report/customer_activity";i:132;s:22:"report/customer_credit";i:133;s:21:"report/customer_login";i:134;s:22:"report/customer_online";i:135;s:21:"report/customer_order";i:136;s:22:"report/customer_reward";i:137;s:16:"report/marketing";i:138;s:24:"report/product_purchased";i:139;s:21:"report/product_viewed";i:140;s:18:"report/sale_coupon";i:141;s:17:"report/sale_order";i:142;s:18:"report/sale_return";i:143;s:20:"report/sale_shipping";i:144;s:15:"report/sale_tax";i:145;s:17:"sale/custom_field";i:146;s:13:"sale/customer";i:147;s:20:"sale/customer_ban_ip";i:148;s:19:"sale/customer_group";i:149;s:10:"sale/order";i:150;s:14:"sale/recurring";i:151;s:11:"sale/return";i:152;s:12:"sale/voucher";i:153;s:18:"sale/voucher_theme";i:154;s:15:"setting/setting";i:155;s:13:"setting/store";i:156;s:16:"shipping/auspost";i:157;s:17:"shipping/citylink";i:158;s:14:"shipping/fedex";i:159;s:13:"shipping/flat";i:160;s:13:"shipping/free";i:161;s:13:"shipping/item";i:162;s:23:"shipping/parcelforce_48";i:163;s:15:"shipping/pickup";i:164;s:19:"shipping/royal_mail";i:165;s:12:"shipping/ups";i:166;s:13:"shipping/usps";i:167;s:15:"shipping/weight";i:168;s:11:"tool/backup";i:169;s:14:"tool/error_log";i:170;s:11:"tool/upload";i:171;s:12:"total/coupon";i:172;s:12:"total/credit";i:173;s:14:"total/handling";i:174;s:16:"total/klarna_fee";i:175;s:19:"total/low_order_fee";i:176;s:12:"total/reward";i:177;s:14:"total/shipping";i:178;s:15:"total/sub_total";i:179;s:9:"total/tax";i:180;s:11:"total/total";i:181;s:13:"total/voucher";i:182;s:8:"user/api";i:183;s:9:"user/user";i:184;s:20:"user/user_permission";i:185;s:14:"module/sellers";i:186;s:14:"module/sellers";i:187;s:18:"module/multiseller";i:188;s:16:"multiseller/base";i:189;s:19:"multiseller/product";i:190;s:21:"multiseller/attribute";i:191;s:19:"multiseller/payment";i:192;s:18:"multiseller/seller";i:193;s:23:"multiseller/transaction";i:194;s:21:"multiseller/dashboard";i:195;s:24:"multiseller/seller-group";i:196;s:16:"module/home_tabs";i:197;s:20:"module/home_category";i:198;s:20:"module/home_category";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_history`
--

CREATE TABLE IF NOT EXISTS `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_theme`
--

CREATE TABLE IF NOT EXISTS `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `voucher_theme`
--

INSERT INTO `voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `voucher_theme_description`
--

INSERT INTO `voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `weight_class`
--

CREATE TABLE IF NOT EXISTS `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `weight_class`
--

INSERT INTO `weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `weight_class_description`
--

CREATE TABLE IF NOT EXISTS `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `weight_class_description`
--

INSERT INTO `weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `wr360product`
--

CREATE TABLE IF NOT EXISTS `wr360product` (
  `product_id` int(11) NOT NULL,
  `root_path` varchar(255) DEFAULT NULL,
  `config_file_url` varchar(255) DEFAULT NULL,
  `wr360_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wr360product`
--

INSERT INTO `wr360product` (`product_id`, `root_path`, `config_file_url`, `wr360_enabled`) VALUES
(40, '', '/360assets/sampleshoe/config.xml', 1),
(50, '', '/360assets/sampleshoe/config.xml', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Andaman and Nicobar Islands', 'AN', 1),
(2, 1, 'Andhra Pradesh', 'AP', 1),
(3, 1, 'Arunachal Pradesh', 'AR', 1),
(4, 1, 'Assam', 'AS', 1),
(5, 1, 'Bihar', 'BR', 1),
(6, 1, 'Chandigarh', 'CH', 1),
(7, 1, 'Chhattisgarh', 'CT', 1),
(8, 1, 'Dadra and Nagar Haveli', 'DN', 1),
(9, 1, 'Daman and Diu', 'DD', 1),
(10, 1, 'Delhi', 'DH', 1),
(11, 1, 'Goa', 'GA', 1),
(12, 1, 'Gujarat', 'GJ', 1),
(13, 1, 'Haryana', 'HR', 1),
(14, 1, 'Himachal Pradesh', 'HP', 1),
(15, 1, 'Jammu and Kashmir', 'JK', 1),
(16, 1, 'Jharkhand', 'JH', 1),
(17, 1, 'Karnataka', 'KA', 1),
(18, 1, 'Kerala', 'KL', 1),
(19, 1, 'Lakshadweep', 'LD', 1),
(20, 1, 'Madhya Pradesh', 'MP', 1),
(21, 1, 'Maharashtra', 'MH', 1),
(22, 1, 'Manipur', 'MN', 1),
(23, 1, 'Meghalaya', 'ML', 1),
(24, 1, 'Mizoram', 'MZ', 1),
(25, 1, 'Nagaland', 'NL', 1),
(26, 1, 'Odisha', 'OR', 1),
(27, 1, 'Puducherry', 'PY', 1),
(28, 1, 'Punjab', 'PB', 1),
(29, 1, 'Rajasthan', 'RJ', 1),
(30, 1, 'Sikkim', 'SK', 1),
(31, 1, 'Tamil Nadu', 'TN', 1),
(32, 1, 'Telangana', 'TG', 1),
(33, 1, 'Tripura', 'TR', 1),
(34, 1, 'Uttar Pradesh', 'UP', 1),
(35, 1, 'Uttarakhand', 'UT', 1),
(36, 1, 'West Bengal', 'WB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `zone_to_geo_zone`
--

INSERT INTO `zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 99, 0, 5, '2015-05-27 11:53:33', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
