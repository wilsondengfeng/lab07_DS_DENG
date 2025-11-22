# Proveedores - CRUD Spring Boot

Servicio REST para manejar la tabla `proveedores` en PostgreSQL (campos: ruc, razonSocial, contacto, correo y telefono).

## Requisitos
- Java 17
- Maven 3.9+
- PostgreSQL con base `proveedoresdb`

## Configuracion
Actualiza `src/main/resources/application.properties` con tu usuario, clave y cadena JDBC.

## Ejecutar en local
```bash
mvn spring-boot:run
```
API activa en `http://localhost:5000`.

## Endpoints
| Metodo | Ruta | Descripcion |
| ------ | ---- | ----------- |
| GET | `/api/proveedores` | Lista proveedores |
| GET | `/api/proveedores/{id}` | Detalle por id |
| POST | `/api/proveedores` | Crea proveedor |
| PUT | `/api/proveedores/{id}` | Actualiza proveedor |
| DELETE | `/api/proveedores/{id}` | Elimina proveedor |

Solicitud de ejemplo:
```json
{
  "ruc": "20100000001",
  "razonSocial": "Tecno Servicios SAC",
  "contacto": "Alvaro Rios",
  "correo": "contacto1@proveedor.com",
  "telefono": "+51 901 555 001"
}
```

## Script de datos
El archivo `scripts/proveedores_seed.sql` contiene 20 inserciones listas para ejecutar.

## Docker
```bash
docker build -t proveedores .
docker run -d -p 5000:5000 --name proveedores proveedores
```
