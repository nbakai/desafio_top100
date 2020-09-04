--1. Crear base de datos llamada películas
psql
CREATE DATABASE peliculas;

--3. Cargar ambos archivos a su tabla correspondiente
\c peliculas;

CREATE TABLE peliculas(id SERIAL NOT NULL PRIMARY KEY, pelicula
VARCHAR(60) NOT NULL, año_estreno INT, director VARCHAR(30));

CREATE TABLE reparto(id INT NOT NULL, actor VARCHAR(30) 
NOT NULL, FOREIGN KEY(id) REFERENCES peliculas(id));


\copy peliculas FROM 'Escritorio/peliculas.csv' csv HEADER;
COPY 100
\copy reparto FROM 'Escritorio/reparto.csv' csv;
COPY 1051

--4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película, año de estreno, director y todo el reparto.

SELECT * FROM peliculas LEFT JOIN reparto ON peliculas.id=
reparto.id WHERE pelicula='Titanic';

-- 5. Listar los titulos de las películas donde actúe Harrison Ford.
SELECT pelicula FROM peliculas JOIN reparto ON peliculas.id=reparto.id 
WHERE actor='Harrison Ford';

--6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100

SELECT director, COUNT(director) FROM peliculas GROUP BY director ORDER BY MIN(peliculas.id) LIMIT 10;

--7. Indicar cuantos actores distintos hay

SELECT COUNT(actor) FROM(
SELECT actor FROM reparto GROUP BY(actor))
AS actor;


--8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente

SELECT año_estreno, pelicula FROM peliculas WHERE
año_estreno >= 1990 AND año_estreno<= 1999 ORDER BY(pelicula) ASC; 

--9. Listar el reparto de las películas lanzadas el año 2001
SELECT reparto.actor FROM reparto INNER JOIN peliculas ON
peliculas.id=reparto.id WHERE año_estreno = 2001;


--10. Listar los actores de la película más nueva
SELECT reparto.actor FROM reparto INNER JOIN peliculas ON
peliculas.id=reparto.id WHERE año_estreno IN(SELECT MAX(año_estreno)
peliculas(# FROM peliculas);






