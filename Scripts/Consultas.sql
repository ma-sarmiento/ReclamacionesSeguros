--Consulta #1
SELECT 
    p.Nombre AS Nombre_Paciente, 
    p.Sexo AS Genero,
    COUNT(c.ID_Cita) AS Numero_Citas,
    COALESCE(SUM(r.Monto_Reclamado), 0) AS Monto_Reclamado_Total,
    COALESCE(SUM(r.Monto_Pagado), 0) AS Monto_Pagado_Total,
    COALESCE(SUM(r.Monto_Reclamado) - SUM(r.Monto_Pagado), 0) AS Diferencia_Reclamado_Pagado
FROM Paciente p
LEFT JOIN Reclamacion r ON p.Cedula_Paciente = r.Cedula_Paciente
LEFT JOIN Cita c ON r.ID_Cita = c.ID_Cita
GROUP BY p.Nombre, p.Sexo

UNION ALL

SELECT 
    'Total General' AS Nombre_Paciente,
    NULL AS Genero,
    COUNT(c.ID_Cita) AS Numero_Citas,
    COALESCE(SUM(r.Monto_Reclamado), 0) AS Monto_Reclamado_Total,
    COALESCE(SUM(r.Monto_Pagado), 0) AS Monto_Pagado_Total,
    COALESCE(SUM(r.Monto_Reclamado) - SUM(r.Monto_Pagado), 0) AS Diferencia_Reclamado_Pagado
FROM Paciente p
LEFT JOIN Reclamacion r ON p.Cedula_Paciente = r.Cedula_Paciente
LEFT JOIN Cita c ON r.ID_Cita = c.ID_Cita;


--Consulta #2
SELECT 
    p.Cargo AS Clase_Miembro,
    p.Sexo AS Sexo,
    SUM(
        CASE 
            WHEN r.Monto_Reclamado <> r.Monto_Pagado THEN 1
            ELSE 0
        END
    ) AS Numero_Reclamaciones_No_Pagadas
FROM 
    Personal p
LEFT JOIN Reclamacion r ON p.Cedula_Personal = r.Cedula_Personal
GROUP BY 
    p.Cargo, p.Sexo;


--Consulta #3
SELECT 
    p.Nombre AS Nombre_Paciente,
    COALESCE(r.Nombre, 'Ninguno') AS Nombre_Relacionado,
    COALESCE(r.Tipo_Relacion, 'Ninguna') AS Naturaleza_Relacion
FROM 
    Paciente p
LEFT JOIN 
    Relacionado r ON p.Cedula_Paciente = r.Cedula_Relacionado;

--Consulta #4
SELECT 
    cs.Nombre AS Nombre_Compañia,
    p.Numero_Poliza,
    COUNT(r.Codigo_Reclamo) AS Total_Reclamaciones
FROM 
    Compania_Seguros cs
INNER JOIN 
    Poliza p ON cs.NIT = p.NIT
LEFT JOIN 
    Reclamacion r ON p.Numero_Poliza = r.Numero_Poliza
GROUP BY 
    cs.Nombre, p.Numero_Poliza;

--Consulta #5
SELECT 
    r.Codigo_Reclamo AS ID_Reclamo,
    COUNT(d.ID_Disputa) AS Numero_Etapas_Negociacion,
    d2.Codigo_Reclamo AS Nuevo_Reclamo
FROM 
    Reclamacion r
LEFT JOIN 
    Disputa d ON r.Codigo_Reclamo = d.Codigo_Reclamo
LEFT JOIN 
    Disputa d2 ON d.ID_Disputa = d2.ID_Disputa
GROUP BY 
    r.Codigo_Reclamo, d2.Codigo_Reclamo;