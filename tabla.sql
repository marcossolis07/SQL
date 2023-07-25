//ejercicio 1
SELECT name, year FROM movies WHERE year=2001;

//ejercicio 2
SELECT COUNT(*), year FROM movies WHERE year=1982;

//ejercicio 3
SELECT * FROM actors WHERE last_name LIKE '%stack%';

//ejercicio 4
SELECT first_name fs, COUNT (*) occurrences FROM actors GROUP BY fs ORDER BY COUNT(fs) DESC LIMIT 10;
SELECT last_name ls, COUNT (*) occurrences FROM actors GROUP BY ls ORDER BY COUNT(ls) DESC LIMIT 10;
SELECT first_name || ' ' || last_name as full_name, COUNT (*) occurrences FROM actors GROUP BY full_name ORDER BY COUNT(full_name) DESC LIMIT 10;

//ejercicio 5

SELECT a.first_name, a.last_name, COUNT(r.actor_id) role_count
FROM actors a
JOIN roles r ON a.id = r.actor_id
GROUP BY a.id, a.first_name, a.last_name
ORDER BY role_count DESC
LIMIT 100;

//ejercicio 6
SELECT mg.genre AS genre, COUNT(m.id) AS num_movies_by_genres
FROM movies_genres mg
JOIN movies m ON mg.movie_id = m.id
GROUP BY mg.genre
ORDER BY num_movies_by_genres ASC;

//ejercicio 7
SELECT a.first_name, a.last_name
FROM actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies m ON r.movie_id = m.id
WHERE m.name = 'Braveheart' AND m.year = 1995
ORDER BY last_name;

//ejercicio 8
SELECT
    d.first_name,
    d.last_name,
    m.name,
    m.year
FROM directors d
JOIN movies_directors md ON d.id = md.director_id
JOIN movies m ON md.movie_id = m.id
JOIN movies_genres mg ON m.id = mg.movie_id
WHERE mg.genre = 'Film-Noir' AND m.year % 4 = 0
ORDER BY m.name;

//ejercicio 9
SELECT m.name AS movie_name, a.first_name, a.last_name
FROM actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies_genres mg ON r.movie_id = mg.movie_id
JOIN movies m ON r.movie_id = m.id
JOIN roles r2 ON m.id = r2.movie_id
JOIN actors a2 ON r2.actor_id = a2.id
WHERE a2.first_name = 'Kevin' AND a2.last_name = 'Bacon'
  AND mg.genre = 'Drama'
  AND NOT (a.first_name = 'Kevin' AND a.last_name = 'Bacon');

