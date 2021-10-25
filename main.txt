


/*SCRIPTS LISTA 7 FIZ TUDO EM UM SÓ ARQUIVO É SÓ IR DESCOMENTANDO E EXECUTANDO*/




CREATE TABLE proprietario
(
  cod_proprietario integer,
  nome varchar(25) ,
  sobrenome varchar(30), 
  idade integer, 
  cidade varchar(25),
  estado varchar(25),
  PRIMARY KEY('cod_proprietario')
  
);


CREATE TABLE veiculo
  (
    Placa varchar(7),
    Modelo varchar(30),
    Ano_Fabricacao year, 
    valor_ipva double, 
    cod_proprietario integer,
    FOREIGN KEY ('cod_proprietario')
    REFERENCES
    proprietario('cod_proprietario'),
    PRIMARY KEY ('Placa')
  );

INSERT INTO proprietario
(cod_proprietario,nome,sobrenome,idade,cidade,estado)
VALUES
(1,'Marcia','Nogueira',59,'SP','SP'),
(2,'Rodrigo','Amaro',36,'rj','RJ'),
(3,'Jose','Laerte',38,'João Pessoa','PB'),
(4,'João','Martins',20,'CaboFrio','RJ'),
(5,'Guilherme','Augusto',19,'BH','MG'),
(6,'Yuri','Nogueira',20,'BH','MG'),
(7,'Yamana','Araujo',20,'CaboFrio','RJ'),
(8,'Ana','Clara',20,'BH','MG'),
(9,'Enzo','DeLuca',19,'BH','MG'),
(10,'Aline','Barros',25,'Cataguases','MG'),
(11,'Pablo','Escobar',23,'Santos','SP'),
(12,'Marco','Geovane',22,'sp','SP'),
(13,'Sergio','Mauricio',29,'rj','RJ'),
(14,'Paulo','Karino',45,'rj','RJ'),
(15,'Junior','Tameirão',38,'CaboFrio','RJ'),
(null,'Marcio','Tenguan',21,'BH','MG'),
(null,'Pedro','Henrique',20,'BH','MG');

INSERT INTO veiculo
(Placa,Modelo,Ano_Fabricacao,valor_ipva,cod_proprietario)
VALUES
('BRA845Q','Astro',2014,500.57,6),
('GUA921Z','Fiat-Palio',2004,225.87,7),
('AZD123X','Fiat-Uno',2015,1200.23,2),
('KJZ875L','Fiat-Argo',2020,1347.98,1),
('AKI928F','Porsche',1994,500.23,9),
('KSM927C','HB20',2016,650.45,4),
('KUZ028U','Polo',2017,800.56,5),
('OBC928K','Fiat-Stilo',2005,390.82,3),
('KIZ972B','Fiat-Bravo',2010,190.92,10),
('UJI879A','Eco-Sport',2006,490.76,8),
('KNY876S','Saveiro',2002,330.49,2),
('AZX234F','Chevete',1996,0,11),
('KJZ937I','T-Cross',2010,800.50,12),
('IOP987C','Jaguar',2011,2500.20,13),
('MCJ928L','Mercedes',2019,3500.35,14),
('LOI862J','Lamborghini',2020,4400.40,15),
('KIU986M','AGUERA',2015,2300.30,7),
('MNJ345Z','Fiat-Palio',2003,350.00,9),
('MNR926L','Gol',2001,250.00,6),
('KLI287X','Xenon',2000,150.00,1),
('JUN928K','Fiat-Stilo',2003,200.00,null),
('NHJ927L','Fiat-Palio',1999,130.00,null),
('UIZ967C','Gol',2002,230.30,1);




/*PARA EXECUÇÃO IR DESCOMENTANDO AS QUESTÔES QUE DESEJA VIZUALIZAR*/

/* *CONSULTA PADRÂO DO BANCO DE DADOS* */
/*select * from proprietario
order by cod_proprietario;

select * from veiculo
order by cod_proprietario;*/


/*1. Relação dos nomes dos proprietários do estado de SP e dos modelos dos seus veículos, em ordem alfabética do nome do proprietário e do modelo do veículo.*/

/*select nome,estado,modelo from proprietario,veiculo
WHERE proprietario.cod_proprietario = veiculo.cod_proprietario AND proprietario.estado = 'SP'
order by nome;*/

/*2. Relação dos estados, placas, modelos, valores de IPVA e nomes dos proprietários do estado de MG ou RJ, que o valor do IPVA esteja entre R$ 150 e R$ 350, em ordem alfabética do estado e da placa.

select nome,estado,placa,modelo,valor_ipva from proprietario JOIN veiculo
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE (estado = 'MG' OR estado = 'RJ') AND valor_ipva BETWEEN 150.00 AND 350.00
order by estado , placa ;*/

/*3. Relação com nome do proprietário e placa do veículo, em ordem alfabética do nome do proprietário e da placa, exibindo também proprietários sem veículos cadastrados.

select nome,placa from proprietario LEFT OUTER JOIN veiculo
ON proprietario.cod_proprietario = veiculo.cod_proprietario 

order by nome , placa;*/


/*4. Relação com nome do proprietário e placa do veículo, em ordem alfabética do nome do proprietário e da placa, exibindo também veículos sem proprietários cadastrados.

select placa,nome from veiculo LEFT JOIN proprietario
ON proprietario.cod_proprietario = veiculo.cod_proprietario 

order by nome , placa;*/

/*5. Quantidade de veículos por cidade, mas apenas para as cidades com mais de 4 veículos, em ordem alfabética da cidade.
select estado,COUNT(*) AS QtdVeiculos From veiculo JOIN proprietario
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE proprietario.estado = 'RJ'

order by estado;

select estado,COUNT(*) AS QtdVeiculos From veiculo JOIN proprietario
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE proprietario.estado = 'MG'


order by estado;
*/
/*6. Somatório do valor do IPVA arrecadado por estado, em ordem decrescente do somatório.

select estado,SUM(valor_ipva) from proprietario,veiculo
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE proprietario.estado = 'SP'
order by SUM(valor_ipva);

select estado,SUM(valor_ipva) from proprietario,veiculo
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE proprietario.estado = 'RJ'
order by SUM(valor_ipva);

select estado,SUM(valor_ipva) from proprietario JOIN veiculo
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE proprietario.estado = 'MG'
order by SUM(valor_ipva);

select estado,SUM(valor_ipva) from proprietario,veiculo
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE proprietario.estado = 'PB'
order by SUM(valor_ipva);*/


/*7. Relação com nomes de proprietários e quantidade de veículos que cada um possui, mas apenas para os proprietários de mais de 1 veículo, em ordem crescente da quantidade de veículos possuídos

select nome,COUNT(*) AS QtdVeiculos From veiculo 
INNER JOIN proprietario
ON proprietario.cod_proprietario = veiculo.cod_proprietario

Group by nome   
Having COUNT(*) > 1
Order by QtdVeiculos ASC;*/



/*8. Quantidade de distintos modelos de veículos agrupados por cidade, em ordem alfabética do modelo.

select cidade, COUNT(modelo), modelo from proprietario 
INNER JOIN veiculo ON proprietario.cod_proprietario = veiculo.cod_proprietario

Group by cidade, modelo Order by modelo ASC;*/

/*9. Somatório total dos valores de IPVA dos veículos cujos proprietários sejam do estado de SP (obs: a resposta retorna um único valor).

select estado,SUM(valor_ipva) from proprietario,veiculo
ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE proprietario.estado = 'SP'
order by SUM(valor_ipva);*/

/*10. Valor médio do IPVA pago dos veículos cujo modelo não começa com Fiat e cujos proprietários são de Belo Horizonte (obs: a resposta retorna um único valor).

select AVG(valor_ipva) AS media_ipva from proprietario

INNER JOIN veiculo ON proprietario.cod_proprietario = veiculo.cod_proprietario
WHERE modelo NOT LIKE 'Fiat%'
AND cidade = 'BH'*/








