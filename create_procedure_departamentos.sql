DELIMITER //
CREATE PROCEDURE AgregarDepartamento(
	IN _nombre VARCHAR(255),
    IN _ubicacion VARCHAR (255)
)

BEGIN
	INSERT INTO departamentos(
		nombre,
        ubicacion
	)
    VALUES(
		_nombre,
        _ubicacion
	);
END //

DELIMITER ;