USE spotifyNew;

-- 1.Contagem de quantos Artistas estão com valor Nulo no nome
SELECT count(nomeArtista) as contagem FROM spotifytop
WHERE nomeArtista is null;

-- 2.Contagem total de quantos registros tem na tabela
SELECT * FROM spotifytop;
SELECT count(posicao)+count(nomeArtista)+count(nomeMusica)+count(dias)+count(top10Vezes)+count(maiorPosicao)+count(vezesMaiorPosicao)+count(picoDeStreams)+count(totalStreams) as contagem FROM spotifytop;

-- 3.Contagem de quantas músicas estiveram no top 1
SELECT sum(maiorPosicao) as TOP1 FROM spotifytop
WHERE maiorPosicao = 1;

-- 4.Qual a música que ficou por mais vezes no top 1
SELECT max(maiorPosicao) as TOP1, nomeMusica FROM spotifytop
WHERE maiorPosicao = 1;

-- 5.Quantos artistas diferentes há
SELECT count(DISTINCT nomeArtista)as Artistas FROM spotifytop;

-- 6.Qual música com mais streams
SELECT nomeMusica FROM spotifytop
WHERE totalStreams = (SELECT max(totalStreams) FROM spotifytop);

-- 7.Qual música com maior pico de streams
SELECT nomeMusica FROM spotifytop
WHERE picoDeStreams = (SELECT max(picoDeStreams) FROM spotifytop);

-- 8.Qual artista ficou mais vezes no top 1
SELECT max(maiorPosicao) as TOP1, nomeArtista FROM spotifytop
WHERE maiorPosicao = 1;

-- 9.Qual artistas possui mais registros
SELECT nomeArtista FROM spotifytop 
GROUP BY nomeArtista 
ORDER BY count(nomeArtista)DESC LIMIT 1;

-- 10.Quantos artistas possuem nome iniciando com a letra “H”
SELECT count(nomeArtista) AS Nome_de_artistas_que_começa_com_H FROM spotifytop 
WHERE nomeArtista LIKE "H%";

-- 11.Quais as músicas da artista “Anitta” estão na tabela
SELECT nomeMusica FROM spotifytop 
WHERE nomeArtista = 'Anitta';

-- 12.Quantas músicas passaram da marca de 500 mil streams
SELECT count(nomeMusica) AS total_musicas_500k FROM spotifytop 
WHERE totalStreams > 500000;

-- 13.Qual a música no registro 3480
SELECT nomeMusica FROM spotifytop LIMIT 3479, 1;

-- 14.Quantas músicas o artista “The Weeknd” possui e quais
SELECT (SELECT count(nomeMusica) FROM spotifytop WHERE nomeArtista = 'The Weeknd' )
AS QT_MÚSICAS, nomeMusica as NOMES_DAS_MÚSICAS FROM spotifytop
WHERE nomeArtista = 'The Weeknd';

-- 15.Quantas músicas possuem “girl” no nome
SELECT count(nomeMusica) AS total_musicas_girl FROM spotifytop 
WHERE nomeMusica LIKE '%girl%';

-- 16.Qual o total de streams do artista “Post Malone”
SELECT sum(totalStreams) AS total_streams_Post_Malone FROM spotifytop 
WHERE nomeArtista = 'Post Malone';

-- 17.Quais são os 5 artistas com mais registros, de forma decrescente
SELECT nomeArtista, COUNT(nomeArtista) AS Registros FROM spotifytop 
GROUP BY nomeArtista 
ORDER BY Registros DESC LIMIT 5;

-- 18.Qual o total de streams das 10 músicas mais com mais streams
SELECT SUM(totalStreams) AS total_streams_top10 FROM (SELECT totalStreams FROM spotifytop ORDER BY totalStreams DESC LIMIT 10) AS top10;

-- 19.Quais as músicas que já estiveram no top 1 e estiveram entre 40 e 60 vezes na maior posição
SELECT nomeMusica FROM spotifytop WHERE maiorPosicao = 1 AND vezesMaiorPosicao BETWEEN 40 AND 60;

-- 20.Quais músicas tiveram menos de 500 mil streams e ficaram entre o top 5 e 10
SELECT nomeMusica FROM spotifytop WHERE totalStreams < 500000 AND maiorPosicao BETWEEN 5 AND 10;

-- 21.Qual a música com o mínimo de streams que atingiu a 1° posição no top 10
SELECT nomeMusica as Música_com_menos_stream FROM spotifytop 
WHERE maiorPosicao = 1 
ORDER BY totalStreams ASC LIMIT 1;

-- 22.Qual a música com o mínimo de streams da artista Taylor Swift
SELECT nomeMusica as Música_Taylor_Swift FROM spotifytop 
WHERE nomeArtista = 'Taylor Swift' 
ORDER BY totalStreams ASC LIMIT 1;