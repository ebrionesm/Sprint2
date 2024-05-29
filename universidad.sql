-- 1)--
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.tipo = 'alumno' ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 2--
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.telefono IS NULL && persona.tipo = 'alumno';
-- 3)--
SELECT persona.* FROM persona WHERE YEAR(persona.fecha_nacimiento) = '1999';
-- 4)--
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona WHERE persona.telefono IS NULL && persona.tipo = 'profesor' && persona.nif LIKE '%K';
-- 5)--
SELECT asignatura.* FROM asignatura WHERE asignatura.cuatrimestre = 1 && asignatura.curso = 3 && asignatura.id_grado = 7;
-- 6)--
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 7)--
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';
-- 8)--
SELECT DISTINCT departamento.nombre FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9)-- Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT persona.* FROM persona JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = '2018' && persona.tipo = 'alumno';
-- UTILIZANDO LEFT JOIN Y RIGHT JOIN
-- 1)--
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 2)-- 
SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE departamento.nombre IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 3)-- 
SELECT departamento.* FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id WHERE profesor.id_profesor IS NULL;
-- 4)-- 
SELECT persona.* FROM persona JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
-- 5)-- 
SELECT asignatura.* FROM persona JOIN profesor ON profesor.id_profesor = persona.id RIGHT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
-- 6)-- 
SELECT DISTINCT departamento.* FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id LEFT JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE asignatura.id IS NULL && alumno_se_matricula_asignatura.id_curso_escolar IS NULL;
-- CONSULTES RESUM --
-- 1)--
SELECT COUNT(persona.id) FROM persona WHERE persona.tipo = 'alumno';
-- 2)--
SELECT COUNT(persona.id) FROM persona WHERE YEAR(persona.fecha_nacimiento) = '1999';
-- 3)-- 
SELECT departamento.nombre, COUNT(profesor.id_departamento) AS 'Cantidad' FROM departamento JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id ORDER BY Cantidad DESC;
-- 4)--
SELECT departamento.nombre, COUNT(profesor.id_departamento) AS 'Cantidad' FROM departamento LEFT JOIN profesor ON profesor.id_departamento = departamento.id GROUP BY departamento.id;
-- 5)--
SELECT grado.nombre, COUNT(asignatura.id) AS 'Cantidad' FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id ORDER BY Cantidad DESC;
-- 6)--
SELECT grado.nombre, COUNT(asignatura.id) AS 'Cantidad' FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id HAVING Cantidad > 40 ORDER BY Cantidad DESC;
-- 7)--
SELECT grado.nombre, asignatura.tipo, COUNT(asignatura.creditos) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.id, asignatura.tipo;
-- 8)--
SELECT curso_escolar.anyo_inicio, COUNT(alumno_se_matricula_asignatura.id_alumno) AS 'Cantidad alumnos' FROM curso_escolar LEFT JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id GROUP BY curso_escolar.id;
-- 9)-- 
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id) AS 'Cantidad' FROM persona JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura 
ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY profesor.id_profesor ORDER BY Cantidad DESC;
-- 10)--
SELECT persona.* FROM persona WHERE persona.tipo = 'alumno' ORDER BY (2024-YEAR(persona.fecha_nacimiento)) ASC, MONTH(persona.fecha_nacimiento) DESC, DAY(persona.fecha_nacimiento) DESC LIMIT 1;
-- 11)--
SELECT persona.* FROM persona JOIN profesor ON profesor.id_profesor = persona.id LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' && asignatura.id_profesor IS NULL;

