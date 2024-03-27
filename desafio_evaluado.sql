DROP TABLE IF EXISTS Peliculas;
DROP TABLE IF EXISTS Reparto;

-- 2. Cargar ambos archivos a su tabla correspondiente
CREATE TABLE Peliculas(
	id INT,
	pelicula VARCHAR(150) NOT NULL,
	anio INT,
	director VARCHAR(50)
);

CREATE TABLE Reparto(
	id_pelicula INT NOT NULL,
	actor VARCHAR(50) NOT NULL
);

COPY Peliculas
FROM 'C:\CSV\peliculas.csv'
DELIMITER ','
CSV HEADER;

COPY Reparto
FROM 'C:\CSV\reparto.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM Peliculas;
SELECT * FROM Reparto;

-- 3. Obtener el ID de la película “Titanic”.
SELECT p.id FROM Peliculas p
WHERE p.pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM Reparto r
WHERE r.id_pelicula = (	SELECT p.id FROM Peliculas p
						WHERE p.pelicula = 'Titanic' );

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(p.id) FROM Peliculas p
JOIN Reparto r ON p.id = r.id_pelicula
WHERE r.actor = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT * FROM Peliculas p
WHERE p.anio >= 1990 AND p.anio <= 1999
ORDER BY p.anio ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT p.pelicula, LENGTH(p.pelicula) AS longitud_titulo FROM Peliculas p;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(p.pelicula)) FROM Peliculas p;


