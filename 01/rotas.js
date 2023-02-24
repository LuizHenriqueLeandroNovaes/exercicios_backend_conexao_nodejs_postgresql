const express = require('express');

const rotas = express();


const { cadastrarAutor , obterAutor , cadastrarLivroAutor } 
= require('./controladores/autores');

const { listarLivros } = require('./controladores/livros');

rotas.post('/autor', cadastrarAutor);
rotas.get('/autor/:id', obterAutor);
rotas.post('/autor/:id/livro', cadastrarLivroAutor);
rotas.get('/livros', listarLivros);


module.exports = rotas;