-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tabletop_army_list
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tabletop_army_list` ;

-- -----------------------------------------------------
-- Schema tabletop_army_list
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tabletop_army_list` DEFAULT CHARACTER SET utf8 ;
USE `tabletop_army_list` ;

-- -----------------------------------------------------
-- Table `tabletop_army_list`.`faction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`faction` (
  `faction_id` INT NOT NULL AUTO_INCREMENT,
  `faction_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`faction_id`));


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`players` (
  `f_name` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `player_id` INT NOT NULL AUTO_INCREMENT,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `l_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`player_id`));


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`army`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`army` (
  `army_id` INT NOT NULL AUTO_INCREMENT,
  `army_name` VARCHAR(100) NOT NULL,
  `faction_id` INT NOT NULL,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`army_id`),
  INDEX `fk_army_faction_idx` (`faction_id` ASC) VISIBLE,
  INDEX `fk_army_players1_idx` (`player_id` ASC) VISIBLE,
  CONSTRAINT `fk_army_faction`
    FOREIGN KEY (`faction_id`)
    REFERENCES `tabletop_army_list`.`faction` (`faction_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_army_players1`
    FOREIGN KEY (`player_id`)
    REFERENCES `tabletop_army_list`.`players` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`units` (
  `unit_id` INT NOT NULL AUTO_INCREMENT,
  `unit_name` VARCHAR(100) NOT NULL,
  `points` INT NOT NULL,
  `price` DECIMAL(4,2) NOT NULL,
  `unit_type` VARCHAR(45) NOT NULL,
  `models` INT NOT NULL,
  PRIMARY KEY (`unit_id`));


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`units_has_faction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`units_has_faction` (
  `unit_id` INT NOT NULL,
  `faction_id` INT NOT NULL,
  PRIMARY KEY (`unit_id`, `faction_id`),
  INDEX `fk_units_has_faction_faction1_idx` (`faction_id` ASC) VISIBLE,
  INDEX `fk_units_has_faction_units1_idx` (`unit_id` ASC) VISIBLE,
  CONSTRAINT `fk_units_has_faction_units1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `tabletop_army_list`.`units` (`unit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_units_has_faction_faction1`
    FOREIGN KEY (`faction_id`)
    REFERENCES `tabletop_army_list`.`faction` (`faction_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`army_has_units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`army_has_units` (
  `army_id` INT NOT NULL,
  `unit_id` INT NOT NULL,
  `nickname` VARCHAR(45) NULL,
  PRIMARY KEY (`army_id`, `unit_id`),
  INDEX `fk_army_has_units_units1_idx` (`unit_id` ASC) VISIBLE,
  INDEX `fk_army_has_units_army1_idx` (`army_id` ASC) VISIBLE,
  CONSTRAINT `fk_army_has_units_army1`
    FOREIGN KEY (`army_id`)
    REFERENCES `tabletop_army_list`.`army` (`army_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_army_has_units_units1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `tabletop_army_list`.`units` (`unit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`campaigns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`campaigns` (
  `campaign_id` INT NOT NULL AUTO_INCREMENT,
  `campaign` VARCHAR(150) NOT NULL,
  `campaign_type` VARCHAR(45) NOT NULL,
  `campaign_date` DATE NULL,
  PRIMARY KEY (`campaign_id`));


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`campaigns_has_armys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`campaigns_has_armys` (
  `campaign_id` INT NOT NULL,
  `army_id` INT NOT NULL,
  `campaign victor` VARCHAR(1) NULL,
  PRIMARY KEY (`campaign_id`, `army_id`),
  INDEX `fk_campaigns_has_army_army1_idx` (`army_id` ASC) VISIBLE,
  INDEX `fk_campaigns_has_army_campaigns1_idx` (`campaign_id` ASC) VISIBLE,
  CONSTRAINT `fk_campaigns_has_army_campaigns1`
    FOREIGN KEY (`campaign_id`)
    REFERENCES `tabletop_army_list`.`campaigns` (`campaign_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campaigns_has_army_army1`
    FOREIGN KEY (`army_id`)
    REFERENCES `tabletop_army_list`.`army` (`army_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`warlord`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`warlord` (
  `warlord_id` INT NOT NULL AUTO_INCREMENT,
  `warlord_name` VARCHAR(150) NOT NULL,
  `unit_id` INT NOT NULL,
  `army_id` INT NOT NULL,
  PRIMARY KEY (`warlord_id`),
  INDEX `fk_warlord_units1_idx` (`unit_id` ASC) VISIBLE,
  INDEX `fk_warlord_army1_idx` (`army_id` ASC) VISIBLE,
  CONSTRAINT `fk_warlord_units1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `tabletop_army_list`.`units` (`unit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_warlord_army1`
    FOREIGN KEY (`army_id`)
    REFERENCES `tabletop_army_list`.`army` (`army_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`settings` (
  `setting_id` INT NOT NULL AUTO_INCREMENT,
  `setting_name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`setting_id`));


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`faction_has_settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`faction_has_settings` (
  `faction_id` INT NOT NULL,
  `setting_id` INT NOT NULL,
  PRIMARY KEY (`faction_id`, `setting_id`),
  INDEX `fk_faction_has_settings_settings1_idx` (`setting_id` ASC) VISIBLE,
  INDEX `fk_faction_has_settings_faction1_idx` (`faction_id` ASC) VISIBLE,
  CONSTRAINT `fk_faction_has_settings_faction1`
    FOREIGN KEY (`faction_id`)
    REFERENCES `tabletop_army_list`.`faction` (`faction_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_faction_has_settings_settings1`
    FOREIGN KEY (`setting_id`)
    REFERENCES `tabletop_army_list`.`settings` (`setting_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`sectors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`sectors` (
  `sector_id` INT NOT NULL AUTO_INCREMENT,
  `sector` VARCHAR(150) NOT NULL,
  `setting_id` INT NOT NULL,
  PRIMARY KEY (`sector_id`),
  INDEX `fk_sectors_settings1_idx` (`setting_id` ASC) VISIBLE,
  CONSTRAINT `fk_sectors_settings1`
    FOREIGN KEY (`setting_id`)
    REFERENCES `tabletop_army_list`.`settings` (`setting_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`places`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`places` (
  `place_id` INT NOT NULL AUTO_INCREMENT,
  `place` VARCHAR(100) NOT NULL,
  `sector_id` INT NOT NULL,
  PRIMARY KEY (`place_id`),
  INDEX `fk_places_sectors1_idx` (`sector_id` ASC) VISIBLE,
  CONSTRAINT `fk_places_sectors1`
    FOREIGN KEY (`sector_id`)
    REFERENCES `tabletop_army_list`.`sectors` (`sector_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `tabletop_army_list`.`campaigns_has_places`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabletop_army_list`.`campaigns_has_places` (
  `campaign_id` INT NOT NULL,
  `place_id` INT NOT NULL,
  PRIMARY KEY (`campaign_id`, `place_id`),
  INDEX `fk_campaigns_has_places_places1_idx` (`place_id` ASC) VISIBLE,
  INDEX `fk_campaigns_has_places_campaigns1_idx` (`campaign_id` ASC) VISIBLE,
  CONSTRAINT `fk_campaigns_has_places_campaigns1`
    FOREIGN KEY (`campaign_id`)
    REFERENCES `tabletop_army_list`.`campaigns` (`campaign_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_campaigns_has_places_places1`
    FOREIGN KEY (`place_id`)
    REFERENCES `tabletop_army_list`.`places` (`place_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;











-- -----------------------------------------------------
-- Insertion of Data
-- -----------------------------------------------------

#army
INSERT INTO army
	(army_name, faction_id, player_id)
VALUES
	("Lords of Entropy", 7, 1),
    ("The Grimoirae", 1, 1),
    ("Velxian Seethe", 2, 1),
    ("Ultramarines 5th Company Detachment", 3, 1),
    ("The Bullion Battalion", 4, 1),
    ("Cuetzpalin Nomads", 5, 1),
    ("Groaziak Mercenairies", 6, 1),
    ("Demonic Horde", 8, 2);
#army_has_units x

#campaigns x

#campaigns_has_armys x

#campaigns_has_places x

#faction
INSERT INTO faction
	(faction_name)
VALUES
	("Nighthaunt"),
    ("Tyranids"),
    ("Utramarines"),
    ("Stormcast Eternals"),
    ("Seraphon"),
    ("Nightlords"),
    ("Death Guard"),
    ("Daemons");
    
#faction_has_settings x
INSERT INTO faction_has_settings
	(faction_id, setting_id)
VALUES
	(1, 2),
	(2, 1),
	(3, 1),
	(3, 3),
	(4, 2),
	(5, 2),
	(5, 4),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 3),
	(8, 1),
	(8, 2),
	(8, 3),
	(8, 4);

#places x

#players
INSERT INTO players
	(f_name, l_name, email)
VALUES
	("Calvin", "Borrowman", "cborrowman75@gmail.com"),
    ("Persona", "Noid", "sumthin@hocus.com");

#sectors x

#settings
INSERT INTO settings
	(setting_name)
VALUES
	("Warhammer 40,000"),
    ("Warhammer: Age of Sigmar"),
    ("Warhammer: The Horus Heresy"),
    ("Warhammer: The Old World"),
    ("Middle Earth"),
    ("Turnip28"),
    ("Star Wars: Legion");
    
#units x

#units_has_faction x

#warlord x

