USE sakila;
##Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.
SELECT title , length FROM film;
SELECT length , title , RANK () OVER (ORDER BY length DESC) as 'rank'
FROM film; 

##Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.
SELECT title , rating, length , RANK () OVER (PARTITION BY rating ORDER BY 'length' DESC) AS 'rank'
FROM film
WHERE 'legth' IS NOT NULL; 

##How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".

SELECT COUNT(c.film_id) AS number_films, a.name
FROM category AS a
RIGHT JOIN film_category AS c
ON a.category_id = c.category_id
GROUP BY a.name
ORDER BY a.name;

##Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

SELECT COUNT(d.actor_id) AS actors_apar ,e.first_name , e.last_name
FROM actor AS e
JOIN film_actor AS d
ON d.actor_id = e.actor_id
GROUP BY e.first_name, e.last_name
ORDER BY e.first_name, e.last_name;

##Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.

SELECT 	COUNT(e.customer_id) AS the_most , f.first_name , f.last_name
FROM customer AS f
JOIN rental AS e
ON e.customer_id = f.customer_id
GROUP BY f.first_name, f.last_name
HAVING 	COUNT(*)> 40
ORDER BY f.first_name, f.last_name ;




