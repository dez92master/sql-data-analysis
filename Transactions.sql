START TRANSACTION; -- puede ser BEGIN o BEGIN TRANSACTION para comenzar una transacción

SAVEPOINT Prevalidacion; -- punto de guardado

INSERT INTO asignacionesdeproyectos
(proyecto_id, empleado_id, horas_asignadas)
VALUES
(5, 1, 10),
(5, 2, 15);-- inserto horas al mismo proyecto de 10 y 15 horas

SELECT SUM(horas_asignadas)
FROM asignacionesdeproyectos
WHERE proyecto_id = 5;  -- suponiendo que quiero la suma de horas en el proyecto no pase de 20 horas

ROLLBACK TO Prevalidacion;-- si es mayor a 20 horas que regrese al savepoint

SELECT SUM(horas_asignadas)
FROM asignacionesdeproyectos
WHERE proyecto_id = 5;-- reviso que las horas asignadas volvieron a vacion o null
