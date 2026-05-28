CREATE VIEW VistaEmpleadosProyectos AS

SELECT 
	E.nombre AS NombreEmpleado,
    E.apellido AS ApellidoEmpleado,
	P.nombre AS NombreProyecto
FROM
	empleados E
JOIN
	asignacionesdeproyectos AP
ON
	E.empleado_id = AP.empleado_id
JOIN proyectos P
ON 	AP.proyecto_id = P.proyecto_id;


SELECT *
FROM
	VistaEmpleadosProyectos;
	
	
