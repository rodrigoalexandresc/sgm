
--  SET AUTOCOMMIT = ON;
-- CREATE DATABASE stur;

--DROP raole stur;

--CREATE USER userstur4 WITH encrypted PASSWORD 'stur2021!';
--GRANT ALL PRIVILEGES ON DATABASE st ur TO userstur;

begin;

DROP TABLE IF EXISTS imposto  ;

CREATE TABLE imposto (
id SERIAL,
cpfoucnpj varchar(100) NOT NULL DEFAULT '',
valor numeric(15,2) NOT NULL DEFAULT 0,
inscricaoimovel varchar(20) NOT NULL,
datavencimento timestamp NOT NULL,
chave varchar(30) NOT NULL DEFAULT '',
descricao varchar(255) NOT NULL DEFAULT '',
areaconstruida numeric(15,2) NOT NULL DEFAULT 0,
areaterreno numeric(15,2) NOT NULL DEFAULT 0,
CONSTRAINT imposto_pkey PRIMARY KEY (id)
);

INSERT INTO imposto (valor, cpfoucnpj, inscricaoimovel, datavencimento, chave, descricao, areaconstruida, areaterreno)
VALUES 
(60*3.5, '35837615881', '30014444', '2021-2-6', '30014444-20210206', '', 60, 140),
(100*3.5, '35837615881', '30054444', '2021-2-6', '30054444-20210206', '', 100, 140),
(160*3.5, '35837615881', '30014334', '2021-2-6', '30014334-20210206', '', 160, 340),
(60*3.5, '35837615881', '20013144', '2021-2-6', '20013144-20210206', '', 60, 140),
(60*3.5, '67557665007', '40016665', '2021-2-6', '40016665-20210206', '', 60, 140),
(60*3.5, '67557665007', '40013264', '2021-2-6', '40013264-20210206', '', 60, 140),
(30*3.5, '40155088076', '10014477', '2021-2-6', '10014477-20210206', '', 30, 100),
(60*3.5, '40155088076', '20014454', '2021-2-6', '20014454-20210206', '', 60, 140),
(60*3.5, '28306782062', '10066666', '2021-2-6', '10066666-20210206', '', 60, 140),
(60*3.5, '28306782062', '30014888', '2021-2-6', '30014888-20210206', '', 60, 140),
(60*3.5, '59975212069', '30020009', '2021-2-6', '30020009-20210206', '', 60, 140),
(60*3.5, '59975212069', '30004444', '2021-2-6', '30004444-20210206', '', 60, 140),
(60*3.5, '59975212069', '30074444', '2021-2-6', '30074444-20210206', '', 60, 140);

DROP TABLE  IF EXISTS lote;

CREATE TABLE lote (
id SERIAL,
inscricaoimovel varchar(20) NOT NULL,
dataatualizacao timestamp NOT NULL,
areaconstruida numeric(15,2) NOT NULL DEFAULT 0,
areaterreno numeric(15,2) NOT NULL DEFAULT 0,
CONSTRAINT lote_pkey PRIMARY KEY (id)
);

INSERT INTO lote (inscricaoimovel, dataatualizacao, areaconstruida, areaterreno)
VALUES 
('30014444', '2020-1-1', 60, 140),
('30054444', '2020-1-1', 100, 140),
('30014334', '2020-1-1', 160, 340),
('20013144', '2020-1-1', 60, 140),
('40016665', '2020-1-1', 60, 140),
('40013264', '2020-1-1', 60, 140),
('10014477', '2020-1-1', 30, 100),
('20014454', '2020-1-1', 60, 140),
('10066666', '2020-1-1', 60, 140),
('30014888', '2020-1-1', 60, 140),
('30020009', '2020-1-1', 60, 140),
('30004444', '2020-1-1', 60, 140),
('30074444', '2020-1-1', 60, 140);

DROP TABLE  IF EXISTS loteproprietario;

CREATE TABLE loteproprietario (
id SERIAL,
loteid INT not null,
cpfoucnpj varchar(100) NOT NULL DEFAULT '',
CONSTRAINT loteproprietario_pkey PRIMARY KEY (id),
CONSTRAINT loteproprietario_fkey_lote FOREIGN KEY (loteid) REFERENCES lote ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO loteproprietario (loteid, cpfoucnpj) VALUES 
((SELECT id FROM lote WHERE lote.inscricaoimovel = '30014444'), '35837615881'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '30054444'), '35837615881'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '30014334'), '35837615881'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '20013144'), '35837615881'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '40016665'), '67557665007'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '40013264'), '67557665007'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '10014477'), '40155088076'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '20014454'), '40155088076'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '10066666'), '28306782062'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '30014888'), '28306782062'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '30020009'), '59975212069'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '30004444'), '59975212069'),
((SELECT id FROM lote WHERE lote.inscricaoimovel = '30074444'), '59975212069');

commit;


SELECT * FROM imposto;

SELECT * FROM lote where inscricaoimovel = '30074444';





