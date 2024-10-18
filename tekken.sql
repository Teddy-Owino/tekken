-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2024 at 07:14 AM
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
-- Database: `tekken`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment_records`
--

CREATE TABLE `payment_records` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_records`
--

INSERT INTO `payment_records` (`id`, `username`, `phone`, `amount`, `status`, `created_at`) VALUES
(1, 'Teddy', '254717959422', 0.00, 'Completed', '2024-10-17 13:01:53'),
(2, 'Teddy', '254717959422', 3500000.00, 'Completed', '2024-10-17 13:05:33'),
(3, 'Teddy', '254705959422', 120000.00, 'Completed', '2024-10-17 13:14:51');

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
(36, 'Suzuki Carry', 'A robust tuktuk designed for both passenger and freight transport.', '500000.00', 'Tuktuk', 'tuk5.jpg'),
(37, 'KTM Tuktuk', 'A compact tuktuk ideal for navigating city streets.', '370000.00', 'tuktuk', 'tuk7.jpg'),
(38, 'Daiichi Tuktuk', 'A budget-friendly tuktuk with good fuel economy.', '320000.00', 'tuktuk', 'tuk8.png'),
(39, 'Bajaj Compact', 'A smaller tuktuk model designed for tight spaces.', '390000.00', 'tuktuk', 'tuk9.jpg'),
(40, 'TVS Wego Tuktuk', 'An innovative tuktuk with modern features and design.', '410000.00', 'tuktuk', 'tuk10.jpg'),
(41, 'Engine Assembly', 'Complete engine assembly for tuk-tuks.', '750.00', 'sparetuk', 'sparetuk1.jpg'),
(42, 'Gearbox', 'Manual gearbox suitable for most tuk-tuks.', '300.00', 'sparetuk', 'sparetuk2.jpg'),
(43, 'Wheel Rim', 'Durable wheel rim compatible with tuk-tuks.', '50.00', 'sparetuk', 'sparetuk3.jpg'),
(44, 'Radiator', 'High-efficiency radiator to cool the engine.', '100.00', 'sparetuk', 'sparetuk4.jpg'),
(45, 'Brake Pads', 'High-performance brake pads for safety.', '20.00', 'sparetuk', 'sparetuk5.jpg'),
(46, 'Fuel Pump', 'Electric fuel pump for efficient fueling.', '45.00', 'sparetuk', 'sparetuk6.jpg'),
(47, 'Battery', 'Reliable battery for tuk-tuk power.', '120.00', 'sparetuk', 'sparetuk7.jpg'),
(48, 'Headlight', 'Bright headlight for improved visibility.', '30.00', 'sparetuk', 'sparetuk8.jpg'),
(49, 'Steering Wheel', 'Ergonomic steering wheel for better control.', '60.00', 'sparetuk', 'sparetuk9.jpg'),
(50, 'Clutch Kit', 'Complete clutch kit for smooth shifting.', '85.00', 'sparetuk', 'sparetuk10.jpg'),
(51, 'Alternator', 'Converts mechanical energy to electrical energy.', '150.00', 'carspares', 'cr1.jpg'),
(52, 'Brake Disc', 'High-performance brake disc for optimal braking.', '70.00', 'carspares', 'cr2.jpg'),
(53, 'Oil Filter', 'Essential for maintaining engine oil quality.', '15.00', 'carspares', 'cr3.jpg'),
(54, 'Air Filter', 'Improves engine efficiency by filtering air.', '25.00', 'carspares', 'cr4.jpg'),
(55, 'Spark Plug', 'Ensures efficient combustion in the engine.', '10.00', 'carspares', 'cr5.jpg'),
(56, 'Radiator', 'Cools the engine and prevents overheating.', '100.00', 'carspares', 'cr6.jpg'),
(57, 'Battery', 'Provides power to start the engine.', '120.00', 'carspares', 'cr7.jpg'),
(58, 'Fuel Injector', 'Delivers fuel into the engine for combustion.', '85.00', 'carspares', 'cr8.jpg'),
(59, 'Timing Belt', 'Maintains timing between engine components.', '50.00', 'carspares', 'cr9.jpg'),
(60, 'Exhaust Muffler', 'Reduces noise and emissions from the exhaust.', '90.00', 'carspares', 'cr10.jpg'),
(61, 'Brake Pads', 'High-performance brake pads for optimal stopping.', '25.00', 'bispares', 'bispares1.jpg'),
(62, 'Bicycle Chain', 'Durable chain for smooth gear shifting.', '15.00', 'bispares', 'bispares2.jpg'),
(63, 'Tire', 'All-weather tire for road and mountain biking.', '40.00', 'bispares', 'bispares3.jpg'),
(64, 'Inner Tube', 'Replacement inner tube for punctured tires.', '10.00', 'bispares', 'bispares4.jpg'),
(65, 'Gear Shifter', 'Smooth and precise gear shifting mechanism.', '30.00', 'bispares', 'bispares5.jpg'),
(66, 'Pedals', 'Durable pedals for efficient power transfer.', '20.00', 'bispares', 'bispares6.jpg'),
(67, 'Handlebars', 'Adjustable handlebars for comfort and control.', '35.00', 'bispares', 'bispares7.jpg'),
(68, 'Seat', 'Comfortable bike seat for long rides.', '50.00', 'bispares', 'bispares8.jpg'),
(69, 'Fork', 'Front fork for better handling and stability.', '100.00', 'bispares', 'bispares9.jpg'),
(70, 'Brake Levers', 'Ergonomic brake levers for easy control.', '20.00', 'bispares', 'bispares10.jpg'),
(71, 'Brake Pads', 'High-performance brake pads for safe stopping.', '30.00', 'bikespares', 'bik1.jpg'),
(72, 'Motorcycle Battery', 'Reliable battery for starting the engine.', '120.00', 'bikespares', 'bik4.jpg'),
(73, 'Clutch Cable', 'Durable clutch cable for smooth operation.', '25.00', 'bikespares', 'bik5.jpg'),
(74, 'Chain', 'Heavy-duty chain for power transfer.', '40.00', 'bikespares', 'bik2.jpg'),
(75, 'Oil Filter', 'Essential for maintaining engine oil quality.', '15.00', 'bikespares', 'bik6.jpg'),
(76, 'Air Filter', 'Improves engine performance by filtering air.', '20.00', 'bikespares', 'bik7.jpg'),
(77, 'Fuel Pump', 'Efficient fuel pump for optimal performance.', '50.00', 'bikespares', 'bik3.jpg'),
(78, 'Front Fork', 'Sturdy front fork for better handling.', '100.00', 'bikespares', 'bik8.jpg'),
(79, 'Headlight', 'Bright headlight for improved visibility.', '35.00', 'bikespares', 'bik9.jpg'),
(80, 'Exhaust System', 'Performance exhaust system for enhanced power.', '200.00', 'bikespares', 'bik10.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `gender`, `phone`, `password`, `user_type`) VALUES
(6, 'Teddy', 'tedd07@gmail.com', 'male', '0705959422', 'tedd100@', 'user'),
(8, 'Onyango', 'mitchellonyango97@gmail.com', 'female', 'female', 'Mitchell@100', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment_records`
--
ALTER TABLE `payment_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payment_records`
--
ALTER TABLE `payment_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
