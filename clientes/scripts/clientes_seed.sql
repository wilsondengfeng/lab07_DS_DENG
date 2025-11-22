DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id BIGSERIAL PRIMARY KEY,
    documento VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(30) NOT NULL
);

INSERT INTO clientes (documento, nombre_completo, email, telefono) VALUES
('CLI0001', 'Ana Torres', 'ana.torres@empresa.com', '+51 900 111 001'),
('CLI0002', 'Bruno Salazar', 'bruno.salazar@empresa.com', '+51 900 111 002'),
('CLI0003', 'Carla Mendez', 'carla.mendez@empresa.com', '+51 900 111 003'),
('CLI0004', 'Diego Castro', 'diego.castro@empresa.com', '+51 900 111 004'),
('CLI0005', 'Elena Vargas', 'elena.vargas@empresa.com', '+51 900 111 005'),
('CLI0006', 'Fabian Morales', 'fabian.morales@empresa.com', '+51 900 111 006'),
('CLI0007', 'Gabriela Soto', 'gabriela.soto@empresa.com', '+51 900 111 007'),
('CLI0008', 'Hector Ramos', 'hector.ramos@empresa.com', '+51 900 111 008'),
('CLI0009', 'Ines Gutierrez', 'ines.gutierrez@empresa.com', '+51 900 111 009'),
('CLI0010', 'Javier Rojas', 'javier.rojas@empresa.com', '+51 900 111 010'),
('CLI0011', 'Karla Navarro', 'karla.navarro@empresa.com', '+51 900 111 011'),
('CLI0012', 'Luis Paredes', 'luis.paredes@empresa.com', '+51 900 111 012'),
('CLI0013', 'Marina Huaman', 'marina.huaman@empresa.com', '+51 900 111 013'),
('CLI0014', 'Nicolas Ponce', 'nicolas.ponce@empresa.com', '+51 900 111 014'),
('CLI0015', 'Olga Caceres', 'olga.caceres@empresa.com', '+51 900 111 015'),
('CLI0016', 'Pablo Aguirre', 'pablo.aguirre@empresa.com', '+51 900 111 016'),
('CLI0017', 'Quena Rosas', 'quena.rosas@empresa.com', '+51 900 111 017'),
('CLI0018', 'Raul Cuellar', 'raul.cuellar@empresa.com', '+51 900 111 018'),
('CLI0019', 'Silvia Prado', 'silvia.prado@empresa.com', '+51 900 111 019'),
('CLI0020', 'Tomas Beltran', 'tomas.beltran@empresa.com', '+51 900 111 020');
