-- _É preciso realizar todas as validações necessárias para evitar erros no banco de dados_

-- A API precisa se conectar com um banco de dados `postgreSQL` chamado `biblioteca` e todo 
--código de criação das tabelas deverá se colocado no arquivo `dump.sql`

create database biblioteca;

-- 1 - Implemente uma tabela chamada `autores` contendo as seguintes características:

-- - Um identificador único do autor como chave primaria e 
auto incremento;
-- - O nome (obrigatório)
-- - A idade

create table autores (
    id serial primary key,
    nome text not null,
    idade integer
);

-- 2 - Implemente na API a funcionalidade de cadastrar um autor no banco de dados seguindo 
--as especificações abaixo:

-- `POST /autor`

-- Exemplo de entrada

-- ```
-- {
--     "nome": "Guido Cerqueira",
--     "idade": 32
-- }
-- ```

-- Exemplo de saída

-- ```
-- {
--     "id": 1
--     "nome": "Guido Cerqueira",
--     "idade": 32
-- }
-- ```

-- ou

-- ```
-- {
--     "mensagem": "o campo nome é obrigatório."
-- }
-- ```

-- 3 - Implemente a funcionalidade de buscar um autor no banco de dados através do seu 
--identificador único, seguindo as especificações abaixo:

-- `GET /autor/:id`

-- Exemplo de saída

-- ```
-- {
--     "id": 1
--     "nome": "Guido Cerqueira",
--     "idade": 32
-- }
-- ```

-- ou

-- ```
-- {
--     "mensagem": "Autor não encontrado"
-- }
-- ```

-- 4 - Implemente uma tabela chamada `livros` contendo as seguintes características:

-- - Um identificador único do livro como chave primaria e auto incremento;
-- - O nome (obrigatório)
-- - O genero
-- - A editora
-- - A data de publicação no formato `YYYY-MM-DD`
-- - O identificador do autor responsável pelo livro

create table livros (
    id serial primary key,
    autor_id serial not null references autores(id),
    nome text not null,
    genero text,
    editora text,
    data_publicacao date
);

-- 5 - Implemente a funcionalidade de cadastrar um livro para um autor no banco de dados 
--seguindo as especificações abaixo:

-- `POST /autor/:id/livro`

-- Exemplo de entrada

-- ```
-- {
-- 	"nome": "Backend PHP",
-- 	"genero": "Programação",
-- 	"editora": "Cubos Academy",
-- 	"data_publicacao": "2020-10-18"
-- }
-- ```

-- Exemplo de saída

-- ```
-- {
-- 	"id": 2,
-- 	"nome": "Backend PHP",
-- 	"genero": "Programação",
-- 	"editora": "Cubos Academy",
-- 	"data_publicacao": "2020-10-18"
-- }
-- ```

-- ou

-- ```
-- {
--     "mensagem": "o campo nome é obrigatório."
-- }
-- ```

-- 6 - O endpoint de buscar um autor deverá ser alterado para quando detalhar o autor,
-- trazer a lista de seus livros cadastrados.

-- Exemplo de saída

-- ```
-- {
--     "id": 1,
--     "nome": "Guido Cerqueira",
--     "idade": 32,
--     "livros": [
--         {
--             "id": 1,
--             "nome": "Backend Nodejs",
--             "genero": "Programação",
--             "editora": "Cubos Academy",
--             "data_publicacao": "2018-06-10"
--         },
--         {
--             "id": 2,
--             "nome": "Backend PHP",
--             "genero": "Programação",
--             "editora": "Cubos Academy",
--             "data_publicacao": "2020-10-18"
--         }
--     ]
-- }
-- ```

-- ou

-- ```
-- {
--     "mensagem": "livro não encontrado"
-- }
-- ```

-- Obs.: Deverá implementar esta funcionalidade utilizando a cláusula `JOIN`.

-- 7 - Implemente a funcionalidade de listar os livros cadastrados no banco de 
--dados, com as informações do seu autor, seguindo as especificações abaixo:

-- `GET /livro`

-- Exemplo de saída

-- ```
-- [
--     {
--         "id": 1,
--         "nome": "Backend Nodejs",
--         "genero": "Programação",
--         "editora": "Cubos Academy",
--         "data_publicacao": "2018-06-10",
--         "autor": {
--             "id": 1
--             "nome": "Guido Cerqueira",
--             "idade": 32
--         }
--     },
--     {
--         "id": 2,
--         "nome": "Backend PHP",
--         "genero": "Programação",
--         "editora": "Cubos Academy",
--         "data_publicacao": "2020-10-18",
--         "autor": {
--             "id": 1
--             "nome": "Guido Cerqueira",
--             "idade": 32
--         }
--     }
-- ]
-- ```

-- ou

-- ```
-- []
-- ```

-- Obs.: Deverá implementar esta funcionalidade utilizando a cláusula `JOIN`.

-- E finalmente o job será entregue e mais uma missão será cumprida. Parabéns!!!