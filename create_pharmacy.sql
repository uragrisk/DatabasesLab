-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hryshkin_7_v56
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hryshkin_7_v56
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hryshkin_7_v56` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hryshkin_7_v56` ;

-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`effect_zone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`effect_zone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NOT NULL,
  `identity_number` VARCHAR(20) NOT NULL,
  `passport_data` VARCHAR(20) NOT NULL,
  `experience` DECIMAL(10,1) NOT NULL,
  `birth_date` DATE NOT NULL,
  `post_id` VARCHAR(25) NOT NULL,
  `pharmacy_id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`medicine_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`medicine_list` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `ministry_code` VARCHAR(10) NOT NULL,
  `require_recipe` TINYINT NOT NULL,
  `is_narcotic` TINYINT NULL DEFAULT NULL,
  `is_psychtropic` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`medicine_zone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`medicine_zone` (
  `medicine_id` INT NOT NULL,
  `zone_id` INT NOT NULL,
  PRIMARY KEY (`medicine_id`, `zone_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`pharmacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`pharmacy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `street_id` VARCHAR(45) NOT NULL,
  `building_number` INT NOT NULL,
  `web_adress` VARCHAR(45) NULL DEFAULT NULL,
  `work_time_open` TIME NOT NULL,
  `work_time_close` TIME NOT NULL,
  `is_open_saturday` TINYINT NOT NULL,
  `is_open_sunday` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`pharmaсy_has_medicine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`pharmaсy_has_medicine` (
  `pharmacy_id` INT NOT NULL,
  `medicine_id` INT NOT NULL,
  PRIMARY KEY (`pharmacy_id`, `medicine_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hryshkin_7_v56`.`street`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hryshkin_7_v56`.`street` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
