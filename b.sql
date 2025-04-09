-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2023 at 03:30 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_selling_price` float NOT NULL,
  `in_stock` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` float NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(200) NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `cat_desc` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `cat_desc`) VALUES
(82, 'Chicken', ''),
(83, 'Chicken 2 Dirham', ''),
(84, 'Beef', ''),
(85, 'Beef 2 Dirham', ''),
(86, 'Fish', ''),
(87, 'Fish 2 Dirham', ''),
(88, 'Rice Set Menu', ''),
(89, 'Juice', ''),
(90, 'Juice 2 Dirham ', ''),
(91, 'Beverages', ''),
(92, 'Water  Bottle 250 ml', ''),
(93, 'Water  Bottle 500 ml', ''),
(94, 'Water Bottle 1 L', ''),
(95, 'Mutton', ''),
(96, 'Kabab', ''),
(97, 'Vegetables', ''),
(98, 'Snacks', '');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cust_id` int(200) NOT NULL,
  `cust_name` varchar(200) NOT NULL,
  `cust_add` varchar(200) NOT NULL,
  `cust_phone` varchar(200) NOT NULL,
  `cust_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `date` date NOT NULL,
  `expense_id` int(11) NOT NULL,
  `expense_cat_id` int(11) NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`date`, `expense_id`, `expense_cat_id`, `amount`) VALUES
('2023-06-02', 11, 15, 1000),
('2023-06-02', 12, 16, 2000),
('2023-05-03', 13, 17, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `expense_cat_id` int(11) NOT NULL,
  `expense_cat_name` varchar(80) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`expense_cat_id`, `expense_cat_name`, `description`) VALUES
(14, 'Restaurant Rent', ''),
(15, 'Electricity Bill', ''),
(16, 'Staff Salary', ''),
(17, 'Manager Salary', ''),
(18, 'Food Wastage', ''),
(19, 'Others', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cust_id` int(11) NOT NULL,
  `sub_total` float NOT NULL,
  `vat` float NOT NULL,
  `discount` float NOT NULL,
  `grand_total` float NOT NULL,
  `paid` float NOT NULL,
  `due` float NOT NULL,
  `cash` float NOT NULL,
  `changed` float NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `payment_status` varchar(11) NOT NULL,
  `date_time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `cust_id`, `sub_total`, `vat`, `discount`, `grand_total`, `paid`, `due`, `cash`, `changed`, `payment_type`, `payment_status`, `date_time_stamp`) VALUES
(4363, '2023-05-08', 6, 10, 0, 0, 10, 10, 0, 10, 0, 'Cash', '1', '2023-05-08 10:30:02'),
(4364, '2023-05-08', 6, 20, 0, 0, 20, 20, 0, 20, 0, 'Cash', '1', '2023-05-08 10:33:56'),
(4365, '2023-06-02', 6, 37, 0, 0, 37, 37, 0, 37, 0, 'Cash', '1', '2023-06-02 10:38:55'),
(4366, '2023-06-02', 6, 20, 0, 0, 20, 20, 0, 20, 0, 'Cash', '1', '2023-06-02 13:04:57'),
(4367, '2023-06-02', 6, 8, 0, 0, 8, 8, 0, 8, 0, 'Cash', '1', '2023-06-02 13:06:15'),
(4368, '2023-06-02', 6, 54, 0, 0, 54, 54, 0, 100, 46, 'Cash', '1', '2023-06-02 13:08:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` varchar(200) NOT NULL,
  `quantity` varchar(200) NOT NULL,
  `rate` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `rate`) VALUES
(4347, 4363, '1466', '1', '10'),
(4348, 4364, '1477,1480', '1,1', '8,12'),
(4349, 4365, '1478,1480,1482', '1,1,1', '10,12,15'),
(4350, 4366, '1469,1477,1478', '1,1,1', '2,8,10'),
(4351, 4367, '1477', '1', '8'),
(4352, 4368, '1477,1489,1487', '5,1,1', '8,8,6');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(200) NOT NULL,
  `cat_id` varchar(200) NOT NULL,
  `sub_cat_id` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_code` varchar(200) NOT NULL,
  `product_purchase_price` float NOT NULL,
  `product_selling_price` float NOT NULL,
  `product_qty` varchar(200) NOT NULL,
  `product_image` text NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `cat_id`, `sub_cat_id`, `product_name`, `product_code`, `product_purchase_price`, `product_selling_price`, `product_qty`, `product_image`, `supplier_id`, `status`) VALUES
(1466, '82', '', 'Chicken Tikka 10 ', '1', 10, 10, '9', '1683525781chicken-tikka.jpg', '10', 1),
(1467, '82', '', 'Chicken Tikka 18', '2', 18, 18, '10', '1683526004chicken-tikka.jpg', '10', 1),
(1468, '82', '', 'Chicken Tikka 30', '3', 30, 30, '10', '1683526070chicken-tikka.jpg', '10', 1),
(1469, '83', '', 'Chicken Tikka 2 Dh', '02', 2, 2, '9', '1683526141chicken-tikka.jpg', '10', 1),
(1470, '82', '', 'Chicken Tikka Masala 12', '4', 12, 12, '10', '1683526275chiken-tikka-masala.jpg', '10', 1),
(1471, '95', '', 'Fresh Mutton Kadal 13', '5', 13, 13, '10', '1683526507fresh-mutton-kadal.jpg', '10', 1),
(1473, '82', '', 'Fresh Chicken Kadal', '6', 12, 12, '10', '1683526744fresh-chicken-kadal.jpg', '10', 1),
(1474, '86', '', 'Grilled Sheri With Rice', '7', 18, 18, '10', '1683526873Grilled Sheri with Rice.jpg', '10', 1),
(1475, '82', '', 'Chicken Malai Boti', '8', 15, 15, '10', '1683526991Chicken-malai-boti.jpg', '10', 1),
(1476, '88', '', 'Afgani Polao 13 Dh', '9', 13, 13, '10', '1683527131afgani-polao.jpg', '10', 1),
(1477, '88', '', 'Chciken Biriyani 8 Dh', '10', 8, 8, '2', '1683527298chicken-biriyani.jpg', '10', 1),
(1478, '88', '', 'Chicken Biriyani 10 Dh', '11', 10, 10, '8', '1683527347chicken-biriyani.jpg', '10', 1),
(1480, '82', '', 'Chicken Chilly 12 Dh', '12', 12, 12, '8', '1683527435chicken-chilly.jpg', '10', 1),
(1481, '96', '', 'Kabab 4 Sikh 12 Dh', '13', 12, 12, '10', '1683528844kabab-4-seekh.jpg', '10', 1),
(1482, '96', '', 'Kabab 4 Sikh 15 Dh', '14', 15, 15, '9', '1683528887kabab-4-seekh.jpg', '10', 1),
(1483, '84', '', 'Daal Ghosh 13 Dh', '15', 13, 13, '10', '1683528983dal-ghosh.jpg', '10', 1),
(1485, '88', '', 'Veg Kurma With Rice 10 Dh', '16', 10, 10, '10', '1683529124veg-kurma-rice.jpg', '10', 1),
(1486, '82', '', 'Lahori Chicken Fry 6 Dh', '17', 6, 6, '10', '1683529687Lahori-chicken-fry.jpg', '10', 1),
(1487, '97', '', 'Allo Palak 6 Dh', '18', 6, 6, '9', '1683529804Aloo-Palak.jpg', '10', 1),
(1488, '98', '', 'Special  Namkeen 25 Dh', '19', 25, 25, '10', '1683530557special-namkeen.jpg', '10', 1),
(1489, '97', '', 'Aloo Keema 8 Dh', '20', 8, 8, '9', '1683530874aloo-keema.jpg', '10', 1),
(1490, '82', '', 'Chicken Korma 13 Dh', '21', 13, 13, '10', '1683531007chicken-korma.jpg', '10', 1),
(1492, '82', '', 'Shahi Chicken haleem 6 Dh', '22', 6, 6, '10', '1683531116shahi-chicken-haleem.jpg', '10', 1),
(1493, '82', '', 'Chicken Boneless 10 Dh', '23', 23, 23, '10', '1683531236chicken-bonless.jpg', '10', 1),
(1494, '88', '', 'Chicken Fried Rice 8 Dh', '24', 8, 8, '10', '1683531326chciken-fried-rice.jpg', '10', 1),
(1495, '97', '', 'Dal Fry 6 Dh', '25', 6, 6, '10', '1683531375dal-fry.jpg', '10', 1),
(1496, '95', '', 'Mutton Korma 14 Dh', '26', 14, 14, '10', '1683531435mutton-korma.jpg', '10', 1),
(1497, '88', '', 'Rice With Chicken Sheek Kabab 12 Dh', '27', 12, 12, '10', '1683531810rice-with-chciken-seekh-kabab.jpg', '10', 1),
(1498, '82', '', 'Grilled chicken 10 Dh', '28', 10, 10, '10', '1683531887grilled-chicken.jpg', '10', 1),
(1499, '82', '', 'Chicken Grilled 18 Dh', '29', 18, 18, '10', '1683531961grilled-chicken.jpg', '10', 1),
(1500, '91', '', 'Pepsi Can 25 Dh', '30', 25, 25, '20', '1683532056pepsi-can.jpg', '10', 1),
(1501, '92', '', 'Water Small 1 Dh', '31', 1, 1, '10', '1683532121water1.jpg', '10', 1),
(1502, '94', '', 'Water larger 1.5 Dh', '32', 2, 2, '20', '1683532174water1.jpg', '10', 1),
(1503, '89', '', 'Milk Shake medium 8 Dh', '33', 8, 8, '10', '1683532254milk-shake.jpg', '10', 1),
(1504, '82', '', 'Chicken Tikka Masala 2 Dh', '34', 2, 2, '10', '1683542862chiken-tikka-masala.jpg', '10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `raw_products`
--

CREATE TABLE `raw_products` (
  `raw_product_id` int(200) NOT NULL,
  `date` date NOT NULL,
  `raw_product_name` varchar(200) NOT NULL,
  `raw_product_code` varchar(200) NOT NULL,
  `raw_product_purchase_price` float NOT NULL,
  `raw_product_qty` varchar(200) NOT NULL,
  `raw_product_image` text NOT NULL,
  `supplier_id` varchar(100) NOT NULL,
  `comments` longtext NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `raw_products`
--

INSERT INTO `raw_products` (`raw_product_id`, `date`, `raw_product_name`, `raw_product_code`, `raw_product_purchase_price`, `raw_product_qty`, `raw_product_image`, `supplier_id`, `comments`) VALUES
(0, '2023-06-02', 'Beef 10 Kg', '91', 8000, '10', '1685701335', '10', 'Paid Fully'),
(0, '2023-06-02', 'Tomatto 2 Kg', '92', 200, '20', '1685701453toamtto.jpeg', '10', 'Fully Paid');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `system_name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `vat` float NOT NULL,
  `stock_warning_limit` int(11) NOT NULL,
  `currency` varchar(20) NOT NULL,
  `vat_reg_no` varchar(30) NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `system_name`, `title`, `address`, `phone`, `email`, `vat`, `stock_warning_limit`, `currency`, `vat_reg_no`, `logo`) VALUES
(1, 'Umami', 'Umami', 'Dhaka', '+8801629581211', 'bati@yahoo.conm', 0, 10, '', '', '1685706549reslogo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(5) NOT NULL,
  `staff_name` varchar(45) NOT NULL,
  `identification_no` varchar(35) NOT NULL,
  `address` varchar(68) NOT NULL,
  `phone` varchar(46) NOT NULL,
  `staff_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staff_id`, `staff_name`, `identification_no`, `address`, `phone`, `staff_image`) VALUES
(1, 'Mr karim', '1515456454', 'Dhaka', '01625441', '16785257238dbc8903-050f-42be-b4e6-63e1baf50c55.jpg'),
(2, 'Mr Tilok', '324242432', 'Dhaka', '9324234243', '1685708555user8-128x128.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `sub_cat_id` int(200) NOT NULL,
  `sub_cat_name` varchar(200) NOT NULL,
  `sub_cat_desc` text NOT NULL,
  `cat_id` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(200) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `supplier_description` varchar(200) NOT NULL,
  `supplier_phone` varchar(20) NOT NULL,
  `supplier_email` varchar(50) NOT NULL,
  `supplier_address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `supplier_description`, `supplier_phone`, `supplier_email`, `supplier_address`) VALUES
(10, 'UAE Local Grocery', 'Daily Supplier', '02243242', 'uae@yahoo,com', 'UAE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `admin_id` int(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_type` varchar(200) NOT NULL,
  `branch` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`admin_id`, `username`, `password`, `user_type`, `branch`) VALUES
(13, 'zahid', 'e10adc3949ba59abbe56e057f20f883e', 'admin', 'central'),
(14, 'tilok', 'e10adc3949ba59abbe56e057f20f883e', 'admin', ''),
(15, 'monir', 'e10adc3949ba59abbe56e057f20f883e', 'sales', ''),
(16, 'hasan', 'e10adc3949ba59abbe56e057f20f883e', 'report', '');

-- --------------------------------------------------------

--
-- Table structure for table `wastages`
--

CREATE TABLE `wastages` (
  `wastage_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` float NOT NULL,
  `details` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`expense_cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `wastages`
--
ALTER TABLE `wastages`
  ADD PRIMARY KEY (`wastage_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1463;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cust_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `expense_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4369;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4353;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1505;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `sub_cat_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `admin_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `wastages`
--
ALTER TABLE `wastages`
  MODIFY `wastage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
