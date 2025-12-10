-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2025 at 09:26 AM
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
-- Database: `job_search_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `affiliates`
--

CREATE TABLE `affiliates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `affiliates`
--

INSERT INTO `affiliates` (`id`, `name`, `type`, `deleted`) VALUES
(1, '機内設備ツール', 1, NULL),
(2, '接客資格', 2, NULL),
(3, 'キャリアパス: フライトリーダー', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `basic_abilities`
--

CREATE TABLE `basic_abilities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `basic_abilities`
--

INSERT INTO `basic_abilities` (`id`, `name`, `deleted`) VALUES
(1, '判断力', NULL),
(2, 'コミュニケーション能力', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `job_category_id` int(11) DEFAULT NULL,
  `job_type_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `business_skill` text DEFAULT NULL,
  `knowledge` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `activity` text DEFAULT NULL,
  `academic_degree_doctor` tinyint(4) DEFAULT NULL,
  `academic_degree_master` tinyint(4) DEFAULT NULL,
  `academic_degree_professional` tinyint(4) DEFAULT NULL,
  `academic_degree_bachelor` tinyint(4) DEFAULT NULL,
  `salary_statistic_group` text DEFAULT NULL,
  `salary_range_first_year` varchar(100) DEFAULT NULL,
  `salary_range_average` varchar(100) DEFAULT NULL,
  `salary_range_remarks` text DEFAULT NULL,
  `restriction` text DEFAULT NULL,
  `estimated_total_workers` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `seo_keywords` text DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `publish_status` tinyint(4) DEFAULT 1,
  `version` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `media_id`, `job_category_id`, `job_type_id`, `description`, `detail`, `business_skill`, `knowledge`, `location`, `activity`, `academic_degree_doctor`, `academic_degree_master`, `academic_degree_professional`, `academic_degree_bachelor`, `salary_statistic_group`, `salary_range_first_year`, `salary_range_average`, `salary_range_remarks`, `restriction`, `estimated_total_workers`, `remarks`, `url`, `seo_description`, `seo_keywords`, `sort_order`, `publish_status`, `version`, `created_by`, `created`, `modified`, `deleted`) VALUES
(1, '航空会社 キャビンアテンダント', NULL, 1, 1, '機内サービス担当', 'キャビンアテンダントの詳細説明', 'コミュニケーション能力', '航空業界の知識', '東京', 'フライト業務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'キャビンアテンダントに関する給与情報', NULL, NULL, '接客が好きな方歓迎', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL),
(2, 'IT システムエンジニア', NULL, 3, 3, '開発業務', '詳細説明なし', 'Java Skills', 'IT 知識', '大阪', '開発', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '特になし', NULL, NULL, 'リモート可', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_basic_abilities`
--

CREATE TABLE `jobs_basic_abilities` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `basic_ability_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_basic_abilities`
--

INSERT INTO `jobs_basic_abilities` (`id`, `job_id`, `basic_ability_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_career_paths`
--

CREATE TABLE `jobs_career_paths` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_career_paths`
--

INSERT INTO `jobs_career_paths` (`id`, `job_id`, `affiliate_id`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_personalities`
--

CREATE TABLE `jobs_personalities` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `personality_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_personalities`
--

INSERT INTO `jobs_personalities` (`id`, `job_id`, `personality_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_practical_skills`
--

CREATE TABLE `jobs_practical_skills` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `practical_skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_practical_skills`
--

INSERT INTO `jobs_practical_skills` (`id`, `job_id`, `practical_skill_id`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_rec_qualifications`
--

CREATE TABLE `jobs_rec_qualifications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_rec_qualifications`
--

INSERT INTO `jobs_rec_qualifications` (`id`, `job_id`, `affiliate_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_req_qualifications`
--

CREATE TABLE `jobs_req_qualifications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_req_qualifications`
--

INSERT INTO `jobs_req_qualifications` (`id`, `job_id`, `affiliate_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jobs_tools`
--

CREATE TABLE `jobs_tools` (
  `id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs_tools`
--

INSERT INTO `jobs_tools` (`id`, `job_id`, `affiliate_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`id`, `name`, `sort_order`, `created_by`, `created`, `modified`, `deleted`) VALUES
(1, '航空サービス', NULL, NULL, NULL, NULL, NULL),
(2, '医療', NULL, NULL, NULL, NULL, NULL),
(3, 'IT', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job_category_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_types`
--

INSERT INTO `job_types` (`id`, `name`, `job_category_id`, `sort_order`, `created_by`, `created`, `modified`, `deleted`) VALUES
(1, 'キャビンアテンダント', 1, NULL, NULL, NULL, NULL, NULL),
(2, 'グランドスタッフ', 1, NULL, NULL, NULL, NULL, NULL),
(3, 'システムエンジニア', 3, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personalities`
--

CREATE TABLE `personalities` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personalities`
--

INSERT INTO `personalities` (`id`, `name`, `deleted`) VALUES
(1, '明るい性格', NULL),
(2, '丁寧な対応', NULL),
(3, 'キャビンアテンダントに向いている性格', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `practical_skills`
--

CREATE TABLE `practical_skills` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `practical_skills`
--

INSERT INTO `practical_skills` (`id`, `name`, `deleted`) VALUES
(1, '接客スキル', NULL),
(2, '語学力', NULL),
(3, 'キャビンアテンダントに役立つスキル', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affiliates`
--
ALTER TABLE `affiliates`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `affiliates` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `basic_abilities`
--
ALTER TABLE `basic_abilities`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `basic_abilities` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `jobs` ADD FULLTEXT KEY `name` (`name`,`description`,`detail`,`business_skill`,`knowledge`,`location`,`activity`,`salary_range_remarks`,`remarks`);
ALTER TABLE `jobs` ADD FULLTEXT KEY `fulltext_jobs` (`name`,`description`,`detail`,`business_skill`,`knowledge`,`location`,`activity`,`salary_statistic_group`,`salary_range_remarks`,`restriction`,`remarks`);

--
-- Indexes for table `jobs_basic_abilities`
--
ALTER TABLE `jobs_basic_abilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_career_paths`
--
ALTER TABLE `jobs_career_paths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_personalities`
--
ALTER TABLE `jobs_personalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_practical_skills`
--
ALTER TABLE `jobs_practical_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_rec_qualifications`
--
ALTER TABLE `jobs_rec_qualifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_req_qualifications`
--
ALTER TABLE `jobs_req_qualifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs_tools`
--
ALTER TABLE `jobs_tools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `job_categories` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `job_types` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `personalities`
--
ALTER TABLE `personalities`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `personalities` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `practical_skills`
--
ALTER TABLE `practical_skills`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `practical_skills` ADD FULLTEXT KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affiliates`
--
ALTER TABLE `affiliates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `basic_abilities`
--
ALTER TABLE `basic_abilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs_basic_abilities`
--
ALTER TABLE `jobs_basic_abilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs_career_paths`
--
ALTER TABLE `jobs_career_paths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs_personalities`
--
ALTER TABLE `jobs_personalities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs_practical_skills`
--
ALTER TABLE `jobs_practical_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs_rec_qualifications`
--
ALTER TABLE `jobs_rec_qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs_req_qualifications`
--
ALTER TABLE `jobs_req_qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs_tools`
--
ALTER TABLE `jobs_tools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personalities`
--
ALTER TABLE `personalities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `practical_skills`
--
ALTER TABLE `practical_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
