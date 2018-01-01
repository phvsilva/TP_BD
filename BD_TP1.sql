DROP TABLE codigoPostal CASCADE CONSTRAINTS;
DROP TABLE Modo_Pagamento CASCADE CONSTRAINTS;
DROP TABLE TipoSala CASCADE CONSTRAINTS;
DROP TABLE Salas CASCADE CONSTRAINTS;
DROP TABLE TipoCurso CASCADE CONSTRAINTS;
DROP TABLE Curso CASCADE CONSTRAINTS;
DROP TABLE Disciplina CASCADE CONSTRAINTS;
DROP TABLE Professor CASCADE CONSTRAINTS;
DROP TABLE Professor_Disciplina CASCADE CONSTRAINTS;
DROP TABLE Aluno CASCADE CONSTRAINTS;
DROP TABLE Sessao CASCADE CONSTRAINTS;
DROP TABLE Aluno_Sessao CASCADE CONSTRAINTS;
DROP TABLE Pagamento CASCADE CONSTRAINTS;
DROP TABLE Pagamento_Sessao CASCADE CONSTRAINTS;

-- CRIAR TABELAS
CREATE TABLE codigoPostal (
    cPostal VARCHAR(8) NOT NULL,
    localidade VARCHAR(25) NOT NULL,
    PRIMARY KEY (cPostal)
);

CREATE TABLE Modo_Pagamento (
    id_ModoPag CHAR(2) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_ModoPag)
);

CREATE TABLE TipoSala (
    id_tipo INTEGER NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tipo)
);

CREATE TABLE Salas (
    id_sala CHAR(4) NOT NULL,
    id_tipo INTEGER NOT NULL,
    PRIMARY KEY (id_sala)
);

CREATE TABLE TipoCurso (
    id_tipo INTEGER NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tipo)
);

CREATE TABLE Curso (
    id_Curso INTEGER NOT NULL,
    Sigla VARCHAR(6) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    id_tipo INTEGER NOT NULL,
    PRIMARY KEY (id_Curso)
);

CREATE TABLE Disciplina (
    id_Disciplina INTEGER NOT NULL,
    sigla VARCHAR(4) NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_Disciplina)
);

CREATE TABLE Professor (
    id_Professor CHAR(4) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    nPorta INTEGER NOT NULL,
    cPostal VARCHAR(8) NOT NULL,
    telefone INTEGER NOT NULL,
    email VARCHAR(50) NOT NULL,
    NIF INTEGER NOT NULL,
    PRIMARY KEY (id_Professor)
);

CREATE TABLE Professor_Disciplina (
    id_Disciplina INTEGER NOT NULL,
    id_professor CHAR(4) NOT NULL,
    PRIMARY KEY (id_Disciplina, id_professor)
);

CREATE TABLE Aluno (
    num_Aluno INTEGER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_curso INTEGER NOT NULL,
    rua VARCHAR(50) NOT NULL,
    nPorta INTEGER NOT NULL,
    cPostal VARCHAR(8) NOT NULL,
    telefone INTEGER NOT NULL,
    email VARCHAR(50) NOT NULL,
    NIF INTEGER NOT NULL,
    PRIMARY KEY (num_Aluno)
);

CREATE TABLE Sessao (
    num_Sessao INTEGER NOT NULL,
    data DATE NOT NULL,
    hora_fim VARCHAR(5) NOT NULL,
    hora_inicio VARCHAR(5) NOT NULL,
    id_disciplina INTEGER NOT NULL,
    id_Professor CHAR(4) NOT NULL,
    id_sala CHAR(4) NOT NULL,
    PRIMARY KEY (num_Sessao)
);

CREATE TABLE Aluno_Sessao (
    num_Aluno INTEGER NOT NULL,
    num_Sessao INTEGER NOT NULL,
    PRIMARY KEY (num_Aluno, num_Sessao)
);

CREATE TABLE Pagamento (
    num_pagamento INTEGER NOT NULL,
    valor_total NUMERIC(5,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    num_Aluno INTEGER NOT NULL,
    id_ModoPag CHAR(2) NOT NULL,
    PRIMARY KEY (num_pagamento)
);

CREATE TABLE Pagamento_Sessao (
    num_pagamento INTEGER NOT NULL,
    num_sessao INTEGER NOT NULL,
    PRIMARY KEY (num_pagamento, num_sessao)
);

-- DEFINIR CHAVES ESTRANGEIRAS (RESTRI��ES DE INTEGRIDADE)

ALTER TABLE Salas ADD FOREIGN KEY (id_tipo) REFERENCES TipoSala(id_tipo);
ALTER TABLE Curso ADD FOREIGN KEY (id_tipo) REFERENCES TipoCurso(id_tipo);
ALTER TABLE Professor ADD FOREIGN KEY (cPostal) REFERENCES codigoPostal(cPostal);
ALTER TABLE Professor_Disciplina ADD FOREIGN KEY (id_professor) REFERENCES Professor(id_Professor);
ALTER TABLE Professor_Disciplina ADD FOREIGN KEY (id_Disciplina) REFERENCES Disciplina(id_Disciplina);
ALTER TABLE Aluno ADD FOREIGN KEY (id_curso) REFERENCES Curso(id_Curso);
ALTER TABLE Aluno ADD FOREIGN KEY (cPostal) REFERENCES codigoPostal(cPostal);
ALTER TABLE Sessao ADD FOREIGN KEY (id_Professor) REFERENCES Professor(id_Professor);
ALTER TABLE Sessao ADD FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_Disciplina);
ALTER TABLE Sessao ADD FOREIGN KEY (id_sala) REFERENCES Salas(id_sala);
ALTER TABLE Aluno_Sessao ADD FOREIGN KEY (num_Aluno) REFERENCES Aluno(num_Aluno);
ALTER TABLE Aluno_Sessao ADD FOREIGN KEY (num_Sessao) REFERENCES Sessao(num_Sessao);
ALTER TABLE Pagamento ADD FOREIGN KEY (num_Aluno) REFERENCES Aluno(num_Aluno);
ALTER TABLE Pagamento ADD FOREIGN KEY (id_ModoPag) REFERENCES Modo_Pagamento(id_ModoPag);
ALTER TABLE Pagamento_Sessao ADD FOREIGN KEY (num_sessao) REFERENCES Sessao(num_Sessao);
ALTER TABLE Pagamento_Sessao ADD FOREIGN KEY (num_pagamento) REFERENCES Pagamento(num_pagamento);

-- INSERIR DADOS EM ALGUMAS TABELAS PARA TESTAR

-- INSERT CODIGOS POSTAIS
INSERT INTO CODIGOPOSTAL(CPOSTAL, LOCALIDADE) VALUES('4970-555','S�O COSME E S�O DAMI�O');
INSERT INTO CODIGOPOSTAL(CPOSTAL, LOCALIDADE) VALUES('4970-441','PRA�A MUNICIPAL');
INSERT INTO CODIGOPOSTAL(CPOSTAL, LOCALIDADE) VALUES('4900-357','RUA SANTIAGO DA BARRA');

-- INSERT TIPOS DE CURSO
INSERT INTO TIPOCURSO(ID_TIPO, DESCRICAO) VALUES(1,'CURSO PROFISSIONAL');
INSERT INTO TIPOCURSO(ID_TIPO, DESCRICAO) VALUES(2,'LICENCIATURA');
INSERT INTO TIPOCURSO(ID_TIPO, DESCRICAO) VALUES(3,'MESTRADO');
INSERT INTO TIPOCURSO(ID_TIPO, DESCRICAO) VALUES(4,'DOUTORAMENTO');

-- INSERT CURSOS
INSERT INTO CURSO(ID_CURSO, SIGLA, NOME, ID_TIPO) VALUES(9119,'EI','ENGENHARIA INFORMATICA',2);
INSERT INTO CURSO(ID_CURSO, SIGLA, NOME, ID_TIPO) VALUES(9147,'G','GEST�O',2);
INSERT INTO CURSO(ID_CURSO, SIGLA, NOME, ID_TIPO) VALUES(6797,'MTGSI','MESTRADO TEC. E GEST�O SISTEMAS DE INFORMA��O',3);
INSERT INTO CURSO(ID_CURSO, SIGLA, NOME, ID_TIPO) VALUES(067,'CTSPIG','CTSP DE INFORMATICA DE GEST�O',1);
INSERT INTO CURSO(ID_CURSO, SIGLA, NOME, ID_TIPO) VALUES(5141,'DEI','DOUTORAMENTO ENGENHARIA INFORMATICA',4);

-- INSERT TIPOSALA
INSERT INTO TIPOSALA(ID_TIPO, DESCRICAO) VALUES(1,'SALA');
INSERT INTO TIPOSALA(ID_TIPO, DESCRICAO) VALUES(2,'LABORATORIO');
INSERT INTO TIPOSALA(ID_TIPO, DESCRICAO) VALUES(3,'AUDITORIO');

-- INSERT SALAS
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('S1.1',1);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('S1.2',1);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('S2.1',1);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('S2.2',1);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('S2.3',1);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('L1.1',2);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('L1.2',2);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('L1.3',2);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('A1.1',3);
INSERT INTO SALAS(ID_SALA, ID_TIPO) VALUES('A2.1',3);

-- INSERT DISCIPLINAS
INSERT INTO DISCIPLINA(ID_DISCIPLINA, SIGLA, DESCRICAO) VALUES(1,'BD','BASE DE DADOS');
INSERT INTO DISCIPLINA(ID_DISCIPLINA, SIGLA, DESCRICAO) VALUES(2,'ASC','ARQUITETURA E SISTEMAS DE COMPUTADORES');
INSERT INTO DISCIPLINA(ID_DISCIPLINA, SIGLA, DESCRICAO) VALUES(3,'IHM','INTERA��O HOMEM-MAQUINA');
INSERT INTO DISCIPLINA(ID_DISCIPLINA, SIGLA, DESCRICAO) VALUES(4,'IA','INTELIGENCIA ARTIFICIAL');
INSERT INTO DISCIPLINA(ID_DISCIPLINA, SIGLA, DESCRICAO) VALUES(5,'ABD','ADMINISTRA��O DE BASE DE DADOS');

-- INSERT PROFESSORES
INSERT INTO PROFESSOR(ID_PROFESSOR, NOME, RUA, NPORTA, CPOSTAL, TELEFONE, EMAIL, NIF)
VALUES('P001','VASCO SILVA','RUA SANTIAGO DA BARRA',17,'4900-357',965789987,'vascosilva@ipvc.pt',123456789);
INSERT INTO PROFESSOR(ID_PROFESSOR, NOME, RUA, NPORTA, CPOSTAL, TELEFONE, EMAIL, NIF)
VALUES('P002','ANA MIRANDA','CASTANHEIRA',54,'4970-555',912343211,'mirandaana@ipvc.pt',987654321);
INSERT INTO PROFESSOR(ID_PROFESSOR, NOME, RUA, NPORTA, CPOSTAL, TELEFONE, EMAIL, NIF)
VALUES('P003','ANTONIO ALVES','RUA DA LIBERDADE',7,'4970-441',933444555,'a.alves@ipvc.pt',543219876);

-- INSERT PROFESSOR_DISCIPLINA
INSERT INTO PROFESSOR_DISCIPLINA(ID_DISCIPLINA, ID_PROFESSOR) VALUES(1,'P003');
INSERT INTO PROFESSOR_DISCIPLINA(ID_DISCIPLINA, ID_PROFESSOR) VALUES(2,'P001');
INSERT INTO PROFESSOR_DISCIPLINA(ID_DISCIPLINA, ID_PROFESSOR) VALUES(3,'P002');
INSERT INTO PROFESSOR_DISCIPLINA(ID_DISCIPLINA, ID_PROFESSOR) VALUES(4,'P002');
INSERT INTO PROFESSOR_DISCIPLINA(ID_DISCIPLINA, ID_PROFESSOR) VALUES(5,'P001');

-- INSERT ALUNO
INSERT INTO ALUNO(NUM_ALUNO, NOME, DATA_NASCIMENTO, ID_CURSO, RUA, NPORTA, CPOSTAL, TELEFONE, EMAIL, NIF)
VALUES(17512,'PEDRO SILVA',TO_DATE('18/03/1996', 'DD/MM/YYYY'), 9119, 'GEREI',105,'4970-555',933333333,'phvsilva@ipvc.pt',123456789);
INSERT INTO ALUNO(NUM_ALUNO, NOME, DATA_NASCIMENTO, ID_CURSO, RUA, NPORTA, CPOSTAL, TELEFONE, EMAIL, NIF)
VALUES(17485,'DIOGO CORREIA',TO_DATE('21/07/1998', 'DD/MM/YYYY'), 5141, 'ZINDE',10,'4970-441',933543768,'diogo@ipvc.pt',635643587);
INSERT INTO ALUNO(NUM_ALUNO, NOME, DATA_NASCIMENTO, ID_CURSO, RUA, NPORTA, CPOSTAL, TELEFONE, EMAIL, NIF)
VALUES(6875,'RITA BRANCO',TO_DATE('18/05/1987', 'DD/MM/YYYY'), 9147, 'AVENIDA FIXE',132,'4970-555',961345765,'rita@ipvc.pt',654321987);
INSERT INTO ALUNO(NUM_ALUNO, NOME, DATA_NASCIMENTO, ID_CURSO, RUA, NPORTA, CPOSTAL, TELEFONE, EMAIL, NIF)
VALUES(342,'PAULO LOPES',TO_DATE('02/01/1986', 'DD/MM/YYYY'), 67, 'RUA DA CIDADE',46,'4900-357',933456743,'paulo@ipvc.pt',456789321);

-- INSERT SESSAO
INSERT INTO SESSAO(NUM_SESSAO, DATA, HORA_INICIO, HORA_FIM, ID_DISCIPLINA, ID_PROFESSOR, ID_SALA)
VALUES(1,TO_DATE('13/12/2018','DD/MM/YYYY'),'10H00','12H00',2,'P001','L1.1');
INSERT INTO SESSAO(NUM_SESSAO, DATA, HORA_INICIO, HORA_FIM, ID_DISCIPLINA, ID_PROFESSOR, ID_SALA)
VALUES(2,SYSDATE,'14H00','16H00',3,'P002','S2.1');

-- INSERT ALUNO_SESSAO
INSERT INTO ALUNO_SESSAO(NUM_ALUNO, NUM_SESSAO) VALUES(17512, 1);
INSERT INTO ALUNO_SESSAO(NUM_ALUNO, NUM_SESSAO) VALUES(17512, 2);
INSERT INTO ALUNO_SESSAO(NUM_ALUNO, NUM_SESSAO) VALUES(17485, 1);
INSERT INTO ALUNO_SESSAO(NUM_ALUNO, NUM_SESSAO) VALUES(17485, 2);
INSERT INTO ALUNO_SESSAO(NUM_ALUNO, NUM_SESSAO) VALUES(6875, 1);
INSERT INTO ALUNO_SESSAO(NUM_ALUNO, NUM_SESSAO) VALUES(342, 1);

--INSERT MODO_PAGAMENTO
INSERT INTO MODO_PAGAMENTO(ID_MODOPAG, DESCRICAO) VALUES('MB','MULTIBANCO');
INSERT INTO MODO_PAGAMENTO(ID_MODOPAG, DESCRICAO) VALUES('D','DINHEIRO');
INSERT INTO MODO_PAGAMENTO(ID_MODOPAG, DESCRICAO) VALUES('C','CHEQUE');

--CRIAR SEQUENCIA NUM_PAGAMENTO
CREATE SEQUENCE NUM_PAGAMENTO
 START WITH     00001
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

--INSERT PAGAMENTO
INSERT INTO PAGAMENTO(NUM_PAGAMENTO, VALOR_TOTAL, DATA_PAGAMENTO, NUM_ALUNO, ID_MODOPAG) 
VALUES(NUM_PAGAMENTO.NEXTVAL, 20, SYSDATE, 17512, 'MB');
INSERT INTO PAGAMENTO(NUM_PAGAMENTO, VALOR_TOTAL, DATA_PAGAMENTO, NUM_ALUNO, ID_MODOPAG) 
VALUES(NUM_PAGAMENTO.NEXTVAL, 30, SYSDATE, 17485, 'MB');
INSERT INTO PAGAMENTO(NUM_PAGAMENTO, VALOR_TOTAL, DATA_PAGAMENTO, NUM_ALUNO, ID_MODOPAG) 
VALUES(NUM_PAGAMENTO.NEXTVAL, 24, SYSDATE, 342, 'MB');
INSERT INTO PAGAMENTO(NUM_PAGAMENTO, VALOR_TOTAL, DATA_PAGAMENTO, NUM_ALUNO, ID_MODOPAG) 
VALUES(NUM_PAGAMENTO.NEXTVAL, 14, SYSDATE, 6875, 'D');

--INSERT PAGAMENTO_SESSAO
INSERT INTO PAGAMENTO_SESSAO(NUM_PAGAMENTO, NUM_SESSAO) VALUES(00001,2);
INSERT INTO PAGAMENTO_SESSAO(NUM_PAGAMENTO, NUM_SESSAO) VALUES(00001,1);
INSERT INTO PAGAMENTO_SESSAO(NUM_PAGAMENTO, NUM_SESSAO) VALUES(00002,1);

-- CRIA�AO DE VIEWS

-- CRIACAO DA VIEW V_PAGAMENTOS
CREATE VIEW V_PAGAMENTOS (NRO_PAGAMENTO, MONTANTE, DATA, NRO_ALUNO, NOME_ALUNO, MODO_PAGAMENTO)
AS
SELECT P.NUM_PAGAMENTO, P.VALOR_TOTAL, P.DATA_PAGAMENTO, P.NUM_ALUNO, A.NOME, MP.DESCRICAO
FROM PAGAMENTO P, MODO_PAGAMENTO MP, ALUNO A
WHERE MP.ID_MODOPAG = P.ID_MODOPAG AND P.NUM_ALUNO = A.NUM_ALUNO
ORDER BY P.NUM_PAGAMENTO ASC;

-- CRIACAO DA VIEW V_ALUNOS
CREATE VIEW V_ALUNOS (NRO_ALUNO, NOME, CURSO, DATA_NASCIMENTO, RUA, PORTA, CODIGO_POSTAL, LOCALIDADE, TELEFONE, EMAIL, NIF)
AS
SELECT A.NUM_ALUNO, A.NOME, C.NOME, A.DATA_NASCIMENTO, A.RUA, A.NPORTA, A.CPOSTAL, CP.LOCALIDADE, A.TELEFONE, A.EMAIL, A.NIF
FROM ALUNO A, CURSO C, CODIGOPOSTAL CP
WHERE A.ID_CURSO = C.ID_CURSO AND A.CPOSTAL = CP.CPOSTAL
ORDER BY NUM_ALUNO ASC;

-- CRIACAO DA VIEW V_PROFESSORES
CREATE VIEW V_PROFESSORES (NRO_PROFESSOR, NOME, RUA, PORTA, CODIGO_POSTAL, LOCALIDADE, TELEFONE, EMAIL, NIF)
AS
SELECT P.ID_PROFESSOR, P.NOME, P.RUA, P.NPORTA, P.CPOSTAL, CP.LOCALIDADE, P.TELEFONE, P.EMAIL, P.NIF
FROM PROFESSOR P, CODIGOPOSTAL CP
WHERE P.CPOSTAL = CP.CPOSTAL
ORDER BY ID_PROFESSOR ASC;

-- CRIA�AO DA VIEW V_DISCIPLINAS
CREATE VIEW V_DISCIPLINAS (ID_DISCIPLINA, SIGLA, NOME) 
AS
SELECT ID_DISCIPLINA, SIGLA, DESCRICAO FROM DISCIPLINA
ORDER BY ID_DISCIPLINA;

-- CRIA�AO DA VIEW V_SESSOES
CREATE VIEW V_SESSOES (NRO_SESSAO, DATA, HORA_INICIO, HORA_FIM, DISCIPLINA, PROFESSOR, SALA)
AS
SELECT S.NUM_SESSAO, S.DATA, S.HORA_INICIO, S.HORA_FIM, D.SIGLA, P.NOME, S.ID_SALA
FROM SESSAO S, DISCIPLINA D, PROFESSOR P
WHERE S.ID_DISCIPLINA = D.ID_DISCIPLINA AND S.ID_PROFESSOR = P.ID_PROFESSOR
ORDER BY S.DATA DESC;

-- TRIGGER PARA ASSOCIA��O AUTOMATICA DA SESSAO ASSISTIDA PELO ALUNO AO SEU PAGAMENTO(INSERT PAGAMENTO_SESSAO)
-- E ATUALIZA��O AUTOMATICA DO VALOR TOTAL A PAGAR PELO ALUNO 
CREATE OR REPLACE TRIGGER INSPAGAMENTOSESSAO
    AFTER INSERT ON ALUNO_SESSAO
      FOR EACH ROW
      
      
  DECLARE NRO_PAGAMENTO INTEGER;
          PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    
    SELECT NUM_PAGAMENTO INTO NRO_PAGAMENTO
    FROM PAGAMENTO P
    WHERE P.NUM_ALUNO = :NEW.NUM_ALUNO;
    
    
    
    INSERT INTO PAGAMENTO_SESSAO VALUES(NRO_PAGAMENTO, :NEW.NUM_SESSAO);
      UPDATE PAGAMENTO SET VALOR_TOTAL = VALOR_TOTAL + 2 WHERE NUM_ALUNO = :NEW.NUM_ALUNO;
      
    COMMIT;
  END;

INSERT INTO ALUNO_SESSAO VALUES(342, 2);
INSERT INTO ALUNO_SESSAO VALUES(6875, 2);
