-- Insertamos 2 despachos de prueba que corresponden a las ventas generadas arriba
INSERT INTO despacho (id_despacho, fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado) 
VALUES 
(1, '2026-06-21', 'AB-CD-12', 1, 1, 'Avenida Siempreviva 742, Santiago', 15000, false),
(2, '2026-06-22', 'ZZ-XX-99', 2, 2, 'Calle Falsa 123, Providencia', 45000, true);