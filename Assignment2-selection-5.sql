--Bryce Holewinski, CS340
#1 Find all films with maximum length and minimum rental duration (compared to all other films).
#In other words let L be the maximum film length, and let R be the minimum rental duration in the table film.
#You need to find all films with length L and rental duration R.
#You just need to return attribute film id for this query.
SELECT film_id FROM `film` WHERE length >= 185 && rental_duration <=3

#2 We want to find out how many actors have played in each film, so for each film
#return the film id, film title, and the number of actors who played in that film.
#Some films may have no actors, and your query does not need to return those films.
SELECT f.film_id, f.title, count(fa.actor_id)
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
GROUP BY f.title

#3 Find the average length of films for each language. Your query should return
#every language even if there is no films in that language. language refers to
#attribute language_id (not attribute original_language_id)
SELECT l.name, avg(f.length)
FROM language l
LEFT JOIN film f ON f.language_id = l.language_id
GROUP BY l.name

#4 We want to find out how many of each category of film KEVIN BLOOM has started in
#so return a table with category.name and the count
#of the number of films that KEVIN was in which were in that category order by
#the category name ascending (Your query should return every category even if KEVIN has been in no films in that category).
SELECT c.name, count(f.film_id)
FROM category c
INNER JOIN film_category fc ON fc.category_id = c.category_id
INNER JOIN film f ON f.film_id = fc.film_id
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'KEVIN' AND a.last_name = 'BLOOM'
GROUP BY c.name

#5 Find the film title of all films which do not feature both SCARLETT DAMON and
#BEN HARRIS(so you will not list a film if both of these actors have played in that film,
#but if only one or none of these actors have played in a film, that film should be listed).
#Order the results by title, descending (use ORDER BY title DESC at the end of the query)
#Warning, this is a tricky one and while the syntax is all things you know, you have to think oustide
#the box a bit to figure out how to get a table that shows pairs of actors in movies
