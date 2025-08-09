-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 06, 2025 lúc 09:57 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fastfoodwebsitedatabase`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `id_accounts` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('Nam','Nữ','Khác') DEFAULT 'Nam',
  `city` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','staff','shipper','user') NOT NULL DEFAULT 'user',
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `verification_token` varchar(100) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `avatar_url` varchar(255) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id_accounts`, `username`, `password`, `email`, `full_name`, `birthday`, `gender`, `city`, `address`, `role`, `is_active`, `verification_token`, `last_login_at`, `created_at`, `updated_at`, `avatar_url`, `token_expiry`) VALUES
(14, '037124124', '$2y$10$NsvXO2RJ2lohxGaZVyuxDOULD9wg9j7fONye4rvdfOJdyBZN6vltq', 'admin123@gmail.com', 'Phan Hải', NULL, 'Nam', NULL, NULL, 'admin', 1, NULL, '2025-07-31 16:05:14', '2025-07-31 05:29:14', '2025-08-05 02:06:13', '/assets/images/avatar/default-avatar.png', NULL),
(16, '0376149975', '$2y$10$K0tO72VvBFYLecPoIYW1wusq4uyRvjgakiw94DZapHyuy5bCdfO/O', 'phanthanhhai151104@gmail.com', 'Phan Thanh Hải', '0000-00-00', 'Nam', 'Hồ Chí Minh', '', 'user', 1, NULL, '2025-08-06 13:45:14', '2025-07-31 16:54:50', '2025-08-06 13:45:14', '/assets/images/avatar/default-avatar.png', '2025-07-31 16:59:50'),
(17, 'demo_user', 'Admin12345@', 'admin1234@example.com', 'Demo Nguyễn', '2000-01-01', '', 'Hà Nội', '123 Đường ABC, Quận XYZ, Hà Nội', 'admin', 1, '', '2025-08-05 17:21:02', '2025-08-01 00:54:45', '2025-08-05 17:21:02', '/assets/images/avatar/default-avatar.png', '0000-00-00 00:00:00'),
(21, '0275345764', '$2y$10$.lvFZtA5qzCAxLcbYom5We4DZbDMQeGr.P.sBEbMq7FNAuAtTTkoq', 'phanthanhhai1511@gmail.com', 'Thanh Hải', NULL, 'Nam', NULL, NULL, 'user', 1, NULL, NULL, '2025-07-31 20:36:08', '2025-08-05 02:06:45', '/assets/images/avatar/default-avatar.png', NULL),
(22, '0542412152', '$2y$10$LCESUbAHFwakW1KvWMMFuuk6MouTHBKdHTIl6UYxvpNFJXpZJvKcK', 'haunguyen@gmail.com', 'Hau', NULL, 'Nam', NULL, NULL, 'shipper', 1, NULL, NULL, '2025-07-31 20:44:30', '2025-08-05 02:06:55', '/assets/images/avatar/default-avatar.png', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id_cart` int(11) NOT NULL,
  `id_accounts` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `total_quantity` int(11) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `id_cart_items` int(11) NOT NULL,
  `id_products` int(11) DEFAULT NULL,
  `id_cart` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon_image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id_categories`, `name`, `icon_image`, `is_active`) VALUES
(11, 'Combos', 'https://png.pngtree.com/png-vector/20231013/ourmid/pngtree-classic-burger-and-crispy-fries-delicious-combo-png-image_10264629.png', 1),
(12, 'Burgers', 'https://cdn-icons-png.flaticon.com/512/5787/5787016.png', 1),
(13, 'Pizza', 'https://cdn-icons-png.flaticon.com/512/1404/1404945.png', 1),
(14, 'Thức Uống', 'https://cdn-icons-png.freepik.com/512/7254/7254781.png', 1),
(15, 'Tráng Miệng', 'https://cdn-icons-png.flaticon.com/512/5347/5347946.png', 1),
(16, 'Salads', 'https://cdn-icons-png.flaticon.com/512/2515/2515183.png', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery`
--

CREATE TABLE `delivery` (
  `id_delivery` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `delivery_status` enum('pending','shipping','delivered','failed') NOT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery_status_logs`
--

CREATE TABLE `delivery_status_logs` (
  `id_log` int(11) NOT NULL,
  `id_delivery` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `id_accounts` int(11) DEFAULT NULL,
  `status` enum('pending','shipping','delivered','failed') NOT NULL,
  `changed_at` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id_invoice` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `payment_method` enum('cash','credit_card','momo','zalo','banking','visa','cod') NOT NULL,
  `amount_paid` decimal(10,0) NOT NULL,
  `issued_at` datetime NOT NULL,
  `is_paid` enum('paid','unpaid') NOT NULL,
  `earned_points` int(11) DEFAULT NULL,
  `payment_token` varchar(255) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_history`
--

CREATE TABLE `invoice_history` (
  `id_invoice_history` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `membership_levels`
--

CREATE TABLE `membership_levels` (
  `id_level` int(11) NOT NULL,
  `level_name` varchar(100) DEFAULT NULL,
  `min_point` int(11) DEFAULT NULL,
  `discount_rate` decimal(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `membership_levels`
--

INSERT INTO `membership_levels` (`id_level`, `level_name`, `min_point`, `discount_rate`, `note`) VALUES
(1, 'Bạc', 100, 5.00, 'Basic level'),
(2, 'Vàng', 500, 10.00, 'Loyal customer'),
(3, 'Đồng', 0, 0.00, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id_orders` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `total_quantity` int(11) DEFAULT NULL,
  `status` enum('pending','confirmed','delivered','cancelled') DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id_order_items` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status_history`
--

CREATE TABLE `order_status_history` (
  `id_status_history` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `status` enum('pending','confirmed','cooking','delivered','cancelled') NOT NULL,
  `changed_at` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `point_transactions`
--
-- Error reading structure for table fastfoodwebsitedatabase.point_transactions: #1932 - Table 'fastfoodwebsitedatabase.point_transactions' doesn't exist in engine
-- Error reading data for table fastfoodwebsitedatabase.point_transactions: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `fastfoodwebsitedatabase`.`point_transactions`' at line 1

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_products` int(11) NOT NULL,
  `id_categories` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_banner` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_products`, `id_categories`, `name`, `price`, `description`, `is_available`, `created_at`, `updated_at`, `is_banner`) VALUES
(50, 11, 'Combo Burger và Khoai Tây Chiên', 120000, 'Combo burger kèm khoai tây chiên giòn', 1, '2025-08-06 14:31:44', '2025-08-06 14:31:44', 1),
(51, 12, 'Burger Bò', 80000, 'Burger bò truyền thống với phô mai', 1, '2025-08-06 14:31:44', '2025-08-06 14:31:44', 0),
(52, 13, 'Pizza Margherita', 150000, 'Pizza phô mai, cà chua tươi, húng quế', 1, '2025-08-06 14:31:44', '2025-08-06 14:31:44', 1),
(53, 14, 'Coca-Cola', 20000, 'Nước ngọt có gas, chai 330ml', 1, '2025-08-06 14:31:44', '2025-08-06 14:31:44', 0),
(54, 15, 'Bánh Brownie Sô-cô-la', 50000, 'Bánh brownie socola đậm vị', 1, '2025-08-06 14:31:44', '2025-08-06 14:31:44', 0),
(55, 16, 'Salad Caesar', 90000, 'Salad xà lách, phô mai, bánh mì nướng', 1, '2025-08-06 14:31:44', '2025-08-06 14:31:44', 0),
(56, 11, 'Combo Gia đình', 280000, 'Combo dành cho gia đình (2 burger + 2 fries)', 1, '2025-08-06 14:43:42', '2025-08-06 14:43:42', 1),
(57, 12, 'Burger Chay', 95000, 'Burger chay với patty đậu nành và rau củ', 1, '2025-08-06 14:43:42', '2025-08-06 14:43:42', 0),
(58, 13, 'Pizza Gà Nướng BBQ', 170000, 'Pizza gà nướng BBQ, hành tây và phô mai', 1, '2025-08-06 14:43:42', '2025-08-06 14:43:42', 0),
(59, 14, 'Nước Cam Ép', 30000, 'Nước cam ép tươi 300ml', 1, '2025-08-06 14:43:42', '2025-08-06 14:43:42', 0),
(60, 15, 'Kem Sundae', 60000, 'Kem sundae socola, hạt dẻ cười và sốt caramel', 1, '2025-08-06 14:43:42', '2025-08-06 14:43:42', 0),
(61, 16, 'Salad Hy Lạp', 95000, 'Salad kiểu Hy Lạp với phô mai feta và oliu', 1, '2025-08-06 14:43:42', '2025-08-06 14:43:42', 0),
(62, 11, 'Combo Thập Cẩm', 300000, 'Burger, khoai tây và nước uống kèm', 1, '2025-08-06 14:52:20', '2025-08-06 14:52:20', 0),
(63, 12, 'Burger Gà Giòn', 85000, 'Burger gà chiên giòn với sốt mật ong', 1, '2025-08-06 14:52:20', '2025-08-06 14:52:20', 0),
(64, 13, 'Pizza Hải Sản Nóng Hổi', 180000, 'Tôm, mực, phô mai trên đế pizza giòn', 1, '2025-08-06 14:52:20', '2025-08-06 14:52:20', 0),
(65, 14, 'Trà Đá Chanh Tươi', 25000, 'Trà đá ấm, chanh vắt và đường phèn', 1, '2025-08-06 14:52:20', '2025-08-06 14:52:20', 0),
(66, 15, 'Pudding Caramel', 45000, 'Bánh pudding mềm mịn kèm sốt caramel thơm béo', 1, '2025-08-06 14:52:20', '2025-08-06 14:52:20', 0),
(67, 16, 'Salad Trộn Đặc Biệt', 80000, 'Rau củ trộn sốt oliu, hạt hướng dương và phô mai', 1, '2025-08-06 14:52:20', '2025-08-06 14:52:20', 0),
(68, 11, 'Combo Mini Gia Đình', 180000, '1 burger + 1 khoai + 1 nước', 1, '2025-08-06 14:56:40', '2025-08-06 14:56:40', 0),
(69, 12, 'Burger Phô Mai Gà', 90000, 'Burger gà sốt phô mai béo ngậy', 1, '2025-08-06 14:56:40', '2025-08-06 14:56:40', 0),
(70, 13, 'Pizza Đặc Biệt', 200000, 'Pizza thịt nguội, phô mai kép, ớt chuông', 1, '2025-08-06 14:56:40', '2025-08-06 14:56:40', 0),
(71, 14, 'Sinh Tố Dâu Tây', 32000, 'Sinh tố dâu tươi 300ml', 1, '2025-08-06 14:56:40', '2025-08-06 14:56:40', 0),
(72, 15, 'Tiramisu Ly', 70000, 'Tiramisu cá nhân với bột cacao', 1, '2025-08-06 14:56:40', '2025-08-06 14:56:40', 0),
(73, 16, 'Salad Nga', 85000, 'Salad khoai nghiền, giăm bông, dưa chuột', 1, '2025-08-06 14:56:40', '2025-08-06 14:56:40', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id_product_images` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_main` tinyint(1) NOT NULL DEFAULT 0,
  `is_banner` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id_product_images`, `id_products`, `image_url`, `is_main`, `is_banner`) VALUES
(1, 50, 'https://static.vecteezy.com/system/resources/thumbnails/030/033/360/small_2x/burger-fry-souse-banner-free-space-text-mockup-fast-food-top-view-empty-professional-phonography-photo.jpg', 0, 1),
(2, 50, 'https://product.hstatic.net/200000605103/product/thit_nuong_dac_biet_f71eaa69060d4a45943fd4a7dad46d87_master.png', 1, 0),
(3, 50, 'https://product.hstatic.net/200000605103/product/ga_pho_mai_b882eebc42574d66a53667259c7db597_1024x1024.jpg', 0, 0),
(4, 50, 'https://product.hstatic.net/200000605103/product/thit_nuong_dac_biet__1__47c27081c4484a8daf40148d24fb33cb_master.png', 0, 0),
(5, 50, 'https://product.hstatic.net/200000605103/product/2_mieng_bo_nuong_094ecb43cade425a84d38b0693f14af6_1024x1024.jpg', 0, 0),
(6, 51, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMQjBYeKze9GWP40cQnf67aR8o8aL9sGP_YA&s', 0, 1),
(7, 51, 'https://product.hstatic.net/200000848723/product/2_356e19838a61405292c8b5bb03ce4075_1024x1024.jpg', 1, 0),
(8, 51, 'https://product.hstatic.net/200000605103/product/bo_nuong_259388242df242dfa49817c9cdd1da9b_master.jpg', 0, 0),
(9, 51, 'https://product.hstatic.net/200000848723/product/2_356e19838a61405292c8b5bb03ce4075_1024x1024.jpg', 0, 0),
(10, 51, 'https://product.hstatic.net/1000244594/product/item_01_e8d6cc3ee923425690ccaa95467a3cac_f56f5aa3c5984dc4ab1c0c39846bd4a9_master.jpg', 0, 0),
(11, 52, 'https://st4.depositphotos.com/3316741/22997/i/450/depositphotos_229976142-stock-photo-pizza-with-tomatoes-mozzarella-cheese.jpg', 0, 1),
(12, 52, 'https://assets.tmecosys.com/image/upload/t_web_rdp_recipe_584x480/img/recipe/ras/Assets/5802fab5-fdce-468a-a830-43e8001f5a72/Derivates/c00dc34a-e73d-42f0-a86e-e2fd967d33fe.jpg', 1, 0),
(13, 52, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYGdprLZCK8tq7VuaXJw-wNT4tRon4P7aZIubIwvdFKPdPHrulyjUmgyuwjEv1nnzRaMU', 0, 0),
(14, 52, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJWOEBDxl5y9MBn5sGj7l9ZdZ4YPGYcblp8AVrL_qC4jgADqCqpYSKtxdPaXeF1S3MVus', 0, 0),
(15, 52, 'https://assets.tmecosys.com/image/upload/t_web_rdp_recipe_584x480/img/recipe/ras/Assets/5802fab5-fdce-468a-a830-43e8001f5a72/Derivates/c00dc34a-e73d-42f0-a86e-e2fd967d33fe.jpg', 0, 0),
(16, 53, 'https://bizweb.dktcdn.net/thumb/grande/100/469/765/products/1503-9de8f3562b364e56b550ff30bc493122-2c0db7cc76fd4b7f8b3c767fb24bc277-d4f804d8fc474b4bae5f628ff0d632e0-master.jpg', 1, 0),
(17, 53, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCs8veNybWTDq0old0ucm-rblweFGp6WM9WSf4GfxIBa0DRuBBSQLdSxAD0ftI7A-Q_7k', 0, 0),
(18, 53, 'https://agencyvn.com/wp-content/uploads/2023/03/aHR0cHM6Ly9jZG4uZ2llLm5ldC9maWxldXBsb2Fkcy9wdWJsaWNhdGlvbnMvMjkvaXNzdWVzLzEwMTQzNy9hcnRpY2xlcy9pbWFnZXMvY29jYS1jb2xhLmpwZw.FI-q1vDMxxQ.jpg', 0, 0),
(19, 53, 'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:format(webp):quality(75)/uong_Coca_co_tot_khong_57b0f440a7.jpg', 0, 0),
(20, 54, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVYMLPCXOeSQwLdcmldOILUS9j-y8-LJFpWg&s', 1, 0),
(21, 54, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCvJ_CvigF_62dBcXrML5jO4s-oQDe2Tb1zYuRXYALEI4HWxgLJE63QFlznd1tBHiRWls', 0, 0),
(22, 54, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkunhQG2HSBLXJd7EillOaoMhsvswF7T5RSA&s', 0, 0),
(23, 54, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcJH8yDc61fRQqhiitmIBb-0k_BVXuwygCFA&s', 0, 0),
(24, 55, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxbiT1c50KU6Y9gBLZ8lAhzY4b02UGEYroHw&s', 1, 0),
(25, 55, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOIiNbCtvRjdGunEXvzblckJtNTZRe4eYDvw&s', 0, 0),
(26, 55, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUzUL3OOhsIQfQKVnYTjcOjHEfPTRconrtGw&s', 0, 0),
(27, 55, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpoeHKz2IGrtZfIwPOB1qdAr4dLP2B1gCwUg&s', 0, 0),
(28, 56, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLMoVlnm3T_NSVROE3DbffV3hiiELSp2neqYun3WxvJkbG0oytxFrMp98ekKHT1p7m02I', 1, 1),
(29, 56, 'https://vnsupermark.com/uploads/catalog/8ea4d4e682f1ff9f2e49b90bb3cd4f90-acb65f540b.png', 0, 0),
(30, 56, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWdOWshBD9XfL_RSwGMBuCUMeZ7HTZI2HNMQelx1aqFoGKNxY016pAXpKIviq1ds4CI_g', 0, 0),
(31, 56, 'https://vnsupermark.com/uploads/catalog/8ea4d4e682f1ff9f2e49b90bb3cd4f90-acb65f540b.png', 0, 0),
(32, 57, 'https://www.seriouseats.com/thmb/_c-xbP-tch4dpSTxKE1zY16sHo8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/20231204-SEA-VeganBurger-FredHardy-00-dbf603c78b694bfd99489b85ab44f4c4.jpg', 1, 0),
(33, 57, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9IT8o7nSntdVDdkGUE8cIwP_0oax_ye6IQA-W26-EcNOHNwp8aOPfaNZmVMDh2AzfcWI', 0, 0),
(34, 57, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5uUHJVD1rsh2BNtvrpRli4urD6oshcC4y_si9dEnOZgzwqLEFIL3BXmiQTjrVYt0LZ1Y', 0, 0),
(35, 57, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqyMthUZWWJeEvfOytJ5P2C_Ym0AqQ-iBxuwKOByav-4221s43D2Y1-F3_nGPlkgJmWm0', 0, 0),
(36, 58, 'https://www.allrecipes.com/thmb/qZ7LKGV1_RYDCgYGSgfMn40nmks=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-24878-bbq-chicken-pizza-beauty-4x3-39cd80585ad04941914dca4bd82eae3d.jpg', 1, 0),
(37, 58, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvUi_at2GCvcxNYyATZuCn5raPo6SJ_SG2_dcM98cOc4Q6o0H3KD50aOKhTsnyYjxa_YY', 0, 0),
(38, 58, 'https://www.allrecipes.com/thmb/qZ7LKGV1_RYDCgYGSgfMn40nmks=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/AR-24878-bbq-chicken-pizza-beauty-4x3-39cd80585ad04941914dca4bd82eae3d.jpg', 0, 0),
(39, 58, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWOYnz-2p45zFRLHm2vuSenrIHg3NGyiVe1J2Q7QVNRbv2Mqi6UCaz4ZpPAmcS9LbnN4o', 0, 0),
(40, 59, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7SsNwo50Mz-xtJcP_mvPP0P379irK1_2nAw&s', 1, 0),
(41, 59, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaIXdX0QifxQloOa2qokxeRRU5r0u1gFibxDvdjMB7qraHjzT-dJfmfuvzSP07C0Kcztw', 0, 0),
(42, 59, 'https://static.toiimg.com/thumb/msid-68562297,imgsize-950123,width-400,resizemode-4/68562297.jpg', 0, 0),
(43, 59, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2KkZJ_bE6GQ7qOuHV7TKrxUZXGkZmIO_8p4u4oTZgZTlMxZGrc0AiXO_5kezIjq5PHH8', 0, 0),
(44, 60, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtH2GnOYbdU1s7RSKD5WfyE971vOutZP5tdw&s', 1, 0),
(45, 60, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKVQhVacG9mGGoAZDSaK33v3KlhGk94U0q-MjAVcjcF0Vtx-lJnlavDqru5cO94BezgIM', 0, 0),
(46, 60, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbMwKifEM3JlvHDL173Y2ocjDr5t2noj266JnmyAXyd0Xja_89fal1hnvAvRDRQ7wHdZ0', 0, 0),
(47, 60, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjgKC7Sn-HUeL5yL23BbNdGziIjnvWpoMna33fNsaHCWsuxVm5GMmrOVswAwfe9fxtrzE', 0, 0),
(48, 61, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVszQzT5Yler0fycOCa3f6d06GXPyjKxl7rg&s', 1, 0),
(49, 61, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSev7v31kgltma-WYsVEFllVrl02pCc85j4QgUmZJ1TU33fcBMgjhhlgXzgDX58d5ZwX2M', 0, 0),
(50, 61, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-Y5rD2L6Hcu1uUJAOYLXayD3eM9e7WHD5qvzGQHo4I2QB9_rPnOHgNOfygJCrVUrfgQc', 0, 0),
(51, 61, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuE-oJhBqg0SYeYQ1luWgTHcooXKTPeyy_YD0f9gm4pIMQ97DBzZbvtUncnKuOeHUr6kk', 0, 0),
(52, 62, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxotWn2OTlTtY6XNDCTIXPHZDgAeDD6I8HoQ&s', 1, 0),
(53, 62, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPp-xtE8WN1P535Hpz4xmyKXM67TB0cm350rgaljQSw7lMs55UtmSm7FQLShOie6S_H9E', 0, 0),
(54, 63, 'https://starchus.com/wp-content/uploads/2024/07/11.png', 1, 0),
(55, 63, 'https://product.hstatic.net/200000848723/product/37_4032a7a363934af3bf9d15a93ff08e19_master.jpg', 0, 0),
(56, 64, 'https://thepizzacompany.vn/images/thumbs/000/0002214_sf-deluxe_500.png', 1, 0),
(57, 64, 'https://thepizzacompany.vn/images/thumbs/000/0002211_tropical-sf_500.png', 0, 0),
(58, 65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuS18nKAStBEYtCxjyuh9gX3auPdulOewKlw&s', 1, 0),
(59, 65, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlFt9idd4d2a8HxbRH5BO3sFAtn4tY1h3Ikt_6la-GD-vHEx_hExiiCzhTbTSK8zTAEcI', 0, 0),
(60, 66, 'https://afamilycdn.com/150157425591193600/2020/7/7/pudding-sp4-1494536331245-15941360398832015385725.jpg', 1, 0),
(61, 66, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwh4grjfrqFPWISpM4KyYZkdfQsrVbPr9gmcuAs07TOIVipIOJrcJa33b2ohX29j9Go2s', 0, 0),
(62, 67, 'https://www.cocoichibanya.vn/wp-content/uploads/2021/03/salad.jpg', 1, 0),
(63, 67, 'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:format(webp):quality(75)/2023_10_25_638338277484171893_cach-lam-salad-rau-xa-lach.jpg', 0, 0),
(64, 68, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCWBN9r5mC1Xmp_IecrqxQu2otWJT99RfNww&s', 1, 0),
(65, 68, 'https://product.hstatic.net/200000605103/product/combo-s1_a64281e362744d929e590de398a13b29_master.png', 0, 0),
(66, 69, 'https://product.hstatic.net/200000605103/product/ga_pho_mai__1__1031b85001d74f05a8379f78b215082d_master.jpg', 1, 0),
(67, 69, 'https://product.hstatic.net/200000605103/product/ga_pho_mai__1__1031b85001d74f05a8379f78b215082d_1024x1024.jpg', 0, 0),
(68, 70, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTp9pBWg6gIGfCUo2jy25qGZ-7Im2Tl0ys7BA&s', 1, 0),
(69, 70, 'https://qsr-ecom.retailhub.vn/images/thumbs/000/0002221_bacon-sup_300.png', 0, 0),
(70, 71, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZmLK91YL6YotUllRrhS_XcP3tYTUspDe54g&s', 1, 0),
(71, 71, 'https://cdn.tgdd.vn/2021/03/CookRecipe/GalleryStep/thanh-pham-756.jpg', 0, 0),
(72, 72, 'https://bizweb.dktcdn.net/100/333/744/files/tiramisu-1.jpg?v=1577697643808', 1, 0),
(73, 72, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL2fqcUcSB5g5WNuKtlwYGGh9qkk-Mf5iRAEWZekSStw20mYlhkU24dEFjw3l1Cs3Y9n4', 0, 0),
(74, 73, 'https://cdn.tgdd.vn/Files/2020/10/31/1303545/3-cach-lam-salad-nga-ngon-dung-chuan-nhu-ngoai-hang-202202171543520699.jpg', 1, 0),
(75, 73, 'https://cdn.tgdd.vn/Files/2020/10/31/1303545/2-cach-lam-salad-nga-ngon-dung-chuan-nhu-ngoai-hang-202202171527548468.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_nutrition`
--

CREATE TABLE `product_nutrition` (
  `id_product_nutrition` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `calo` decimal(10,2) DEFAULT NULL,
  `protein` decimal(10,2) DEFAULT NULL,
  `carbohydrate` decimal(10,2) DEFAULT NULL,
  `fat` decimal(10,2) DEFAULT NULL,
  `gram` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_nutrition`
--

INSERT INTO `product_nutrition` (`id_product_nutrition`, `id_products`, `calo`, `protein`, `carbohydrate`, `fat`, `gram`) VALUES
(1, 50, 650.00, 25.00, 60.00, 30.00, '500 g'),
(2, 51, 450.00, 20.00, 35.00, 25.00, '250 g'),
(3, 52, 800.00, 30.00, 85.00, 35.00, '350 g'),
(4, 53, 140.00, 0.00, 35.00, 0.00, '330 ml'),
(5, 54, 450.00, 5.00, 50.00, 25.00, '100 g'),
(6, 55, 300.00, 10.00, 15.00, 20.00, '200 g'),
(7, 56, 1200.00, 40.00, 130.00, 60.00, '800 g'),
(8, 57, 550.00, 18.00, 45.00, 28.00, '300 g'),
(9, 58, 900.00, 32.00, 95.00, 36.00, '400 g'),
(10, 59, 150.00, 0.00, 35.00, 0.00, '300 ml'),
(11, 60, 480.00, 6.00, 50.00, 30.00, '150 g'),
(12, 61, 350.00, 12.00, 18.00, 22.00, '250 g'),
(13, 62, 750.00, 28.00, 65.00, 35.00, '600 g'),
(14, 63, 500.00, 22.00, 40.00, 30.00, '300 g'),
(15, 64, 900.00, 35.00, 90.00, 40.00, '400 g'),
(16, 65, 80.00, 0.50, 20.00, 0.00, '300 ml'),
(17, 66, 350.00, 4.00, 45.00, 18.00, '150 g'),
(18, 67, 320.00, 10.00, 20.00, 15.00, '250 g'),
(19, 68, 400.00, 15.00, 45.00, 20.00, '350 g'),
(20, 69, 480.00, 25.00, 40.00, 28.00, '300 g'),
(21, 70, 850.00, 28.00, 90.00, 33.00, '400 g'),
(22, 71, 170.00, 1.00, 38.00, 0.50, '300 ml'),
(23, 72, 430.00, 6.00, 48.00, 22.00, '150 g'),
(24, 73, 380.00, 12.00, 25.00, 18.00, '250 g');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id_promotions` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount_type` enum('percent','amount') NOT NULL,
  `value` decimal(10,0) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `promotions`
--

INSERT INTO `promotions` (`id_promotions`, `code`, `name`, `discount_type`, `value`, `start_date`, `end_date`, `is_active`) VALUES
(3, 'G20K100K', 'Giảm 20.000₫ cho đơn từ 100.000₫', 'amount', 20000, '2025-08-01 00:00:00', '2025-12-31 23:59:59', 1),
(4, 'SALE5P', 'Giảm 5% toàn bộ đơn hàng', 'percent', 5, '2025-08-01 00:00:00', '2025-12-31 23:59:59', 1),
(5, 'G5K50K', 'Giảm 5.000₫ cho đơn từ 50.000₫', 'amount', 5000, '2025-08-01 00:00:00', '2025-12-31 23:59:59', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotion_order`
--

CREATE TABLE `promotion_order` (
  `id_promotion_order` int(11) NOT NULL,
  `id_promotions` int(11) NOT NULL,
  `id_orders` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_memberships`
--

CREATE TABLE `user_memberships` (
  `id_memberships` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `id_accounts` int(11) NOT NULL,
  `point_balance` int(11) NOT NULL,
  `total_spent` decimal(12,2) DEFAULT 0.00,
  `joined_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_memberships`
--

INSERT INTO `user_memberships` (`id_memberships`, `id_level`, `id_accounts`, `point_balance`, `total_spent`, `joined_at`, `updated_at`) VALUES
(16, 3, 14, 0, 0.00, '2025-08-01 01:26:46', NULL),
(20, 3, 21, 0, 0.00, '2025-07-31 20:36:08', NULL),
(21, 3, 22, 0, 0.00, '2025-07-31 20:44:30', NULL),
(24, 3, 16, 37, 768000.00, '2025-08-01 11:04:30', '2025-08-01 14:56:50');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_accounts`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id_cart_items`),
  ADD KEY `id_cart` (`id_cart`),
  ADD KEY `id_products` (`id_products`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Chỉ mục cho bảng `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id_delivery`),
  ADD KEY `id_orders` (`id_orders`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Chỉ mục cho bảng `delivery_status_logs`
--
ALTER TABLE `delivery_status_logs`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_delivery` (`id_delivery`),
  ADD KEY `id_orders` (`id_orders`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `id_orders` (`id_orders`);

--
-- Chỉ mục cho bảng `invoice_history`
--
ALTER TABLE `invoice_history`
  ADD PRIMARY KEY (`id_invoice_history`),
  ADD KEY `id_accounts` (`id_accounts`),
  ADD KEY `id_invoice` (`id_invoice`);

--
-- Chỉ mục cho bảng `membership_levels`
--
ALTER TABLE `membership_levels`
  ADD PRIMARY KEY (`id_level`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_orders`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id_order_items`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD PRIMARY KEY (`id_status_history`),
  ADD KEY `id_accounts` (`id_accounts`),
  ADD KEY `id_orders` (`id_orders`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_products`),
  ADD KEY `id_categories` (`id_categories`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id_product_images`),
  ADD KEY `id_products` (`id_products`);

--
-- Chỉ mục cho bảng `product_nutrition`
--
ALTER TABLE `product_nutrition`
  ADD PRIMARY KEY (`id_product_nutrition`),
  ADD KEY `id_products` (`id_products`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id_promotions`);

--
-- Chỉ mục cho bảng `promotion_order`
--
ALTER TABLE `promotion_order`
  ADD PRIMARY KEY (`id_promotion_order`),
  ADD KEY `id_promotions` (`id_promotions`),
  ADD KEY `id_orders` (`id_orders`);

--
-- Chỉ mục cho bảng `user_memberships`
--
ALTER TABLE `user_memberships`
  ADD PRIMARY KEY (`id_memberships`),
  ADD KEY `id_level` (`id_level`),
  ADD KEY `id_accounts` (`id_accounts`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id_accounts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id_cart_items` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id_delivery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `delivery_status_logs`
--
ALTER TABLE `delivery_status_logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `invoice_history`
--
ALTER TABLE `invoice_history`
  MODIFY `id_invoice_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `membership_levels`
--
ALTER TABLE `membership_levels`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id_orders` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id_order_items` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_status_history`
--
ALTER TABLE `order_status_history`
  MODIFY `id_status_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id_product_images` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT cho bảng `product_nutrition`
--
ALTER TABLE `product_nutrition`
  MODIFY `id_product_nutrition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id_promotions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `promotion_order`
--
ALTER TABLE `promotion_order`
  MODIFY `id_promotion_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_memberships`
--
ALTER TABLE `user_memberships`
  MODIFY `id_memberships` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_accounts`);

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`id_cart`) REFERENCES `carts` (`id_cart`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`id_products`) REFERENCES `products` (`id_products`);

--
-- Các ràng buộc cho bảng `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_accounts`);

--
-- Các ràng buộc cho bảng `delivery_status_logs`
--
ALTER TABLE `delivery_status_logs`
  ADD CONSTRAINT `delivery_status_logs_ibfk_1` FOREIGN KEY (`id_delivery`) REFERENCES `delivery` (`id_delivery`),
  ADD CONSTRAINT `delivery_status_logs_ibfk_2` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`),
  ADD CONSTRAINT `delivery_status_logs_ibfk_3` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_accounts`);

--
-- Các ràng buộc cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`);

--
-- Các ràng buộc cho bảng `invoice_history`
--
ALTER TABLE `invoice_history`
  ADD CONSTRAINT `invoice_history_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_accounts`),
  ADD CONSTRAINT `invoice_history_ibfk_2` FOREIGN KEY (`id_invoice`) REFERENCES `invoices` (`id_invoice`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_accounts`);

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id_orders`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_products`);

--
-- Các ràng buộc cho bảng `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD CONSTRAINT `order_status_history_ibfk_1` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_accounts`),
  ADD CONSTRAINT `order_status_history_ibfk_2` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id_categories`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`id_products`) REFERENCES `products` (`id_products`);

--
-- Các ràng buộc cho bảng `product_nutrition`
--
ALTER TABLE `product_nutrition`
  ADD CONSTRAINT `product_nutrition_ibfk_1` FOREIGN KEY (`id_products`) REFERENCES `products` (`id_products`);

--
-- Các ràng buộc cho bảng `promotion_order`
--
ALTER TABLE `promotion_order`
  ADD CONSTRAINT `promotion_order_ibfk_1` FOREIGN KEY (`id_promotions`) REFERENCES `promotions` (`id_promotions`),
  ADD CONSTRAINT `promotion_order_ibfk_2` FOREIGN KEY (`id_orders`) REFERENCES `orders` (`id_orders`);

--
-- Các ràng buộc cho bảng `user_memberships`
--
ALTER TABLE `user_memberships`
  ADD CONSTRAINT `user_memberships_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `membership_levels` (`id_level`),
  ADD CONSTRAINT `user_memberships_ibfk_2` FOREIGN KEY (`id_accounts`) REFERENCES `accounts` (`id_accounts`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
