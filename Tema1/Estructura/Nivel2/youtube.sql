DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube CHARACTER SET utf8mb4;
USE youtube;

CREATE TABLE usuario (
	id_usuario BIGINT AUTO_INCREMENT PRIMARY KEY,
    mail VARCHAR(40) UNIQUE NOT NULL,
    pass VARCHAR(50) NOT NULL,
    nickname VARCHAR(30) UNIQUE NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('m', 'f'),
    pais VARCHAR(30) NOT NULL,
    codigo_postal INT
);

CREATE TABLE video (
	id_video BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(1000),
    tamaño DECIMAL(2) NOT NULL,
    nombre_archivo VARCHAR(50) NOT NULL,
    duracion TIME NOT NULL,
    thumbnail VARCHAR(50),
    reproducciones BIGINT NOT NULL,
    likes BIGINT NOT NULL,
    dislikes BIGINT NOT NULL,
    estado ENUM('publico', 'oculto', 'privado') NOT NULL,
    fecha_publicacion DATE NOT NULL,
    hora_publicacion TIME NOT NULL,
    id_usuario BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE etiqueta (
	id_etiqueta INT PRIMARY KEY,
    nombre VARCHAR(30)
);

CREATE TABLE video_tiene_etiqueta (
	id_video BIGINT,
    id_etiqueta INT,
    PRIMARY KEY (id_video, id_etiqueta),
    FOREIGN KEY (id_video) REFERENCES video(id_video),
    FOREIGN KEY (id_etiqueta) REFERENCES etiqueta(id_etiqueta)
);

CREATE TABLE canal (
	id_canal BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE NOT NULL,
    descripcion VARCHAR(1000),
    fecha_creacion DATE NOT NULL,
    hora_creacion TIME NOT NULL,
    id_usuario BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE usuario_suscrito_a_canal (
	id_usuario BIGINT,
    id_canal BIGINT,
    PRIMARY KEY(id_usuario, id_canal),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_canal) REFERENCES canal(id_canal)
);

CREATE TABLE usuario_interactua_video (
	id_usuario BIGINT,
    id_video BIGINT,
    interaccion ENUM('like', 'dislike') NOT NULL,
    fecha_interaccion DATE NOT NULL,
    hora_interaccion TIME NOT NULL,
    PRIMARY KEY (id_usuario, id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE playlist (
	id_playlist BIGINT PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE NOT NULL,
    fecha_creacion DATE NOT NULL,
    estado ENUM('publico', 'privado'),
    id_usuario BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE playlist_tiene_video (
	id_playlist BIGINT,
    id_video BIGINT,
    PRIMARY KEY (id_playlist, id_video),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE comentario (
	id_comentario BIGINT PRIMARY KEY,
    texto VARCHAR(2000) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    id_usuario BIGINT NOT NULL,
    id_video BIGINT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_video) REFERENCES video(id_video)
);

CREATE TABLE usuario_interactua_comentario (
	id_usuario BIGINT,
    id_comentario BIGINT,
    interaccion ENUM('like', 'dislike') NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    PRIMARY KEY(id_usuario, id_comentario),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_comentario) REFERENCES comentario(id_comentario)
);
