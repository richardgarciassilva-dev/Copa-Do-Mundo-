CREATE TABLE PAIS_SEDE(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR (255) NOT NULL,
  SIGLA CHAR(2) NOT NULL,
  CONTINENTE VARCHAR (255) NOT NULL
);

CREATE TABLE TECNICO(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR (255) NOT NULL,
  DT_NACS DATE NOT NULL,
  NACIONALIDADE VARCHAR (255)
);

CREATE TABLE ESTADIO(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR (255) NOT NULL,
  CIDADE VARCHAR (255) NOT NULL,
  CAPACIDADE INT NOT NULL,
  PAIS VARCHAR (255) NOT NULL
);

CREATE TABLE SELECAO(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR (255) NOT NULL,
  RANKING_FIFA INT NOT NULL,
  FK_TECNICO INT NOT NULL,
  FOREIGN KEY (FK_TECNICO) REFERENCES TECNICO (ID)
);

CREATE TABLE FASE(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR (255) NOT NULL
);

CREATE TABLE JOGADOR(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME_COMPLETO VARCHAR (255) NOT NULL,
  NOME_CAMISA VARCHAR 
(255),
  NUMERO_CAMISA INT NOT NULL,
  POSICAO VARCHAR (255) NOT NULL,
  DT_NSC DATE NOT NULL,
  ALTURA_CM INT NOT NULL,
  FK_SELECAO INT NOT NULL,
  FOREIGN KEY (FK_SELECAO) REFERENCES SELECAO (ID)
);

CREATE TABLE ARBITRO(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR (255) NOT NULL,
  NACIONALIDADE VARCHAR (255) NOT NULL
);

CREATE TABLE PARTIDA(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  DT_JG DATE NOT NULL,
  HR_JG CHAR (5),
  FK_FASE INT NOT NULL,
  FOREIGN KEY (FK_FASE) REFERENCES FASE (ID),
  FK_ESTADIO INT NOT NULL,
  FOREIGN KEY (FK_ESTADIO) REFERENCES ESTADIO (ID)
);

CREATE TABLE PARTIDA_SELECAO(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  FK_SELECAO INT NOT NULL,
  FOREIGN KEY (FK_SELECAO) REFERENCES SELECAO (ID),
  FK_PARTIDA INT NOT NULL,
  FOREIGN KEY (FK_PARTIDA) REFERENCES PARTIDA (ID)
);

CREATE TABLE PARTIDA_ARBITRO(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  FK_PARTIDA INT NOT NULL,
  FOREIGN KEY (FK_PARTIDA) REFERENCES PARTIDA (ID),
  FK_ARBITRO INT NOT NULL,
  FOREIGN KEY (FK_ARBITRO) REFERENCES ARBITRO (ID),
  FUNCAO VARCHAR (255) NOT NULL
);

CREATE TABLE EVENTO_PARTIDA(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  FK_PARTIDA INT NOT NULL,
  FOREIGN KEY (FK_PARTIDA) REFERENCES PARTIDA (ID),
  MINUTO CHAR (5) NOT NULL,
  TIPO_EVENTO VARCHAR (255) NOT NULL,
  FK_JOGADOR INT NOT NULL,
  FOREIGN KEY (FK_JOGADOR) REFERENCES JOGADOR (ID),
  FK_SELECAO INT NOT NULL,
  FOREIGN KEY (FK_SELECAO) REFERENCES SELECAO (ID)
);
https://github.com/richardgarciassilva-dev/Copa-Do-Mundo-.git
CREATE TABLE GOL_PARTIDA(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  FK_PARTIDA INT NOT NULL,
  FOREIGN KEY  REFERENCES PARTIDA (ID),
  FK_JOGA INT NOT NULL,
  FOREIGN KEY (FK_JOGADOR) REFERENCES JOGADOR (ID),
  MINUTO CHAR (5) NOT NULL
);

CREATE TABLE RESULTADO_PARTIDA(
ID INT PRIMARY KEY AUTO_INCREMENT,
FK_PARTIDA INT NOT NULL,
FOREIGN KEY (FK_PARTIDA)  
FK_SELECAO_V INT NOT NULL,
FOREIGN KEY (FK_SELECAO_V) REFERENCES SELECAO (ID),
FK_SELECAO_P INT NOT NULL,
FOREIGN KEY (FK_SELECAO_P) REFERENCES SELECAO (ID)
);

CREATE TABLE SUBSTITUICAO(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  FK_PARTIDA INT NOT NULL,
  FOREIGN KEY (FK_PARTIDA) REFERENCES PARTIDA (ID),
  FK_JOGADOR_S INT NOT NULL,
  FOREIGN KEY (FK_JOGADOR_S) REFERENCES JOGADOR (ID),
  FK_JOGADOR_E INT NOT NULL,
  FOREIGN KEY (FK_JOGADOR_E) REFERENCES JOGADOR (ID),
  MINUTO CHAR (5) NOT NULL
);

INSERT INTO PAIS_SEDE (NOME, SIGLA, CONTINENTE) VALUES

-- ANFITRIÕES (CONCACAF)
('Canadá', 'CA', 'América do Norte'),
('Estados Unidos', 'US', 'América do Norte'),
('México', 'MX', 'América do Norte');

INSERT INTO TECNICO (NOME, DT_NACS, NACIONALIDADE) VALUES

-- CONMEBOL (América do Sul)
('Lionel Scaloni', '1978-05-16', 'Argentina'),
('Carlo Ancelotti', '1959-06-25', 'Itália'),
('Marcelo Bielsa', '1955-07-21', 'Argentina'),
('Néstor Lorenzo', '1966-02-08', 'Argentina'),
('Sebastián Beccacece', '1979-01-04', 'Argentina'),
('Gustavo Alfaro', '1962-04-14', 'Argentina'),

-- UEFA (Europa)
('Didier Deschamps', '1968-10-15', 'França'),
('Luis de la Fuente', '1961-06-16', 'Espanha'),
('Julian Nagelsmann', '1987-11-23', 'Alemanha'),
('Gareth Southgate', '1970-11-23', 'Inglaterra'),
('Roberto Martínez', '1973-07-13', 'Espanha'),
('Ronald Koeman', '1963-03-21', 'Países Baixos'),
('Rudi Garcia', '1964-02-04', 'França'),
('Zlatko Dalić', '1966-10-17', 'Croácia'),
('Murat Yakin', '1974-09-15', 'Suíça'),
('Ralf Rangnick', '1958-06-09', 'Alemanha'),
('Vincenzo Montella', '1974-06-18', 'Itália'),
('Steve Clarke', '1963-08-29', 'Escócia'),
('Marco Rossi', '1964-04-09', 'Itália'),
('Ivan Hašek', '1963-09-06', 'República Tcheca'),
('Sergej Barbarez', '1971-09-17', 'Bósnia e Herzegovina'),

-- CONCACAF
('Mauricio Pochettino', '1972-03-02', 'Argentina'),
('Javier Aguirre', '1958-12-01', 'México'),
('Jesse Marsch', '1973-11-08', 'Estados Unidos'),
('John Herdman', '1975-07-19', 'Inglaterra'),
('Thomas Christiansen', '1973-03-11', 'Espanha'),
('Luis Fernando Suárez', '1959-12-23', 'Colômbia'),

-- CAF (África)
('Walid Regragui', '1975-09-23', 'Marrocos'),
('Pape Thiaw', '1977-02-05', 'Senegal'),
('Hossam Hassan', '1966-08-10', 'Egito'),
('Emerse Faé', '1984-01-07', 'Costa do Marfim'),
('Hugo Broos', '1952-04-18', 'Bélgica'),
('Vladimir Petković', '1963-08-15', 'Suíça'),
('Carlos Queiroz', '1953-03-01', 'Portugal'),
('Sébastien Desabre', '1976-08-02', 'França'),
('Sami Trabelsi', '1968-02-04', 'Tunísia'),
('Bubista', '1975-05-02', 'Cabo Verde'),

-- AFC (Ásia)
('Hajime Moriyasu', '1968-08-23', 'Japão'),
('Hong Myung-bo', '1969-02-12', 'Coreia do Sul'),
('Amir Ghalenoei', '1964-11-23', 'Irã'),
('Tony Popovic', '1973-07-04', 'Austrália'),
('Julen Lopetegui', '1966-08-28', 'Espanha'),
('Hervé Renard', '1968-09-30', 'França'),
('Graham Arnold', '1963-08-12', 'Austrália'),
('Darren Bazeley', '1972-10-05', 'Inglaterra'),

-- Outros
('Ricardo Gareca', '1958-02-28', 'Argentina'),
('Pedro Caixinha', '1970-10-15', 'Portugal'),
('Vahid Halilhodžić', '1952-10-15', 'Bósnia e Herzegovina'),
('Félix Sánchez', '1975-12-13', 'Espanha');

INSERT INTO ESTADIO (NOME, CIDADE, CAPACIDADE, PAIS) VALUES

-- MÉXICO
('Estadio Azteca', 'Cidade do México', 83000, 'México'),
('Estadio BBVA', 'Monterrey', 50113, 'México'),
('Estadio Akron', 'Guadalajara', 48300, 'México'),

-- CANADÁ
('BMO Field', 'Toronto', 45000, 'Canadá'),
('BC Place', 'Vancouver', 54500, 'Canadá'),

-- ESTADOS UNIDOS
('MetLife Stadium', 'Nova York / Nova Jersey', 82500, 'Estados Unidos'),
('AT&T Stadium', 'Arlington', 94000, 'Estados Unidos'),
('Mercedes-Benz Stadium', 'Atlanta', 75000, 'Estados Unidos'),
('Arrowhead Stadium', 'Kansas City', 73000, 'Estados Unidos'),
('NRG Stadium', 'Houston', 72000, 'Estados Unidos'),
('SoFi Stadium', 'Los Angeles', 70240, 'Estados Unidos'),
('Gillette Stadium', 'Boston', 65878, 'Estados Unidos'),
('Hard Rock Stadium', 'Miami', 65326, 'Estados Unidos'),
('Lumen Field', 'Seattle', 69000, 'Estados Unidos'),
('Levis Stadium', 'San Francisco Bay Area', 71000, 'Estados Unidos'),
('Lincoln Financial Field', 'Filadélfia', 69500, 'Estados Unidos');

INSERT INTO SELECAO (NOME, RANKING_FIFA, FK_TECNICO) VALUES
-- CONMEBOL
('Argentina', 3, 4),
('Brasil', 6, 5),
('Uruguai', 17, 6),
('Colômbia', 13, 7),
('Equador', 23, 8),
('Paraguai', 30, 9),   -- aproximado

-- UEFA
('França', 1, 10),
('Espanha', 2, 11),
('Alemanha', 10, 12),
('Inglaterra', 4, 13),
('Portugal', 5, 14),
('Países Baixos', 7, 15),
('Bélgica', 9, 16),
('Itália', 12, 17),
('Croácia', 11, 18),
('Suíça', 19, 19),
('Áustria', 24, 20),
('Turquia', 22, 21),
('República Tcheca', 35, 22),  -- aproximado
('Escócia', 36, 23),         -- aproximado
('Noruega', 28, 24),         -- aproximado

-- CONCACAF
('Estados Unidos', 16, 2),
('México', 15, 3),
('Canadá', 33, 1),           -- aproximado
('Panamá', 29, 25),          -- aproximado
('Haiti', 55, 26),           -- aproximado
('Curaçao', 60, 27),         -- aproximado

-- CAF (África)
('Marrocos', 8, 28),
('Senegal', 14, 29),
('Egito', 29, 30),           -- aproximado
('Costa do Marfim', 34, 31),
('Argélia', 28, 32),
('Gana', 74, 33),            -- aproximado
('Tunísia', 44, 34),
('África do Sul', 60, 35),
('RD Congo', 65, 36),        -- aproximado
('Cabo Verde', 69, 37),      -- aproximado

-- AFC (Ásia)
('Japao', 18, 38),
('Coreia do Sul', 25, 39),
('Irã', 21, 40),
('Austrália', 27, 41),
('Catar', 55, 42),           -- aproximado
('Arábia Saudita', 61, 43),  -- aproximado
('Uzbequistão', 50, 44),
('Jordânia', 63, 45),        -- aproximado
('Iraque', 57, 46),          -- aproximado

-- OFC
('Nova Zelândia', 85, 47);   -- aproximado

INSERT INTO FASE (NOME) VALUES
('Fase de Grupos'),
('Rodada de 32'),
('Oitavas de Final'),
('Quartas de Final'),
('Semifinal'),
('Disputa de 3º Lugar'),
('Final');

SELECT * FROM PAIS_SEDE;

SELECT * FROM TECNICO;

SELECT * FROM ESTADIO;

SELECT * FROM SELECAO;

SELECT * FROM FASE;

-- SELECT * FROM JOGADOR;

-- SELECT * FROM ARBITRO;

-- SELECT * FROM PARTIDA;

-- SELECT * FROM PARTIDA_SELECAO;

-- SELECT * FROM PARTIDA_ARBITRO;

-- SELECT * FROM EVENTO_PARTIDA;

-- SELECT * FROM GOL_PARTIDA;

-- SELECT * FROM RESULTADO_PARTIDA,

-- SELECT * FROM SUBSTITUICAO;


