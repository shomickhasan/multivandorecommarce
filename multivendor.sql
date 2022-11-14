-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 05:24 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bracket`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 for active 0 for inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `category_des`, `image`, `status`, `created_at`, `updated_at`) VALUES
(13, 'Health & Beauty', 'health-beauty', 'here you can find health and beauty\'s product', '1012008997.png', 1, '2022-10-05 19:24:11', '2022-10-09 19:14:24'),
(14, 'Watches, Bags, Jewellery', 'watches-bags-jewellery', 'Watches, Bags, Jewellerys products', '483891475.png', 1, '2022-10-05 19:26:09', '2022-10-09 19:14:08'),
(12, 'limit 1 to 11 active', 'limit-1-to-11-active', 'Only 1 to 11 serial er  Active Category show korbe', '1606028311.png', 1, '2022-10-05 19:22:04', '2022-10-19 22:28:26'),
(15, 'Men\'s Fashion', 'mens-fashion', 'Men\'s Fashion products', '1341703747.png', 1, '2022-10-05 19:27:35', '2022-10-09 19:13:52'),
(16, 'Babies & Toys', 'babies-toys', 'Babies & Toys products', '861512625.png', 1, '2022-10-05 19:28:39', '2022-10-09 19:13:37'),
(17, 'Electronic Devices', 'electronic-devices', 'Electronic Devices products', '1162838489.png', 1, '2022-10-05 19:30:16', '2022-10-09 19:13:23'),
(18, 'Electronic Accessories', 'electronic-accessories', 'Electronic Accessories products', '564070334.png', 1, '2022-10-05 19:31:50', '2022-10-09 19:13:00'),
(19, 'Groceries & Pets', 'groceries-pets', 'Groceries & Pets products', '1979744505.png', 1, '2022-10-05 19:33:27', '2022-10-09 19:12:48'),
(20, 'Home & Lifestyle', 'home-lifestyle', 'Home & Lifestyle products', '1652723858.png', 1, '2022-10-05 19:49:14', '2022-10-09 19:12:33'),
(21, 'Sports & Outdoor', 'sports-outdoor', 'Sports & Outdoor products', '948212842.png', 1, '2022-10-05 19:50:20', '2022-10-09 19:12:17'),
(22, 'Automotive & Motorbike', 'automotive-motorbike', 'Automotive & Motorbike product', '2047193148.png', 1, '2022-10-05 19:51:32', '2022-10-09 19:12:04'),
(28, 'inactive Category', 'inactive-category', 'inactive  category Home page e Show kore na', '411521925.png', 0, '2022-10-06 19:35:35', '2022-10-09 19:11:45'),
(29, 'Woman Fashion', 'woman-fashion', 'Woman Fashion', '1323945166.png', 1, '2022-10-06 19:37:21', '2022-10-09 19:11:26'),
(30, 'Official Electronics', 'official-electronics', 'Official Electronics', '846910810.png', 1, '2022-10-09 20:13:33', '2022-10-09 20:13:33'),
(31, 'New Arrival Product', 'new-arrival-product', 'Official Electronics', '979798159.png', 1, '2022-10-09 20:13:36', '2022-10-10 20:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `start_at` date NOT NULL,
  `end_at` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 FOR ACTIVE 2 FOR INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `discount_amount`, `vendor_id`, `start_at`, `end_at`, `status`, `created_at`, `updated_at`) VALUES
(7, 'TEST', 320, 1, '2022-10-31', '2022-11-05', 1, '2022-11-06 20:52:54', '2022-11-06 20:52:54'),
(5, 'DIGITAL', 500, 1, '2022-11-07', '2022-11-10', 1, '2022-11-06 20:25:33', '2022-11-06 20:25:33'),
(6, 'BANGLEDESH', 200, 1, '2022-11-07', '2022-11-09', 1, '2022-11-06 20:27:36', '2022-11-06 20:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_09_29_161045_create_sliders_table', 2),
(9, '2022_09_30_115544_create_product_galleries_table', 4),
(10, '2022_10_01_123017_create_sliders_table', 5),
(11, '2022_10_01_124135_create_sliders_table', 6),
(12, '2022_09_29_192934_create_products_table', 3),
(16, '2022_10_03_175319_create_categories_table', 7),
(18, '2022_10_08_101137_create_sub_categories_table', 8),
(19, '2022_10_04_154246_create_coupons_table', 9),
(20, '2022_10_12_170155_create_subscribes_table', 10),
(21, '2022_10_18_191743_create_roles_table', 11),
(22, '2022_10_26_060641_create_settings_table', 12),
(23, '2022_10_26_194801_create_sliders_table', 13),
(24, '2022_10_27_172254_create_wishlists_table', 14),
(25, '2022_10_30_154444_create_orders_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `blnc_transection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 For Active And 0 For Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_code` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` bigint(20) NOT NULL,
  `discount_price` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_id` int(11) NOT NULL,
  `thumbnails` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 For Active 2 For Inactive',
  `short_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `product_code`, `product_name`, `product_slug`, `product_price`, `discount_price`, `quantity`, `cat_id`, `subcat_id`, `thumbnails`, `status`, `short_desc`, `long_desc`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(4, 1, 'Apple-253', 'Apple Watch', 'apple-watch', 40000, 38000, 9652, 14, 2, 'product19b879eb1c759251a0de1a67a2b91536.png', 1, 'Apple Watch Series 7 case Pair any band', '<p><font color=\"#052840\" face=\"Aktiv grotesk, sans-serif\"><span style=\"outline-color: initial; outline-style: initial; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); background-color: rgb(255, 255, 255);\">Apple Watch Series 7 case Pair any band</span></font><br></p>', 2, 2, '2022-10-06 19:43:59', '2022-10-06 20:04:11'),
(3, 1, 'MAC-225', 'Macbook Pro-LITE', 'macbook-pro-lite', 180000, 5000, 100, 17, 6, 'product33a0b751be57c26557732ad6aea44d0b.png', 2, 'It is a long established fact that a reader will be distracted eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate', '<p><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">It is a long established fact that a reader will be distracted eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate</span><br></p>', 2, 2, '2022-10-05 21:14:35', '2022-10-05 22:23:04'),
(5, 1, 'Mac-76546', 'Mac Mini', 'mac-mini', 96320, 50000, 4545, 12, 4, 'product1d20832fbfc8f2586d3109a67a43a0b4.png', 1, 'Apple MacBook Pro13.3″ Laptop with new Touch bar ID', '<p><font color=\"#052840\" face=\"Aktiv grotesk, sans-serif\"><span style=\"outline-color: initial; outline-style: initial; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); background-color: rgb(255, 255, 255);\">Apple MacBook Pro13.3″ Laptop with new Touch bar ID</span><span style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; outline-color: initial; outline-style: initial; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1);\">Apple MacBook Pro13.3″ Laptop with new Touch bar IDApple MacBook Pro13.3″ Laptop with new Touch bar IDApple MacBook Pro13.3″ Laptop with new Touch bar ID</span></font><br></p>', 2, NULL, '2022-10-06 23:48:25', '2022-10-06 23:48:25'),
(6, 1, 'LTE-34', 'CURREN 8109 Watches', 'curren-8109-watches', 560, 150, 5, 12, 4, 'product3b8a0f70e1f8f52af9c74f023a4e4d7c.png', 1, 'It is a long established fact that a reader will be distracted eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate', '<p><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">It is a long established fact that a reader will be distracted eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate</span><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">It&nbsp; is a long established fact that a reader will be distracted eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate</span></p><ul><li><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">AL</span></li><li><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">MA</span></li><li><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">mun</span></li><li><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">la</span></li><li><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">Test</span></li><li><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">what</span></li><li><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\">OK end</span></li></ul><p><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">It is a long established fact that a reader will be distracted eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate</span><span style=\"color: rgb(5, 40, 64); font-family: &quot;Aktiv grotesk&quot;, sans-serif; font-size: 0.875rem;\"><br></span></p>', 2, NULL, '2022-10-07 22:05:21', '2022-10-07 22:05:21'),
(7, 1, 'PD005', 'Macbook Pro', 'macbook-pro', 122500, 500, 10, 17, 11, 'product35d03a441d6f17d4e963d67bc416aed5.png', 1, 'Apple MacBook Pro13.3″ Laptop with Touch ID', '<p><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif; background-color: rgb(255, 255, 255);\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">Apple MacBook Pro13.3″ Laptop with Touch ID</a><br></p>', 2, NULL, '2022-10-17 19:29:43', '2022-10-17 19:29:43'),
(11, 1, '12', 'Watch', 'watch', 1200, 200, 10, 15, 13, 'product0a39bc2374a30ccb9ab7e29f3d5c1bc1.png', 1, 'Men\'s Fashion', 'Fashion', 2, NULL, '2022-10-17 21:11:49', '2022-10-17 21:11:49'),
(9, 1, 'PDL0', 'iPhone 13', 'iphone-13', 50000, 0, 10, 17, 10, 'productf0be39c059b75f82960a40dca45aaeec.png', 1, 'A dramatically more powerful camera system a display', '<p><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif; background-color: rgb(255, 255, 255);\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">A dramatically more powerful camera system a display</a><br></p>', 2, NULL, '2022-10-17 20:08:59', '2022-10-17 20:08:59'),
(10, 1, 'PD33109', 'iPad mini', 'ipad-mini', 60000, 0, 0, 17, 10, 'product83892d9c94f09939c9b8a3121fe87a34.png', 1, 'The ultimate iPad experience all over the world', '<p><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif; background-color: rgb(255, 255, 255);\">The ultimate iPad experience all over the world</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">The ultimate iPad experience all over the world</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">The ultimate iPad experience all over the world</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">The ultimate iPad experience all over the world</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">The ultimate iPad experience all over the world</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">The ultimate iPad experience all over the world</a><a href=\"https://products.wp-ts.com/stowaa/html/shop_list.html#\" style=\"background-color: rgb(255, 255, 255); font-size: 0.875rem; color: rgb(5, 40, 64); outline: 0px; display: inline-block; transition-duration: 0.6s; transition-timing-function: cubic-bezier(0.25, 1, 0.5, 1); font-family: &quot;Aktiv grotesk&quot;, sans-serif;\">The ultimate iPad experience all over the world</a><br></p>', 2, NULL, '2022-10-17 20:12:49', '2022-10-17 20:12:49'),
(12, 1, '13', 'Smart Watch', 'smart-watch', 2200, 200, 10, 15, 13, 'producte72611979dd05a737c8570d98880d675.png', 1, 'Smart Watch', '<p>Smart Watch</p>', 2, NULL, '2022-10-17 21:35:27', '2022-10-17 21:35:27'),
(13, 1, '14', 'Watch', 'watch', 1500, 300, 10, 15, 13, 'product4eb0883e44df79fb08a958fecd1efc8f.png', 1, 'Watch', '<p>Watch</p>', 2, NULL, '2022-10-17 21:37:54', '2022-10-17 21:37:54'),
(14, 1, '15', 'Iphone 13', 'iphone-13', 600, 100, 0, 17, 14, 'productea3887eedd5377e724438098f25afc22.png', 1, 'The ultimate iPad experience all over the world', '<p>Iphone 13<br></p>', 2, 1, '2022-10-17 22:45:08', '2022-10-21 19:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_galleries`
--

CREATE TABLE `product_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_galleries`
--

INSERT INTO `product_galleries` (`id`, `product_code`, `images`, `created_at`, `updated_at`) VALUES
(92, '12', '1332787738.png', '2022-10-17 21:11:50', '2022-10-17 21:11:50'),
(78, 'Mac-76546', '513983118.png', '2022-10-06 23:48:26', '2022-10-06 23:48:26'),
(75, 'Apple-253', '1928407817.jpg', '2022-10-06 20:04:11', '2022-10-06 20:04:11'),
(91, 'PD33109', '1593475377.jpg', '2022-10-17 20:12:49', '2022-10-17 20:12:49'),
(90, 'PD33109', '80236412.jpg', '2022-10-17 20:12:49', '2022-10-17 20:12:49'),
(89, 'PD33109', '1963979761.png', '2022-10-17 20:12:49', '2022-10-17 20:12:49'),
(88, 'PDL0', '1903015289.jpg', '2022-10-17 20:08:59', '2022-10-17 20:08:59'),
(58, 'pro-987756', '848979276.jpg', '2022-10-01 19:38:17', '2022-10-01 19:38:17'),
(87, 'PDL0', '2020037449.jpg', '2022-10-17 20:08:59', '2022-10-17 20:08:59'),
(86, 'PDL0', '883161150.png', '2022-10-17 20:08:59', '2022-10-17 20:08:59'),
(85, 'PD005', '506530138.png', '2022-10-17 19:29:44', '2022-10-17 19:29:44'),
(84, 'PD005', '730709199.png', '2022-10-17 19:29:44', '2022-10-17 19:29:44'),
(82, 'LTE-34', '488729116.png', '2022-10-07 22:05:21', '2022-10-07 22:05:21'),
(59, 'pro-987756', '1971981790.png', '2022-10-01 19:41:17', '2022-10-01 19:41:17'),
(55, 'pro-987756', '930214175.jpg', '2022-10-01 19:38:17', '2022-10-01 19:38:17'),
(81, 'LTE-34', '1809858081.png', '2022-10-07 22:05:21', '2022-10-07 22:05:21'),
(56, 'pro-987756', '1633880478.jpg', '2022-10-01 19:38:17', '2022-10-01 19:38:17'),
(80, 'LTE-34', '611637687.png', '2022-10-07 22:05:21', '2022-10-07 22:05:21'),
(57, 'pro-987756', '1850391974.jpg', '2022-10-01 19:38:17', '2022-10-01 19:38:17'),
(77, 'Mac-76546', '751846045.png', '2022-10-06 23:48:25', '2022-10-06 23:48:25'),
(72, 'Apple-253', '522515082.png', '2022-10-06 19:43:59', '2022-10-06 19:43:59'),
(71, 'Apple-253', '1020354974.png', '2022-10-06 19:43:59', '2022-10-06 19:43:59'),
(83, 'PD005', '1155775194.png', '2022-10-17 19:29:43', '2022-10-17 19:29:43'),
(67, 'MAC-225', '977487255.png', '2022-10-05 21:14:35', '2022-10-05 21:14:35'),
(68, 'MAC-225', '1001279909.png', '2022-10-05 21:14:35', '2022-10-05 21:14:35'),
(69, 'MAC-225', '1519560726.png', '2022-10-05 21:14:36', '2022-10-05 21:14:36'),
(93, '14', '1792090038.png', '2022-10-17 21:37:54', '2022-10-17 21:37:54'),
(94, '15', '1764793952.png', '2022-10-17 22:45:09', '2022-10-17 22:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_comments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_comments`, `role_status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '	\r\nAccess the All Features', 1, '2022-10-20 02:52:04', NULL),
(2, 'User', 'Access Only Profile', 1, '2022-10-20 02:52:29', NULL),
(3, 'Seller', '	\r\nAccess to Seller Dashboard Feature', 1, '2022-10-20 02:52:49', NULL),
(4, 'Vendor', 'Access And Manage Vendor Dashborad\r\n', 1, '2022-10-20 02:53:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_phone`, `pic`, `youtube_link`, `instagram_link`, `twitter_link`, `facebook_link`, `linkedin_link`, `created_at`, `updated_at`) VALUES
(1, 'Karo Cart', '0987654', '1017615833.png', 'www.youtube.com', 'www.instagram.com', 'www.twitter.com', 'www.facebook.com', 'www.linkedin.com', '2022-10-26 10:09:31', '2022-10-26 10:53:11');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_disPrice` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1. for Active 2. for Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `product_name`, `product_category`, `product_price`, `product_disPrice`, `title`, `description`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, '4', 'Alias quia magnam un', 399, 593, 'Est in voluptatem do', 'Et in obcaecati id', '237070109.jpg', 'Aperiam dolor sed te', 1, '2022-10-28 23:41:19', '2022-10-28 23:41:37'),
(3, '12', 'Quaerat ab aliquip p', 562, 884, 'Cumque itaque numqua', 'Nisi repellendus Mo', '2128911809.jpg', 'Dolore adipisci labo', 2, '2022-10-28 23:43:28', '2022-10-28 23:43:28');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribes`
--

INSERT INTO `subscribes` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'shomick2019@gmail.com', '2022-10-12 21:17:31', '2022-10-12 21:17:31'),
(2, 'admin@mail.com', '2022-10-12 21:26:04', '2022-10-12 21:26:04'),
(3, 'hasan@gmail.com', '2022-10-12 21:26:23', '2022-10-12 21:26:23'),
(4, 'proshenjit@gmail.com', '2022-10-12 21:27:03', '2022-10-12 21:27:03'),
(5, 'shomickhasan@gmail.com', '2022-10-12 23:31:40', '2022-10-12 23:31:40'),
(6, 'hovijynot@mailinator.com', '2022-10-13 14:09:53', '2022-10-13 14:09:53'),
(7, 'mamunur5150@gmail.com', '2022-10-13 17:34:39', '2022-10-13 17:34:39'),
(8, 'mostakimemon181@gmail.com', '2022-10-13 21:02:19', '2022-10-13 21:02:19'),
(9, 'dfgghhj@gmail.con', '2022-10-17 22:06:57', '2022-10-17 22:06:57'),
(10, 'admin@gmail.com', '2022-10-19 22:02:06', '2022-10-19 22:02:06'),
(11, 'hddh@gmail.com', '2022-10-21 19:21:50', '2022-10-21 19:21:50'),
(12, 'Grammarly.jersey.addy18@gmail.com', '2022-10-21 20:43:11', '2022-10-21 20:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `sub_name`, `sub_slug`, `sub_image`, `sub_status`, `created_at`, `updated_at`) VALUES
(11, 17, 'Laptop', 'laptop', '1295571843.png', 1, '2022-10-17 19:27:13', '2022-10-17 19:27:13'),
(4, 21, 'Martin Whitfield', 'martin-whitfield', '1084836364.jpg', 2, '2022-10-09 17:10:51', '2022-10-11 23:02:00'),
(13, 15, 'Watch', 'watch', '902427835.png', 1, '2022-10-17 21:10:45', '2022-10-17 21:10:45'),
(14, 17, 'MOBAIl', 'mobail', '1782061007.png', 2, '2022-10-18 09:24:48', '2022-10-18 09:24:48'),
(12, 18, 'Headphone', 'headphone', '548651604.jpg', 1, '2022-10-17 20:02:13', '2022-10-17 20:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_source` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bkash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rocket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nagad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `social_id`, `user_source`, `phone`, `nid`, `role_id`, `photo`, `bkash`, `rocket`, `nagad`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@mail.com', NULL, NULL, '01835061968', '1245878564', 'Admin', NULL, NULL, NULL, NULL, 1, NULL, '$2y$10$sNgWsS1YaXIUsNGLAfFRyeLIUqLVhQTcF/nvUEIP29U5kMDddt6Cm', NULL, '2022-09-27 14:00:00', '2022-09-27 14:00:00'),
(2, 'Vendor', 'vendor@mail.com', NULL, NULL, '01335061968', '7354451481', 'Vendor', NULL, '01835061968', '01835061968', '01835061968', 1, NULL, '$2y$10$sHWL/B1.3XTj6B4VZyECJOS9oBHMwKlU37FN0gE.0aXK5Af3AzMye', NULL, '2022-09-27 14:02:26', '2022-09-27 14:02:26'),
(4, 'User', 'user@mail.com', NULL, NULL, '01335064968', '7354451485', 'User', NULL, '01835061945', '01835061928', '01835064968', 1, '2022-10-20 02:57:07', '$2y$10$sHWL/B1.3XTj6B4VZyECJOS9oBHMwKlU37FN0gE.0aXK5Af3AzMye', NULL, '2022-09-27 14:02:26', '2022-09-27 14:02:26'),
(9, 'Proshenjit Karmakar', 'no1sports.live2@gmail.com', '109808033159279436676', 'Google', NULL, NULL, 'user', NULL, NULL, NULL, NULL, 1, NULL, 'eyJpdiI6IlJqNURJZUU1bHJ3Qk9CZXphbFBLNVE9PSIsInZhbHVlIjoiRUxWNHBLVlRZYng5cis3OWVMbnhCS2IzME9tSEs2eXBVc21PNDFkS09XWT0iLCJtYWMiOiJhMWYxYjk1NmNlYjI5NzZmZmJlOTI5ZjczNTY0ZjkyMTRhZTY3NDU1NmM2ZjBlMTRhMGZkYjI3MjllOTE5MjdmIiwidGFnIjoiIn0=', NULL, '2022-10-26 23:23:52', '2022-10-26 23:23:52'),
(10, 'Sharder Almamoon', 'almamoon602@gmail.com', '111830748910148501281', 'Google', NULL, NULL, 'user', NULL, NULL, NULL, NULL, 1, NULL, 'eyJpdiI6IkJ5MHpzZnpPRGxBNTNmcjl5RU5hVlE9PSIsInZhbHVlIjoibDlNWElkVWo0QW0vZEdSeGpMK2lXRHVyT2dlV3J1Z0dlSnRqT0hXc1pZaz0iLCJtYWMiOiI2OWU1MGY1OWFkMDE0M2U5YjYyZjBiOGI4MzU3Zjg4YzAwYjc3YWExMjhiZWQyZTQwYTM1OGRkOTM3ZTcwNjI0IiwidGFnIjoiIn0=', NULL, '2022-10-28 07:45:38', '2022-10-28 07:45:38');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `pro_id`, `created_at`, `updated_at`) VALUES
(6, 4, 6, '2022-10-27 22:35:59', '2022-10-27 22:35:59'),
(7, 4, 10, '2022-10-27 22:45:48', '2022-10-27 22:45:48'),
(11, 10, 3, '2022-10-28 08:00:46', '2022-10-28 08:00:46'),
(13, 1, 3, '2022-10-30 10:30:08', '2022-10-30 10:30:08'),
(14, 1, 4, '2022-10-30 12:40:49', '2022-10-30 12:40:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_nid_unique` (`nid`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_galleries`
--
ALTER TABLE `product_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
