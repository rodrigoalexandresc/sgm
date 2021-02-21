begin;

DROP TABLE IF EXISTS iptu;

CREATE TABLE iptu (
id SERIAL,
valor numeric(15,2) NOT NULL DEFAULT 0,
inscricaoimovel varchar(20) NOT NULL,
datavencimento timestamp NOT NULL,
chave varchar(30) NOT NULL DEFAULT '',
descricao varchar(255) NOT NULL DEFAULT '',
areaconstruida numeric(15,2) NOT NULL DEFAULT 0,
areaterreno numeric(15,2) NOT NULL DEFAULT 0,
CONSTRAINT iptu_pkey PRIMARY KEY (id)
);
