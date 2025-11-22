# Productos - CRUD Spring Boot

API REST para administrar la tabla `productos` en PostgreSQL (campos: codigo, nombre, categoria y precio).

## Requisitos
- Java 17
- Maven 3.9+
- PostgreSQL con base `productosdb`

## Configuracion
Edita `src/main/resources/application.properties` para apuntar a tu servidor de base de datos.

## Ejecutar en local
```bash
mvn spring-boot:run
```
Servicio disponible en `http://localhost:4000`.

## Endpoints
| Metodo | Ruta | Descripcion |
| ------ | ---- | ----------- |
| GET | `/api/productos` | Lista productos |
| GET | `/api/productos/{id}` | Detalle por id |
| POST | `/api/productos` | Crear producto |
| PUT | `/api/productos/{id}` | Actualizar producto |
| DELETE | `/api/productos/{id}` | Eliminar producto |

JSON de ejemplo:
```json
{
  "codigo": "PROD001",
  "nombre": "Teclado Mecanico",
  "categoria": "Perifericos",
  "precio": 249.90
}
```

## Script de datos
Carga los 20 registros usando `scripts/productos_seed.sql`.

## Docker
```bash
docker build -t productos .
docker run -d -p 4000:4000 --name productos productos
```
