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
    pais VARCHAR(30) NOT NULL
);

DROP TABLE IF EXISTS optica.Proveedor ;

CREATE TABLE IF NOT EXISTS optica.Proveedor (
  nif VARCHAR(8) PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL UNIQUE,
  telefono INT NOT NULL UNIQUE,
  fax INT UNIQUE,
  id_direccion INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_direccion) REFERENCES Direccion(id_direccion)
  );

DROP TABLE IF EXISTS optica.Gafas ;

CREATE TABLE IF NOT EXISTS optica.Gafas (
  id_gafas INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(30) NOT NULL,
  graduacion_der DECIMAL(2),
  graduacion_izq DECIMAL(2),
  tipo_montura ENUM('flotante', 'pasta', 'metal'),
  color_montura VARCHAR(30) NOT NULL,
  col_vidrio_der VARCHAR(30) NOT NULL,
  col_vidrio_izq VARCHAR(30) NOT NULL,
  precio DECIMAL(2) NOT NULL,
  id_proveedor VARCHAR(8) NOT NULL,
  FOREIGN KEY (id_proveedor) REFERENCES Proveedor(nif)
  -- `id_tipo_montura` INT NOT NULL,
  );

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
  
DROP TABLE IF EXISTS optica.Empleado ;

CREATE TABLE IF NOT EXISTS optica.Empleado (
  id_empleado INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(30) NOT NULL,
  apellido2 VARCHAR(30)
  );

DROP TABLE IF EXISTS optica.Empleado_vende_a_Cliente ;

CREATE TABLE IF NOT EXISTS optica.Empleado_vende_a_Cliente (
  id_empleado INT NOT NULL,
  id_cliente INT NOT NULL,
  id_gafas INT UNIQUE NOT NULL,
  fecha_venta DATETIME NOT NULL,
  PRIMARY KEY (id_empleado, id_cliente, id_gafas),
  FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  FOREIGN KEY (id_gafas) REFERENCES Gafas(id_gafas)
);

/* Direccion */
INSERT INTO Direccion VALUES (1, 'Calle1', 1, 1, 'A', 'Ciudad1', 00000, 'Pais1' );

/* Proveedor */
INSERT INTO Proveedor VALUES('1111111K', 'Empresa1', 777777777, NULL , 1);

/* Gafas */
INSERT INTO Gafas VALUE(1, 'Marca1', NULL, NULL, 'metal', 'negro', 'negro', 'negro', 30, '1111111K');
INSERT INTO Gafas VALUE(2, 'Marca1', NULL, NULL, 'metal', 'negro', 'negro', 'negro', 30, '1111111K');
INSERT INTO Gafas VALUE(3, 'Marca3', NULL, NULL, 'metal', 'negro', 'negro', 'negro', 30, '1111111K');
INSERT INTO Gafas VALUE(4, 'Marca3', NULL, NULL, 'metal', 'negro', 'negro', 'negro', 30, '1111111K');

/* Cliente */
INSERT INTO Cliente VALUE(1, 'Nombre1', 'Apellido1', 'Apellido2', 654321987, 'correo1@correo.com', '2024/06/04', NULL);
INSERT INTO Cliente VALUE(2, 'Nombre1', 'Apellido1', 'Apellido2', 654321987, 'correo1@correo.com', '2024/06/04', NULL);

/* Empleado */
INSERT INTO Empleado VALUE(1, 'Empleado1', 'Apellido1', NULL);

/* Venta */
INSERT INTO Empleado_vende_a_Cliente VALUE(1, 1, 1, '2024/06/04');
INSERT INTO Empleado_vende_a_Cliente VALUE(1, 1, 2, '2023/06/02');
INSERT INTO Empleado_vende_a_Cliente VALUE(1, 2, 3, '2022/06/03');
