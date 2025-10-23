/*                                      EXO REQUETE 

A : Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur

 SELECT f.id_film, f.title, f.year_of_release, CONCAT(floor(f.duration / 60), 'h',  (f.duration % 60)) AS duree, f.id_director, p.first_name, p.last_name
FROM film f
INNER JOIN director d ON d.id_director = f.id_director
INNER JOIN person p ON p.id_person = d.id_person 
ORDER BY f.id_film

Option avec  date_format() et sec_to_time()

SELECT f.id_film, f.title, f.year_of_release, DATE_FORMAT(SEC_TO_TIME(f.duration * 60), '%H:%i') AS duree, concat(p.first_name,' ', p.last_name) AS réalisateur
FROM film f
INNER JOIN director d ON d.id_director = f.id_director
INNER JOIN person p ON p.id_person = d.id_person
ORDER BY f.id_film

******************************************************************************************

B : Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)

SELECT f.title, f.duration
FROM film f
WHERE (f.duration > 135)
ORDER BY f.duration desc

******************************************************************************************

C : Liste des films d’un réalisateur (en précisant l’année de sortie) 

SELECT d.id_director, concat(p.first_name,' ', p.last_name) AS réalisateur, f.title, f.year_of_release
FROM director d
INNER JOIN film f ON f.id_director = d.id_director
INNER JOIN person p ON p.id_person = d.id_person
WHERE d.id_director = 

******************************************************************************************

D : Nombre de films par genre (classés dans l’ordre décroissant)

SELECT g.wording, count(c.id_film)
FROM genre g
INNER JOIN classified c ON c.id_genre = g.id_genre
GROUP BY g.wording

******************************************************************************************

E : Nombre de films par réalisateur (classés dans l’ordre décroissant)

SELECT concat(p.first_name,' ', p.last_name) AS réalisateur, d.id_director, COUNT(f.id_film)
FROM person p
INNER JOIN director d ON d.id_person = p.id_person
INNER JOIN film f ON f.id_director = d.id_director
GROUP BY d.id_director

******************************************************************************************

F : Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe

select pl.id_film, concat(p.first_name,' ', p.last_name) AS acteurs, p.gender
FROM play pl
INNER JOIN film f ON f.id_film = pl.id_film
INNER JOIN actor a ON a.id_actor = pl.id_actor
INNER JOIN person p ON p.id_person = a.id_person
WHERE pl.id_film = 1


******************************************************************************************

G : Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie (du film le plus récent au plus ancien)

SELECT f.title, f.year_of_release, CONCAT(p.first_name, ' ', p.last_name) AS acteur, fr.character_first_name, fr.character_last_name
FROM film f
INNER JOIN play pl ON pl.id_film = f.id_film
INNER JOIN film_role fr ON fr.id_role = pl.id_role
INNER JOIN actor a ON a.id_actor = pl.id_actor
INNER JOIN person p ON p.id_person = a.id_person
WHERE pl.id_actor = 1

******************************************************************************************


H : Liste des personnes qui sont à la fois acteurs et réalisateurs

SELECT concat(p.first_name,' ', p.last_name) AS réalisacteurs
FROM person p
INNER JOIN actor a ON a.id_person = p.id_person
INNER JOIN director d ON d.id_person = p.id_person

******************************************************************************************

I : Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien)

SELECT f.title
FROM film f
WHERE f.year_of_release > 2020

******************************************************************************************

J : Nombre d’hommes et de femmes parmi les acteurs

SELECT gender, COUNT(*) AS nombre
FROM person
GROUP BY gender

******************************************************************************************

K : Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu)

SELECT concat(p.first_name,' ', p.last_name) AS acteurs_de_plus_de_50_ans, FLOOR(DATEDIFF(CURDATE(), p.birthday) / 365) AS age
FROM person p
JOIN actor a ON p.id_person = a.id_person
WHERE FLOOR(DATEDIFF(CURDATE(), p.birthday) / 365) > 50

******************************************************************************************

L : Acteurs ayant joué dans 3 films ou plus

SELECT concat(p.first_name,' ', p.last_name) AS acteurs, COUNT(DISTINCT f.id_film) AS nombre_films
FROM person p
inner JOIN actor a ON p.id_person = a.id_person
INNER JOIN play pl ON a.id_actor = pl.id_actor
inner JOIN film f ON pl.id_film = f.id_film
GROUP BY p.id_person, p.first_name, p.last_name
HAVING COUNT(DISTINCT f.id_film) >= 3

******************************************************************************************


