# Balanceador Nginx para clientes/productos/proveedores

Este directorio contiene todo lo necesario para levantar los tres microservicios y un balanceador Nginx en Docker. La topologia queda asi:

| Servicio    | Puerto interno | Puerto expuesto | Ruta en el LB      |
|-------------|----------------|-----------------|--------------------|
| clientes    | 5001           | 5001            | `/clientes/**`     |
| productos   | 6001           | 6001            | `/productos/**`    |
| proveedores | 7001           | 7001            | `/proveedores/**`  |
| nginx (LB)  | 7000           | 7000            | entrada principal  |

## Uso

```bash
cd nginx-loadbalancer
docker compose up --build -d
```

Cuando todo esté arriba navega con rutas dedicadas para mantener los assets correctos:
- `http://localhost:7000/clientes/`
- `http://localhost:7000/productos/`
- `http://localhost:7000/proveedores/`

El archivo `nginx.conf` usa un `upstream` con balanceo aleatorio para la raíz `/`, pero ahora las rutas `/clientes/**`, `/productos/**` y `/proveedores/**` se dirigen siempre al backend correcto. Además, los endpoints `/api/clientes`, `/api/productos` y `/api/proveedores` se enrutan a su microservicio correspondiente para que cada frontend pueda consultar su base de datos sin errores.

## Variables de entorno

`docker-compose.yml` expone variables para apuntar a tu base de datos PostgreSQL externa sin editar los `application.properties`.

| Variable             | Valor por defecto                                      |
|----------------------|--------------------------------------------------------|
| `CLIENTES_DB_URL`    | `jdbc:postgresql://host.docker.internal:5432/lab07_cliente` |
| `PRODUCTOS_DB_URL`   | `jdbc:postgresql://host.docker.internal:5432/lab07_productos` |
| `PROVEEDORES_DB_URL` | `jdbc:postgresql://host.docker.internal:5432/lab07_proveedores` |
| `DB_USERNAME`        | `postgres`                                             |
| `DB_PASSWORD`        | `7839`                                                 |

Para personalizarlas crea un archivo `.env` en este directorio y redefine las variables antes de ejecutar `docker compose`.

## Comandos utiles

```bash
# ver logs
docker compose logs -f clientes-app
docker compose logs -f productos-app
docker compose logs -f proveedores-app
docker compose logs -f nginx

# detener y limpiar
docker compose down
```
