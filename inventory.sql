-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 02:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopkeer_req`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` >= 0),
  `price` decimal(10,2) NOT NULL CHECK (`price` >= 0),
  `supplier` varchar(100) NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `item_name`, `item_code`, `category`, `quantity`, `price`, `supplier`, `date_added`) VALUES
(1, 'Fortune Sunflower Oil', 'FRT1001', 'Grocery', 20, 145.20, 'Adani Wilmar Pvt. Ltd.', '0000-00-00'),
(2, 'Tata Salt', 'TATA1002', 'Grocery', 50, 20.00, 'Tata Chemicals Ltd.', '2025-05-15'),
(3, 'Maggi Noodles', 'MAG3001', 'Grocery', 30, 12.50, 'Nestle India Ltd.', '2025-05-16'),
(4, 'Colgate Toothpaste', 'COL5003', 'Personal Care', 40, 55.75, 'Colgate-Palmolive India Ltd.', '2025-05-15'),
(5, 'Surf Excel Detergent', 'SURF7004', 'Cleaning', 25, 120.00, 'Hindustan Unilever Ltd.', '2025-05-14'),
(6, 'Cadbury Dairy Milk', 'CAD9005', 'Confectionery', 60, 45.00, 'Mondelez India Foods Pvt. Ltd.', '2025-05-13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_code` (`item_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
