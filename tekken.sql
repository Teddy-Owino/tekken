-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 11, 2024 at 11:17 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tekken`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(50) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_desc` varchar(255) NOT NULL,
  `product_cost` varchar(255) NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_image_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_desc`, `product_cost`, `product_category`, `product_image_name`) VALUES
(1, 'Toyota Land Cruiser', 'A robust SUV known for its off-road capability.', '8500000.00', 'car', 'car1.jpg'),
(2, 'Nissan X-Trail', 'A compact SUV with advanced safety features.', '3500000.00', 'car', 'car2.jpg'),
(3, 'Honda Fit', 'A versatile hatchback with excellent fuel economy.', '1800000.00', 'car', 'car3.jpg'),
(4, 'Ford Ranger', 'A reliable pickup truck for both work and leisure.', '4000000.00', 'car', 'car4.jpg'),
(5, 'Subaru Impreza', 'A sporty sedan known for its all-wheel drive.', '2200000.00', 'car', 'car5.jpg'),
(6, 'Mercedes-Benz C-Class', 'A luxury sedan with premium features and comfort.', '6500000.00', 'car', 'car6.jpg'),
(7, 'Toyota Hilux', 'A durable pickup truck favored for its toughness.', '5200000.00', 'car', 'car7.jpg'),
(8, 'Kia Sportage', 'A stylish compact SUV with a spacious interior.', '3000000.00', 'car', 'car8.jpg'),
(9, 'Volkswagen Golf', 'A popular hatchback known for its performance.', '2500000.00', 'car', 'car9.jpg'),
(10, 'BMW 3 Series', 'A luxury sedan with sporty handling and design.', '7000000.00', 'Car', 'car10.jpg'),
(11, 'Bajaj Boxer 150', 'A reliable commuter bike known for its fuel efficiency.', '120000.00', 'motorbike', 'motor1.png'),
(12, 'TVS Apache RTR 200', 'A sporty bike with a powerful engine and modern design.', '210000.00', 'motorbike', 'motor2.jpg'),
(13, 'Honda CB125F', 'A stylish bike with a comfortable ride and great fuel economy.', '150000.00', 'motorbike', 'motor3.jpg'),
(14, 'Kawasaki Ninja 250', 'A lightweight sportbike designed for agility and speed.', '450000.00', 'motorbike', 'motor4.jpg'),
(15, 'Suzuki GSX-R150', 'A compact sports bike with high performance and advanced features.', '300000.00', 'motorbike', 'motor5.jpg'),
(16, 'Yamaha MT-15', 'A naked bike with aggressive styling and a responsive engine.', '250000.00', 'motorbike', 'motor6.jpg'),
(17, 'Hero Passion Pro', 'A fuel-efficient commuter bike ideal for daily use.', '100000.00', 'motorbike', 'motor7.jpg'),
(18, 'Benelli 502C', 'A stylish cruiser with powerful performance and comfort.', '600000.00', 'motorbike', 'motor8.jpg'),
(19, 'KTM Duke 390', 'A powerful bike with a sharp design and advanced technology.', '350000.00', 'motorbike', 'motor9.jpg'),
(20, 'Honda CRF250L', 'A dual-sport bike that excels on both road and off-road terrains.', '400000.00', 'motorbike', 'motor10.jpg'),
(21, 'Mountain Bike', 'A rugged bike designed for off-road cycling.', '45000.00', 'bicylce', 'cycle1.jpg'),
(22, 'Road Bike', 'A lightweight bike ideal for speed on paved roads.', '60000.00', 'bicylce', 'cycle2.jpg'),
(23, 'Hybrid Bike', 'Combines features of road and mountain bikes for versatile use.', '55000.00', 'bicylce', 'cycle3.jpg'),
(24, 'Folding Bike', 'A compact bike that folds for easy storage and transport.', '30000.00', 'bicylce', 'cycle4.jpg'),
(25, 'Cruiser Bike', 'A comfortable bike designed for leisurely rides.', '40000.00', 'bicylce', 'cycle5.jpg'),
(26, 'BMX Bike', 'A bike designed for stunts and tricks, typically used in parks.', '25000.00', 'bicylce', 'cycle6.jpg'),
(27, 'Electric Bike', 'A bike with an electric motor for assisted pedaling.', '90000.00', 'bicylce', 'cycle7.jpg'),
(28, 'Kids Bike', 'A small bike designed specifically for children.', '20000.00', 'bicylce', 'cycle8.jpg'),
(29, 'Touring Bike', 'A bike designed for long-distance rides with extra comfort.', '80000.00', 'bicylce', 'cycle9.jpg'),
(30, 'Fat Bike', 'A bike with oversized tires for riding on soft terrain like sand or snow.', '75000.00', 'bicylce', 'cycle10.jpg'),
(31, 'Bajaj RE', 'A popular tuktuk known for its fuel efficiency and durability.', '400000.00', 'tuktuk', 'tuk10.jpg'),
(32, 'TVS King', 'A reliable tuktuk with a spacious cabin and comfortable seating.', '350000.00', 'tuktuk', 'tuk3.jpg'),
(33, 'Piaggio Ape', 'An iconic tuktuk designed for urban transportation.', '450000.00', 'tuktuk', 'tuk4.jpg'),
(34, 'Mahindra Alfa', 'A versatile tuktuk suitable for cargo and passenger transport.', '380000.00', 'tuktuk', 'tuk5.jpg'),
(35, 'Kisumu Tuktuk', 'A local brand known for its affordability and efficiency.', '300000.00', 'tuktuk', 'tuk6.jpg'),
(36, 'Suzuki Carry', 'A robust tuktuk designed for both passenger and freight transport.', '500000.00', 'Tuktuk', 'suzuki_carry.jpg'),
(37, 'KTM Tuktuk', 'A compact tuktuk ideal for navigating city streets.', '370000.00', 'tuktuk', 'tuk7.jpg'),
(38, 'Daiichi Tuktuk', 'A budget-friendly tuktuk with good fuel economy.', '320000.00', 'tuktuk', 'tuk8.jpg'),
(39, 'Bajaj Compact', 'A smaller tuktuk model designed for tight spaces.', '390000.00', 'tuktuk', 'tuk9.jpg'),
(40, 'TVS Wego Tuktuk', 'An innovative tuktuk with modern features and design.', '410000.00', 'tuktuk', 'tuk10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
