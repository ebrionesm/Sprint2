DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify CHARACTER SET utf8mb4;
USE spotify;

CREATE TABLE usuario (
	id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(30) UNIQUE NOT NULL,
    pass VARCHAR(50) NOT NULL,
    nickname VARCHAR(30) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('m', 'f'),
    pais VARCHAR(30) NOT NULL,
    codigo_postal INT,
    tipo_usuario ENUM('free', 'premium')
);

CREATE TABLE suscripcion (
	id_usuario BIGINT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_renovacion DATE NOT NULL,
    forma_pago ENUM('tarjeta', 'paypal'),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE tarjeta (
	id_usuario BIGINT PRIMARY KEY,
    numero_tarjeta VARCHAR(12) UNIQUE NOT NULL,
    mes_caducidad TINYINT(2) NOT NULL,
    anyo_caducidad TINYINT(2) NOT NULL,
    codigo_seg INT(3) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES suscripcion(id_usuario)
);
CREATE TABLE paypal (
	id_usuario BIGINT PRIMARY KEY,
    nickname VARCHAR(30) UNIQUE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES suscripcion(id_usuario)
);

CREATE TABLE pago (
	numero_orden VARCHAR(30) PRIMARY KEY,
    fecha DATE NOT NULL,
    total DECIMAL(2) NOT NULL,
    id_usuario BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE artista (
	id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE NOT NULL,
    imagen VARCHAR(50) NOT NULL
);

CREATE TABLE album (
	id_album INT AUTO_INCREMENT PRIMARY KEY,
    anyo_publicacion INT(4) NOT NULL,
    imagen_portada VARCHAR(50) NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE cancion (
	id_cancion BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(30) NOT NULL,
    descripcion VARCHAR(30) NOT NULL,
    reproducciones BIGINT NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES album(id_album)
);

CREATE TABLE artista_tiene_cancion (
	id_artista INT,
    id_cancion BIGINT,
    PRIMARY KEY(id_artista, id_cancion),
    FOREIGN KEY (id_artista) REFERENCES artista (id_artista),
    FOREIGN KEY (id_cancion) REFERENCES cancion (id_cancion)
);

CREATE TABLE playlist (
	id_playlist BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(30) NOT NULL,
    numero_canciones INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    activa BIT DEFAULT(1) NOT NULL,
    fecha_eliminada DATE,
    id_usuario BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE playlist_tiene_cancion (
	id_playlist BIGINT,
    id_cancion BIGINT,
    id_usuario_agrega_cancion BIGINT,
    fecha_agrega_cancion DATE NOT NULL,
    PRIMARY KEY (id_playlist, id_cancion, id_usuario_agrega_cancion),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id_cancion),
    FOREIGN KEY (id_usuario_agrega_cancion) REFERENCES usuario(id_usuario)
);

CREATE TABLE usuario_sigue_artista (
	id_usuario BIGINT,
    id_artista INT,
    PRIMARY KEY (id_usuario, id_artista),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE artista_relacionado_artista (
	id_artista_principal INT,
    id_artista_relacionado INT,
    PRIMARY KEY (id_artista_principal, id_artista_relacionado),
    FOREIGN KEY (id_artista_principal) REFERENCES artista(id_artista),
    FOREIGN KEY (id_artista_relacionado) REFERENCES artista(id_artista)
);

CREATE TABLE usuario_gusta_playlist (
	id_usuario BIGINT,
    id_playlist BIGINT,
    PRIMARY KEY (id_usuario, id_playlist),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist)
);

CREATE TABLE usuario_gusta_cancion (
	id_usuario BIGINT,
    id_cancion BIGINT,
    PRIMARY KEY (id_usuario, id_cancion),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id_cancion)
);

