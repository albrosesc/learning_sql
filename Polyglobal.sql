DROP DATABASE if exists polyglobal;
CREATE DATABASE polyglobal
    DEFAULT CHARACTER SET = latin1
	DEFAULT COLLATE = latin1_spanish_ci;
	
USE polyglobal;

  DROP TABLE IF EXISTS tbProductos;
  CREATE TABLE tbProductos (
  Clave CHAR(5),
  Descripcion Varchar(100) NOT NULL,
  Marca Varchar(38) NOT NULL,
  UnidadMedida Char(3) NOT NULL,
  Linea Char(2),
  Division TinyInt CONSTRAINT DominioDivision CHECK(Division > 0 AND Division < 8) NOT NULL,
  Largo Decimal(7,3),
  Ancho Decimal(7,3),
  Superficie Decimal(8,3) AS (Largo * Ancho),
  Precio Decimal(8,2) NOT NULL,
  Descuento Decimal(3,2) NOT NULL,
  PrecioUnitario Decimal(8,2) AS (Precio - Precio*Descuento) NOT NULL,
  Alta DateTime,
  Modificacion DateTime,
  Responsable Varchar(10) NOT NULL,
  FraccionArancelaria Varchar(10),
  PRIMARY KEY (Clave)
) ENGINE=InnoDB  COMMENT='Tabla de Productos POLYGLOBAL';

