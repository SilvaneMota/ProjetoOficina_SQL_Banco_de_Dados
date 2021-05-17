CREATE DATABASE OFICINA;

USE OFICINA;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	ID_CARRO INT UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('CEL','RES','COM') NOT NULL,
	NUMERO VARCHAR(30) NOT NULL,
	ID_CLIENTE INT 
);

CREATE TABLE MARCA(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	MARCA VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO(
	IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
	MODELO VARCHAR(30) NOT NULL,
	PLACA VARCHAR(30) NOT NULL UNIQUE,
	ID_MARCA INT
);

CREATE TABLE COR(
	IDCOR INT PRIMARY KEY AUTO_INCREMENT,
	COR VARCHAR(30) UNIQUE
);

CREATE TABLE CARRO_COR(
	ID_CARRO INT,
	ID_COR INT,
	PRIMARY KEY(ID_CARRO,ID_COR)
);

ALTER TABLE TELEFONE 
ADD CONSTRAINT FK_TELEFONE_CLIENTE
FOREIGN KEY(ID_CLIENTE)
REFERENCES CLIENTE(IDCLIENTE);


ALTER TABLE CLIENTE
ADD CONSTRAINT FK_CLIENTE_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);


ALTER TABLE CARRO
ADD CONSTRAINT FK_CARRO_MARCA
FOREIGN KEY(ID_MARCA)
REFERENCES MARCA(IDMARCA);


ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_COR
FOREIGN KEY(ID_COR)
REFERENCES COR(IDCOR);


ALTER TABLE CARRO_COR
ADD CONSTRAINT FK_CARRO
FOREIGN KEY(ID_CARRO)
REFERENCES CARRO(IDCARRO);

INSERT INTO MARCA VALUES (null, 'Honda');
INSERT INTO MARCA VALUES (null, 'Fiat');
INSERT INTO MARCA VALUES (null,'Chevrolet');
INSERT INTO MARCA VALUES (null, 'Citroen');
INSERT INTO MARCA VALUES (null, 'Ford');
INSERT INTO MARCA VALUES (null, 'Kia');

SELECT IDMARCA, MARCA FROM MARCA;
+---------+-----------+
| IDMARCA | MARCA     |
+---------+-----------+
|       3 | Chevrolet |
|       4 | Citroen   |
|       2 | Fiat      |
|       5 | Ford      |
|       1 | Honda     |
|       6 | Kia       |
+---------+-----------+

INSERT INTO CARRO VALUES (null, 'City Ex CVT', 'PHL4F06', 1);
INSERT INTO CARRO VALUES (null, 'Fit LX CVT', 'PLK3F56', 1);
INSERT INTO CARRO VALUES (null, 'Toro', 'GTF5F23', 2);
INSERT INTO CARRO VALUES (null, 'Cronos','EWS1F89', 2);
INSERT INTO CARRO VALUES (null, 'Onix', 'OKR8R13', 3);
INSERT INTO CARRO VALUES (null, 'Cruze', 'TRF5H67', 3);
INSERT INTO CARRO VALUES (null, 'C4 Lounge', 'FDS6J78', 4);
INSERT INTO CARRO VALUES (null, 'Aircross', 'XCV0M45', 4);
INSERT INTO CARRO VALUES (null, 'EcoSport', 'LKM6Z78', 5);
INSERT INTO CARRO VALUES (null, 'Ranger (Cabine Dupla)', 'SLY9X56', 5);
INSERT INTO CARRO VALUES (null, 'Sportage', 'PQD9F67', 6);
INSERT INTO CARRO VALUES (null, 'Sorento', 'RFB0L76', 6);

 SELECT MODELO, PLACA, IDCARRO FROM CARRO;
+-----------------------+---------+---------+
| MODELO                | PLACA   | IDCARRO |
+-----------------------+---------+---------+
| City Ex CVT           | PHL4F06 |       1 |
| Fit LX CVT            | PLK3F56 |       2 |
| Toro                  | GTF5F23 |       3 |
| Cronos                | EWS1F89 |       4 |
| Onix                  | OKR8R13 |       5 |
| Cruze                 | TRF5H67 |       6 |
| C4 Lounge             | FDS6J78 |       7 |
| Aircross              | XCV0M45 |       8 |
| EcoSport              | LKM6Z78 |       9 |
| Ranger (Cabine Dupla) | SLY9X56 |      10 |
| Sportage              | PQD9F67 |      11 |
| Sorento               | RFB0L76 |      12 |
+-----------------------+---------+---------+

INSERT INTO CLIENTE VALUES (Null,'Silvane Melo da Mota','F', 9);
INSERT INTO CLIENTE VALUES (Null,'Guilherme Henrique Gonçalves', 'M', 4);
INSERT INTO CLIENTE VALUES (Null,'Maria do Livramento M Mota', 'F', 6);
INSERT INTO CLIENTE VALUES (Null,'Nelson Rodrigues da Mota', 'M', 11);
INSERT INTO CLIENTE VALUES (Null,'Gilcelli Melo da Mota', 'F', 12);
INSERT INTO CLIENTE VALUES (Null,'Leandro Melo da Mota', 'M', 3);
INSERT INTO CLIENTE VALUES (Null,'Claudia Simone R. da Mota', 'F', 8);
INSERT INTO CLIENTE VALUES (Null,'Rosangela Alqueja', 'F', 10);
INSERT INTO CLIENTE VALUES (Null,'Edson Alqueja','M', 1);
INSERT INTO CLIENTE VALUES (Null,'Anna Cristina da Silva', 'F', 7);
INSERT INTO CLIENTE VALUES (Null,'Katya Prates', 'F', 2);
INSERT INTO CLIENTE VALUES (Null,'Elisa Melo Batista', 'F', 5);

SELECT IDCLIENTE, NOME, SEXO FROM CLIENTE;
+-----------+------------------------------+------+
| IDCLIENTE | NOME                         | SEXO |
+-----------+------------------------------+------+
|         1 | Silvane Melo da Mota         | F    |
|         2 | Guilherme Henrique Gonçalves | M    |
|         3 | Maria do Livramento M Mota   | F    |
|         4 | Nelson Rodrigues da Mota     | M    |
|         5 | Gilcelli Melo da Mota        | F    |
|         6 | Leandro Melo da Mota         | M    |
|         7 | Claudia Simone R. da Mota    | F    |
|         8 | Rosangela Alqueja            | F    |
|         9 | Edson Alqueja                | M    |
|        10 | Anna Cristina da Silva       | F    |
|        11 | Katya Prates                 | F    |
|        12 | Elisa Melo Batista           | F    |
+-----------+------------------------------+------+

INSERT INTO TELEFONE VALUES (NULL, 'CEL','11 93456-9876', 1);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '11 4765-7865', 2);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '11 995643-0912', 4);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '11 4234-4567', 5);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '11 4567-1233', 7);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '11 3423-8976', 1);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '11 95643-0976', 8);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '11 90765-2345', 10);
INSERT INTO TELEFONE VALUES (NULL, 'RES', '11 2467-0987', 12);
INSERT INTO TELEFONE VALUES (NULL, 'CEL', '11 98532-5554', 4);

SELECT TIPO, NUMERO, ID_CLIENTE FROM TELEFONE;
+------+----------------+------------+
| TIPO | NUMERO         | ID_CLIENTE |
+------+----------------+------------+
| CEL  | 11 93456-9876  |          1 |
| RES  | 11 4765-7865   |          2 |
| CEL  | 11 995643-0912 |          4 |
| RES  | 11 4234-4567   |          5 |
| RES  | 11 4567-1233   |          7 |
| RES  | 11 3423-8976   |          1 |
| CEL  | 11 95643-0976  |          8 |
| CEL  | 11 90765-2345  |         10 |
| RES  | 11 2467-0987   |         12 |
| CEL  | 11 98532-5554  |          4 |
+------+----------------+------------+

INSERT INTO COR VALUES (NULL, 'Preto');
INSERT INTO COR VALUES (NULL, 'Prata');
INSERT INTO COR VALUES (NULL, 'Amarelo');
INSERT INTO COR VALUES (NULL, 'Vermelho');
INSERT INTO COR VALUES (NULL, 'Cinza Chumbo');
INSERT INTO COR VALUES (NULL, 'Perolado');
INSERT INTO COR VALUES (NULL, 'Branco');
INSERT INTO COR VALUES (NULL, 'Marron');
INSERT INTO COR VALUES (NULL, 'Laranja');
INSERT INTO COR VALUES (NULL, 'Azul');

 SELECT COR, IDCOR FROM COR;
+--------------+-------+
| COR          | IDCOR |
+--------------+-------+
| Amarelo      |     3 |
| Azul         |    10 |
| Branco       |     7 |
| Cinza Chumbo |     5 |
| Laranja      |     9 |
| Marron       |     8 |
| Perolado     |     6 |
| Prata        |     2 |
| Preto        |     1 |
| Vermelho     |     4 |
+--------------+-------+
INSERT INTO CARRO_COR VALUES (1,2);
INSERT INTO CARRO_COR VALUES (1,3);
INSERT INTO CARRO_COR VALUES (2,3);
INSERT INTO CARRO_COR VALUES (3,10);
INSERT INTO CARRO_COR VALUES (3,6);
INSERT INTO CARRO_COR VALUES (4,1);
INSERT INTO CARRO_COR VALUES (5,4);
INSERT INTO CARRO_COR VALUES (6,9);
INSERT INTO CARRO_COR VALUES (6,8);
INSERT INTO CARRO_COR VALUES (7,7);
INSERT INTO CARRO_COR VALUES (8,5);
INSERT INTO CARRO_COR VALUES (8,9);
INSERT INTO CARRO_COR VALUES (9,8);
INSERT INTO CARRO_COR VALUES (10,1);
INSERT INTO CARRO_COR VALUES (11,10);
INSERT INTO CARRO_COR VALUES (11,6);
INSERT INTO CARRO_COR VALUES (12,5);

SELECT * FROM CARRO_COR;
+----------+--------+
| ID_CARRO | ID_COR |
+----------+--------+
|        4 |      1 |
|       10 |      1 |
|        1 |      2 |
|        1 |      3 |
|        2 |      3 |
|        5 |      4 |
|        8 |      5 |
|       12 |      5 |
|        3 |      6 |
|       11 |      6 |
|        7 |      7 |
|        6 |      8 |
|        9 |      8 |
|        6 |      9 |
|        8 |      9 |
|        3 |     10 |
|       11 |     10 |
+----------+--------+

SHOW CREATE TABLE CARRO_COR;

SELECT CLIENTE.NOME, TELEFONE.TIPO, TELEFONE.NUMERO, CLIENTE.SEXO, CARRO.MODELO, MARCA.MARCA, CARRO.PLACA, COR.COR
FROM CARRO
INNER JOIN CLIENTE
ON IDCARRO = CLIENTE.ID_CARRO
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE
INNER JOIN MARCA
ON CARRO.ID_MARCA = MARCA.IDMARCA
INNER JOIN CARRO_COR
ON IDCARRO = CARRO_COR.ID_CARRO
INNER JOIN COR
ON COR.IDCOR = CARRO_COR.ID_COR;
+------------------------------+------+----------------+------+-----------------------+-----------+---------+--------------+
| NOME                         | TIPO | NUMERO         | SEXO | MODELO                | MARCA     | PLACA   | COR          |
+------------------------------+------+----------------+------+-----------------------+-----------+---------+--------------+
| Elisa Melo Batista           | RES  | 11 2467-0987   | F    | Onix                  | Chevrolet | OKR8R13 | Vermelho     |
| Anna Cristina da Silva       | CEL  | 11 90765-2345  | F    | C4 Lounge             | Citroen   | FDS6J78 | Branco       |
| Claudia Simone R. da Mota    | RES  | 11 4567-1233   | F    | Aircross              | Citroen   | XCV0M45 | Cinza Chumbo |
| Claudia Simone R. da Mota    | RES  | 11 4567-1233   | F    | Aircross              | Citroen   | XCV0M45 | Laranja      |
| Guilherme Henrique Gonçalves | RES  | 11 4765-7865   | M    | Cronos                | Fiat      | EWS1F89 | Preto        |
| Silvane Melo da Mota         | CEL  | 11 93456-9876  | F    | EcoSport              | Ford      | LKM6Z78 | Marron       |
| Silvane Melo da Mota         | RES  | 11 3423-8976   | F    | EcoSport              | Ford      | LKM6Z78 | Marron       |
| Rosangela Alqueja            | CEL  | 11 95643-0976  | F    | Ranger (Cabine Dupla) | Ford      | SLY9X56 | Preto        |
| Nelson Rodrigues da Mota     | CEL  | 11 995643-0912 | M    | Sportage              | Kia       | PQD9F67 | Perolado     |
| Nelson Rodrigues da Mota     | CEL  | 11 995643-0912 | M    | Sportage              | Kia       | PQD9F67 | Azul         |
| Nelson Rodrigues da Mota     | CEL  | 11 98532-5554  | M    | Sportage              | Kia       | PQD9F67 | Perolado     |
| Nelson Rodrigues da Mota     | CEL  | 11 98532-5554  | M    | Sportage              | Kia       | PQD9F67 | Azul         |
| Gilcelli Melo da Mota        | RES  | 11 4234-4567   | F    | Sorento               | Kia       | RFB0L76 | Cinza Chumbo |
+------------------------------+------+----------------+------+-----------------------+-----------+---------+--------------+

SELECT MODELO, COUNT(*) AS 'QUANT.'
FROM CARRO
GROUP BY MODELO;
+-----------------------+--------+
| MODELO                | QUANT. |
+-----------------------+--------+
| Aircross              |      1 |
| C4 Lounge             |      1 |
| City Ex CVT           |      1 |
| Cronos                |      1 |
| Cruze                 |      1 |
| EcoSport              |      1 |
| Fit LX CVT            |      1 |
| Onix                  |      1 |
| Ranger (Cabine Dupla) |      1 |
| Sorento               |      1 |
| Sportage              |      1 |
| Toro                  |      1 |
+-----------------------+--------+

SELECT SEXO, COUNT(*) AS 'QUANT'
FROM CLIENTE
GROUP BY SEXO;
+------+-------+
| SEXO | QUANT |
+------+-------+
| M    |     4 |
| F    |     8 |
+------+-------+

SELECT CLIENTE.NOME, CLIENTE.SEXO, TELEFONE.TIPO, TELEFONE.NUMERO, CARRO.MODELO, MARCA.MARCA, COR.COR
FROM CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = TELEFONE.ID_CLIENTE
INNER JOIN CARRO
ON CLIENTE.ID_CARRO = CARRO.IDCARRO
INNER JOIN MARCA
ON CARRO.ID_MARCA = MARCA.IDMARCA
INNER JOIN CARRO_COR
ON CARRO_COR.ID_CARRO = CARRO.IDCARRO
INNER JOIN COR
ON COR.IDCOR = CARRO_COR.ID_COR
WHERE SEXO = 'F';
+---------------------------+------+------+---------------+-----------------------+-----------+--------------+
| NOME                      | SEXO | TIPO | NUMERO        | MODELO                | MARCA     | COR          |
+---------------------------+------+------+---------------+-----------------------+-----------+--------------+
| Elisa Melo Batista        | F    | RES  | 11 2467-0987  | Onix                  | Chevrolet | Vermelho     |
| Anna Cristina da Silva    | F    | CEL  | 11 90765-2345 | C4 Lounge             | Citroen   | Branco       |
| Claudia Simone R. da Mota | F    | RES  | 11 4567-1233  | Aircross              | Citroen   | Cinza Chumbo |
| Claudia Simone R. da Mota | F    | RES  | 11 4567-1233  | Aircross              | Citroen   | Laranja      |
| Silvane Melo da Mota      | F    | CEL  | 11 93456-9876 | EcoSport              | Ford      | Marron       |
| Silvane Melo da Mota      | F    | RES  | 11 3423-8976  | EcoSport              | Ford      | Marron       |
| Rosangela Alqueja         | F    | CEL  | 11 95643-0976 | Ranger (Cabine Dupla) | Ford      | Preto        |
| Gilcelli Melo da Mota     | F    | RES  | 11 4234-4567  | Sorento               | Kia       | Cinza Chumbo |
+---------------------------+------+------+---------------+-----------------------+-----------+--------------+
