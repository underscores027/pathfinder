CREATE TABLE login_pessoa (
    id serial PRIMARY KEY,
    nome varchar(127),
    telefone bigint,
    senha varchar(127),
    email varchar(127) UNIQUE
);

CREATE TABLE veiculo (
    id serial PRIMARY KEY,
    placa char(7) UNIQUE,
    descricao varchar(127),
    assentos smallint,
    id_dono integer REFERENCES login_pessoa(id)
);

CREATE TABLE carona (
    id serial PRIMARY KEY,
    local_saida point,
    local_chegada point,
    horario_saida timestamp,
    horario_chegada timestamp,
    id_veiculo integer REFERENCES veiculo(id)
);

CREATE TABLE participante_carona (
    id serial PRIMARY KEY,
    id_carona integer REFERENCES carona(id),
    id_avaliador integer REFERENCES login_pessoa(id),
    id_avaliado integer REFERENCES login_pessoa(id)
);

CREATE TABLE avaliacao (
    id integer PRIMARY KEY REFERENCES participante_carona(id),
    nota smallint,
    comentario text
);