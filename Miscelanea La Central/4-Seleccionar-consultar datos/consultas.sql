--ORDER BY, LIMIT y OFFSET
ORDER BY: Ordernar los resultados por una o más columnas
ASC: Ordenar ascendentemente
DESC: Ordenar descendentemente
LIMIT n: Muestrar los primeros n resultados
OFFSET n: Saltar los primeros n resultados antes de empezar a mostrar
PAGINACIÓN: Cargar datos por partes, se hace mezclando LIMIT y OFFSET
GROUP BY: Agrupa filas con el mismo valor en una columna, colapsándolas en uan sola fila por grupo
HAVING: filtrar grupos - Lo mismo que WHERE pero apicado después del agrupamiento
CASE: Es una expresión condicional. Funciona como un if / else if / else dentro de una consulta
UNION: Filas A más filas de B (SIN duplicados)
UNION ALL: Filas A más filas de B (CON duplicados)
INTERSECT: Solamente filas que están en A y también en B (Se puede simular)
MINUS / EXCEPT: Filas que están en A pero NO en B (Se puede simular)
JOIN: Basico

-- Reglas clave:
El orden de las cláusulas en SQL es: - FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY -> LIMIT


-- Consulta 1: Productos ordenados por precio detal de mayor a menor
SELECT nombre, precio_venta_detal, stock
FROM productos
ORDER BY precio_venta_detal DESC

-- Consulta 2: Alerta de inventario: Productos con menor stock primero
SELECT nombre, stock, stock_minimo
FROM productos
WHERE activo = TRUE
ORDER BY stock ASC

-- Consulta 3: Las 5 ventas más recientes
SELECT id, fecha, tipo, total
FROM ventas
ORDER BY fecha DESC
LIMIT 5



