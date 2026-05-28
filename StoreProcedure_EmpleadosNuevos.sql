DELIMITER //
CREATE PROCEDURE AgregarEmpleado( IN _nombre VARCHAR(255), IN _apellido VARCHAR(255), IN _email VARCHAR(255), IN _dept_id INT)
BEGIN
		INSERT INTO empleados(nombre, apellido, email, depto_id) VALUES (_nombre, _apellido, _email, _dept_id);
END //

DELIMITER ;


