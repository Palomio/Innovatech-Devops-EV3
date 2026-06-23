-- Opcional: Crear secuencia por si Hibernate la pide debido al GenerationType.AUTO
CREATE SEQUENCE IF NOT EXISTS despacho_seq START WITH 1 INCREMENT BY 50;

CREATE TABLE IF NOT EXISTS despacho (
    id_despacho BIGINT NOT NULL,
    fecha_despacho DATE,
    patente_camion VARCHAR(255),
    intento INT NOT NULL,
    id_compra BIGINT,
    direccion_compra VARCHAR(255),
    valor_compra BIGINT,
    despachado BOOLEAN NOT NULL,
    PRIMARY KEY (id_despacho)
);