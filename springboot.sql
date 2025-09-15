-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.8.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

test_springboot
-- test_springboot 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `test_springboot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `test_springboot`;

-- 테이블 test_springboot.springboot_traffic 구조 내보내기
CREATE TABLE IF NOT EXISTS `springboot_traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `req_class` varchar(200) DEFAULT NULL,
  `req_method` varchar(50) DEFAULT NULL,
  `req_time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 test_springboot.springboot_traffic:~11 rows (대략적) 내보내기
DELETE FROM `springboot_traffic`;
INSERT INTO `springboot_traffic` (`id`, `req_class`, `req_method`, `req_time`) VALUES
	(29, 'test_class', 'req_method', '2025-09-11 07:57:53'),
	(30, 'test_class', 'req_method', '2025-09-11 07:57:53'),
	(31, 'test_class', 'req_method', '2025-09-11 07:57:53'),
	(32, 'test_class', 'req_method', '2025-09-11 07:57:54'),
	(33, 'test_class', 'req_method', '2025-09-11 07:57:54'),
	(34, 'test_class', 'req_method', '2025-09-11 07:57:54'),
	(35, 'test_class', 'req_method', '2025-09-11 07:57:54'),
	(36, 'postman_class', 'post', '2025-09-11 08:00:27'),
	(37, 'postman_class', 'post', '2025-09-11 08:00:28'),
	(38, 'postman_class', 'post', '2025-09-11 08:00:28'),
	(39, 'postman_class', 'post', '2025-09-11 08:00:29');

-- 테이블 test_springboot.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 테이블 데이터 test_springboot.user:~4 rows (대략적) 내보내기
DELETE FROM `user`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `created_at`, `updated_at`) VALUES
	(5, 'qwer', '1234', 'qwer@1234', '2025-09-11 07:05:47', '2025-09-11 07:05:47'),
	(6, 'asdf', '568', 'asdf@7890', '2025-09-11 07:06:12', '2025-09-11 07:06:12'),
	(7, '이희만w', '1243', 'hahajava@naver.comm', '2025-09-11 07:40:20', '2025-09-11 07:42:37'),
	(9, '이희만', '1243', 'hahajava@naver.com', '2025-09-11 07:41:06', '2025-09-11 07:41:06');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
