-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 07:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hivefour`
--
CREATE DATABASE IF NOT EXISTS `hivefour` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hivefour`;
-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_ID` varchar(45) NOT NULL,
  `Invoice_Date` date NOT NULL,
  `Total_Amount` double NOT NULL,
  `Order_ID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Invoice_ID`, `Invoice_Date`, `Total_Amount`, `Order_ID`) VALUES
('I01', '2024-05-01', 35, 'O01'),
('I02', '2024-05-02', 65, 'O02'),
('I03', '2024-05-03', 155, 'O03');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` varchar(45) NOT NULL,
  `Order_Date` date NOT NULL,
  `Order_Time` time(6) DEFAULT NULL,
  `Order_Price` double NOT NULL,
  `Shipping_Price` double NOT NULL,
  `Status_ID` varchar(45) DEFAULT NULL,
  `User_ID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `Order_Date`, `Order_Time`, `Order_Price`, `Shipping_Price`, `Status_ID`, `User_ID`) VALUES
('O01', '2024-05-01', '10:00:00.000000', 30, 5, 'S01', 'U01'),
('O02', '2024-05-02', '11:15:00.000000', 60, 5, 'S02', 'U02'),
('O03', '2024-05-03', '09:30:00.000000', 150, 5, 'S03', 'U03');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Order_Details_ID` varchar(45) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Product_ID` varchar(45) DEFAULT NULL,
  `Order_ID` varchar(45) DEFAULT NULL,
  `Size_ID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Order_Details_ID`, `Quantity`, `Product_ID`, `Order_ID`, `Size_ID`) VALUES
('OD01', 2, 'PD1', 'O01', 'S'),
('OD02', 3, 'PD2', 'O02', 'L'),
('OD03', 6, 'PD3', 'O03', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` varchar(45) NOT NULL,
  `Amount_Paid` double NOT NULL,
  `Payment_Date` date NOT NULL,
  `Payment_Time` time(6) NOT NULL,
  `Receipt` longblob DEFAULT NULL,
  `Order_ID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Amount_Paid`, `Payment_Date`, `Payment_Time`, `Receipt`, `Order_ID`) VALUES
('PY01', 35, '2024-05-01', '10:05:00.000000', NULL, 'O01'),
('PY02', 65, '2024-05-02', '11:20:00.000000', NULL, 'O02'),
('PY03', 155, '2024-05-03', '09:35:00.000000', NULL, 'O03');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(45) NOT NULL,
  `Product_Name` varchar(45) NOT NULL,
  `Product_Image` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Product_Image`) VALUES
('PD1', 'Red Rose', 0x4e554c4c),
('PD2', 'Bluey Cloud', 0x4e554c4c),
('PD3', 'Flying Bees', 0x4e554c4c);

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `Size_ID` varchar(45) NOT NULL,
  `Size_Name` varchar(45) NOT NULL,
  `Size_Description` varchar(50) DEFAULT NULL,
  `Size_Price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`Size_ID`, `Size_Name`, `Size_Description`, `Size_Price`) VALUES
('L', 'Large', '13\" x 14\"', 25),
('M', 'Medium', '10\" x 11\"', 20),
('S', 'Small', '7\" x 8\"', 15);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `Status_ID` varchar(45) NOT NULL,
  `Status_Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`Status_ID`, `Status_Name`) VALUES
('S01', 'Pending'),
('S02', 'Processed'),
('S03', 'Shipped');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` varchar(45) NOT NULL,
  `User_Name` varchar(45) NOT NULL,
  `User_Full_Name` varchar(50) NOT NULL,
  `User_Email` varchar(45) NOT NULL,
  `User_Password` varchar(45) NOT NULL,
  `Type_ID` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `User_Name`, `User_Full_Name`, `User_Email`, `User_Password`, `Type_ID`) VALUES
('U01', 'amzati2004', 'Amirah Izzati Binti Aminuddin', 'amirah@gmail.com', 'amirah123', 'UT01'),
('U02', 'aalifCurang', 'Aliff Aziz Bin ', 'aaziz@gmail.com', 'alifaziz098', 'UT01'),
('U03', 'syabat04', 'Nur Batrisyia Binti Norul Haizal', 'batrisyia@gmail.com', 'batrisyia123', 'UT01'),
('U04', 'aidandellion', 'Aida Syazwani Binti Samani', 'aidasyazwani04@gmail.com', 'aida123', 'UT02'),
('U05', 'a_alicafe23', 'Nurul Aliah Haifaa Binti Nasiruddin', 'aliah@gmail.com', 'aliah123', 'UT02');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `User_Details_ID` varchar(45) NOT NULL,
  `Address1` varchar(50) NOT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `Postcode` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `User_ID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`User_Details_ID`, `Address1`, `Address2`, `Postcode`, `State`, `City`, `User_ID`) VALUES
('UD01', '123, Jalan Tun Razak', 'Apartment B, Unit 2B', '50400', 'WP Kuala Lumpur', 'Kuala Lumpur', 'U01'),
('UD02', '45, Jalan Ampang', 'Taman Ampang', '68000', 'WP Kuala Lumpur', 'Ampang', 'U02'),
('UD03', '789, Jalan Sultan Ismail', 'NULL', '50250', 'WP Kuala Lumpur', 'Kuala Lumpur', 'U03'),
('UD04', 'Lot 2410, Lorong Kenanga', 'Kampung Sijangkang', '42500', 'Selangor', 'Telok Panglima Garang', 'U04'),
('UD05', '12, Jalan Kuchai Lama', 'NULL', '58200', 'WP Kuala Lumpur', 'Kuala Lumpur', 'U05');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `Type_ID` varchar(45) NOT NULL,
  `Type_Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`Type_ID`, `Type_Name`) VALUES
('UT01', 'Customer'),
('UT02', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Status_ID` (`Status_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Order_Details_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Order_ID` (`Order_ID`),
  ADD KEY `Size_ID` (`Size_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`Size_ID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`Status_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Type_ID` (`Type_ID`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`User_Details_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`Status_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`Size_ID`) REFERENCES `product_size` (`Size_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Type_ID`) REFERENCES `user_type` (`Type_ID`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
