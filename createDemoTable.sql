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


CREATE TABLE "public".d_autore
(
    id              serial NOT NULL,
    autore          varchar(100),
    ts_creazione    timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_autore PRIMARY KEY (id)
);


CREATE TABLE "public".d_titolo
(
    id              serial NOT NULL,
    titolo          varchar(100),
    ts_creazione    timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_titolo PRIMARY KEY (id)
);


CREATE TABLE "public".d_editore
(
    id              serial NOT NULL,
    editore         varchar(100),
    ts_creazione    timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_editore PRIMARY KEY (id)
);


CREATE TABLE "public".d_genere
(
    id              serial NOT NULL,
    genere          varchar(100),
    ts_creazione    timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_genere PRIMARY KEY (id)
);


CREATE TABLE "public".f_libro
(
    id              serial NOT NULL,
    id_autore       integer NOT NULL,
    id_titolo       integer NOT NULL,
    id_editore      integer,
    id_genere       integer,
    ts_creazione    timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_libro PRIMARY KEY (id)
);


ALTER TABLE "public".f_pietanze
ADD CONSTRAINT fk_f_pietanze_d_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES "public".d_ingrediente (id);

ALTER TABLE "public".f_pietanze
ADD CONSTRAINT fk_f_pietanze_d_spezia FOREIGN KEY (id_spezia) REFERENCES "public".d_spezia (id);

ALTER TABLE "public".f_pietanze
ADD CONSTRAINT fk_f_pietanze_d_quantita FOREIGN KEY (id_quantita) REFERENCES "public".d_quantita (id);

ALTER TABLE "public".f_libro
ADD CONSTRAINT fk_f_libro_autore FOREIGN KEY (id_autore) REFERENCES "public".d_autore (id);

ALTER TABLE "public".f_libro
ADD CONSTRAINT fk_f_libro_titolo FOREIGN KEY (id_titolo) REFERENCES "public".d_titolo (id);

ALTER TABLE "public".f_libro
ADD CONSTRAINT fk_f_libro_editore FOREIGN KEY (id_editore) REFERENCES "public".d_editore (id);

ALTER TABLE "public".f_libro
ADD CONSTRAINT fk_f_libro_genere FOREIGN KEY (id_genere) REFERENCES "public".d_genere (id);