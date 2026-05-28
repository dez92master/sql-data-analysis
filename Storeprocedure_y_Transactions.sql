DELIMITER //
CREATE PROCEDURE AsignarHorasProyecto(
					IN proyectoId INT,
					IN empleadoId INT,
                    IN horasAsignadas INT
)-- creacion de procedimiento de almacenamiento con sus parametros
BEGIN -- inicio el procedimiento almacenado
	DECLARE horasTotales INT DEFAULT 0; -- declaro variable dinamina que comienza en cero
    DECLARE horasMaximas INT DEFAULT 100; -- declaro variable fija igual a 100

-- inicia transaccion--
	START TRANSACTION;

	SAVEPOINT PreValidacion;   -- establezco un punto de guardado antes de alguna modificacion

	INSERT INTO asignacionesdeproyectos(
	proyecto_id,
	empleado_id,
	horas_asignadas
	)
	VALUES(
	proyectoId, 
    empleadoId, 
    horasAsignadas
	);

	-- luego calculamos la suma de horasAsignadas
	SELECT 
		IFNULL(SUM(horas_asignadas),0)
	INTO 
		horasTotales
	FROM 
		asignacionesdeproyectos
	WHERE 
		proyecto_id = proyectoId;

	-- si horasTotales supera a horasMaximaS, regrese al savepoint
	IF horasTotales > horasMaximas 
		THEN
		ROLLBACK TO PreValidacion;
		SELECT
		'Error: la asignacion excede el total de horas maximas permitidas para el proyecto'
        AS mensaje;
	ELSE 
		COMMIT;-- Acepta el insert porque esta bien
		SELECT 
		'Asignacion registrada correctamente'
		AS mensaje;
	END IF;

	END //
DELIMITER ;







    

