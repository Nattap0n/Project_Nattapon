-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2023 at 07:08 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_tbl`
--

CREATE TABLE `post_tbl` (
  `id` int(11) NOT NULL,
  `post_by` int(11) NOT NULL COMMENT 'คนที่ post',
  `post_date` date NOT NULL COMMENT 'วันที่ ',
  `post_topic` varchar(255) NOT NULL COMMENT 'หัวข้อ',
  `post_content` varchar(255) NOT NULL COMMENT 'เนื้อหา',
  `post_banner` varchar(255) NOT NULL,
  `post_cat` int(11) NOT NULL COMMENT 'หมวดหมู่',
  `post_view` int(11) NOT NULL COMMENT 'จำนวนคนเข้าดู',
  `post_rating` varchar(255) NOT NULL COMMENT 'คะเเนน',
  `post_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `report_tbl`
--

CREATE TABLE `report_tbl` (
  `id` int(11) NOT NULL,
  `report_topic` varchar(255) NOT NULL,
  `report_content` varchar(255) NOT NULL,
  `report_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL COMMENT 'เก็บ id',
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `std_no` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL,
  `reg_date` datetime NOT NULL,
  `img_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `lname`, `std_no`, `email`, `pass`, `status`, `reg_date`, `img_user`) VALUES
(4, 'อังศุธร', 'โพธิ์สุ', '62114340410', 'monkung.mullet@gmail.com', '$2y$12$MbBfFw/koe/YgTQWXTb1X.ZTMUtTU01hIgvh6/wpfiZWzO1MYZWXm', 'Member', '2022-12-06 02:21:53', ''),
(5, 'ณัฐพล', 'จุฬา', '62114340786', 'nattapon.ch.62@ubu.ac.th', '$2y$12$2hcsTDm5BANfesQdZ80NC.MPEQS.jQPQjQ6jOC4FVPJlt/jEIUwPy', 'Member', '2022-12-06 05:00:38', '');

-- --------------------------------------------------------

--
-- Table structure for table `view_tbl`
--

CREATE TABLE `view_tbl` (
  `id` int(11) NOT NULL,
  `view_ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tbl`
--
ALTER TABLE `post_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_tbl`
--
ALTER TABLE `report_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_by_index` (`report_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `view_tbl`
--
ALTER TABLE `view_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_tbl`
--
ALTER TABLE `post_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `report_tbl`
--
ALTER TABLE `report_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'เก็บ id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `view_tbl`
--
ALTER TABLE `view_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post_tbl`
--
ALTER TABLE `post_tbl`
  ADD CONSTRAINT `post_tbl_ibfk_1` FOREIGN KEY (`post_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `post_tbl_ibfk_2` FOREIGN KEY (`post_cat`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `post_tbl_ibfk_3` FOREIGN KEY (`post_view`) REFERENCES `view_tbl` (`id`);

--
-- Constraints for table `report_tbl`
--
ALTER TABLE `report_tbl`
  ADD CONSTRAINT `report_tbl_ibfk_1` FOREIGN KEY (`report_by`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
