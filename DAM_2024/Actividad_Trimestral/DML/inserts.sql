INSERT INTO personas VALUES ('11234567A', 'José Jiménez', 'ESP');
INSERT INTO personas VALUES ('12345678B', 'Juan Pérez', 'ESP');
INSERT INTO personas VALUES ('23456789C', 'María García', 'ESP');
INSERT INTO personas VALUES ('34567890D', 'Pedro López', 'MEX');
INSERT INTO personas VALUES ('45678901E', 'Ana Martínez', 'VEN');
INSERT INTO personas VALUES ('56789012F', 'Carlos Sánchez', 'ESP');
INSERT INTO personas VALUES ('67890123G', 'Laura Rodríguez', 'NIC');
INSERT INTO personas VALUES ('78901234H', 'Marta Hernández', 'COL');
INSERT INTO personas VALUES ('89012345I', 'David Fernández', 'VEN');
INSERT INTO personas VALUES ('90123456J', 'Elena Gómez', 'PER');


INSERT INTO fabricas VALUES ('FAB1', 'Calle Principal 123');
INSERT INTO fabricas VALUES ('FAB3', 'Plaza Mayor 789');
INSERT INTO fabricas VALUES ('FAB2', 'Avenida Central 456');
INSERT INTO fabricas VALUES ('FAB4', 'Calle Secundaria 321');
INSERT INTO fabricas VALUES ('FAB5', 'Boulevard Norte 654');


INSERT INTO vehiculos VALUES ('5678MNO', 'Chevrolet', 'Cruze', 'Plateado', 'FAB1');
INSERT INTO vehiculos VALUES ('1234ABC', 'Toyota', 'Corolla', 'Rojo', 'FAB3');
INSERT INTO vehiculos VALUES ('2345DEF', 'Ford', 'Focus', 'Azul', 'FAB2');
INSERT INTO vehiculos VALUES ('3456GHI', 'Honda', 'Civic', 'Blanco', 'FAB4');
INSERT INTO vehiculos VALUES ('4567JKL', 'Volkswagen', 'Golf', 'Negro', 'FAB5');

INSERT INTO alquileres VALUES ('11234567A', '2023-07-01', '2023-12-31', 5000, '5678MNO');
INSERT INTO alquileres VALUES ('12345678B', '2023-01-01', '2023-06-30', 50000, '1234ABC');
INSERT INTO alquileres VALUES ('23456789C', '2023-07-01', '2023-12-31', 45000, '1234ABC');
INSERT INTO alquileres VALUES ('34567890D', '2023-01-01', '2023-06-30', 40000, '2345DEF');
INSERT INTO alquileres VALUES ('45678901E', '2023-07-01', '2023-12-31', 35000, '2345DEF');
INSERT INTO alquileres VALUES ('56789012F', '2023-01-01', '2023-06-30', 30000, '3456GHI');
INSERT INTO alquileres VALUES ('67890123G', '2023-07-01', '2023-12-31', 25000, '3456GHI');
INSERT INTO alquileres VALUES ('78901234H', '2023-01-01', '2023-06-30', 20000, '4567JKL');
INSERT INTO alquileres VALUES ('89012345I', '2023-07-01', '2023-12-31', 15000, '4567JKL');
INSERT INTO alquileres VALUES ('11234567A', '2022-01-01', '2022-06-30', 15000, '5678MNO');
INSERT INTO alquileres VALUES ('90123456J', '2023-01-01', '2023-06-30', 10000, '5678MNO');