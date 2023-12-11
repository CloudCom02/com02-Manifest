-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema com02
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema com02
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `com02` DEFAULT CHARACTER SET utf8 ;
USE `com02` ;

-- -----------------------------------------------------
-- Table `com02`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `com02`.`user` (
                                              `user_id` BIGINT NOT NULL AUTO_INCREMENT,
                                              `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`user_id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `com02`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `com02`.`device` (
                                                `parent_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                `device_name` VARCHAR(100) NOT NULL,
    `entire_capacity` INT NULL,
    `watt_perhour` FLOAT NULL ,
    `maximum_output` FLOAT NULL,
    `category` VARCHAR(10) NULL,
    `imageurl` VARCHAR(100) NULL,
    `is_registered` BOOLEAN NOT NULL DEFAULT false,
    `user` BIGINT NULL,
    `subDevice` BIGINT NULL,
    PRIMARY KEY (`parent_id`),
    INDEX `fk_Device_User_idx` (`user` ASC) VISIBLE,
    INDEX `fk_Device_Device1_idx` (`subDevice` ASC) VISIBLE,
    CONSTRAINT `fk_Device_User`
    FOREIGN KEY (`user`)
    REFERENCES `com02`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_Device_Device1`
    FOREIGN KEY (`subDevice`)
    REFERENCES `com02`.`device` (`parent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;

INSERT INTO device(device_name,entire_capacity,watt_perhour,maximum_output,category,imageURL) VALUES ('test name',5000,30,15,'testcate','https://item.kakaocdn.net/do/db5af21af268f4ea017a599441f7d90d9f5287469802eca457586a25a096fd31');

-- -----------------------------------------------------
-- Table `com02`.`Capacity_of_User`
-- -----------------------------------------------------
CREATE TABLE `capacity_of_user` (
                                    `user_capacity_id` bigint NOT NULL AUTO_INCREMENT,
                                    `now_capacity` double DEFAULT NULL,
                                    `average_days` float DEFAULT NULL,
                                    `user` bigint NOT NULL,
                                    `parent_device` bigint DEFAULT NULL,
                                    `device_name` varchar(45) DEFAULT NULL,
                                    `category` varchar(45) DEFAULT NULL,
                                    PRIMARY KEY (`user_capacity_id`),
                                    KEY `fk_Capacity_of_User_Device1_idx` (`parent_device`),
                                    KEY `user_idx` (`user`),
                                    CONSTRAINT `FKqkks6n76ntdegoaewo42nx6u7` FOREIGN KEY (`parent_device`) REFERENCES `device` (`parent_id`),
                                    CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
