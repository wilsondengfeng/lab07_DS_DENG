DROP TABLE IF EXISTS productos;

CREATE TABLE productos (
    id BIGSERIAL PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    precio NUMERIC(10,2) NOT NULL
);

INSERT INTO productos (codigo, nombre, categoria, precio) VALUES
('PROD001', 'Teclado Mecanico', 'Perifericos', 249.90),
('PROD002', 'Mouse Inalambrico', 'Perifericos', 89.50),
('PROD003', 'Monitor 27 UHD', 'Pantallas', 1299.00),
('PROD004', 'Laptop 14 Pro', 'Computo', 3499.99),
('PROD005', 'Disco SSD 1TB', 'Almacenamiento', 379.90),
('PROD006', 'Memoria RAM 16GB', 'Componentes', 299.00),
('PROD007', 'Router WiFi 6', 'Redes', 459.90),
('PROD008', 'Impresora Laser', 'Oficina', 799.00),
('PROD009', 'Silla Ergonomica', 'Oficina', 559.90),
('PROD010', 'Tablet 11 Pulg', 'Movilidad', 1899.00),
('PROD011', 'Camara Web HD', 'Perifericos', 159.90),
('PROD012', 'Audifonos Bluetooth', 'Audio', 289.90),
('PROD013', 'Microfono USB', 'Audio', 219.90),
('PROD014', 'Disco Duro 4TB', 'Almacenamiento', 499.00),
('PROD015', 'Smartwatch Series 7', 'Wearables', 1399.00),
('PROD016', 'USB 128GB', 'Almacenamiento', 99.90),
('PROD017', 'Cargador 65W', 'Accesorios', 129.90),
('PROD018', 'Hub USB-C', 'Accesorios', 149.90),
('PROD019', 'Proyector LED', 'Presentacion', 999.00),
('PROD020', 'Telefono IP Empresarial', 'Redes', 699.90);
