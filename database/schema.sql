-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2026 at 03:33 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `barangay_case_management_system1`
--

-- --------------------------------------------------------

--
-- Table structure for table `amicable_settlement_conciliation`
--

CREATE TABLE `amicable_settlement_conciliation` (
  `ASC_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Date_entered` date NOT NULL,
  `Member_id` int(11) NOT NULL,
  `Case_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amicable_settlement_mediation`
--

CREATE TABLE `amicable_settlement_mediation` (
  `ASM_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Date_entered` date NOT NULL,
  `PB_id` int(11) NOT NULL,
  `Case_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_schedule`
--

CREATE TABLE `case_schedule` (
  `schedule_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `NoticeOfHearing_FTA_id` int(11) DEFAULT NULL,
  `NoticeOfHearingMP_id` int(11) DEFAULT NULL,
  `NoticeOfHearingCP_id` int(11) DEFAULT NULL,
  `Hearing_type` enum('Mediation','Conciliation','','') NOT NULL,
  `Hearing_date` date NOT NULL,
  `Hearing_time` time NOT NULL,
  `Schedule_status` enum('Completed','Scheduled','','') NOT NULL,
  `Remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_type`
--

CREATE TABLE `case_type` (
  `Case_type_id` int(11) NOT NULL,
  `Case_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complainant`
--

CREATE TABLE `complainant` (
  `Complainant_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Complainant_Lname` varchar(150) NOT NULL,
  `Complainant_Fname` varchar(150) NOT NULL,
  `Complainant_Mname` varchar(150) NOT NULL,
  `comp_addr_id` int(11) NOT NULL,
  `Contact_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_form`
--

CREATE TABLE `complaint_form` (
  `Complaint_id` int(11) NOT NULL,
  `Complainant_id` int(11) NOT NULL,
  `Respondent_id` int(11) NOT NULL,
  `Complaint_reason` text NOT NULL,
  `Relief` text DEFAULT NULL,
  `Brgy_case_no` varchar(50) NOT NULL,
  `Case_type_id` int(11) NOT NULL,
  `Date_of_CreationCF` date NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `OfficialReceipt_no` varchar(50) DEFAULT NULL,
  `PB_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comp_addr_tbl`
--

CREATE TABLE `comp_addr_tbl` (
  `comp_addr_id` int(11) NOT NULL,
  `house_no` varchar(20) DEFAULT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `purok` varchar(50) DEFAULT NULL,
  `barangay` varchar(100) NOT NULL,
  `municipality_city` varchar(100) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ctfa`
--

CREATE TABLE `ctfa` (
  `CTFA_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Date_issued` date NOT NULL,
  `Member_id` int(11) NOT NULL,
  `Complainant_id` int(11) NOT NULL,
  `Respondent_id` int(11) NOT NULL,
  `Case_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lupon_members`
--

CREATE TABLE `lupon_members` (
  `Member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `Member_LName` varchar(150) NOT NULL,
  `Member_Fname` varchar(150) NOT NULL,
  `Member_Mname` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_chosen_pangkat`
--

CREATE TABLE `notice_chosen_pangkat` (
  `ChosenPangkat_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Member_id` int(11) NOT NULL,
  `Selection_Date` date NOT NULL,
  `Date_Received` date DEFAULT NULL,
  `PB_id` int(11) NOT NULL,
  `Case_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_constitution_pangkat`
--

CREATE TABLE `notice_constitution_pangkat` (
  `NFCP_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `NoticeOfHearingCP_id` int(11) NOT NULL,
  `Date_of_Creation` date NOT NULL,
  `PB_id` int(11) NOT NULL,
  `Notif_dateNFCP` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_of_hearing_conciliation`
--

CREATE TABLE `notice_of_hearing_conciliation` (
  `NoticeOfHearingCP_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Member_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `Creation_dateCP` date NOT NULL,
  `Notif_DateCP` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_of_hearing_fta`
--

CREATE TABLE `notice_of_hearing_fta` (
  `NoticeOfHearing_FTA_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `PB_id` int(11) NOT NULL,
  `Date_of_CreationFTA` date NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `Notif_dateFTA` date DEFAULT NULL,
  `Case_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_of_hearing_mediation`
--

CREATE TABLE `notice_of_hearing_mediation` (
  `NoticeOfHearingMP_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `Creation_dateMP` date NOT NULL,
  `PB_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punong_barangay`
--

CREATE TABLE `punong_barangay` (
  `PB_id` int(11) NOT NULL,
  `PB_Lname` varchar(150) NOT NULL,
  `PB_Fname` varchar(50) NOT NULL,
  `PB_Mname` varchar(50) NOT NULL,
  `PB_Aname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `respondent`
--

CREATE TABLE `respondent` (
  `Respondent_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Respondent_Lname` varchar(150) NOT NULL,
  `Respondent_Fname` varchar(150) NOT NULL,
  `Respoondent_Mname` varchar(150) NOT NULL,
  `res_addr_id` int(11) NOT NULL,
  `Contact_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_addr_tbl`
--

CREATE TABLE `res_addr_tbl` (
  `res_addr_id` int(11) NOT NULL,
  `house_no` varchar(20) DEFAULT NULL,
  `street_name` varchar(100) DEFAULT NULL,
  `purok` varchar(50) DEFAULT NULL,
  `barangay` varchar(100) NOT NULL,
  `municipality_city` varchar(100) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_tb`
--

CREATE TABLE `role_tb` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_log`
--

CREATE TABLE `sms_log` (
  `sms_id` int(11) NOT NULL,
  `Complaint_id` int(11) DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `recipient_type` enum('COMPLAINANT','RESPONDENT','OTHER') DEFAULT NULL,
  `direction` enum('IN','OUT') NOT NULL,
  `message` text NOT NULL,
  `send_status` enum('PENDING','SENT','FAILED','RECEIVED') NOT NULL DEFAULT 'PENDING',
  `gateway_ref` varchar(100) DEFAULT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `summon`
--

CREATE TABLE `summon` (
  `Summon_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `Summon_creation_date` date NOT NULL,
  `Complainant_id` int(11) NOT NULL,
  `Respondent_id` int(11) NOT NULL,
  `Case_type_id` int(11) NOT NULL,
  `PB_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking_tb`
--

CREATE TABLE `tracking_tb` (
  `tracking_id` int(11) NOT NULL,
  `Complaint_id` int(11) NOT NULL,
  `trackingtbl_status` enum('For Mediation','For Conciliation','Settled','CTFA') DEFAULT NULL,
  `remark` text NOT NULL,
  `Member_id` int(11) NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_tb`
--

CREATE TABLE `user_tb` (
  `userID` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(11) NOT NULL,
  `email` varchar(55) NOT NULL,
  `contact_no` varchar(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amicable_settlement_conciliation`
--
ALTER TABLE `amicable_settlement_conciliation`
  ADD PRIMARY KEY (`ASC_id`),
  ADD KEY `idx_settlement_conciliation_complaint` (`Complaint_id`),
  ADD KEY `idx_settlement_conciliation_member` (`Member_id`),
  ADD KEY `fk_settlement_conciliation_case_type` (`Case_type_id`);

--
-- Indexes for table `amicable_settlement_mediation`
--
ALTER TABLE `amicable_settlement_mediation`
  ADD PRIMARY KEY (`ASM_id`),
  ADD KEY `idx_settlement_mediation_complaint` (`Complaint_id`),
  ADD KEY `idx_settlement_mediation_pb` (`PB_id`),
  ADD KEY `fk_settlement_mediation_case_type` (`Case_type_id`);

--
-- Indexes for table `case_schedule`
--
ALTER TABLE `case_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `Complaint_id` (`Complaint_id`),
  ADD KEY `NoticeOfHearing_FTA_id` (`NoticeOfHearing_FTA_id`),
  ADD KEY `NoticeOfHearingCP_id` (`NoticeOfHearingCP_id`),
  ADD KEY `NoticeOfHearingMP_id` (`NoticeOfHearingMP_id`);

--
-- Indexes for table `case_type`
--
ALTER TABLE `case_type`
  ADD PRIMARY KEY (`Case_type_id`);

--
-- Indexes for table `complainant`
--
ALTER TABLE `complainant`
  ADD PRIMARY KEY (`Complainant_id`),
  ADD KEY `Complaint_id` (`Complaint_id`),
  ADD KEY `comp_addr_id` (`comp_addr_id`);

--
-- Indexes for table `complaint_form`
--
ALTER TABLE `complaint_form`
  ADD PRIMARY KEY (`Complaint_id`),
  ADD KEY `Case_type_id` (`Case_type_id`),
  ADD KEY `PB_id` (`PB_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `Complainant_id` (`Complainant_id`),
  ADD KEY `Respondent_id` (`Respondent_id`);

--
-- Indexes for table `comp_addr_tbl`
--
ALTER TABLE `comp_addr_tbl`
  ADD PRIMARY KEY (`comp_addr_id`);

--
-- Indexes for table `ctfa`
--
ALTER TABLE `ctfa`
  ADD PRIMARY KEY (`CTFA_id`),
  ADD KEY `idx_ctfa_complaint` (`Complaint_id`),
  ADD KEY `idx_ctfa_member` (`Member_id`),
  ADD KEY `fk_ctfa_complainant` (`Complainant_id`),
  ADD KEY `fk_ctfa_respondent` (`Respondent_id`),
  ADD KEY `fk_ctfa_case_type` (`Case_type_id`);

--
-- Indexes for table `lupon_members`
--
ALTER TABLE `lupon_members`
  ADD PRIMARY KEY (`Member_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `notice_chosen_pangkat`
--
ALTER TABLE `notice_chosen_pangkat`
  ADD PRIMARY KEY (`ChosenPangkat_id`),
  ADD KEY `Complaint_id` (`Complaint_id`),
  ADD KEY `PB_id` (`PB_id`),
  ADD KEY `fk_notice_chosen_pangkat_case_type` (`Case_type_id`),
  ADD KEY `Member_id` (`Member_id`);

--
-- Indexes for table `notice_constitution_pangkat`
--
ALTER TABLE `notice_constitution_pangkat`
  ADD PRIMARY KEY (`NFCP_id`),
  ADD KEY `PB_id` (`PB_id`),
  ADD KEY `Complaint_id` (`Complaint_id`),
  ADD KEY `NoticeOfHearingCP_id` (`NoticeOfHearingCP_id`);

--
-- Indexes for table `notice_of_hearing_conciliation`
--
ALTER TABLE `notice_of_hearing_conciliation`
  ADD PRIMARY KEY (`NoticeOfHearingCP_id`),
  ADD KEY `Member_id` (`Member_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `Complaint_id` (`Complaint_id`);

--
-- Indexes for table `notice_of_hearing_fta`
--
ALTER TABLE `notice_of_hearing_fta`
  ADD PRIMARY KEY (`NoticeOfHearing_FTA_id`),
  ADD KEY `Complaint_id` (`Complaint_id`),
  ADD KEY `PB_id` (`PB_id`),
  ADD KEY `fk_notice_fta_case_type` (`Case_type_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `notice_of_hearing_mediation`
--
ALTER TABLE `notice_of_hearing_mediation`
  ADD PRIMARY KEY (`NoticeOfHearingMP_id`),
  ADD KEY `PB_id` (`PB_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `Complaint_id` (`Complaint_id`);

--
-- Indexes for table `punong_barangay`
--
ALTER TABLE `punong_barangay`
  ADD PRIMARY KEY (`PB_id`);

--
-- Indexes for table `respondent`
--
ALTER TABLE `respondent`
  ADD PRIMARY KEY (`Respondent_id`),
  ADD KEY `Complaint_id` (`Complaint_id`),
  ADD KEY `res_addr_id` (`res_addr_id`);

--
-- Indexes for table `res_addr_tbl`
--
ALTER TABLE `res_addr_tbl`
  ADD PRIMARY KEY (`res_addr_id`);

--
-- Indexes for table `role_tb`
--
ALTER TABLE `role_tb`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sms_log`
--
ALTER TABLE `sms_log`
  ADD PRIMARY KEY (`sms_id`),
  ADD KEY `idx_complaint` (`Complaint_id`),
  ADD KEY `idx_phone` (`phone_number`),
  ADD KEY `idx_status` (`send_status`);

--
-- Indexes for table `summon`
--
ALTER TABLE `summon`
  ADD PRIMARY KEY (`Summon_id`),
  ADD KEY `Complaint_id` (`Complaint_id`),
  ADD KEY `fk_summon_complainant` (`Complainant_id`),
  ADD KEY `fk_summon_respondent` (`Respondent_id`),
  ADD KEY `fk_summon_case_type` (`Case_type_id`),
  ADD KEY `fk_summon_pb` (`PB_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `tracking_tb`
--
ALTER TABLE `tracking_tb`
  ADD PRIMARY KEY (`tracking_id`),
  ADD KEY `complaint_id` (`Complaint_id`),
  ADD KEY `Member_id` (`Member_id`);

--
-- Indexes for table `user_tb`
--
ALTER TABLE `user_tb`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amicable_settlement_conciliation`
--
ALTER TABLE `amicable_settlement_conciliation`
  MODIFY `ASC_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amicable_settlement_mediation`
--
ALTER TABLE `amicable_settlement_mediation`
  MODIFY `ASM_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_schedule`
--
ALTER TABLE `case_schedule`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_type`
--
ALTER TABLE `case_type`
  MODIFY `Case_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complainant`
--
ALTER TABLE `complainant`
  MODIFY `Complainant_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_form`
--
ALTER TABLE `complaint_form`
  MODIFY `Complaint_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comp_addr_tbl`
--
ALTER TABLE `comp_addr_tbl`
  MODIFY `comp_addr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ctfa`
--
ALTER TABLE `ctfa`
  MODIFY `CTFA_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lupon_members`
--
ALTER TABLE `lupon_members`
  MODIFY `Member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_chosen_pangkat`
--
ALTER TABLE `notice_chosen_pangkat`
  MODIFY `ChosenPangkat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_constitution_pangkat`
--
ALTER TABLE `notice_constitution_pangkat`
  MODIFY `NFCP_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_of_hearing_conciliation`
--
ALTER TABLE `notice_of_hearing_conciliation`
  MODIFY `NoticeOfHearingCP_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_of_hearing_fta`
--
ALTER TABLE `notice_of_hearing_fta`
  MODIFY `NoticeOfHearing_FTA_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_of_hearing_mediation`
--
ALTER TABLE `notice_of_hearing_mediation`
  MODIFY `NoticeOfHearingMP_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `punong_barangay`
--
ALTER TABLE `punong_barangay`
  MODIFY `PB_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `respondent`
--
ALTER TABLE `respondent`
  MODIFY `Respondent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `res_addr_tbl`
--
ALTER TABLE `res_addr_tbl`
  MODIFY `res_addr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_tb`
--
ALTER TABLE `role_tb`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_log`
--
ALTER TABLE `sms_log`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `summon`
--
ALTER TABLE `summon`
  MODIFY `Summon_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking_tb`
--
ALTER TABLE `tracking_tb`
  MODIFY `tracking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tb`
--
ALTER TABLE `user_tb`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amicable_settlement_conciliation`
--
ALTER TABLE `amicable_settlement_conciliation`
  ADD CONSTRAINT `fk_settlement_conciliation_case_type` FOREIGN KEY (`Case_type_id`) REFERENCES `case_type` (`Case_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_settlement_conciliation_complaint` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_settlement_conciliation_member` FOREIGN KEY (`Member_id`) REFERENCES `lupon_members` (`Member_id`) ON UPDATE CASCADE;

--
-- Constraints for table `amicable_settlement_mediation`
--
ALTER TABLE `amicable_settlement_mediation`
  ADD CONSTRAINT `fk_settlement_mediation_case_type` FOREIGN KEY (`Case_type_id`) REFERENCES `case_type` (`Case_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_settlement_mediation_complaint` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_settlement_mediation_pb` FOREIGN KEY (`PB_id`) REFERENCES `punong_barangay` (`PB_id`) ON UPDATE CASCADE;

--
-- Constraints for table `case_schedule`
--
ALTER TABLE `case_schedule`
  ADD CONSTRAINT `case_schedule_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `case_schedule_ibfk_2` FOREIGN KEY (`NoticeOfHearing_FTA_id`) REFERENCES `notice_of_hearing_fta` (`NoticeOfHearing_FTA_id`),
  ADD CONSTRAINT `case_schedule_ibfk_3` FOREIGN KEY (`NoticeOfHearingCP_id`) REFERENCES `notice_of_hearing_conciliation` (`NoticeOfHearingCP_id`),
  ADD CONSTRAINT `case_schedule_ibfk_4` FOREIGN KEY (`NoticeOfHearingMP_id`) REFERENCES `notice_of_hearing_mediation` (`NoticeOfHearingMP_id`);

--
-- Constraints for table `complainant`
--
ALTER TABLE `complainant`
  ADD CONSTRAINT `complainant_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `complainant_ibfk_2` FOREIGN KEY (`comp_addr_id`) REFERENCES `comp_addr_tbl` (`comp_addr_id`);

--
-- Constraints for table `complaint_form`
--
ALTER TABLE `complaint_form`
  ADD CONSTRAINT `complaint_form_ibfk_3` FOREIGN KEY (`Case_type_id`) REFERENCES `case_type` (`Case_type_id`),
  ADD CONSTRAINT `complaint_form_ibfk_4` FOREIGN KEY (`PB_id`) REFERENCES `punong_barangay` (`PB_id`),
  ADD CONSTRAINT `complaint_form_ibfk_5` FOREIGN KEY (`schedule_id`) REFERENCES `case_schedule` (`schedule_id`),
  ADD CONSTRAINT `complaint_form_ibfk_6` FOREIGN KEY (`Complainant_id`) REFERENCES `complainant` (`Complainant_id`),
  ADD CONSTRAINT `complaint_form_ibfk_7` FOREIGN KEY (`Respondent_id`) REFERENCES `respondent` (`Respondent_id`);

--
-- Constraints for table `ctfa`
--
ALTER TABLE `ctfa`
  ADD CONSTRAINT `fk_ctfa_case_type` FOREIGN KEY (`Case_type_id`) REFERENCES `case_type` (`Case_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ctfa_complainant` FOREIGN KEY (`Complainant_id`) REFERENCES `complainant` (`Complainant_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ctfa_complaint` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ctfa_member` FOREIGN KEY (`Member_id`) REFERENCES `lupon_members` (`Member_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ctfa_respondent` FOREIGN KEY (`Respondent_id`) REFERENCES `respondent` (`Respondent_id`) ON UPDATE CASCADE;

--
-- Constraints for table `lupon_members`
--
ALTER TABLE `lupon_members`
  ADD CONSTRAINT `lupon_members_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_tb` (`role_id`);

--
-- Constraints for table `notice_chosen_pangkat`
--
ALTER TABLE `notice_chosen_pangkat`
  ADD CONSTRAINT `fk_notice_chosen_pangkat_case_type` FOREIGN KEY (`Case_type_id`) REFERENCES `case_type` (`Case_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notice_chosen_pangkat_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `notice_chosen_pangkat_ibfk_2` FOREIGN KEY (`PB_id`) REFERENCES `punong_barangay` (`PB_id`),
  ADD CONSTRAINT `notice_chosen_pangkat_ibfk_3` FOREIGN KEY (`Member_id`) REFERENCES `lupon_members` (`Member_id`);

--
-- Constraints for table `notice_constitution_pangkat`
--
ALTER TABLE `notice_constitution_pangkat`
  ADD CONSTRAINT `notice_constitution_pangkat_ibfk_2` FOREIGN KEY (`PB_id`) REFERENCES `punong_barangay` (`PB_id`),
  ADD CONSTRAINT `notice_constitution_pangkat_ibfk_3` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `notice_constitution_pangkat_ibfk_4` FOREIGN KEY (`NoticeOfHearingCP_id`) REFERENCES `notice_of_hearing_conciliation` (`NoticeOfHearingCP_id`);

--
-- Constraints for table `notice_of_hearing_conciliation`
--
ALTER TABLE `notice_of_hearing_conciliation`
  ADD CONSTRAINT `notice_of_hearing_conciliation_ibfk_1` FOREIGN KEY (`Member_id`) REFERENCES `lupon_members` (`Member_id`),
  ADD CONSTRAINT `notice_of_hearing_conciliation_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `case_schedule` (`schedule_id`),
  ADD CONSTRAINT `notice_of_hearing_conciliation_ibfk_3` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`);

--
-- Constraints for table `notice_of_hearing_fta`
--
ALTER TABLE `notice_of_hearing_fta`
  ADD CONSTRAINT `fk_notice_fta_case_type` FOREIGN KEY (`Case_type_id`) REFERENCES `case_type` (`Case_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notice_of_hearing_fta_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `notice_of_hearing_fta_ibfk_2` FOREIGN KEY (`PB_id`) REFERENCES `punong_barangay` (`PB_id`),
  ADD CONSTRAINT `notice_of_hearing_fta_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `case_schedule` (`schedule_id`);

--
-- Constraints for table `notice_of_hearing_mediation`
--
ALTER TABLE `notice_of_hearing_mediation`
  ADD CONSTRAINT `notice_of_hearing_mediation_ibfk_2` FOREIGN KEY (`PB_id`) REFERENCES `punong_barangay` (`PB_id`),
  ADD CONSTRAINT `notice_of_hearing_mediation_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `case_schedule` (`schedule_id`),
  ADD CONSTRAINT `notice_of_hearing_mediation_ibfk_4` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`);

--
-- Constraints for table `respondent`
--
ALTER TABLE `respondent`
  ADD CONSTRAINT `respondent_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `respondent_ibfk_2` FOREIGN KEY (`res_addr_id`) REFERENCES `res_addr_tbl` (`res_addr_id`);

--
-- Constraints for table `sms_log`
--
ALTER TABLE `sms_log`
  ADD CONSTRAINT `fk_sms_complaint` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `summon`
--
ALTER TABLE `summon`
  ADD CONSTRAINT `fk_summon_case_type` FOREIGN KEY (`Case_type_id`) REFERENCES `case_type` (`Case_type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_summon_complainant` FOREIGN KEY (`Complainant_id`) REFERENCES `complainant` (`Complainant_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_summon_pb` FOREIGN KEY (`PB_id`) REFERENCES `punong_barangay` (`PB_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_summon_respondent` FOREIGN KEY (`Respondent_id`) REFERENCES `respondent` (`Respondent_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `summon_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `summon_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `case_schedule` (`schedule_id`);

--
-- Constraints for table `tracking_tb`
--
ALTER TABLE `tracking_tb`
  ADD CONSTRAINT `tracking_tb_ibfk_1` FOREIGN KEY (`Complaint_id`) REFERENCES `complaint_form` (`Complaint_id`),
  ADD CONSTRAINT `tracking_tb_ibfk_2` FOREIGN KEY (`Member_id`) REFERENCES `lupon_members` (`Member_id`);

--
-- Constraints for table `user_tb`
--
ALTER TABLE `user_tb`
  ADD CONSTRAINT `user_tb_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_tb` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
