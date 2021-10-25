

/*TABELA ORIGINAL DA LISTA 6*/



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
(2,'Rodrigo','Amaro',36,'RJ','RJ'),
(3,'Jose','Laerte',38,'João Pessoa','PB'),
(4,'João','Martins',20,'BH','MG'),
(5,'Guilherme','Augusto',19,'BH','MG'),
(6,'Yuri','Nogueira',20,'BH','MG'),
(7,'Yamana','Araujo',20,'Vespasiano','MG'),
(8,'Ana','Clara',20,'BH','MG'),
(9,'Gabriel','Ferreira',18,'Contagem','MG'),
(10,'Aline','Barros',25,'Cataguases','MG');

INSERT INTO veiculo
(Placa,Modelo,Ano_Fabricacao,valor_ipva,cod_proprietario)
VALUES
('BRA845Q','Astro',2014,500.25,6),
('GUA921Z','Palio',2004,425.40,7),
('AZD123X','Uno-Evo',2015,1200.47,2),
('KJZ875L','Fiat-Argo',2020,1347.40,1),
('AKI928F','Fiat-Strada',2012,680.87,9),
('KSM927C','HB20',2016,750.40,4),
('KUZ028U','Polo',2017,800.90,5),
('OBC928K','Fiat-Stilo',2005,390.48,3),
('KIZ972B','Fiat-Bravo',2010,590.99,10),
('UJI879A','Eco-Sport',2006,490.29,8);



select * from proprietario
Order by cod_proprietario;

select * from veiculo
Order by cod_proprietario;
