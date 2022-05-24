-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 24, 2022 at 09:47 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `wsf`
--

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `command_id` int(255) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `cheese_id` varchar(255) NOT NULL,
  `cheese_name` varchar(20) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fromage`
--

CREATE TABLE `fromage` (
  `cheese_id` int(255) NOT NULL,
  `cheese_name` varchar(30) NOT NULL,
  `family` varchar(20) NOT NULL,
  `milk` varchar(10) NOT NULL,
  `sigle` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fromage`
--

INSERT INTO `fromage` (`cheese_id`, `cheese_name`, `family`, `milk`, `sigle`) VALUES
(1, 'Munster', 'Molle à croûte lavée', 'Vache', 'AOP'),
(2, 'Munster', 'Molle à croûte lavée', 'Vache', 'AOP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`command_id`),
  ADD KEY `cheese_select` (`cheese_id`,`cheese_name`),
  ADD KEY `cheese_name_select` (`cheese_name`);

--
-- Indexes for table `fromage`
--
ALTER TABLE `fromage`
  ADD PRIMARY KEY (`cheese_id`),
  ADD KEY `cheese_name` (`cheese_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `command_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fromage`
--
ALTER TABLE `fromage`
  MODIFY `cheese_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `cheese_name_select` FOREIGN KEY (`cheese_name`) REFERENCES `fromage` (`cheese_name`);
