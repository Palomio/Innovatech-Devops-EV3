-- Opcional: Crear secuencia por si Hibernate la pide debido al GenerationType.AUTO
CREATE SEQUENCE IF NOT EXISTS venta_seq START WITH 1 INCREMENT BY 50;

CREATE TABLE IF NOT EXISTS venta (
    id_venta BIGINT NOT NULL,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN NOT NULL,
    PRIMARY KEY (id_venta)
);