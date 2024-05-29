-- 1)--
SELECT nombre FROM producto;
-- 2)--
SELECT nombre, precio FROM producto;
-- 3)--
SELECT * FROM producto;
-- 4)--
SELECT nombre, precio, precio * 1.09 FROM producto;
-- 5)--
SELECT nombre, precio AS 'euro', precio * 1.09 AS 'dòlars nord-americans' FROM producto;
-- 6)--
SELECT UPPER(nombre), precio FROM producto;
-- 7)--
SELECT LOWER(nombre), precio FROM producto;
-- 8)--
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
-- 9)--
SELECT nombre, ROUND(precio) FROM producto;
-- 10)--
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
-- 11)--
SELECT codigo_fabricante FROM producto;
-- 12)--
SELECT DISTINCT codigo_fabricante FROM producto;
-- 13)--
SELECT nombre FROM fabricante ORDER BY nombre ASC;
-- 14)--
SELECT nombre FROM fabricante ORDER BY nombre DESC;
-- 15)--
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;
-- 16)--
SELECT * FROM fabricante LIMIT 5;
-- 17)--
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
-- 18)--
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
-- 19)--
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
-- 20)--
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
-- 21)--
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
-- 22)--
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY fabricante.nombre ASC;
-- 23)--
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;
-- 24)--
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio ASC LIMIT 1;
-- 25)--
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante ORDER BY producto.precio DESC LIMIT 1;
-- 26)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';
-- 27)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Crucial' && producto.precio > 200;
-- 28)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus' || fabricante.nombre = 'Hewlett-Packard' || fabricante.nombre = 'Seagate';
-- 29)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- 30)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%e';
-- 31)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre LIKE '%w%';
-- 32)--
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;
-- 33)--
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
-- 34)--
SELECT fabricante.*, producto.* FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
-- 35)--
SELECT fabricante.* FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;
-- 36)--
SELECT producto.* FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo';
-- 37)--
SELECT producto.* FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio = (SELECT producto.precio FROM producto LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ORDER BY producto.precio DESC LIMIT 1) ;
-- 38)--
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ORDER BY producto.precio DESC LIMIT 1;
-- 39)--
SELECT producto.nombre FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY producto.precio ASC LIMIT 1;
-- 40)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio >= (SELECT producto.precio FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' ORDER BY producto.precio DESC LIMIT 1) ;
-- 41)--
SELECT producto.* FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE producto.precio > (SELECT SUM(producto.precio)/COUNT(producto.precio) FROM producto INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Asus') && fabricante.nombre = 'Asus';