-- a) A quantidade de livros agrupado pelo nome do gênero
SELECT tbGenero.nomeGenero, COUNT(tbLivro.nomeLivro) AS quantidade_livros
FROM tbGenero
LEFT JOIN tbLivro ON tbGenero.codGenero = tbLivro.codGenero
GROUP BY tbGenero.nomeGenero;
 
-- b) A soma das páginas agrupada pelo nome do autor
SELECT tbAutor.nomeAutor, SUM(tbLivro.numPaginas) AS soma_paginas
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
GROUP BY tbAutor.nomeAutor;
 
-- c) A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z)
SELECT tbAutor.nomeAutor, AVG(tbLivro.numPaginas) AS media_paginas
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
GROUP BY tbAutor.nomeAutor
ORDER BY tbAutor.nomeAutor ASC;
 
-- d) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)
SELECT tbEditora.nomeEditora, COUNT(tbLivro.nomeLivro) AS quantidade_livros
FROM tbEditora
LEFT JOIN tbLivro ON tbEditora.codEditora = tbLivro.codEditora
GROUP BY tbEditora.nomeEditora
ORDER BY tbEditora.nomeEditora DESC;
 
-- e) A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C”
SELECT tbAutor.nomeAutor, SUM(tbLivro.numPaginas) AS soma_paginas
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
WHERE tbAutor.nomeAutor LIKE 'C%'
GROUP BY tbAutor.nomeAutor;
 
-- f) A quantidade de livros agrupada pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”
SELECT tbAutor.nomeAutor, COUNT(tbLivro.nomeLivro) AS quantidade_livros
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
WHERE tbAutor.nomeAutor IN ('Machado de Assis', 'Cora Coralina', 'Graciliano Ramos', 'Clarice Lispector')
GROUP BY tbAutor.nomeAutor;
 
-- g) A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500 (inclusive)
SELECT tbEditora.nomeEditora, SUM(tbLivro.numPaginas) AS soma_paginas
FROM tbEditora
LEFT JOIN tbLivro ON tbEditora.codEditora = tbLivro.codEditora
WHERE tbLivro.numPaginas BETWEEN 200 AND 500
GROUP BY tbEditora.nomeEditora;
 
-- h) O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor
FROM tbLivro
JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor;
 
-- i) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras”
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor
FROM tbLivro
JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
WHERE tbEditora.nomeEditora = 'Companhia das Letras';
 
-- j) O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor
FROM tbLivro
JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
WHERE tbAutor.nomeAutor != 'Érico Veríssimo';
 
-- k) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não têm livros cadastrados
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor;
 
-- l) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que não têm autores cadastrados
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
FROM tbLivro
LEFT JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor;
 
-- m) O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e indiferente do livro pertencer a algum autor
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
FROM tbAutor
FULL JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor;
 
-- n) A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática.
SELECT tbLivro.nomeLivro, 'Ática' AS nomeEditora
FROM tbLivro;
 
-- o) Somente os nomes dos autores que não têm livros cadastrados
SELECT tbAutor.nomeAutor
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
WHERE tbLivro.codLivro IS NULL;
 
-- p) Os nomes dos gêneros que não possuem nenhum livro cadastrado
SELECT tbGenero.nomeGenero
FROM tbGenero
LEFT JOIN tbLivro ON tbGenero.codGenero = tbLivro.codGenero
WHERE tbLivro.codLivro IS NULL;