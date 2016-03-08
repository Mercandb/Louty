SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema louty
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `louty` ;
CREATE SCHEMA IF NOT EXISTS `louty` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `louty` ;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `date_creation` DATETIME NULL,
  `date_last_connection` DATETIME NULL,
  `first_name` VARCHAR(100) NULL,
  `last_name` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `age` TINYINT NULL,
  `sexe` TINYINT(1) NULL,
  `admin` TINYINT(1) NOT NULL DEFAULT '0',
  `description` VARCHAR(999) NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Article` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Article` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_section` INT NULL,
  `title` VARCHAR(500) NULL,
  `visibility` TINYINT NOT NULL DEFAULT 1,
  `public` TINYINT NOT NULL DEFAULT 0,
  `date_creation` DATETIME NULL,
  `type` VARCHAR(60) NULL,
  `content` VARCHAR(9999) NULL,
  `id_user_creator` INT NOT NULL,
  `description` VARCHAR(999) NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Section` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Section` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(500) NOT NULL,
  `visibility` TINYINT NOT NULL DEFAULT 1,
  `public` TINYINT NOT NULL DEFAULT 0,
  `date_creation` DATETIME NULL,
  `id_user_creator` INT NOT NULL,
  `description` VARCHAR(999) NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `File`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `File` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `File` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_article` INT NULL,
  `url` VARCHAR(500) NOT NULL,
  `name` VARCHAR(500) NOT NULL,
  `size` INT UNSIGNED NOT NULL DEFAULT 0,
  `visibility` TINYINT NOT NULL DEFAULT 1,
  `public` TINYINT NOT NULL DEFAULT 0,
  `date_creation` DATETIME NULL,
  `type` VARCHAR(60) NULL,
  `content` VARCHAR(9999) NULL,
  `number_read` INT UNSIGNED NULL,
  `number_download` INT UNSIGNED NULL,
  `directory` TINYINT NOT NULL DEFAULT 0,
  `id_user_creator` INT NOT NULL,
  `id_file_parent` INT NOT NULL DEFAULT -1,
  `description` VARCHAR(999) NULL,
  PRIMARY KEY (`id`))
ENGINE = MyISAM;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
