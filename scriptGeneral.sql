DROP DATABASE if exists `sql_learning`;
CREATE DATABASE `sql_learning`
    DEFAULT CHARACTER SET = latin1
	DEFAULT COLLATE = latin1_spanish_ci;
	
USE `sql_learning`;

  DROP TABLE IF EXISTS `oph`;
  CREATE TABLE `oph` (
  `NoOrder` int NOT NULL AUTO_INCREMENT,
  `DateSupplier` Datetime NOT NULL,
  PRIMARY KEY (`NoOrder`)
) ENGINE=InnoDB  COMMENT='Catalogo de Order Purchase Header';
show databases;
INSERT INTO `sql_learning`.`oph` (`DateSupplier`) VALUES (now());
INSERT INTO `sql_learning`.`oph` (`DateSupplier`) VALUES  (ADDDATE(now(), INTERVAL 7 DAY)); 
INSERT INTO `sql_learning`.`oph` (`DateSupplier`) VALUES  (ADDDATE(now(), INTERVAL 15 DAY)); 
INSERT INTO `sql_learning`.`oph` (`DateSupplier`) VALUES  (ADDDATE(now(), INTERVAL 30 DAY));
	
DROP TABLE if exists `opl`;

CREATE TABLE `opl` (
  `idLine` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `idNoProducto` varchar(1)  NOT NULL COMMENT 'Número de Producto',
  `ophNoOrder` int, 
  INDEX Norder(idline, ophNoOrder),
  PRIMARY KEY (idLine),
  FOREIGN KEY (ophNoOrder) REFERENCES oph(NoOrder)
  ) ENGINE=InnoDB COMMENT='Detalle de la ORDER Purchase';

INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('A', 1);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('B', 1);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('C', 1);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('B', 2);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('D', 2);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('C', 3);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('A', 4);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('B', 4);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('C', 4);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('D', 4);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('E', 4);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('E', 1);
INSERT INTO `sql_learning`.`opl` (`idNoProducto`,`ophNoOrder`) VALUES ('C', 2);


