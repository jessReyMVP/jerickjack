-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2024 at 11:15 AM
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
-- Database: `db_hotel`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `payment_q`
-- (See below for the actual view)
--
CREATE TABLE `payment_q` (
`payment_id` int(11)
,`customer_name` varchar(101)
,`customer_id` int(11)
,`payment_date` date
,`reservation_id` int(11)
,`date_range` varchar(20)
,`room_id` int(11)
,`amount` decimal(20,0)
,`total_payment` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q_payment`
-- (See below for the actual view)
--
CREATE TABLE `q_payment` (
`payment_id` int(11)
,`customer_name` varchar(101)
,`customer_id` int(11)
,`payment_date` date
,`total_payment` decimal(20,0)
,`reservation_id` int(11)
,`date_range` varchar(20)
,`room_id` int(11)
,`amount` decimal(20,0)
,`calculated_total_payment` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q_reservation`
-- (See below for the actual view)
--
CREATE TABLE `q_reservation` (
`reservation_id` int(11)
,`customer_id` int(11)
,`customer_name` varchar(101)
,`room_id` int(11)
,`reservation_date` date
,`date_in` date
,`date_out` date
,`date_range` varchar(23)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `q_reservation_detail`
-- (See below for the actual view)
--
CREATE TABLE `q_reservation_detail` (
`reservation_id` int(11)
,`customer_id` int(11)
,`customer_name` varchar(100)
,`room_id` int(11)
,`reservation_date` date
,`date_in` date
,`date_out` date
,`date_range` int(7)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reservation_details`
-- (See below for the actual view)
--
CREATE TABLE `reservation_details` (
`reservation_id` int(11)
,`customer_id` int(11)
,`customer_name` varchar(101)
,`room_id` int(11)
,`reservation_date` date
,`date_in` date
,`date_out` date
,`date_range` int(7)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `Name`, `username`, `password`) VALUES
(1, 'Jerick Leopa', 'Admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`customer_id`, `firstname`, `lastname`, `address`, `status`, `contact_no`, `username`, `password`) VALUES
(1, 'Jerick', 'Leopa', 'Bansag', 'Single', '09958178837', 'jerick', '12345'),
(3, 'Jess-rey', 'Labanero', 'Barangay Cabudian, Duenas, Iloilo', 'Single', '09958178837', 'jessrey123', 'Jess123456'),
(4, 'Jocye', 'Sibag', 'Barangay Bansag, Lambunao, Iloilo', 'Single', '09958178837', 'jyc08', '143');

-- --------------------------------------------------------

--
-- Table structure for table `tb_emplooyee`
--

CREATE TABLE `tb_emplooyee` (
  `employee_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `jDepartment` varchar(30) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_emplooyee`
--

INSERT INTO `tb_emplooyee` (`employee_id`, `firstname`, `lastname`, `address`, `contact_no`, `jDepartment`, `Username`, `password`) VALUES
(1, 'Jerick', 'Leopa', 'Bansag', '09958178837', 'Cleaning', 'jerick', '123'),
(2, 'Jerick', 'Leopa', 'Bansag', '0990', 'Room', 'bonn', '123'),
(4, 'Jerick', 'Leopa', 'Bansag', '09958178837', 'Cleaning', 'jerick', '123'),
(5, 'Jerick', 'Leopa', 'Bansag', '09958178837', 'Cleaning', 'jerick', '123'),
(6, 'Jerick', 'Leopa', 'Bansag', '09123333344', 'Cleaning', 'jerick', '1234'),
(8, 'Joyce', 'Sibag', 'Bansag', '09123333344', 'Cleaning', 'jyc', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `tb_payments`
--

CREATE TABLE `tb_payments` (
  `payment_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `total_payment` decimal(20,0) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `date_range` varchar(20) NOT NULL,
  `room_id` int(11) NOT NULL,
  `amount` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_payments`
--

INSERT INTO `tb_payments` (`payment_id`, `customer_name`, `customer_id`, `payment_date`, `total_payment`, `reservation_id`, `date_range`, `room_id`, `amount`) VALUES
(1, '', 1, '2024-04-30', 0, 0, '', 0, 0),
(2, '', 9, '2024-05-16', 0, 0, '', 0, 0),
(3, 'Jeric Leopa', 10, '2024-05-17', 1500, 4, '3', 1, 500),
(4, '1', 1, '2024-05-16', 500, 27, '27', 500, 500),
(5, '1', 1, '2024-05-16', 500, 27, '27', 500, 500),
(6, '1', 1, '2024-05-09', 500, 27, '27', 500, 500),
(7, '4', 4, '2024-05-23', 3000, 3, '3', 1000, 1000),
(8, '4', 4, '2024-05-24', 2000, 2, '2', 1000, 1000),
(9, '1', 1, '2024-05-16', 500, 8, '8', 500, 500);

-- --------------------------------------------------------

--
-- Table structure for table `tb_reports`
--

CREATE TABLE `tb_reports` (
  `report_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `information` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_reservation`
--

CREATE TABLE `tb_reservation` (
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `room_id` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `date_in` date NOT NULL,
  `date_out` date NOT NULL,
  `date_range` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_reservation`
--

INSERT INTO `tb_reservation` (`reservation_id`, `customer_id`, `customer_name`, `room_id`, `reservation_date`, `date_in`, `date_out`, `date_range`, `status`) VALUES
(3, 10, '', 11, '2024-05-17', '2024-05-16', '2024-05-17', '2Days', ''),
(4, 5, 'Joyce Sibag', 8, '2024-05-16', '2024-05-24', '2024-05-24', '1', ''),
(5, 2, 'Jerick Leopa', 8, '2024-05-16', '2024-05-22', '2024-05-24', '3', ''),
(7, 3, '3', 2, '2024-05-17', '2024-05-25', '2024-05-27', '', 'Pending'),
(8, 1, '1', 3, '2024-05-01', '2024-05-01', '2024-05-28', '', 'Approved'),
(9, 3, '3', 1, '2024-05-17', '2024-05-25', '2024-05-28', '', 'Approved'),
(10, 1, '1', 3, '2024-05-18', '2024-05-25', '2024-05-28', '', 'Pending'),
(11, 4, '4', 4, '2024-05-23', '2024-05-29', '2024-06-03', '', 'Approved'),
(12, 1, '1', 3, '2024-05-09', '2024-05-16', '2024-05-20', '', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tb_room`
--

CREATE TABLE `tb_room` (
  `room_id` int(11) NOT NULL,
  `class_id` varchar(11) NOT NULL,
  `picture` longblob NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_room`
--

INSERT INTO `tb_room` (`room_id`, `class_id`, `picture`, `description`, `amount`) VALUES
(1, '1', '', 'dasdasd', 500),
(2, '1', '', 'dasdasd', 500),
(3, '2', 0x75706c6f6164732f, 'dasdasd', 1000),
(4, '3', 0x75706c6f6164732f, 'dasdas', 1000),
(7, '5', 0x75706c6f6164732f6c6f676f2e706e67, 'dasdasd', 10000),
(8, '5', 0x75706c6f6164732f6c6f676f2e706e67, 'dasdasd', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaction`
--

CREATE TABLE `tb_transaction` (
  `transaction_id` int(11) NOT NULL,
  `transaction_name` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_transaction`
--

INSERT INTO `tb_transaction` (`transaction_id`, `transaction_name`, `customer_id`, `payment_id`, `employee_id`, `reservation_id`, `transaction_date`) VALUES
(1, 'Jerick Leopa', 1, 1, 1, 1, '2024-05-17');

-- --------------------------------------------------------

--
-- Structure for view `payment_q`
--
DROP TABLE IF EXISTS `payment_q`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payment_q`  AS SELECT `p`.`payment_id` AS `payment_id`, concat(`c`.`firstname`,' ',`c`.`lastname`) AS `customer_name`, `c`.`customer_id` AS `customer_id`, `p`.`payment_date` AS `payment_date`, `p`.`reservation_id` AS `reservation_id`, `r`.`date_range` AS `date_range`, `rm`.`room_id` AS `room_id`, `rm`.`amount` AS `amount`, `r`.`date_range`* `rm`.`amount` AS `total_payment` FROM (((`tb_payments` `p` join `tb_reservation` `r` on(`p`.`reservation_id` = `r`.`reservation_id`)) join `tb_room` `rm` on(`r`.`room_id` = `rm`.`room_id`)) join `tb_customer` `c` on(`p`.`customer_id` = `c`.`customer_id`)) WHERE `r`.`date_range` * `rm`.`amount` = `p`.`total_payment` ;

-- --------------------------------------------------------

--
-- Structure for view `q_payment`
--
DROP TABLE IF EXISTS `q_payment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q_payment`  AS SELECT `p`.`payment_id` AS `payment_id`, concat(`c`.`firstname`,' ',`c`.`lastname`) AS `customer_name`, `c`.`customer_id` AS `customer_id`, `p`.`payment_date` AS `payment_date`, `p`.`total_payment` AS `total_payment`, `p`.`reservation_id` AS `reservation_id`, `r`.`date_range` AS `date_range`, `rm`.`room_id` AS `room_id`, `rm`.`amount` AS `amount`, `r`.`date_range`* `rm`.`amount` AS `calculated_total_payment` FROM (((`tb_payments` `p` join `tb_reservation` `r` on(`p`.`reservation_id` = `r`.`reservation_id`)) join `tb_room` `rm` on(`r`.`room_id` = `rm`.`room_id`)) join `tb_customer` `c` on(`p`.`customer_id` = `c`.`customer_id`)) WHERE `r`.`date_range` * `rm`.`amount` = `p`.`total_payment` ;

-- --------------------------------------------------------

--
-- Structure for view `q_reservation`
--
DROP TABLE IF EXISTS `q_reservation`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q_reservation`  AS SELECT `r`.`reservation_id` AS `reservation_id`, `r`.`customer_id` AS `customer_id`, concat(`c`.`firstname`,' ',`c`.`lastname`) AS `customer_name`, `ro`.`room_id` AS `room_id`, `r`.`reservation_date` AS `reservation_date`, `r`.`date_in` AS `date_in`, `r`.`date_out` AS `date_out`, concat(`r`.`date_in`,' - ',`r`.`date_out`) AS `date_range` FROM ((`tb_reservation` `r` join `tb_customer` `c` on(`r`.`customer_id` = `c`.`customer_id`)) join `tb_room` `ro` on(`r`.`room_id` = `ro`.`room_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `q_reservation_detail`
--
DROP TABLE IF EXISTS `q_reservation_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `q_reservation_detail`  AS SELECT `r`.`reservation_id` AS `reservation_id`, `c`.`customer_id` AS `customer_id`, `r`.`customer_name` AS `customer_name`, `r`.`room_id` AS `room_id`, `r`.`reservation_date` AS `reservation_date`, `r`.`date_in` AS `date_in`, `r`.`date_out` AS `date_out`, to_days(`r`.`date_out`) - to_days(`r`.`date_in`) AS `date_range`, `r`.`status` AS `status` FROM ((`tb_reservation` `r` join `tb_customer` `c` on(`r`.`customer_id` = `c`.`customer_id`)) join `tb_room` `rm` on(`r`.`room_id` = `rm`.`room_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `reservation_details`
--
DROP TABLE IF EXISTS `reservation_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservation_details`  AS SELECT `r`.`reservation_id` AS `reservation_id`, `c`.`customer_id` AS `customer_id`, concat(`c`.`firstname`,' ',`c`.`lastname`) AS `customer_name`, `r`.`room_id` AS `room_id`, `r`.`reservation_date` AS `reservation_date`, `r`.`date_in` AS `date_in`, `r`.`date_out` AS `date_out`, to_days(`r`.`date_out`) - to_days(`r`.`date_in`) AS `date_range`, `r`.`status` AS `status` FROM ((`tb_reservation` `r` join `tb_customer` `c` on(`r`.`customer_id` = `c`.`customer_id`)) join `tb_room` `rm` on(`r`.`room_id` = `rm`.`room_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `tb_emplooyee`
--
ALTER TABLE `tb_emplooyee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `tb_payments`
--
ALTER TABLE `tb_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tb_reports`
--
ALTER TABLE `tb_reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `tb_reservation`
--
ALTER TABLE `tb_reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `tb_room`
--
ALTER TABLE `tb_room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_emplooyee`
--
ALTER TABLE `tb_emplooyee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_payments`
--
ALTER TABLE `tb_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_reports`
--
ALTER TABLE `tb_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_reservation`
--
ALTER TABLE `tb_reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_room`
--
ALTER TABLE `tb_room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
