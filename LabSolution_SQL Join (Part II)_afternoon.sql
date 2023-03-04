USE sakila;
#question 1
-- Write a query to display for each store its store ID, city, and country.
SELECT * FROM sakila.store;
SELECT * FROM sakila.city;
SELECT * FROM sakila.address;

SELECT s.store_id, c.city_id, c.country_id FROM sakila.store s
JOIN sakila.address ad
USING (address_id)
JOIN  sakila.city c
ON ad.city_id = c.city_id;

#Question2
-- Write a query to display how much business, in dollars, each store brought in.
SELECT * FROM sakila.store; #store_id is commmon to 'store and customer'
SELECT * FROM sakila.payment; # custmer_id is common to 'payment and customer'
SELECT * FROM sakila.customer;

SELECT s.store_id, sum(p.amount) FROM sakila.store s
JOIN sakila.customer c
USING (store_id)
JOIN sakila.payment p
ON c.customer_id = p.customer_id
GROUP BY s.store_id;

#Question 3
-- Which film categories are longest?
SELECT * FROM sakila.film_category; # common column is film_id
SELECT * FROM sakila.film;

SELECT fc.category_id, f.length FROM sakila.film_category fc
JOIN sakila.film f
USING (film_id)
ORDER BY f.length DESC LIMIT 10;

#Question 4
-- Display the most frequently rented movies in descending order.
SELECT title, rental_rate FROm sakila.film
ORDER BY title DESC;

#Question 5
#List the top five genres in gross revenue in descending order.
SELECT * FROM sakila.payment;
SELECT * FROM sakila.film;
SELECT * FROM sakila.category; #categoryid
SELECT * FROM sakila.film_category;#film_id

SELECT * FROM sakila.payment p
JOIN sakila.film f USING (rental_id)
JOIN sakila.film_category fc ON f.film_id = fc.film_id
JOIN sakila.category c ON fc.category_id = c.category_id;

#QUESTION 7 (Case of Self Joint)
#Get all pairs of actors that worked together
SELECT * FROM sakila.film_actor;

SELECT a1.actor_id, a2.actor_id, a1.film_id
 FROM sakila.film_actor a1
 JOIN sakila.film_actor a2
 ON (a1.film_id =a2.film_id) AND (a1.actor_id <> a2.actor_id);
 
 #8.Get all pairs of customers that have rented the same film more than 3 times.
 SELECT * FROM sakila.rental;

SELECT a1.customer_id, a2.customer_id, a1.rental_id
FROM sakila.rental a1
JOIN sakila.rental a2
ON (a1.rental_id = a2.rental_id) AND (a1.customer_id != a2.customer_id);

#Question 9
SELECT actor_id,  count(film_id) FROM sakila.film_actor
GROUP BY actor_id
ORDER BY count(film_id) DESC;

