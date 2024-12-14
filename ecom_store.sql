-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 09 ديسمبر 2024 الساعة 23:20
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
-- بنية الجدول `about_us`
--

CREATE TABLE `about_us` (
  `about_id` int(10) NOT NULL,
  `about_heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `about_short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `about_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `about_us`
--

INSERT INTO `about_us` (`about_id`, `about_heading`, `about_short_desc`, `about_desc`) VALUES
(1, 'About Us', '<h2 style=\"text-align: center; \"><span style=\"font-family: \" arial=\"\" black\";\"=\"\"><b>artistic talents of people with special needs</b></span></h2><h2 style=\"text-align: center; \"><span style=\"font-family: \" arial=\"\" black\";\"=\"\"><b><br></b></span></h2><h6 style=\"text-align: center; \"><font face=\"Impact\"><span style=\"font-family: Arial; font-weight: normal;\"><br></span></font></h6><h6 style=\"text-align: center; \"><font face=\"Impact\"><span style=\"font-family: Arial; font-weight: normal;\">We are a team of ambitious developers who saw the need for an online platform that empowers and supports the artistic talents of people with special needs. Based on our belief in the capabilities of these creative artists, we created this website to be a comprehensive platform to display and sell their artwork.</span></font></h6>', '<h2> </h2><h2 style=\"text-align: center; \"><span style=\"font-family: \"Arial Black\";\">Id</span><span style=\"font-family: \"Arial Black\";\">ea</span></h2><p>The idea for this project began when we noticed the social and economic challenges that people with disabilities face in expressing their artistic creativity and obtaining meaningful job opportunities. Therefore, we decided to use our technical skills to develop a solution that contributes to empowering these artists and enhancing their integration into society.</p><p><br></p><h3><span style=\"font-family: \" comic=\"\" sans=\"\" ms\";\"=\"\">Working Team:</span></h3><p>The working team consists of a group of young developers and designers who believe in the power of art as a means of self-expression and achieving independence. We are committed to providing an inclusive and accessible digital platform for all artists with special needs to display and sell their artwork with pride and confidence.</p><p><br></p><h3><span style=\"font-family: \" comic=\"\" sans=\"\" ms\";\"=\"\">Achievements and Impact:</span></h3><p>Since the launch of the website, many creative artists have been able to display and sell their artwork, which has contributed to improving their living conditions and boosting their self-confidence.  We have also contributed to raising community awareness of the capabilities of these artists and providing them with appropriate opportunities.</p>');

-- --------------------------------------------------------

--
-- بنية الجدول `admins`
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
-- إرجاع أو استيراد بيانات الجدول `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_contact`, `admin_country`, `admin_job`, `admin_about`) VALUES
(13, 'alanoud', 'alanoud@gmail.com', '123456', '360_F_626509838_53EvnKybkJ3LAoJQea7pKf3Hhxh35eAi.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(15, 'Rima', 'rima@gmail.com', '123456', '177646.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(16, 'Reem', 'reem@gmail.com', '123456', 'images.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(17, 'Raneem', 'Raneem@gmail.com', '123456', '7M.jpg', '96655555555', 'Saudi Arabia', 'Devloper', 'devloper'),
(18, 'amal', 'amal32@gmail.com', 'Amal123@', 'photo_2024-12-03_19-54-00.jpg', '0501969267', 'المملكة العربية السعودية', 'artist', 'artist');

-- --------------------------------------------------------

--
-- بنية الجدول `artwork`
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
-- إرجاع أو استيراد بيانات الجدول `artwork`
--

INSERT INTO `artwork` (`product_id`, `cat_id`, `add_date`, `product_title`, `product_img1`, `product_price`, `product_psp_price`, `product_desc`, `product_keywords`, `product_label`, `status`, `customer_id`) VALUES
(74, 16, '2024-11-25 04:21:12', 'Wings of Resilience', 'WhatsApp Image 2024-11-24 at 8.38.39 PM.jpeg', 100, 98, '<p>This image features an abstract composition created with washes of black and gray ink, forming soft, organic shapes that blend and bleed into one another on a textured surface. The effect resembles shadows, mist, or even figures emerging from a hazy background, inviting viewers to interpret forms and shapes as they wish. The fluidity and varying opacity of the ink create a sense of depth and movement, as if capturing a fleeting, almost ghostly moment.</p>', 'Ethereal Abstraction', 'New', '1', 10006),
(75, 16, '2024-11-25 04:21:18', 'Beyond Limits', 'WhatsApp Image 2024-11-24 at 8.38.38 PM (1).jpeg', 110, 101, '<p>This artwork features a split scene with two figures, both with blue hair, possibly representing the same person at different points in time. On the left, the figure sits introspectively with a sheet of paper labeled \"THEME: Disability,\" using their foot to hold a pencil, symbolizing adaptability and resilience. This figure wears a school uniform with a green skirt, white top, and a yellow hair accessory.&lt;/p&gt;&lt;p&gt;On the right, an older version of the character stands confidently in dark, stylish clothing and uses a brush and palette to paint a colorful canvas labeled \"2030,\" suggesting a vision of hope and creativity for the future. The contrasting styles and tones in each half of the image highlight themes of growth, self-acceptance, and transformation</p>', 'Self-Transformation', 'New', '1', 10007),
(76, 15, '2024-12-04 01:40:48', 'Moonlight from the cave', 'WhatsApp Image 2024-11-24 at 8.38.38 PM.jpeg', 205, 189, '<p>A fantasy painting featuring a cave opening to a moonlit night sky, surrounded by glowing blue butterflies, creating a magical and mysterious atmosphere that sparks imagination and reflection.</p>', 'Ethereal Abstraction', 'New', '1', 10008),
(77, 12, '2024-11-25 04:53:34', 'Whispers in the Mist', 'WhatsApp Image 2024-11-24 at 8.38.37 PM.jpeg', 111, 99, '<p>This image features an abstract composition created with washes of black and gray ink, forming soft, organic shapes that blend and bleed into one another on a textured surface. The effect resembles shadows, mist, or even figures emerging from a hazy background, inviting viewers to interpret forms and shapes as they wish. The fluidity and varying opacity of the ink create a sense of depth and movement, as if capturing a fleeting, almost ghostly moment.</p>', 'Ethereal Abstraction', 'New', '1', 10009),
(78, 13, '2024-12-04 01:50:30', 'Whale Dance', 'WhatsApp Image 2024-12-01 at 2.21.28 AM.jpeg', 90, 88, '<p>A captivating painting that combines sunset colors with the ocean\'s freedom, showcasing a whale\'s tail in a moment of natural beauty.</p>', 'Whale', 'New', '1', 16),
(79, 12, '2024-12-04 01:50:33', 'Wings on the Horizon', 'WhatsApp Image 2024-12-01 at 2.21.37 AM.jpeg', 110, 103, '<p>A mesmerizing painting showing a sky graded with warm sunset colors, adorned with a flock of black birds, capturing a moment of freedom and calm.</p>', 'Birds', 'New', '1', 16),
(80, 16, '2024-12-04 01:50:36', 'Tale of the Sky', 'WhatsApp Image 2024-12-01 at 2.22.06 AM.jpeg', 90, 88, '<p>A famous painting called \"Starry Night\" reflecting a lively and beautiful night sky, with vibrant blue colors and swirling brushstrokes adding a special charm.</p>', 'Night Sky', 'New', '1', 10006),
(81, 12, '2024-12-04 01:56:31', 'Journey through flowers and twigs', 'photo_2024-12-04_06-53-39.jpg', 120, 111, '<p>The painting is combined with industrial nature, passing through the vast experimental train of sun worship, while drawing from it the blue color that forms in amazing likes. The character belonging to South America in North America adds a contemplative dimension to sadness, expressing the state of calm from the midst of sadness.</p>', 'flowers', 'New', '1', 10007),
(82, 12, '2024-12-04 01:50:41', 'Harmony of Elements', 'WhatsApp Image 2024-12-01 at 2.21.52 AM.jpeg', 121, 118, '<p>An innovative geometric design combining palm trees, the moon, the sun, and waves, using warm and bright colors to create a magical balance between nature and geometry.</p>', 'Warm Colors', 'New', '1', 10008),
(83, 15, '2024-12-04 01:30:41', 'Between the Wave and the Sand', 'photo_2024-12-04_05-11-53.jpg', 114, 109, '<p>A human painting in the middle of nature, where a person walks on a beach immersed in its undulating beauty. The brushstroke meter filled with love conveys a sense of spontaneity and simplicity.</p>', 'Wave', 'Sale', '1', 10009),
(84, 12, '2024-12-06 04:54:12', 'Lemon and Crescent Arch', 'photo_2024-12-04_17-55-45.jpg', 144, 150, '<p><b>A painting that combines the beauty of nature and the magic of architecture, showing a stone arch with green branches decorated with lemon fruits hanging from it, with a background of a calm sky decorated with a delicate crescent moon and a warm sunset.</b></p>', 'Crescent', 'New', '1', 10017),
(85, 13, '2024-12-06 05:55:24', 'Waves of Creativity', 'photo_2024-12-06_08-49-04.jpg', 200, 190, '<p><b>The image depicts a small boat floating amidst swirling blue waters. Surrounding the boat are colorful whirlpools that evoke a sense of movement and dynamism. The person in the boat is rowing, symbolizing a personal quest on an inspiring journey. The varied colors reflect a feeling of tranquility and depth, while the swirls create an atmosphere of mystery and creativity.</b></p>', 'Waves', 'Sale', '1', 10017),
(86, 12, '2024-12-07 16:25:55', 'اشراقة الامل', 'photo_2024-12-07_19-22-04.jpg', 140, 100, '<p>لوحة فنية احترافية تجمع بين الألوان الزاهية والأشكال التجريدية، تصور مشهدًا مبهجًا مستوحى من الطبيعة والخيال، مع لمسة إبداعية تعكس براءة الأطفال.</p>', 'الامل', 'New', '1', 10017);

-- --------------------------------------------------------

--
-- بنية الجدول `boxes_section`
--

CREATE TABLE `boxes_section` (
  `box_id` int(10) NOT NULL,
  `box_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `box_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `boxes_section`
--

INSERT INTO `boxes_section` (`box_id`, `box_title`, `box_desc`) VALUES
(4, 'WE LOVE OUR CUSTOMERS', 'Some quick example text to build on the card title and make up the bulk of the card&#039;s content.'),
(5, 'BEST PRICES', 'Some quick example text to build on the card title and make up the bulk of the card&#039;s content.'),
(6, '100% SATISFICTION &amp; GUARENTED', 'Some quick example text to build on the card title and make up the bulk of the card&#039;s content.');

-- --------------------------------------------------------

--
-- بنية الجدول `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qty` int(10) NOT NULL,
  `product_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cat_top` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cat_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(12, 'Paintings', 'Yes', 'image-asset.jpeg'),
(13, 'Drawings', 'Yes', '44.jpg'),
(15, 'Sculptures', 'Yes', 'catimage.jpg'),
(16, 'Applied Arts', 'Yes', 'istockphoto-1892764479-612x612.webp');

-- --------------------------------------------------------

--
-- بنية الجدول `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(10) NOT NULL,
  `contact_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_heading` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `contact_email`, `contact_heading`, `contact_desc`) VALUES
(1, 'devzani.roy11@gmail.com', 'Contact Us ', 'If you have any questions, please feel free to <a href=\"http://localhost/ecommerce/contact.php\" target=\"_blank\">contact us</a>. Our customer service is working for you 24/7');

-- --------------------------------------------------------

--
-- بنية الجدول `coupons`
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
-- إرجاع أو استيراد بيانات الجدول `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(5, 70, 'Wellcome-Gift', '50', 'WELLCOMEGIFT', 100, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `customers`
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
  `is_artist` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `disability_id` int(11) DEFAULT NULL,
  `biography` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `difficulties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `overcame` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `goal` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`, `customer_confirm_code`, `manufacturer_top`, `is_artist`, `disability_id`, `biography`, `difficulties`, `overcame`, `goal`) VALUES
(16, 'Raneem', 'Raneem@gamil.com', 'Raneem66#$', 'Saudi Arabia', 'Riyadh', '+96655555555', '000000', '7M.jpg', '::1', '977968538', 'Yes', '1', 1, '\"I was born in Sana’a in 1990 and have been blind since birth. Despite my disability, I’ve always been passionate about art from a young age. My journey into the world of art began through painting, even though I faced the challenge of having poor vision. I’ve always been inspired by working with colors and shapes, even though I can’t see them. I learned how to use dimensions and patterns based on touch and sensory interaction with materials. I faced many challenges, but art has always been my source of inspiration and strength.\"', '\"I face significant difficulty in mobility due to my motor impairment, and it has been challenging for me to move around in public places and art studios. It was hard to find the right support to access the art materials I needed. However, I never gave up and discovered new ways to cope with the challenges, such as using audio-based painting techniques where I listen to audio guides that help me identify spaces and colors.\"', 'I relied heavily on technology to assist me with mobility and my artistic work, such as using computers and software that support touch. I also benefited from human assistance at times to reach the places I needed to be. Over time, I became more capable of expressing myself through art, despite the difficulty in mobility.\"', '\"My message is that art does not rely on the traditional senses. A person can create and feel through art, even without certain senses. My goal with art is to send a message to the world that a person with disabilities can achieve great things and that disability is not an obstacle to creativity. I want my works to reach a wider audience and inspire others who face similar challenges. My dream is to share my paintings with the world and challenge traditional concepts of art.\"'),
(10006, 'alanoud', 'alanoud@gmail.com', 'Alanoud66#$', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', '360_F_626509838_53EvnKybkJ3LAoJQea7pKf3Hhxh35eAi.jpg', '::1', '767699624', 'Yes', '1', 3, '\"I was born in 1985 in Dubai and became paralyzed from the waist down due to a car accident in my early twenties. Art has been my outlet for expression ever since. Despite my disability, I have found a way to work around it by using adaptive tools and a wheelchair-friendly workspace. Art allowed me to continue living with a sense of purpose and creativity, which I never thought I could experience again after the accident. I started with sculpture and later moved to painting, finding joy in expressing my emotions through abstract art.\"', '\"The greatest challenge I face is mobility. Accessing public spaces and art galleries can be difficult. I also struggle with finding the right equipment for my artistic needs, as not all tools are designed for wheelchair users.\"', '\"I worked hard to create an accessible studio at home. Over the years, I adapted tools to suit my needs, such as a motorized canvas mover. I also found online art communities that provide support and encouragement. Now, I feel empowered by my ability to overcome these challenges.\"', '\"I want my art to speak about resilience. The journey of overcoming obstacles and embracing life after a traumatic event is what I hope my audience feels when viewing my work. My goal is to spread a message of hope and strength through my creations. I dream of showcasing my work in international art galleries and inspiring people who are facing their own challenges.\"'),
(10007, 'Wafaa', 'wafaa@gmail.com', 'Wafaa66#$', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', '71mCIQIobvL._AC_UF894,1000_QL80_.jpg', '::1', '1952939694', 'Yes', '1', 1, '\"I lost my sight at the age of 15 due to a retinal disease. Growing up in a world of darkness, I found solace in sound and touch, which led me to explore music and tactile art forms. Over time, I shifted my focus to painting with textures, learning to identify colors and shapes through feeling and tactile patterns. Art became my language and allowed me to communicate when words alone couldn’t express my thoughts.\"', '\"Being blind, the lack of accessibility to art materials has always been a major challenge. Finding the right tools to work with, such as textured paints or assistive technologies, was not easy.\"', '\"I researched and found specialized tools designed for visually impaired artists. I began using braille to label my colors and create textured surfaces. With the support of a few mentors and friends, I slowly overcame the initial obstacles to my artistic journey.\"', '\"Art is not just something you see, it is something you feel. My message is to challenge the notion that visual impairment hinders creativity. I want my art to show the world that vision goes beyond what is seen with the eyes, and that all forms of creativity are valuable.\"'),
(10008, 'Rima', 'rima@gmail.com', 'Rima66#$', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', '177646.jpg', '::1', '987123820', 'Yes', '1', 3, '\"I grew up in a small town in Riyadh. I’ve been deaf since birth, but I’ve never let it hold me back. I started expressing myself through visual art, mainly painting and digital art, as a way to communicate my feelings and experiences. I believe that art is a universal language that doesn\'t require sound to be understood. Throughout my life, I have faced the challenge of being misunderstood by society, but my work always speaks for itself.\"', '\"The biggest challenge I face is society’s lack of understanding of how a person with a hearing impairment can succeed in the art world. Many people have doubts about my abilities and often question how I can convey emotions through art without the ability to hear music or sounds.\"', '\"I proved myself by working relentlessly and showing my art to the world. My deafness is not a barrier; it is my unique perspective that allows me to create. I have had the privilege of connecting with other deaf artists and joining art exhibitions that support and showcase our work.\"', '\"My goal is to break down the barriers of sound and silence. I want to show the world that hearing is not a requirement to create meaningful art. Through my work, I hope to inspire others with disabilities to pursue their passions and live without limits.\"'),
(10009, 'Reem', 'reem@gmail.com', 'Reem66#$', 'Saudi Arabia', 'almadeena', '96655555555', 'almadeena', 'images.jpg', '::1', '2026392070', 'Yes', '1', 3, '\"I lost my leg in a tragic accident when I was 23. After my amputation, I struggled with depression and a sense of loss, but art helped me cope. I began experimenting with different mediums, from painting to mixed media sculptures, and soon I found healing in expressing my emotions through my work. Today, I use my art to convey stories of strength, recovery, and the beauty of resilience. I believe my work reflects my journey as a survivor and my determination to move forward in life.\"', '\"The physical pain I occasionally experience and adjusting to life with a prosthetic limb have been significant challenges. There are days when I cannot get to the studio as easily, and sometimes my prosthetic causes discomfort when I stand for long periods.\"', '\"I adapted my studio to suit my needs, ensuring everything is within reach so I can continue working even when standing is not an option. I also started incorporating more abstract forms in my work, which reflect the inner struggles I’ve had while overcoming physical barriers.\"', '\"Through my work, I want to show the world that setbacks don’t define us. Life is about how we rise from challenges, and my goal is to inspire others to embrace their struggles and turn them into strength. My dream is to use my art to encourage others who have experienced loss or hardship, showing them that they can create something beautiful out of their own pain.\"'),
(10015, 'Lama_a', 'Lama231@gmail.com', 'Lama444@1', 'المملكة العربية السعودية', 'ALmadinah', '0501969268', 'Azizia', 'photo_2024-12-03_19-54-00.jpg', '::1', '516337533', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10016, 'reem_r', 'reem23@gmail.com', 'Reem44@1', 'المملكة العربية السعودية', 'ALmadinah', '0501969268', 'Azizia', 'photo_2024-12-03_19-54-00.jpg', '::1', '181188231', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10017, 'amal', 'amal32@gmail.com', 'Amal123@', 'المملكة العربية السعودية', 'ALmadinah', '0501969268', 'Azizia', 'photo_2024-12-03_19-54-00.jpg', '::1', '1455641571', 'Yes', '1', 2, ' a deaf artist born without the ability to hear, but that has never stopped me from pursuing my passion for art. Since childhood, I searched for ways to express myself, and when I discovered painting and sculpture, it felt like I had found my own world. I live in a world full of colors and shapes, where I can communicate with others through my paintings, without the need for sound.\r\n', 'The journey wasn’t easy at first; there were many challenges,', 'I learned that art is not just about replicating what we see or hear. For me, art is a way to express my feelings and thoughts—it’s a language that touches hearts and reaches deep into the soul. Every time I place my brushes on the canvas, I feel every part of the world through my hands, translating that into colors that express my silent world.\r\n', '\r\nMy message is that art doesn’t need sound to speak. Anyone can feel and understand it, no matter their disability. Creativity is not limited to the senses; it is an inner strength that allows us to express ourselves and connect with the world in a unique way.'),
(10018, 'محمد', 'ahmed1@gmail.com', 'Ahmed123@', 'المملكة العربية السعودية', 'المدينة المنورة', '0505123569', 'البدراني', 'photo_2024-12-07_16-07-24.jpg', '::1', '751829450', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10019, 'مها', 'maha12@gmail.com', 'Maha123@', 'المملكة العربية السعودية', 'المدينة المنورة', '0505123567', 'البدراني', 'photo_2024-12-07_16-07-12.jpg', '::1', '923959717', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10020, 'sara', 'sara14@gmail.com', 'Sara23@', 'المملكة العربية السعودية', 'ينبع', '0500209930', 'العزيزيهٍ', 'صورة واتساب بتاريخ 1446-06-03 في 21.42.24_48ff36fc.jpg', '::1', '1530420266', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10021, 'ali', 'ali99@gmail.com', 'al223344@', 'المملكة العربية السعودية', 'ينبع', '0500209930', 'العزيزيهٍ', 'صورة واتساب بتاريخ 1446-06-03 في 21.42.24_48ff36fc.jpg', '::1', '1302144371', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10022, 'Razan', 'Razan22@gmail.com', 'Razan12', 'المملكة العربية السعودية', 'ينبع', '0500209930', 'العزيزيهٍ', 'أجمل_اللوحات_الفنية.jpg', '::1', '130243737', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10023, 'Razan', 'Razan222@gmail.com', 'Razan@22', 'المملكة العربية السعودية', 'ينبع', '0500209930', 'العزيزيهٍ', 'أجمل_اللوحات_الفنية.jpg', '::1', '593615474', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10024, 'RazanAL', 'Razan123123@gmail.com', 'Razan@2331', 'المملكة العربية السعودية', 'ينبع', '0500209930', 'العزيزيهٍ', 'أجمل_اللوحات_الفنية.jpg', '::1', '972459897', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10025, 'Raneem2331', 'Raneem2331@gamil.com', 'Raneem@2331', 'المملكة العربية السعودية', 'ينبع', '0500209930', 'العزيزيهٍ', 'أجمل_اللوحات_الفنية.jpg', '::1', '1539919821', 'No', '0', NULL, NULL, NULL, NULL, NULL),
(10026, 'Lama', 'Lama@gmail.com', 'Lama@12', 'المملكة العربية السعودية', 'ينبع', '0500209930', 'العزيزيهٍ', 'أجمل_اللوحات_الفنية.jpg', '::1', '450908928', 'No', '0', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `disability`
--

CREATE TABLE `disability` (
  `disability_id` int(10) NOT NULL,
  `disability_type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `disability`
--

INSERT INTO `disability` (`disability_id`, `disability_type`) VALUES
(1, 'Visual Impairment (Blindness)'),
(2, 'Hearing Impairment (Deafness)'),
(3, 'Physical Disability (Paralysis, Amputation)'),
(4, 'Intellectual Disability'),
(5, 'Learning Disability (e.g., Dyslexia)'),
(6, 'Speech or Language Disability'),
(7, 'Mental Health Condition'),
(8, 'Autism Spectrum Disorder'),
(9, 'Chronic Illness or Medical Condition');

-- --------------------------------------------------------

--
-- بنية الجدول `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `enquiry_id` int(10) NOT NULL,
  `enquiry_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `enquiry_type`
--

INSERT INTO `enquiry_type` (`enquiry_id`, `enquiry_title`) VALUES
(1, 'Order Support'),
(2, 'Technical Supports'),
(3, 'Price Concern'),
(4, 'Delivery Problems');

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
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
-- إرجاع أو استيراد بيانات الجدول `orders`
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
(35, 10006, 111, 240532040, 1, '2024-11-25 05:11:10', 'Complete'),
(36, 10015, 109, 848669580, 1, '2024-12-05 14:30:50', 'Complete'),
(37, 10015, 121, 848669580, 1, '2024-12-04 01:15:51', 'pending'),
(38, 10015, 90, 848669580, 1, '2024-12-04 01:15:51', 'pending'),
(39, 10015, 205, 848669580, 1, '2024-12-04 01:15:51', 'pending'),
(40, 10019, 110, 1433345462, 1, '2024-12-07 13:55:34', 'pending'),
(41, 10019, 363, 1433345462, 3, '2024-12-07 13:55:34', 'pending'),
(42, 10018, 144, 1933729610, 1, '2024-12-07 16:06:17', 'Complete'),
(43, 10008, 140, 1023235922, 1, '2024-12-08 07:07:48', 'Complete'),
(44, 10020, 190, 1721748522, 1, '2024-12-08 08:25:38', 'Complete');

-- --------------------------------------------------------

--
-- بنية الجدول `payments`
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
-- إرجاع أو استيراد بيانات الجدول `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(12, 226260289, 154, 'Easy Paisa', 4, 111, '2024-11-14'),
(13, 531988902, 597, 'Easy Paisa', 1111111, 111, '2024-11-14'),
(14, 1308051552, 150, 'Uestern Union', 222, 222, '2024-11-14'),
(15, 499754472, 205, 'Easy Paisa', 1111, 2222, '2024-11-25'),
(16, 1451628959, 111, 'Easy Paisa', 1111, 2222, '2024-11-25'),
(17, 968813089, 110, 'Easy Paisa', 1111, 2222, '2024-11-25'),
(18, 240532040, 111, 'Easy Paisa', 111, 2222, '2024-11-25'),
(19, 848669580, 109, 'Bank Code', 0, 332, '2024-12-11'),
(20, 1933729610, 144, 'Bank Code', 3, 332, '2024-12-07'),
(21, 968813089, 110, 'Choose...', 1, 321, '2024-12-08'),
(22, 1023235922, 140, 'Bank Code', 2147483647, 441, '2024-12-08'),
(23, 1721748522, 190, 'Bank Code', 667832, 144, '2024-12-08');

-- --------------------------------------------------------

--
-- بنية الجدول `pending_orders`
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
-- إرجاع أو استيراد بيانات الجدول `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `order_status`) VALUES
(23, 16, 531988902, 61, 3, 'pending'),
(26, 16, 949045744, 61, 1, 'pending'),
(31, 10009, 499754472, 76, 1, 'pending'),
(32, 10007, 1451628959, 77, 1, 'pending'),
(33, 10008, 968813089, 75, 1, 'pending'),
(34, 10006, 240532040, 77, 1, 'Complete'),
(35, 10015, 848669580, 83, 1, 'pending'),
(36, 10015, 848669580, 82, 1, 'Complete'),
(37, 10015, 848669580, 78, 1, 'pending'),
(38, 10015, 848669580, 76, 1, 'pending'),
(39, 10019, 1433345462, 79, 1, 'pending'),
(40, 10019, 1433345462, 82, 3, 'pending'),
(41, 10018, 1933729610, 84, 1, 'pending'),
(42, 10008, 1023235922, 86, 1, 'pending'),
(43, 10020, 1721748522, 85, 1, 'pending');

-- --------------------------------------------------------

--
-- بنية الجدول `services`
--

CREATE TABLE `services` (
  `service_id` int(10) NOT NULL,
  `service_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `services`
--

INSERT INTO `services` (`service_id`, `service_title`, `service_desc`, `service_image`) VALUES
(16, 'Promotion and Marketing of Artwork', '<h4 class=\"card-title\" style=\"font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(51, 51, 51); text-align: justify;\"><span style=\"font-size: 1rem;\">Recognizing the value of exposure, this service promotes artists’ work to a broad online audience. Once an artist uploads their work, the platform facilitates digital marketing, connecting artists with potential buyers, fans, and art enthusiasts. Artists’ work can be showcased through curated collections, featured artist spots, or themed exhibitions, enhancing visibility and appeal. The platform also integrates social media sharing options, allowing artists to promote their work across various channels with a single click. Additionally, promotional tools such as tags, keywords, and SEO enhancements help each piece reach relevant audiences, helping artists build an online presence and gain recognition in the art community.</span></h4>', 'Promotion and Marketing of Artwork.png');

-- --------------------------------------------------------

--
-- بنية الجدول `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slide_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slide_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slide_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_title`, `slide_text`) VALUES
(22, '.', 'WhatsApp Image 2024-11-15 at 2.21.45 AM.jpeg', 'Welcome to our platform for artists with disabilities.', '   We offer you a unique platform to enable artists with disabilities to showcase their artistic creations and sell them directly. We are here to support your artistic talents.'),
(23, 'Talent Without Limits', 'Picture3.png', 'Supporting the Art of People of Determination', 'B ecause talent knows no limits,\r\n we support the art of people of determination.'),
(24, 'The Story of Creativity', 'Picture5.png', 'Art Tells Unique Stories', 'We believe that every person\r\n has a unique story to tell through art.');

-- --------------------------------------------------------

--
-- بنية الجدول `tblcomments`
--

CREATE TABLE `tblcomments` (
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `postId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblcomments`
--

INSERT INTO `tblcomments` (`name`, `email`, `comment`, `postingDate`, `status`, `id`, `postId`) VALUES
('reem_r', 'reem23@gmail.com', 'لوحه رائعه استمري في ابداعك ', '2024-12-05 01:38:44', 1, 8, 83),
('Lama_a', 'Lama231@gmail.com', 'لوحه جميله ومعبره ', '2024-12-05 01:53:03', 1, 9, 81),
('Lama', 'Lama231@gmail.com', 'Very beautiful drawing', '2024-12-06 14:14:07', 1, 10, 77),
('محمد', 'ahmed1@gmail.com', 'A special painting and its colors are wonderful', '2024-12-07 11:15:34', 1, 11, 82);

-- --------------------------------------------------------

--
-- بنية الجدول `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `product_id`) VALUES
(3, 4, 13),
(4, 10000, 68),
(5, 10008, 77),
(6, 10015, 82),
(7, 10016, 79),
(8, 10017, 84),
(9, 10018, 85),
(10, 10020, 85);

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
-- Indexes for table `disability`
--
ALTER TABLE `disability`
  ADD PRIMARY KEY (`disability_id`);

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
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `artwork`
--
ALTER TABLE `artwork`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

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
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10027;

--
-- AUTO_INCREMENT for table `disability`
--
ALTER TABLE `disability`
  MODIFY `disability_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `enquiry_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

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
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `artwork`
--
ALTER TABLE `artwork`
  ADD CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
