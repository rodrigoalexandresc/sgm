begin;

DROP TABLE IF EXISTS lote;

CREATE TABLE lote (
id SERIAL,
GeoId int not null,
Endereco text not null,
inscricaoimovel varchar(20) NOT NULL,
ativo boolean not null DEFAULT true,
CONSTRAINT lote_pkey PRIMARY KEY (id)
);

INSERT INTO lote (GeoId, Endereco, inscricaoimovel) VALUES
(1, 'RUA DAS ACACIAS, 99 - PQUE AVENIDA', '40016665'),
(2, 'RUA DAS HORTENCIAS, 142 - PQUE AVENIDA', '40013264'),
(3, 'RUA MF, 2018 - PQUE LIBERDADE', '10014477'),
(4, 'RUA 4, 190 - VILA NOVA', '20014454'),
(11,'AVENIDA CHICO LANDI, 1 - CENTRO', '10066666'),
(12,'ESTRADA DO RIO PEQUENO, KM 7 - VILA RURAL 2', '30014888'),
(54,'RUA DAS CAPIVARAS, 3402 - CHÁCARAS DO MORRO VERDE', '30020009'),
(33,'RUA DA EMA, 3000 - CHÁCARAS DO MORRO VERDE', '30004444'),
(92,'RUA SANTO AGOSTINHO, 200 - VILA SANTA CRUZ', '30074444');

DROP TABLE IF EXISTS lotehistorico;

CREATE TABLE lotehistorico (
id SERIAL,
LoteId int not null,
areaconstruida numeric(15,2) NOT NULL DEFAULT 0,
areaterreno numeric(15,2) NOT NULL DEFAULT 0,
DataAtualizacao timestamp NOT NULL,
CONSTRAINT lotehistorico_pkey PRIMARY KEY (id),
CONSTRAINT lotehistorico_fkey_1 FOREIGN KEY (LoteId) REFERENCES lote ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO lotehistorico (LoteId, areaconstruida, areaterreno, DataAtualizacao) VALUES 
(1,60,140,'2020-12-1'),
(2,60,140,'2020-12-1'),
(3,30,100,'2020-12-1'),
(4,60,140,'2020-12-1'),
(5,60,140,'2020-12-1'),
(6,60,140,'2020-12-1'),
(7,60,140,'2020-12-1'),
(8,60,140,'2020-12-1'),
(9,60,140,'2020-12-1');
