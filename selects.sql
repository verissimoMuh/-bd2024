-- a) A quantidade de livros agrupado pelo nome do g�nero
SELECT tbGenero.nomeGenero, COUNT(tbLivro.nomeLivro) AS quantidade_livros
FROM tbGenero
LEFT JOIN tbLivro ON tbGenero.codGenero = tbLivro.codGenero
GROUP BY tbGenero.nomeGenero;
 
-- b) A soma das p�ginas agrupada pelo nome do autor
SELECT tbAutor.nomeAutor, SUM(tbLivro.numPaginas) AS soma_paginas
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
GROUP BY tbAutor.nomeAutor;
 
-- c) A m�dia de p�ginas agrupada pelo nome do autor em ordem alfab�tica (de A a Z)
SELECT tbAutor.nomeAutor, AVG(tbLivro.numPaginas) AS media_paginas
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
GROUP BY tbAutor.nomeAutor
ORDER BY tbAutor.nomeAutor ASC;
 
-- d) A quantidade de livros agrupada pelo nome da editora em ordem alfab�tica inversa (de Z a A)
SELECT tbEditora.nomeEditora, COUNT(tbLivro.nomeLivro) AS quantidade_livros
FROM tbEditora
LEFT JOIN tbLivro ON tbEditora.codEditora = tbLivro.codEditora
GROUP BY tbEditora.nomeEditora
ORDER BY tbEditora.nomeEditora DESC;
 
-- e) A soma de p�ginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra �C�
SELECT tbAutor.nomeAutor, SUM(tbLivro.numPaginas) AS soma_paginas
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
WHERE tbAutor.nomeAutor LIKE 'C%'
GROUP BY tbAutor.nomeAutor;
 
-- f) A quantidade de livros agrupada pelo nome do autor, cujo nome do autor seja �Machado de Assis� ou �Cora Coralina� ou �Graciliano Ramos� ou �Clarice Lispector�
SELECT tbAutor.nomeAutor, COUNT(tbLivro.nomeLivro) AS quantidade_livros
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
WHERE tbAutor.nomeAutor IN ('Machado de Assis', 'Cora Coralina', 'Graciliano Ramos', 'Clarice Lispector')
GROUP BY tbAutor.nomeAutor;
 
-- g) A soma das p�ginas dos livros agrupadas pelo nome da editora cujo n�mero de p�ginas esteja entre 200 e 500 (inclusive)
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
 
-- i) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for �Cia das Letras�
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor
FROM tbLivro
JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
WHERE tbEditora.nomeEditora = 'Companhia das Letras';
 
-- j) O nome dos livros ao lado dos nomes dos autores, somente dos livros que n�o forem do autor ��rico Ver�ssimo�
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor
FROM tbLivro
JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
WHERE tbAutor.nomeAutor != '�rico Ver�ssimo';
 
-- k) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que n�o t�m livros cadastrados
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor;
 
-- l) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles que n�o t�m autores cadastrados
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
FROM tbLivro
LEFT JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor;
 
-- m) O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou n�o livro publicado, e indiferente do livro pertencer a algum autor
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro
FROM tbAutor
FULL JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor;
 
-- n) A editora �tica ir� publicar todos os t�tulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora �tica.
SELECT tbLivro.nomeLivro, '�tica' AS nomeEditora
FROM tbLivro;
 
-- o) Somente os nomes dos autores que n�o t�m livros cadastrados
SELECT tbAutor.nomeAutor
FROM tbAutor
LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
WHERE tbLivro.codLivro IS NULL;
 
-- p) Os nomes dos g�neros que n�o possuem nenhum livro cadastrado
SELECT tbGenero.nomeGenero
FROM tbGenero
LEFT JOIN tbLivro ON tbGenero.codGenero = tbLivro.codGenero
WHERE tbLivro.codLivro IS NULL;