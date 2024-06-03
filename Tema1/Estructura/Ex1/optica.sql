DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica CHARACTER SET utf8mb4;
USE optica;

CREATE TABLE Direccion (
    id_direccion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    piso INT,
    puerta VARCHAR(5),
    ciudad VARCHAR(30) NOT NULL,
    codigo_postal INT NOT NULL,
    pais VARCHAR(30)
);


-- -----------------------------------------------------
-- Table `optica`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS optica.Proveedor ;

CREATE TABLE IF NOT EXISTS optica.Proveedor (
  nif VARCHAR(8) PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL UNIQUE,
  telefono INT NOT NULL UNIQUE,
  fax INT UNIQUE,
  id_direccion INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion)
  );


-- -----------------------------------------------------
-- Table `optica`.`Tipo_Montura`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS optica.Tipo_Montura ;

-- CREATE TABLE IF NOT EXISTS optica.Tipo_Montura (
  -- id_tipo_montura INT PRIMARY KEY,
  -- flotante VARCHAR(30) BINARY NOT NULL,
  -- pasta VARCHAR(30) BINARY NOT NULL,
  -- metal VARCHAR(30) BINARY NOT NULL,
  -- PRIMARY KEY (`id_tipo_montura`),
  -- UNIQUE INDEX `id_tipo_montura_UNIQUE` (`id_tipo_montura` ASC) VISIBLE)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gafas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS optica.Gafas ;

CREATE TABLE IF NOT EXISTS optica.Gafas (
  id_gafas INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(30) NOT NULL,
  graduacion_der DECIMAL(2) NOT NULL,
  graduacion_izq DECIMAL(2) NOT NULL,
  tipo_montura ENUM('flotante', 'pasta', 'metal'),
  color_montura VARCHAR(30) NOT NULL,
  col_vidrio_der VARCHAR(30) NOT NULL,
  col_vidrio_izq VARCHAR(30) NOT NULL,
  precio DECIMAL(2) NOT NULL
  -- `id_tipo_montura` INT NOT NULL,
  );


-- -----------------------------------------------------
-- Table `mydb`.`Proveedor_has_Gafas`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `optica`.`Proveedor_has_Gafas` ;

-- CREATE TABLE IF NOT EXISTS `optica`.`Proveedor_has_Gafas` (
  -- `Proveedor_nif` VARCHAR(8) NOT NULL,
  -- `Gafas_id_gafas` INT NOT NULL,
  -- PRIMARY KEY (`Proveedor_nif`, `Gafas_id_gafas`),
  -- INDEX `fk_Proveedor_has_Gafas_Gafas1_idx` (`Gafas_id_gafas` ASC) VISIBLE,
  --  `fk_Proveedor_has_Gafas_Proveedor1_idx` (`Proveedor_nif` ASC) VISIBLE,
  -- CONSTRAINT `fk_Proveedor_has_Gafas_Proveedor1`
    -- FOREIGN KEY (`Proveedor_nif`)
    -- REFERENCES `mydb`.`Proveedor` (`nif`)
    -- ON DELETE NO ACTION
-- ON UPDATE NO ACTION,
  -- CONSTRAINT `fk_Proveedor_has_Gafas_Gafas1`
-- FOREIGN KEY (`Gafas_id_gafas`)
    -- REFERENCES `mydb`.`Gafas` (`id_gafas`)
    -- ON DELETE NO ACTION
    -- ON UPDATE NO ACTION)
-- ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS optica.Cliente;

CREATE TABLE IF NOT EXISTS optica.Cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30),
  telefono INT NOT NULL,
  correo VARCHAR(50) NOT NULL,
  fecha_registro DATETIME NOT NULL,
  id_cliente_recomendacion INT,
  FOREIGN KEY (id_cliente_recomendacion) REFERENCES Cliente(id_cliente)
  );
  


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS optica.Empleado ;

CREATE TABLE IF NOT EXISTS optica.Empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30)
  );


-- -----------------------------------------------------
-- Table `mydb`.`Empleado_vende_a_Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS optica.Empleado_vende_a_Cliente ;

CREATE TABLE IF NOT EXISTS optica.Empleado_vende_a_Cliente (
  id_empleado INT NOT NULL,
  id_cliente INT NOT NULL,
  id_gafas INT NOT NULL,
  fecha_venta DATETIME NOT NULL,
  PRIMARY KEY (id_empleado, id_cliente, id_gafas),
  FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (id_gafas) REFERENCES Gafas(id_gafas)
);

/* Direccion*/

INSERT INTO Direccion VALUES (1, 'Calle1', 1, 1, 'A', 'Ciudad1', 00000, 'Pais1' );
