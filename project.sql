-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2021 at 03:31 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `fullname`) VALUES
(2, 'Nikolaos Avrantinis');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_id` int(50) NOT NULL,
  `patient_id` int(50) NOT NULL,
  `app_type` enum('visit','tests','covid_vaccine','') NOT NULL,
  `app_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_id`, `patient_id`, `app_type`, `app_date`) VALUES
(1, 3, 'tests', '2021-06-10 10:00:00'),
(3, 3, 'visit', '2021-06-10 10:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `asks_for`
--

CREATE TABLE `asks_for` (
  `doctor_id` int(50) NOT NULL,
  `supply_id` int(50) NOT NULL,
  `quantity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asks_for`
--

INSERT INTO `asks_for` (`doctor_id`, `supply_id`, `quantity`) VALUES
(4, 2, 30);

-- --------------------------------------------------------

--
-- Table structure for table `covid_vaccine`
--

CREATE TABLE `covid_vaccine` (
  `vacc_app_id` int(50) NOT NULL,
  `vacc_man_id` int(50) NOT NULL,
  `vaccine_title` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diagnosis_id` int(50) NOT NULL,
  `doctor_id` int(50) NOT NULL,
  `patient_id` int(50) NOT NULL,
  `textbox` text DEFAULT NULL,
  `diagnosis_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`diagnosis_id`, `doctor_id`, `patient_id`, `textbox`, `diagnosis_date`) VALUES
(1, 4, 3, 'Too sick!!', '2021-05-31 16:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(15) NOT NULL,
  `speciality` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `speciality`) VALUES
(4, 'urologist');

-- --------------------------------------------------------

--
-- Table structure for table `lab_analyst`
--

CREATE TABLE `lab_analyst` (
  `lab_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lab_analyst`
--

INSERT INTO `lab_analyst` (`lab_id`) VALUES
(6);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(50) NOT NULL,
  `admin_id` int(5) NOT NULL,
  `supply_id` int(50) DEFAULT NULL,
  `quantity` int(20) DEFAULT NULL,
  `bill` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `admin_id`, `supply_id`, `quantity`, `bill`) VALUES
(2, 2, 1, 100, 200);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(50) NOT NULL,
  `amka` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `amka`) VALUES
(3, '3735638');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(50) NOT NULL,
  `doctor_id` int(50) NOT NULL,
  `patient_id` int(50) NOT NULL,
  `medicine` text NOT NULL,
  `instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `doctor_id`, `patient_id`, `medicine`, `instructions`) VALUES
(1, 4, 3, 'Depon', 'Don\'t take the whole box.');

-- --------------------------------------------------------

--
-- Table structure for table `reception`
--

CREATE TABLE `reception` (
  `reception_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reception`
--

INSERT INTO `reception` (`reception_id`) VALUES
(5);

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE `supplies` (
  `supply_id` int(50) NOT NULL,
  `supply` varchar(50) NOT NULL,
  `stock` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplies`
--

INSERT INTO `supplies` (`supply_id`, `supply`, `stock`) VALUES
(1, 'gloves', 1000),
(2, 'masks', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL,
  `lab_id` int(50) NOT NULL,
  `test_title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_id`, `lab_id`, `test_title`) VALUES
(1, 6, 'blood');

-- --------------------------------------------------------

--
-- Table structure for table `test_results`
--

CREATE TABLE `test_results` (
  `test_id` int(50) NOT NULL,
  `patient_id` int(50) NOT NULL,
  `test_title` varchar(50) NOT NULL,
  `test_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_results`
--

INSERT INTO `test_results` (`test_id`, `patient_id`, `test_title`, `test_date`) VALUES
(1, 3, 'blood', '2021-05-31 16:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(50) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `e-mail` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(20) NOT NULL DEFAULT 'X',
  `phone_num` text DEFAULT NULL,
  `user_type` enum('patient','admin','doctor','reception','lab analyst','vaccines manager') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `first_name`, `last_name`, `e-mail`, `birthday`, `password`, `phone_num`, `user_type`) VALUES
(2, 'NikolasAvra', 'Nikolaos', 'Avrantinis', 'nikolas.avra@gmail.com', '1999-03-01', '12345', '6948418105', 'admin'),
(3, 'AlexKou', 'Alexandros', 'Koutsoukos', 'alexkou10@gmail.com', '1999-10-02', '1234567', '6983848575', 'patient'),
(4, 'MarinosGiz', 'Marinos', 'Gizas', 'marinos16@gmail.com', '1998-03-02', 'marinos', '6984457765', 'doctor'),
(5, 'CharaVas', 'Chara', 'Vasilakopoulou', 'charavasilak93@gmail.com', '1999-10-10', 'charavas', NULL, 'reception'),
(6, 'Venogrom', 'George', 'Nikolakopoulos', 'venogrom33@hotmail.com', '1999-05-12', 'venogrom', NULL, 'lab analyst'),
(7, 'Bliaro', 'Vasilios', 'Liarommatis', 'bliaro13@yahoo.com', '1998-02-07', 'pao13', '6945637587', 'vaccines manager');

-- --------------------------------------------------------

--
-- Table structure for table `vaccines_manager`
--

CREATE TABLE `vaccines_manager` (
  `vacc_man_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccines_manager`
--

INSERT INTO `vaccines_manager` (`vacc_man_id`) VALUES
(7);

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`visit_id`, `doctor_id`) VALUES
(3, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `asks_for`
--
ALTER TABLE `asks_for`
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `supply_id` (`supply_id`);

--
-- Indexes for table `covid_vaccine`
--
ALTER TABLE `covid_vaccine`
  ADD KEY `vacc_app_id` (`vacc_app_id`),
  ADD KEY `vacc_man_id` (`vacc_man_id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diagnosis_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `lab_analyst`
--
ALTER TABLE `lab_analyst`
  ADD KEY `lab_id` (`lab_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `supply_id` (`supply_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `reception`
--
ALTER TABLE `reception`
  ADD KEY `reception_id` (`reception_id`);

--
-- Indexes for table `supplies`
--
ALTER TABLE `supplies`
  ADD PRIMARY KEY (`supply_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD KEY `lab_id` (`lab_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `test_results`
--
ALTER TABLE `test_results`
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vaccines_manager`
--
ALTER TABLE `vaccines_manager`
  ADD KEY `vacc_man_id` (`vacc_man_id`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD KEY `visit_id` (`visit_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `app_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `diagnosis_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplies`
--
ALTER TABLE `supplies`
  MODIFY `supply_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `asks_for`
--
ALTER TABLE `asks_for`
  ADD CONSTRAINT `asks_for_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asks_for_ibfk_4` FOREIGN KEY (`supply_id`) REFERENCES `supplies` (`supply_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `covid_vaccine`
--
ALTER TABLE `covid_vaccine`
  ADD CONSTRAINT `covid_vaccine_ibfk_1` FOREIGN KEY (`vacc_app_id`) REFERENCES `appointment` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `covid_vaccine_ibfk_2` FOREIGN KEY (`vacc_man_id`) REFERENCES `vaccines_manager` (`vacc_man_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `diagnosis_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lab_analyst`
--
ALTER TABLE `lab_analyst`
  ADD CONSTRAINT `lab_analyst_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`supply_id`) REFERENCES `supplies` (`supply_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prescription_ibfk_4` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reception`
--
ALTER TABLE `reception`
  ADD CONSTRAINT `reception_ibfk_1` FOREIGN KEY (`reception_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `lab_analyst` (`lab_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tests_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `appointment` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_results`
--
ALTER TABLE `test_results`
  ADD CONSTRAINT `test_results_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test_results_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vaccines_manager`
--
ALTER TABLE `vaccines_manager`
  ADD CONSTRAINT `vaccines_manager_ibfk_1` FOREIGN KEY (`vacc_man_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `appointment` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
