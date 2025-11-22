# Lab07 - Microservicios con Spring Boot y Nginx

Repositorio que agrupa tres servicios CRUD (`clientes`, `productos` y `proveedores`) desarrollados con Spring Boot + PostgreSQL, cada uno con su propio frontend estático y scripts SQL de prueba. El directorio `nginx-loadbalancer` contiene un docker-compose que construye los microservicios y los publica detrás de un balanceador Nginx.

## Estructura

| Ruta                  | Descripción                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| `clientes/`           | CRUD para la entidad Cliente (puerto 5001).                                 |
| `productos/`          | CRUD para la entidad Producto (puerto 6001).                                |
| `proveedores/`        | CRUD para la entidad Proveedor (puerto 7001).                               |
| `nginx-loadbalancer/` | `docker-compose.yml` y `nginx.conf` para exponer todo en `http://localhost:7000`. |

Cada microservicio incluye:
- `src/main/resources/application.properties` con la configuración base.
- Archivos estáticos en `src/main/resources/static/`.
- Script SQL en `scripts/*.sql` para poblar 20 registros de prueba.

## Requisitos comunes

- Java 17
- Maven 3.9 o superior
- Docker + Docker Compose (para la opción contenedorizada)
- PostgreSQL con tres bases de datos creadas previamente:
  - `lab07_cliente`
  - `lab07_productos`
  - `lab07_proveedores`
- Usuario/clave por defecto: `postgres` / `7839` (ajusta según tu entorno).

> **Nota:** Cada aplicación tiene `spring.jpa.hibernate.ddl-auto=update`, por lo que al iniciarse creará/ajustará las tablas automáticamente. Ejecuta los scripts SQL si quieres datos iniciales.

## Ejecutar los servicios en local (sin Docker)

1. Clona este repositorio y configura las bases de datos indicadas.
2. Para cada módulo (`clientes`, `productos`, `proveedores`):
   ```bash
   cd <modulo>
   mvn spring-boot:run
   ```
3. Verifica los endpoints REST:
   - `http://localhost:5001/api/clientes`
   - `http://localhost:6001/api/productos`
   - `http://localhost:7001/api/proveedores`
4. Las páginas estáticas se sirven desde `/clientes/`, `/productos/` y `/proveedores/` respectivamente (mismo puerto del backend).

Si necesitas cambiar puertos o credenciales, actualiza el `application.properties` del módulo correspondiente.

## Levantar todo con Docker + Nginx

1. (Opcional) Crea un archivo `.env` dentro de `nginx-loadbalancer/` para sobreescribir las variables:
   ```dotenv
   CLIENTES_DB_URL=jdbc:postgresql://host.docker.internal:5432/lab07_cliente
   PRODUCTOS_DB_URL=jdbc:postgresql://host.docker.internal:5432/lab07_productos
   PROVEEDORES_DB_URL=jdbc:postgresql://host.docker.internal:5432/lab07_proveedores
   DB_USERNAME=postgres
   DB_PASSWORD=7839
   ```
2. Desde `nginx-loadbalancer/` ejecuta:
   ```bash
   docker compose up --build -d
   ```
3. Accede vía balanceador:
   - Front clientes: `http://localhost:7000/clientes/`
   - Front productos: `http://localhost:7000/productos/`
   - Front proveedores: `http://localhost:7000/proveedores/`
   - APIs expuestas bajo `/api/clientes`, `/api/productos`, `/api/proveedores`.
4. Para revisar logs:
   ```bash
   docker compose logs -f clientes-app
   docker compose logs -f productos-app
   docker compose logs -f proveedores-app
   docker compose logs -f nginx
   ```
5. Para detener los contenedores:
   ```bash
   docker compose down
   ```

## Semillas de datos

Después de crear cada base, ejecuta el script SQL del módulo correspondiente:

- `clientes/scripts/clientes_seed.sql`
- `productos/scripts/productos_seed.sql`
- `proveedores/scripts/proveedores_seed.sql`

Esto carga un conjunto homogéneo de registros que permiten probar el frontend y los endpoints CRUD de inmediato.

## Próximos pasos

- Agregar pruebas unitarias/integración por servicio.
- Configurar CI/CD para compilar y publicar las imágenes automáticamente.
