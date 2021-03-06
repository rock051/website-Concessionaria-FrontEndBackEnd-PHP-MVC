-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema concessionaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema concessionaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `concessionaria` DEFAULT CHARACTER SET utf8 ;
USE `concessionaria` ;

-- -----------------------------------------------------
-- Table `concessionaria`.`Proprietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concessionaria`.`Proprietario` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `nascimento` DATE NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `concessionaria`.`Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concessionaria`.`Veiculo` (
  `id` INT NOT NULL,
  `placa` VARCHAR(75) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `precovenda` VARCHAR(45) NOT NULL,
  `aluguel` DOUBLE NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `anofabricacao` DATE NOT NULL,
  `cpfProprietario` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Veiculo_Proprietario1_idx` (`cpfProprietario` ASC),
  CONSTRAINT `fk_Veiculo_Proprietario1`
    FOREIGN KEY (`cpfProprietario`)
    REFERENCES `concessionaria`.`Proprietario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `concessionaria`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concessionaria`.`Cliente` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `nascimento` DATE NOT NULL,
  `endereco` VARCHAR(75) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `concessionaria`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concessionaria`.`Funcionario` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `nascimento` DATE NOT NULL,
  `endereco` VARCHAR(75) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `concessionaria`.`Contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `concessionaria`.`Contrato` (
    `idContrato` INT NOT NULL,
    `aluguelContrato` DOUBLE NULL,
    `idVeiculo` INT NOT NULL,
    `cpfProprietario` VARCHAR(11) NOT NULL,
    `cpfFuncionario` VARCHAR(11) NOT NULL,
    `cpfCliente` VARCHAR(11) NOT NULL,
    PRIMARY KEY (`idContrato`),
    INDEX `fk_Contrato_Veiculo1_idx` (`idVeiculo` ASC),
    INDEX `fk_Contrato_Proprietario1_idx` (`cpfProprietario` ASC),
    INDEX `fk_Contrato_Funcionario1_idx` (`cpfFuncionario` ASC),
    INDEX `fk_Contrato_Cliente1_idx` (`cpfCliente` ASC),
    CONSTRAINT `fk_Contrato_Veiculo1` FOREIGN KEY (`idVeiculo`)
        REFERENCES `concessionaria`.`Veiculo` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Contrato_Proprietario1` FOREIGN KEY (`cpfProprietario`)
        REFERENCES `concessionaria`.`Proprietario` (`cpf`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Contrato_Funcionario1` FOREIGN KEY (`cpfFuncionario`)
        REFERENCES `concessionaria`.`Funcionario` (`cpf`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Contrato_Cliente1` FOREIGN KEY (`cpfCliente`)
        REFERENCES `concessionaria`.`Cliente` (`cpf`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
