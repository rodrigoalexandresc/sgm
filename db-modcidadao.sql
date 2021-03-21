begin;


-- SET AUTOCOMMIT = ON;
-- CREATE DATABASE cidadao;

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

-- INSERT INTO iptu (valor, inscricaoimovel, datavencimento, chave, descricao, areaconstruida, areaterreno) VALUES
-- (60*3.5, '30014444', '2021-2-6', '30014444-20210206', '', 60, 140),
-- (100*3.5, '30054444', '2021-2-6', '30054444-20210206', '', 100, 140);


SELECT * FROM iptu;
