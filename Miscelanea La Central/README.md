# Caso de Estudio: Miscelánea "La Central"

## Descripción del negocio

"La Central" es una miscelánea dedicada a la venta de productos alimenticios al por mayor y al detal. El negocio cuenta con múltiples socios que desean tener visibilidad diaria y mensual de todos los movimientos financieros y operativos.

## Características principales - Requerimientos del sistema

- Venta de productos alimenticios al **detal** y al **por mayor**
- Gestión de **clientes** con opción de crédito y abonos parciales
- Gestión de **proveedores** con opción de crédito y pagos parciales
- Registro de **compras**, **inventario** y **ventas**
- Control de **gastos operativos**: nómina, arriendo, agua, luz, internet, honorarios contables
- **Reportes diarios** de movimientos para los socios
- **Reportes mensuales** de utilidad

## Estructura del caso de estudio

| Carpeta | Contenido |
|---|---|
| `00_Base_de_Datos/` | Modelo de datos, schema SQL y datos de prueba |
| `Unidad_1_Consultas_SQL/` | Consultas SQL aplicadas al negocio |
| `Unidad_2_Control_Usuarios/` | Roles y privilegios por tipo de empleado |
| `Unidad_3_API_FastAPI/` | API REST en Python para administrar la miscelánea |
| `Unidad_4_Administracion/` | Backup, índices, optimización, concurrencia y auditoría |

## Roles de usuarios del sistema

| Rol | Descripción |
|---|---|
| `admin` | Acceso total al sistema |
| `vendedor` | Registra ventas y consulta productos |
| `bodeguero` | Gestiona inventario y compras |
| `contador` | Acceso a reportes financieros y gastos |
| `socio` | Solo lectura de reportes |