# Curso: Bases de Datos II

**Motor principal:** MySQL  
**Enfoque:** Administración y gestión con visión comparativa de paradigmas modernos

---

## Unidad 0 — Prerrequisitos del curso

### Git
- Qué es Git y por qué usarlo (control de versiones)
- Instalación y configuración inicial (`git config`)
- Flujo de trabajo básico: `init`, `add`, `commit`, `status`, `log`

### GitHub
- Subir archivos al repositorio remoto: `push`
- Visualización de archivos y commits en la interfaz de GitHub

---

## Unidad 1 — Consultas SQL

### Eje 1: Consultas fundamentales
- Manipulación de datos: `INSERT`, `UPDATE`, `DELETE`
- Ordenamiento: `ORDER BY` con `ASC` / `DESC`
- Paginación básica: `LIMIT` y `OFFSET`
- Agrupación y filtrado: `GROUP BY`, `HAVING`
- Expresiones condicionales: cláusula `CASE`
- Operadores de conjuntos: `UNION`, `INTERSECT`, `MINUS`
- Subconsultas (queries anidadas)

### Eje 2: Combinaciones de tablas (JOINs)
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- `FULL OUTER JOIN`, `CROSS JOIN`, `SELF JOIN`

### Eje 3: Funciones
- Funciones de agregación: `SUM`, `AVG`, `MIN`, `MAX`, `COUNT`, `GROUP_CONCAT`
- Funciones de carácter, numéricas, de fecha y de conversión
- Funciones ventana: `RANK`, `DENSE_RANK`, `ROW_NUMBER`

---

## Unidad 2 — Control de Usuarios

- Gestión de usuarios en MySQL
- Creación, modificación y eliminación de usuarios (`CREATE USER`)
- Tipos de privilegios:
  - **Del sistema:** `CREATE DATABASE`, `DROP DATABASE`, `CREATE USER`, `GRANT OPTION`
  - **A nivel de objeto:** `SELECT`, `INSERT`, `UPDATE`, `DELETE`, `EXECUTE`
- Asignación de roles y privilegios
- Diseño de sistemas de acceso seguros y escalables

---

## Unidad 3 — Implementación de una API con Python y FastAPI

**Contexto:** Aplicación para administrar una miscelánea de venta de productos alimenticios

### Configuración del entorno
- Instalación de Python y dependencias (`mysql-connector-python`, `fastapi`, `uvicorn`)
- Conexión a MySQL desde Python

### Modelo de datos
- Diseño de tablas: productos, categorías, ventas, clientes
- Creación de la base de datos y tablas desde Python

### Operaciones CRUD con la API
- `GET` — consultar productos y ventas
- `POST` — registrar productos y ventas
- `PUT` — actualizar precios e inventario
- `DELETE` — eliminar productos

### Consultas integradas
- Aplicar JOINs, filtros y agrupaciones de la Unidad 1 desde la API
- Reporte de ventas por categoría y productos más vendidos

### Buenas prácticas
- Manejo de errores y validaciones
- Uso de parámetros para prevenir SQL Injection

---

## Unidad 4 — Administración de Bases de Datos

### Backup y Recuperación
- Tipos de backup: Completo, Incremental, Diferencial, en Tiempo Real
- Estrategias de recuperación con MySQL: completa, a punto en el tiempo, parcial
- Planes de recuperación y cumplimiento legal

### Indexación
- Tipos de índices en MySQL: Primario, Secundario, Compuesto, Único, Textual, Espacial
- Trade-offs: rendimiento vs. espacio en disco

### Optimización de Consultas
- Uso eficiente de índices y cláusula `WHERE`
- Uso de `EXPLAIN` para analizar planes de ejecución
- Evitar `SELECT *`, usar `LIMIT` / `FETCH`
- Preferir `JOIN` sobre subconsultas

### Gestión de la Concurrencia en MySQL
- Problemas: Lecturas Sucias, Lecturas no Repetibles, Lecturas Fantasma, Condiciones de Carrera
- Mecanismos: MVCC, bloqueos InnoDB a nivel de fila y tabla
- Niveles de aislamiento
- Gestión de deadlocks (interbloqueos)

### Seguridad y Auditoría
- Configuración segura de MySQL
- Autenticación, cifrado y protección de datos
- Monitoreo de actividades en el sistema

---

## Unidad 5 — Bases de Datos para Casos de Uso Modernos

### Bases de datos vectoriales para RAGs en IA
- Qué es un RAG (Retrieval-Augmented Generation) y por qué necesita una BD especializada
- Concepto de embeddings y búsqueda por similitud semántica
- Motores: pgvector, Pinecone, Chroma, Weaviate
- Casos de uso: chatbots con contexto, búsqueda semántica, asistentes sobre documentos

### Bases de datos orientadas a grafos (Neo4j)
- Modelo de datos: nodos, relaciones y propiedades
- Cuándo usar grafos vs. relacional
- Lenguaje Cypher
- Casos de uso: redes sociales, recomendaciones, detección de fraude

### MongoDB: modelo de documentos y casos de uso NoSQL
- Modelo de documentos y esquema flexible
- Operaciones CRUD en MongoDB
- Cuándo usar MongoDB vs. relacional
- Casos de uso: e-commerce, catálogos, apps con datos semiestructurados

### Comparativo de paradigmas
- SQL vs. NoSQL vs. Vectorial vs. Grafos
- Criterios de selección según el proyecto: estructura de datos, consistencia, escalabilidad, tipo de consulta