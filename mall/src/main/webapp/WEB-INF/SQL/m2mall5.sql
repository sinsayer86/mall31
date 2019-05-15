-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- m2mall 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `m2mall` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `m2mall`;


-- 테이블 m2mall의 구조를 덤프합니다. board
CREATE TABLE IF NOT EXISTS `board` (
  `board_no` int(10) NOT NULL AUTO_INCREMENT,
  `board_pw` varchar(50) NOT NULL,
  `board_title` varchar(200) NOT NULL,
  `board_content` text NOT NULL,
  `board_user` varchar(50) NOT NULL,
  `board_date` date NOT NULL,
  PRIMARY KEY (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. board_comment
CREATE TABLE IF NOT EXISTS `board_comment` (
  `board_comment_no` int(10) NOT NULL AUTO_INCREMENT,
  `board_no` int(10) NOT NULL,
  `board_comment_pw` varchar(50) NOT NULL,
  `board_comment_content` varchar(500) NOT NULL,
  `board_comment_user` varchar(50) NOT NULL,
  PRIMARY KEY (`board_comment_no`),
  KEY `FK_board_comment_board_no` (`board_no`),
  CONSTRAINT `FK_board_comment_board_no` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. board_file
CREATE TABLE IF NOT EXISTS `board_file` (
  `board_file_no` int(10) NOT NULL AUTO_INCREMENT,
  `board_no` int(10) NOT NULL,
  `board_file_origin_name` varchar(500) NOT NULL,
  `board_file_save_name` varchar(500) NOT NULL,
  `board_file_ext` varchar(50) NOT NULL,
  `board_file_size` bigint(20) NOT NULL,
  `board_file_type` varchar(100) NOT NULL,
  PRIMARY KEY (`board_file_no`),
  KEY `FK_board_file_board_no` (`board_no`),
  CONSTRAINT `FK_board_file_board_no` FOREIGN KEY (`board_no`) REFERENCES `board` (`board_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. cart
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) NOT NULL,
  `product_no` int(11) NOT NULL,
  `cart_count` int(11) NOT NULL,
  PRIMARY KEY (`cart_no`),
  KEY `fk_cart_product_no_idx` (`product_no`),
  KEY `fk_cart_member_no_idx` (`member_no`),
  CONSTRAINT `fk_cart_member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `fk_cart_product_no` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. category
CREATE TABLE IF NOT EXISTS `category` (
  `category_no` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(45) NOT NULL,
  `member_pw` varchar(45) NOT NULL,
  `member_name` varchar(45) NOT NULL,
  `member_phone` varchar(45) NOT NULL,
  `member_address` varchar(45) NOT NULL,
  `member_gender` varchar(45) NOT NULL,
  `member_email` varchar(200) NOT NULL,
  `member_level` varchar(45) NOT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `member_id` (`member_id`),
  UNIQUE KEY `member_email` (`member_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. member_consumer
CREATE TABLE IF NOT EXISTS `member_consumer` (
  `member_no` int(11) NOT NULL,
  `member_consumer_date_of_birth` varchar(45) NOT NULL,
  PRIMARY KEY (`member_no`),
  CONSTRAINT `fk_member_consumer_member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. member_employee
CREATE TABLE IF NOT EXISTS `member_employee` (
  `member_no` int(11) NOT NULL,
  `member_employee_rank` varchar(45) NOT NULL,
  PRIMARY KEY (`member_no`),
  CONSTRAINT `fk_member_employee_member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. member_out_id
CREATE TABLE IF NOT EXISTS `member_out_id` (
  `member_out_id_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  PRIMARY KEY (`member_out_id_no`),
  UNIQUE KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. notice
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_no` int(10) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(50) DEFAULT NULL,
  `notice_content` varchar(50) DEFAULT NULL,
  `notice_date` date DEFAULT NULL,
  `notice_writer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`notice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) NOT NULL,
  `orders_total_price` int(11) NOT NULL,
  `orders_date` date NOT NULL,
  `orders_phone` varchar(45) NOT NULL,
  `orders_address` varchar(45) NOT NULL,
  `payment_state` varchar(45) NOT NULL,
  PRIMARY KEY (`orders_no`),
  KEY `fk_orders_member_no_idx` (`member_no`),
  CONSTRAINT `fk_orders_member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. orders_product
CREATE TABLE IF NOT EXISTS `orders_product` (
  `orders_product_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_no` int(11) NOT NULL,
  `product_no` int(11) NOT NULL,
  `orders_product_price` int(11) NOT NULL,
  `orders_product_count` int(11) NOT NULL,
  `orders_no` int(11) NOT NULL,
  PRIMARY KEY (`orders_product_no`),
  KEY `fk_order_product_product_no_idx` (`product_no`),
  KEY `fk_orders_product_orders_no_idx` (`orders_no`),
  KEY `fk_orders_product_orders_product_idx` (`member_no`),
  CONSTRAINT `fk_orders_product_orders_no` FOREIGN KEY (`orders_no`) REFERENCES `orders` (`orders_no`),
  CONSTRAINT `fk_orders_product_orders_product` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `fk_orders_product_product_no` FOREIGN KEY (`product_no`) REFERENCES `product` (`product_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. payment
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_no` int(11) NOT NULL AUTO_INCREMENT,
  `orders_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_no`),
  KEY `fk_payment_orders_no_idx` (`orders_no`),
  KEY `fk_payemnt_member_no_idx` (`member_no`),
  CONSTRAINT `fk_payemnt_member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `fk_payment_orders_no` FOREIGN KEY (`orders_no`) REFERENCES `orders` (`orders_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. product
CREATE TABLE IF NOT EXISTS `product` (
  `product_no` int(11) NOT NULL AUTO_INCREMENT,
  `product_common_no` int(11) NOT NULL,
  `product_color` varchar(45) NOT NULL,
  `product_size` varchar(45) NOT NULL,
  `product_stock` int(11) NOT NULL,
  PRIMARY KEY (`product_no`),
  KEY `fk_product_product_common_no_idx` (`product_common_no`),
  CONSTRAINT `fk_product_product_common_no` FOREIGN KEY (`product_common_no`) REFERENCES `product_common` (`product_common_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.


-- 테이블 m2mall의 구조를 덤프합니다. product_common
CREATE TABLE IF NOT EXISTS `product_common` (
  `product_common_no` int(11) NOT NULL AUTO_INCREMENT,
  `category_no` int(11) NOT NULL,
  `product_common_name` varchar(45) NOT NULL,
  `product_common_price` int(11) NOT NULL,
  `product_common_description` varchar(45) NOT NULL,
  `product_common_date` date NOT NULL,
  PRIMARY KEY (`product_common_no`),
  KEY `fk_product_common_category_no_idx` (`category_no`),
  CONSTRAINT `fk_product_common_category_no` FOREIGN KEY (`category_no`) REFERENCES `category` (`category_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 내보낼 데이터가 선택되어 있지 않습니다.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
