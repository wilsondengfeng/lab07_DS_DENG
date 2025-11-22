# Clientes - CRUD Spring Boot

Servicio REST para administrar la tabla `clientes` en PostgreSQL (campos: documento, nombreCompleto, email y telefono).

## Requisitos
- Java 17
- Maven 3.9+
- PostgreSQL con una base llamada `clientesdb`

## Configuracion
Actualiza `src/main/resources/application.properties` si tus credenciales no son `postgres/postgres` o si la base usa otro host/puerto.

## Ejecutar en local
```bash
mvn spring-boot:run
```
La API queda disponible en `http://localhost:3000`.

## Endpoints principales
| Metodo | Ruta | Descripcion |
| ------ | ---- | ----------- |
| GET | `/api/clientes` | Lista todos los clientes |
| GET | `/api/clientes/{id}` | Obtiene un cliente por id |
| POST | `/api/clientes` | Crea un cliente nuevo |
| PUT | `/api/clientes/{id}` | Actualiza un cliente existente |
| DELETE | `/api/clientes/{id}` | Elimina un cliente |

Para crear o actualizar envia un JSON como:
```json
{
  "documento": "CLI0001",
  "nombreCompleto": "Ana Torres",
  "email": "ana.torres@empresa.com",
  "telefono": "+51 900 111 001"
}
```

## Script de datos
Ejecuta `scripts/clientes_seed.sql` luego de crear la tabla para cargar 20 registros de prueba.

## Docker
```bash
docker build -t clientes .
docker run -d -p 3000:3000 --name clientes clientes
```
