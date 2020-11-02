-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema smash_data
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema smash_data
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `smash_data` DEFAULT CHARACTER SET utf8 ;

-- -----------------------------------------------------
-- Table `smash_data`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`games` (
  `game_id` INT(10) UNSIGNED NOT NULL,
  `smash_game_title` VARCHAR(45) NULL DEFAULT NULL,
  `year_released` INT(10) UNSIGNED NOT NULL,
  `platforms` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE INDEX `year_released_UNIQUE` (`year_released` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `smash_data`.`characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`characters` (
  `character_id` INT(10) UNSIGNED NOT NULL,
  `smash_Game_Origin_id` INT(10) UNSIGNED NOT NULL,
  `tier` VARCHAR(45) NOT NULL,
  `weight` VARCHAR(20) NOT NULL,
  `character_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`character_id`),
  UNIQUE INDEX `same_origin_id_UNIQUE` (`smash_game_origin_id` ASC) VISIBLE,
  UNIQUE INDEX `character_name_UNIQUE` (`character_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`games_characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`games_characters` (
  `smash_game_id` INT UNSIGNED NOT NULL,
  `character_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`smash_game_id`, `character_id`),
  INDEX `character_fk_idx` (`character_id` ASC) VISIBLE,
  CONSTRAINT `smash_fk`
    FOREIGN KEY (`smash_game_id`)
    REFERENCES `smash_data`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `character_fk`
    FOREIGN KEY (`character_id`)
    REFERENCES `smash_data`.`characters` (`character_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smash_data`.`gamemode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`gamemode` (
  `gamemode_id` INT(10) UNSIGNED NOT NULL,
  `game_mode_title` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `smash_meter` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `items_enabled` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `handicap` VARCHAR(10) NOT NULL,
  `scoring_system` VARCHAR(45) NULL,
  PRIMARY KEY (`gamemode_id`),
  UNIQUE INDEX `handicap_UNIQUE` (`handicap` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`game_gamemode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`game_gamemode` (
  `smash_game_id` INT UNSIGNED NOT NULL,
  `gamemode_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`smash_game_id`, `gamemode_id`),
  INDEX `gamemode_fk_idx` (`gamemode_id` ASC) VISIBLE,
  CONSTRAINT `game1_fk`
    FOREIGN KEY (`smash_game_id`)
    REFERENCES `smash_data`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `gamemode_fk`
    FOREIGN KEY (`gamemode_id`)
    REFERENCES `smash_data`.`gamemode` (`gamemode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smash_data`.`stages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`stages` (
  `stage_id` INT(10) UNSIGNED NOT NULL,
  `stage_name` VARCHAR(45) NOT NULL,
  `size` INT(10) UNSIGNED ZEROFILL NOT NULL,
  `series_origin` VARCHAR(45) NOT NULL,
  `hazards` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `smash_game_origin` VARCHAR(45) NULL,
  PRIMARY KEY (`stage_id`),
  UNIQUE INDEX `stage_name_UNIQUE` (`stage_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`games_stages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`games_stages` (
  `smash_game_id` INT UNSIGNED NOT NULL,
  `stage_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`smash_game_id`, `stage_id`),
  INDEX `stages_fk_idx` (`stage_id` ASC) VISIBLE,
  CONSTRAINT `game2_fk`
    FOREIGN KEY (`smash_game_id`)
    REFERENCES `smash_data`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `stages_fk`
    FOREIGN KEY (`stage_id`)
    REFERENCES `smash_data`.`stages` (`stage_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `smash_data`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`items` (
  `item_id` INT(10) UNSIGNED NOT NULL,
  `item_name` VARCHAR(45) NOT NULL,
  `franchise_origin` VARCHAR(45) NOT NULL,
  `smash_game_origin_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`game_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`game_items` (
  `smash_game_id` INT UNSIGNED NOT NULL,
  `item_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`smash_game_id`, `item_id`),
  INDEX `items_fk_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `game3_fk`
    FOREIGN KEY (`smash_game_id`)
    REFERENCES `smash_data`.`games` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `items_fk`
    FOREIGN KEY (`item_id`)
    REFERENCES `smash_data`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `smash_data` ;

-- -----------------------------------------------------
-- Table `smash_data`.`moves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`moves` (
  `move_id` INT(10) UNSIGNED NOT NULL,
  `move_name` VARCHAR(45) NOT NULL,
  `move_input` VARCHAR(45) NOT NULL,
  `character_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`move_id`),
  UNIQUE INDEX `move_name_UNIQUE` (`move_name` ASC) VISIBLE,
  INDEX `fk_Moves_character_id_idx` (`character_id` ASC) VISIBLE,
  CONSTRAINT `fk_Moves_character_id`
    FOREIGN KEY (`character_id`)
    REFERENCES `smash_data`.`characters` (`character_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `smash_data`.`skins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smash_data`.`skins` (
  `skin_id` INT(10) UNSIGNED NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `character_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`skin_id`),
  UNIQUE INDEX `fk_skins_character_id_idx` (`character_id` ASC) VISIBLE,
  CONSTRAINT `fk_skins_character_id`
    FOREIGN KEY (`character_id`)
    REFERENCES `smash_data`.`characters` (`character_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
