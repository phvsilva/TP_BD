CREATE TABLE codigoPostal (
    cPostal VARCHAR(8) NOT NULL,
    localidade VARCHAR(25) NOT NULL,
    PRIMARY KEY (cPostal)
);

CREATE TABLE Modo_Pagamento (
    id_ModoPag INTEGER NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_ModoPag)
);

CREATE TABLE TipoSala (
    id_tipo INTEGER NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_tipo)
);

CREATE TABLE Salas (
    id_sala INTEGER NOT NULL,
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
    id_Professor INTEGER NOT NULL,
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
    id_professor INTEGER NOT NULL,
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
    id_Professor INTEGER NOT NULL,
    id_sala INTEGER NOT NULL,
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
    id_ModoPag INTEGER NOT NULL,
    PRIMARY KEY (num_pagamento)
);

CREATE TABLE Pagamento_Sessao (
    num_pagamento INTEGER NOT NULL,
    num_sessao INTEGER NOT NULL,
    PRIMARY KEY (num_pagamento, num_sessao)
);

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