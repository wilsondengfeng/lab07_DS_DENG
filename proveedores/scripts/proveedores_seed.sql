DROP TABLE IF EXISTS proveedores;

CREATE TABLE proveedores (
    id BIGSERIAL PRIMARY KEY,
    ruc VARCHAR(20) NOT NULL UNIQUE,
    razon_social VARCHAR(140) NOT NULL,
    contacto VARCHAR(120) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(30) NOT NULL
);

INSERT INTO proveedores (ruc, razon_social, contacto, correo, telefono) VALUES
('20100000001', 'Tecno Servicios SAC', 'Alvaro Rios', 'contacto1@proveedor.com', '+51 901 555 001'),
('20100000002', 'Logistica Global SRL', 'Beatriz Ormeno', 'contacto2@proveedor.com', '+51 901 555 002'),
('20100000003', 'Alimentos Andinos SAC', 'Carlos Medina', 'contacto3@proveedor.com', '+51 901 555 003'),
('20100000004', 'Ferreteria Norte SAC', 'Diana Pinares', 'contacto4@proveedor.com', '+51 901 555 004'),
('20100000005', 'Papeles del Pacifico', 'Eduardo Pino', 'contacto5@proveedor.com', '+51 901 555 005'),
('20100000006', 'Transportes Express', 'Fiorella Quispe', 'contacto6@proveedor.com', '+51 901 555 006'),
('20100000007', 'Energia Viva SAC', 'Gustavo Rado', 'contacto7@proveedor.com', '+51 901 555 007'),
('20100000008', 'Insumos Verdes SAC', 'Helena Suarez', 'contacto8@proveedor.com', '+51 901 555 008'),
('20100000009', 'Medica del Sur', 'Ivan Pacheco', 'contacto9@proveedor.com', '+51 901 555 009'),
('20100000010', 'Agua Pura SAC', 'Juliana Tapia', 'contacto10@proveedor.com', '+51 901 555 010'),
('20100000011', 'Tecnet Solutions', 'Kevin Oliva', 'contacto11@proveedor.com', '+51 901 555 011'),
('20100000012', 'Motores Industriales', 'Lucia Prada', 'contacto12@proveedor.com', '+51 901 555 012'),
('20100000013', 'Optima Salud', 'Marco Cueto', 'contacto13@proveedor.com', '+51 901 555 013'),
('20100000014', 'Ropa del Centro', 'Noemi Barra', 'contacto14@proveedor.com', '+51 901 555 014'),
('20100000015', 'Metales Unidos', 'Oscar Pinchi', 'contacto15@proveedor.com', '+51 901 555 015'),
('20100000016', 'Editorial Horizonte', 'Pamela Cuadros', 'contacto16@proveedor.com', '+51 901 555 016'),
('20100000017', 'Fruta Fresca SAC', 'Renato Suarez', 'contacto17@proveedor.com', '+51 901 555 017'),
('20100000018', 'Construye Ya SAC', 'Sandra Tueros', 'contacto18@proveedor.com', '+51 901 555 018'),
('20100000019', 'Servicios Nauticos', 'Tomas Vivas', 'contacto19@proveedor.com', '+51 901 555 019'),
('20100000020', 'Plasticos Industriales', 'Valeria Santillan', 'contacto20@proveedor.com', '+51 901 555 020');
