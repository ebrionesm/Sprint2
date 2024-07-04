DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido1 VARCHAR(20) NOT NULL,
	apellido2 VARCHAR(20),
	calle VARCHAR(60) NOT NULL,
	codigo_postal INT NOT NULL,
	localidad VARCHAR(60) NOT NULL,
	provincia VARCHAR(60) NOT NULL,
	telefono INT NOT NULL
);
CREATE TABLE tienda (
	id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    calle VARCHAR(60) NOT NULL,
    codigo_postal INT NOT NULL,
    localidad VARCHAR(60) NOT NULL,
    provincia VARCHAR(60) NOT NULL
);
CREATE TABLE pizzeria.empleado (
	id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20),
    nif VARCHAR(9) UNIQUE NOT NULL,
    tipo ENUM('cocina', 'reparto'),
    id_tienda INT NOT NULL,
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);

CREATE TABLE pedido (
	id_pedido INT UNSIGNED AUTO_INCREMENT,
    fecha_pedido DATE NOT NULL,
    hora_pedido TIME NOT NULL,
    entrega ENUM('domicilio', 'tienda') NOT NULL,
    cantidad_pizza INT NOT NULL,
    cantidad_hamburguesa INT NOT NULL,
    cantidad_bebidas INT NOT NULL,
    precio DECIMAL(2),
    fecha_entrega DATE,
    hora_entrega TIME,
    id_cliente INT NOT NULL,
    id_tienda INT NOT NULL,
    id_empleado INT,
    PRIMARY KEY (id_pedido),
	FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY(id_tienda) REFERENCES pizzeria.tienda(id_tienda),
    FOREIGN KEY(id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE categoria (
	id_categoria INT UNSIGNED PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

CREATE TABLE producto (
	id_producto INT UNSIGNED PRIMARY KEY,
    tipo ENUM('pizza', 'hamburguesa', 'bebida') NOT NULL,
	nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    imagen VARCHAR(100) NOT NULL,
    precio DECIMAL(2) NOT NULL,
    id_categoria INT UNSIGNED,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE pedido_tiene_producto (
	id_pedido INT UNSIGNED NOT NULL,
    id_producto INT UNSIGNED NOT NULL,
    cantidad_producto INT NOT NULL,
    PRIMARY KEY(id_pedido, id_producto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);




INSERT INTO cliente VALUE (1, 'Nombre1', 'Apellido1', 'Apellido2', 'Calle1', 90000, 'Localidad1', 'Provincia1', 654321987);
INSERT INTO tienda VALUE (1, 'Calle2', 90000, 'Localidad1', 'Provincia1');
INSERT INTO empleado VALUE (1, 'Empleado1', 'ApellidoEmpleado1', 'ApellidoEmpleado2', '12345678A', 'reparto', 1);
INSERT INTO pedido VALUE(1, '2024/06/04', '12:00:00', 'domicilio', 0, 0, 1, 2, '2024/06/04', '12:30:00', 1, 1, 1);
INSERT INTO categoria VALUE(1, 'categoria1');
INSERT INTO producto VALUE(1, 'pizza' , 'pizza1', 'descripcion_pizza1', 'imagen.url', 9.99, 1);
INSERT INTO producto VALUE(2, 'bebida', 'bebida1', 'descripcion_bebida1', 'imagen_bebida.url', 2, NULL);
INSERT INTO pedido_tiene_producto VALUE(1, 2, 1);