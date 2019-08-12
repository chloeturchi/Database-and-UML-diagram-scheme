-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ef_database
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ef_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ef_database` DEFAULT CHARACTER SET utf8 ;
USE `ef_database` ;

-- -----------------------------------------------------
-- Table `ef_database`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `creation_date` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`administrator` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `creation_date` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`deliverer_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`deliverer_state` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`deliverer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`deliverer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `creation_date` DATE NOT NULL,
  `latitude` REAL NOT NULL,
  `longitude` REAL NOT NULL,
  `deliverer_state_id` INT NOT NULL,
  PRIMARY KEY (`id`, `deliverer_state_id`),
  INDEX `fk_deliverer_deliverer_state1_idx` (`deliverer_state_id` ASC) VISIBLE,
  CONSTRAINT `fk_deliverer_deliverer_state1`
    FOREIGN KEY (`deliverer_state_id`)
    REFERENCES `ef_database`.`deliverer_state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`address` (
  `id` INT NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `building` VARCHAR(45) NULL,
  `zip_code` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `instructions` TEXT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`, `customer_id`),
  INDEX `fk_address_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ef_database`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`order_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`order_state` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`product_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`product_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`product` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `cost` INT NOT NULL,
  `creation_date` DATE NOT NULL,
  `product_type_id` INT NOT NULL,
  PRIMARY KEY (`id`, `product_type_id`),
  INDEX `fk_product_product_type1_idx` (`product_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_product_type1`
    FOREIGN KEY (`product_type_id`)
    REFERENCES `ef_database`.`product_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`an_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`an_order` (
  `id` INT NOT NULL,
  `payment_date` TIMESTAMP NOT NULL,
  `start_date` TIMESTAMP NOT NULL,
  `end_date` TIMESTAMP NOT NULL,
  `total_amount` REAL NOT NULL,
  `instructions` TEXT NULL,
  `order_state_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `deliverer_id` INT NOT NULL,
  `deliverer_state_id` INT NOT NULL,
  PRIMARY KEY (`id`, `order_state_id`, `customer_id`, `deliverer_id`, `deliverer_state_id`),
  INDEX `fk_order_order_state1_idx` (`order_state_id` ASC) VISIBLE,
  INDEX `fk_an_order_customer1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_an_order_deliverer1_idx` (`deliverer_id` ASC, `deliverer_state_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_order_state10`
    FOREIGN KEY (`order_state_id`)
    REFERENCES `ef_database`.`order_state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_an_order_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `ef_database`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_an_order_deliverer1`
    FOREIGN KEY (`deliverer_id` , `deliverer_state_id`)
    REFERENCES `ef_database`.`deliverer` (`id` , `deliverer_state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ef_database`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ef_database`.`order_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `an_order_id` INT NOT NULL,
  `order_state_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `product_type_id` INT NOT NULL,
  PRIMARY KEY (`id`, `an_order_id`, `order_state_id`, `customer_id`, `product_id`, `product_type_id`),
  INDEX `fk_an_order_has_product_product1_idx` (`product_id` ASC, `product_type_id` ASC) VISIBLE,
  INDEX `fk_an_order_has_product_an_order1_idx` (`an_order_id` ASC, `order_state_id` ASC, `customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_an_order_has_product_an_order1`
    FOREIGN KEY (`an_order_id` , `order_state_id` , `customer_id`)
    REFERENCES `ef_database`.`an_order` (`id` , `order_state_id` , `customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_an_order_has_product_product1`
    FOREIGN KEY (`product_id` , `product_type_id`)
    REFERENCES `ef_database`.`product` (`id` , `product_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;