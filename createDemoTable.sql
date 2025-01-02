CREATE TABLE "public".d_ingrediente
(
    id                      serial NOT NULL,
    ingrediente             varchar(50),
    ts_creazione            timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_ingrediente PRIMARY KEY (id)
);

CREATE TABLE "public".d_spezia
(
    id                      serial NOT NULL,
    spezia                  varchar(100),
    ts_creazione            timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_spezia PRIMARY KEY (id)
);

CREATE TABLE "public".d_quantita
(
    id                      serial NOT NULL,
    quantita                varchar(150),
    ts_creazione            timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_quantita PRIMARY KEY (id)
);


CREATE TABLE "public".f_pietanze
(
    id                      serial NOT NULL,
    id_ingrediente          integer,
    id_spezia               integer,
    id_quantita             integer,
    ts_creazione            timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_pietanza PRIMARY KEY (id)
);


ALTER TABLE "public".f_pietanze
ADD CONSTRAINT fk_f_pietanze_d_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES "public".d_ingrediente (id);

ALTER TABLE "public".f_pietanze
ADD CONSTRAINT fk_f_pietanze_d_spezia FOREIGN KEY (id_spezia) REFERENCES "public".d_spezia (id);

ALTER TABLE "public".f_pietanze
ADD CONSTRAINT fk_f_pietanze_d_quantita FOREIGN KEY (id_quantita) REFERENCES "public".d_quantita (id);
