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


 DROP TABLE IF EXISTS `Authors`;
  CREATE TABLE `Authors` (
  `IdAuthor` int NOT NULL AUTO_INCREMENT,
  `Name` Varchar(64) NOT NULL,
  PRIMARY KEY (`IdAuthor`)
) ENGINE=InnoDB  COMMENT='Catalogo de Author';


INSERT INTO `sql_learning`.`Authors` (`Name`) VALUES ('Paz, Octavio');
INSERT INTO `sql_learning`.`Authors` (`Name`) VALUES ('Verne, Julio');
INSERT INTO `sql_learning`.`Authors` (`Name`) VALUES ('Asimov, Isaac');

 DROP TABLE IF EXISTS `Books`;
  CREATE TABLE `Books` (
  `IdBook` int NOT NULL AUTO_INCREMENT,
  `Title` Varchar(64) NOT NULL,
  PRIMARY KEY (`IdBook`)
) ENGINE=InnoDB  COMMENT='Catalogo de Libros';

INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('El laberinto de la soledad');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Piedra de sol');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Sor Juana Inés de la Cruz');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('La vuelta al mundo en 80 días');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Viaje al centro de la tierra');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('De la tierra a la luna');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('20,000 leguas de viaje submarino');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Dos años de vacaciones');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Las tribulaciones de un chino en china');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Un capitán de quince años');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Yo robot');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('El imperio Romano');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Los egipcios');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Constantinopla');
INSERT INTO `sql_learning`.`Books` (`Title`) VALUES ('Historia de la Edad Media');

  DROP TABLE IF EXISTS `BooksAuthors`;
  CREATE TABLE `BooksAuthors` (
  `IdAuthor` int NOT NULL,
  `IdBook` int NOT NULL,
  PRIMARY KEY (`IdAuthor`, `IdBook`),
  FOREIGN KEY (`IdAuthor`) REFERENCES `Authors`(`IdAuthor`),
  FOREIGN KEY (`IdBook`) REFERENCES `Books`(`IdBook`)
) ENGINE=InnoDB  COMMENT='Tabla de enlace entre Authors y Books';

INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (1, 1);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (1, 2);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (1, 3);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (2, 4);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (2, 5);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (2, 6);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (2, 7);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (2, 8);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (2, 9);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (2, 10);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (3, 11);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (3, 12);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (3, 13);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (3, 14);
INSERT INTO `sql_learning`.`BooksAuthors` (`idAuthor`, `idBook`) VALUES (3, 15);


create table autors_and_book 
select   * from 
(select idAuthor Id,  count(idauthor) NoBooks
from booksauthors 
group by idAuthor
having  count(idauthor))  x ;

select *  
from autors_and_book 
where  NoBooks= (select max(NoBooks) from autors_and_book);

INSERT INTO `sql_learning`.`Authors` (`name`) VALUES ('pancho pantera');
select * from Authors;

select * from booksauthors where idAuthor=5

select * from books
