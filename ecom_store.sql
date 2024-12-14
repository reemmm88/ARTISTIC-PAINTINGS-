-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 06:19 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `about_id` int(10) NOT NULL,
  `about_heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `about_short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `about_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`about_id`, `about_heading`, `about_short_desc`, `about_desc`) VALUES
(1, 'About Us', '<h2 style=\"text-align: center; \"><span style=\"font-family: \" arial=\"\" black\";\"=\"\"><b>artistic talents of people with special needs</b></span></h2><h2 style=\"text-align: center; \"><span style=\"font-family: \" arial=\"\" black\";\"=\"\"><b><br></b></span></h2><h6 style=\"text-align: center; \"><font face=\"Impact\"><span style=\"font-family: Arial; font-weight: normal;\"><br></span></font></h6><h6 style=\"text-align: center; \"><font face=\"Impact\"><span style=\"font-family: Arial; font-weight: normal;\">We are a team of ambitious developers who saw the need for an online platform that empowers and supports the artistic talents of people with special needs. Based on our belief in the capabilities of these creative artists, we created this website to be a comprehensive platform to display and sell their artwork.</span></font></h6>', '<h2> </h2><h2 style=\"text-align: center; \"><span style=\"font-family: \"Arial Black\";\">Id</span><span style=\"font-family: \"Arial Black\";\">ea</span></h2><p>The idea for this project began when we noticed the social and economic challenges that people with disabilities face in expressing their artistic creativity and obtaining meaningful job opportunities. Therefore, we decided to use our technical skills to develop a solution that contributes to empowering these artists and enhancing their integration into society.</p><p><br></p><h3><span style=\"font-family: \" comic=\"\" sans=\"\" ms\";\"=\"\">Working Team:</span></h3><p>The working team consists of a group of young developers and designers who believe in the power of art as a means of self-expression and achieving independence. We are committed to providing an inclusive and accessible digital platform for all artists with special needs to display and sell their artwork with pride and confidence.</p><p><br></p><h3><span style=\"font-family: \" comic=\"\" sans=\"\" ms\";\"=\"\">Achievements and Impact:</span></h3><p>Since the launch of the website, many creative artists have been able to display and sell their artwork, which has contributed to improving their living conditions and boosting their self-confidence.  We have also contributed to raising community awareness of the capabilities of these artists and providing them with appropriate opportunities.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin_about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_contact`, `admin_country`, `admin_job`, `admin_about`) VALUES
(13, 'alanoud', 'alanoud@gmail.com', '123456', '360_F_626509838_53EvnKybkJ3LAoJQea7pKf3Hhxh35eAi.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(14, 'wafaa', 'wafaa@gmail.com', '123456', '71mCIQIobvL._AC_UF894,1000_QL80_.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(15, 'Rima', 'rima@gmail.com', '123456', '177646.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(16, 'Reem', 'reem@gmail.com', '123456', 'images.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(17, 'Raneem', 'Raneem@gmail.com', '123456', '7M.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper');

-- --------------------------------------------------------

--
-- Table structure for table `artwork`
--

CREATE TABLE `artwork` (
  `product_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_img1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_psp_price` int(100) NOT NULL,
  `product_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_keywords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `product_label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `artwork`
--

INSERT INTO `artwork` (`product_id`, `cat_id`, `add_date`, `product_title`, `product_img1`, `product_price`, `product_psp_price`, `product_desc`, `product_keywords`, `product_label`, `status`, `customer_id`) VALUES
(60, 13, '2024-11-15 17:45:40', 'Whispers in the Mist', 'WhatsApp Image 2024-11-15 at 8.51.57 PM.jpeg', 154, 2, '<p>This image features an abstract composition created with washes of black and gray ink, forming soft, organic shapes that blend and bleed into one another on a textured surface. The effect resembles shadows, mist, or even figures emerging from a hazy background, inviting viewers to interpret forms and shapes as they wish. The fluidity and varying opacity of the ink create a sense of depth and movement, as if capturing a fleeting, almost ghostly moment.</p>', 'Ethereal Abstraction', 'New', '1', 16),
(61, 12, '2024-11-19 17:04:04', 'Beyond Limits', 'WhatsApp Image 2024-11-15 at 8.52.22 PM.jpeg', 199, 12, '<p>This artwork features a split scene with two figures, both with blue hair, possibly representing the same person at different points in time. On the left, the figure sits introspectively with a sheet of paper labeled \"THEME: Disability,\" using their foot to hold a pencil, symbolizing adaptability and resilience. This figure wears a school uniform with a green skirt, white top, and a yellow hair accessory.</p><p>On the right, an older version of the character stands confidently in dark, stylish clothing and uses a brush and palette to paint a colorful canvas labeled \"2030,\" suggesting a vision of hope and creativity for the future. The contrasting styles and tones in each half of the image highlight themes of growth, self-acceptance, and transformation</p>', 'Self-Transformation', 'New', '1', 16),
(74, 16, '2024-11-25 04:21:12', 'Wings of Resilience', 'WhatsApp Image 2024-11-24 at 8.38.39 PM.jpeg', 100, 98, '<p>This image features an abstract composition created with washes of black and gray ink, forming soft, organic shapes that blend and bleed into one another on a textured surface. The effect resembles shadows, mist, or even figures emerging from a hazy background, inviting viewers to interpret forms and shapes as they wish. The fluidity and varying opacity of the ink create a sense of depth and movement, as if capturing a fleeting, almost ghostly moment.</p>', 'Ethereal Abstraction', 'New', '1', 10006),
(75, 16, '2024-11-25 04:21:18', 'Beyond Limits', 'WhatsApp Image 2024-11-24 at 8.38.38 PM (1).jpeg', 110, 101, '<p>This artwork features a split scene with two figures, both with blue hair, possibly representing the same person at different points in time. On the left, the figure sits introspectively with a sheet of paper labeled \"THEME: Disability,\" using their foot to hold a pencil, symbolizing adaptability and resilience. This figure wears a school uniform with a green skirt, white top, and a yellow hair accessory.&lt;/p&gt;&lt;p&gt;On the right, an older version of the character stands confidently in dark, stylish clothing and uses a brush and palette to paint a colorful canvas labeled \"2030,\" suggesting a vision of hope and creativity for the future. The contrasting styles and tones in each half of the image highlight themes of growth, self-acceptance, and transformation</p>', 'Self-Transformation', 'New', '1', 10007),
(76, 15, '2024-11-25 04:52:00', 'Wings of Resilience', 'WhatsApp Image 2024-11-24 at 8.38.38 PM.jpeg', 205, 189, '<p>This image features an abstract composition created with washes of black and gray ink, forming soft, organic shapes that blend and bleed into one another on a textured surface. The effect resembles shadows, mist, or even figures emerging from a hazy background, inviting viewers to interpret forms and shapes as they wish. The fluidity and varying opacity of the ink create a sense of depth and movement, as if capturing a fleeting, almost ghostly moment.</p>', 'Ethereal Abstraction', 'New', '1', 10008),
(77, 12, '2024-11-25 04:53:34', 'Whispers in the Mist', 'WhatsApp Image 2024-11-24 at 8.38.37 PM.jpeg', 111, 99, '<p>This image features an abstract composition created with washes of black and gray ink, forming soft, organic shapes that blend and bleed into one another on a textured surface. The effect resembles shadows, mist, or even figures emerging from a hazy background, inviting viewers to interpret forms and shapes as they wish. The fluidity and varying opacity of the ink create a sense of depth and movement, as if capturing a fleeting, almost ghostly moment.</p>', 'Ethereal Abstraction', 'New', '1', 10009);

-- --------------------------------------------------------

--
-- Table structure for table `boxes_section`
--

CREATE TABLE `boxes_section` (
  `box_id` int(10) NOT NULL,
  `box_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `box_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `boxes_section`
--

INSERT INTO `boxes_section` (`box_id`, `box_title`, `box_desc`) VALUES
(4, 'WE LOVE OUR CUSTOMERS', 'Some quick example text to build on the card title and make up the bulk of the card&#039;s content.'),
(5, 'BEST PRICES', 'Some quick example text to build on the card title and make up the bulk of the card&#039;s content.'),
(6, '100% SATISFICTION &amp; GUARENTED', 'Some quick example text to build on the card title and make up the bulk of the card&#039;s content.');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qty` int(10) NOT NULL,
  `product_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cat_top` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cat_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(12, 'Paintings', 'Yes', 'image-asset.jpeg'),
(13, 'Drawings', 'Yes', '44.jpg'),
(15, 'Sculptures', 'Yes', 'catimage.jpg'),
(16, 'Applied Arts', 'Yes', 'istockphoto-1892764479-612x612.webp');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(10) NOT NULL,
  `contact_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `contact_email`, `contact_heading`, `contact_desc`) VALUES
(1, 'devzani.roy11@gmail.com', 'Contact Us ', 'If you have any questions, please feel free to <a href=\"http://localhost/ecommerce/contact.php\" target=\"_blank\">contact us</a>. Our customer service is working for you 24/7');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `coupon_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coupon_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coupon_limit` int(10) NOT NULL,
  `coupon_used` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(5, 70, 'Wellcome-Gift', '50', 'WELLCOMEGIFT', 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_confirm_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manufacturer_top` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_artist` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`, `customer_confirm_code`, `manufacturer_top`, `is_artist`) VALUES
(16, 'Raneem', 'Raneem@gamil.com', '123', 'Saudi Arabia', 'Riyadh', '+96655555555', '000000', '7M.jpg', '::1', '977968538', 'Yes', '1'),
(10006, 'alanoud', 'alanoud@gmail.com', '123456', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', '360_F_626509838_53EvnKybkJ3LAoJQea7pKf3Hhxh35eAi.jpg', '::1', '767699624', 'Yes', '1'),
(10007, 'Wafaa', 'wafaa@gmail.com', '123456', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', '71mCIQIobvL._AC_UF894,1000_QL80_.jpg', '::1', '1952939694', 'Yes', '1'),
(10008, 'Rima', 'rima@gmail.com', '123456', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', '177646.jpg', '::1', '987123820', 'Yes', '1'),
(10009, 'Reem', 'reem@gmail.com', '123456', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', 'images.jpg', '::1', '2026392070', 'Yes', '1');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `enquiry_id` int(10) NOT NULL,
  `enquiry_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `enquiry_type`
--

INSERT INTO `enquiry_type` (`enquiry_id`, `enquiry_title`) VALUES
(1, 'Order Support'),
(2, 'Technical Supports'),
(3, 'Price Concern'),
(4, 'Delivery Problems');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `order_date`, `order_status`) VALUES
(22, 16, 154, 226260289, 1, '2024-11-14 10:03:59', 'Complete'),
(23, 16, 150, 226260289, 1, '2024-11-14 06:38:41', 'pending'),
(24, 16, 597, 531988902, 3, '2024-11-14 10:49:57', 'Complete'),
(25, 16, 300, 531988902, 2, '2024-11-14 08:48:38', 'pending'),
(26, 16, 150, 1308051552, 1, '2024-11-14 10:58:52', 'Complete'),
(27, 16, 199, 949045744, 1, '2024-11-14 19:36:36', 'pending'),
(28, 10002, 120, 1454133467, 1, '2024-11-15 19:26:56', 'pending'),
(29, 10002, 199, 1454133467, 1, '2024-11-15 19:26:56', 'pending'),
(30, 10003, 199, 983781705, 1, '2024-11-15 20:46:43', 'pending'),
(31, 10004, 199, 335507091, 1, '2024-11-16 20:28:14', 'pending'),
(32, 10009, 205, 499754472, 1, '2024-11-25 05:06:51', 'Complete'),
(33, 10007, 111, 1451628959, 1, '2024-11-25 05:08:58', 'Complete'),
(34, 10008, 110, 968813089, 1, '2024-11-25 05:10:06', 'Complete'),
(35, 10006, 111, 240532040, 1, '2024-11-25 05:11:10', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(12, 226260289, 154, 'Easy Paisa', 4, 111, '2024-11-14'),
(13, 531988902, 597, 'Easy Paisa', 1111111, 111, '2024-11-14'),
(14, 1308051552, 150, 'Uestern Union', 222, 222, '2024-11-14'),
(15, 499754472, 205, 'Easy Paisa', 1111, 2222, '2024-11-25'),
(16, 1451628959, 111, 'Easy Paisa', 1111, 2222, '2024-11-25'),
(17, 968813089, 110, 'Easy Paisa', 1111, 2222, '2024-11-25'),
(18, 240532040, 111, 'Easy Paisa', 111, 2222, '2024-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `product_id` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `order_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `order_status`) VALUES
(23, 16, 531988902, 61, 3, 'pending'),
(26, 16, 949045744, 61, 1, 'pending'),
(31, 10009, 499754472, 76, 1, 'pending'),
(32, 10007, 1451628959, 77, 1, 'pending'),
(33, 10008, 968813089, 75, 1, 'pending'),
(34, 10006, 240532040, 77, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(10) NOT NULL,
  `service_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_title`, `service_desc`, `service_image`) VALUES
(14, 'Easy Upload and Display of Artwork', '<h4 class=\"card-title\" style=\"font-family: \"Open Sans\", sans-serif; color: rgb(51, 51, 51); text-align: justify;\"><span style=\"font-size: 1rem;\">The platform is designed with user-friendly features to simplify the process of uploading artwork, making it accessible for artists with varying abilities. The interface is clean and clutter-free, featuring large buttons and intuitive navigation that guides users step-by-step. Artists can quickly upload images of their work, add titles, descriptions, and categorize pieces for optimal presentation. The goal is to provide an experience where artists feel in control and empowered, enabling them to focus on their creativity without technical barriers. Additionally, the platform may include accessibility features such as screen reader compatibility, adjustable font sizes, and color contrasts to cater to different visual and physical needs, ensuring that everyone can participate fully.</span></h4>', 'user-friendly interface for uploading and displaying artwork (2).png'),
(15, 'Technical Support and Personal Training', '<h4 class=\"card-title\" style=\"font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(51, 51, 51); text-align: justify;\"><span style=\"font-size: 1rem;\">Technical support is designed to be both responsive and empathetic, assisting artists with any issues they may encounter, whether related to uploading files, setting up profiles, or managing sales. Personalized training sessions and interactive tutorials help new users navigate the platform effectively. Additionally, educational content on topics such as digital marketing, pricing strategies, and portfolio curation helps artists sharpen their skills. This service aims to empower artists, giving them the knowledge to succeed and grow their online presence confidently. Moreover, specialized support is available for accessibility issues, ensuring that the platform remains inclusive and responsive to the diverse needs of artists with disabilities.</span></h4>', 'Technical Support and Personal Training for artists.png'),
(16, 'Promotion and Marketing of Artwork', '<h4 class=\"card-title\" style=\"font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(51, 51, 51); text-align: justify;\"><span style=\"font-size: 1rem;\">Recognizing the value of exposure, this service promotes artists’ work to a broad online audience. Once an artist uploads their work, the platform facilitates digital marketing, connecting artists with potential buyers, fans, and art enthusiasts. Artists’ work can be showcased through curated collections, featured artist spots, or themed exhibitions, enhancing visibility and appeal. The platform also integrates social media sharing options, allowing artists to promote their work across various channels with a single click. Additionally, promotional tools such as tags, keywords, and SEO enhancements help each piece reach relevant audiences, helping artists build an online presence and gain recognition in the art community.</span></h4>', 'Promotion and Marketing of Artwork.png');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slide_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slide_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slide_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_title`, `slide_text`) VALUES
(22, '.', 'WhatsApp Image 2024-11-15 at 2.21.45 AM.jpeg', 'Welcome to our platform for artists with disabilities.', '  We offer you a unique platform to enable artists with disabilities to showcase their artistic creations and sell them directly. We are here to support your artistic talents.'),
(23, 'Street Vendor in a Wheelchair', 'WhatsApp Image 2024-11-15 at 2.22.34 AM.jpeg', 'A Wheelchair-bound Book Vendor', 'the spirit of resilience and entrepreneurship as a person in a wheelchair sells books on the street. Despite physical challenges, the vendor makes a living through their efforts, showcasing a powerful example of determination and perseverance.'),
(24, 'Monitored Sleeping Area', 'WhatsApp Image 2024-11-15 at 2.43.18 AM.jpeg', 'Place Under Watch', 'makeshift sleeping area for homeless individuals, marked with a sign indicating CCTV surveillance. It highlights the harsh reality of homelessness and the efforts to maintain cleanliness and safety in such spaces. The presence of personal items and framed');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `product_id`) VALUES
(3, 4, 13),
(4, 10000, 68);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `artwork`
--
ALTER TABLE `artwork`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `boxes_section`
--
ALTER TABLE `boxes_section`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `about_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `artwork`
--
ALTER TABLE `artwork`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `boxes_section`
--
ALTER TABLE `boxes_section`
  MODIFY `box_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10010;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `enquiry_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artwork`
--
ALTER TABLE `artwork`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
