use sakila;

SELECT DISTINCT a1.actor_id AS actor1_id, a1.first_name AS actor1_first_name, a1.last_name AS actor1_last_name,
                a2.actor_id AS actor2_id, a2.first_name AS actor2_first_name, a2.last_name AS actor2_last_name,
                f.title AS film_title
FROM sakila.actor a1
JOIN sakila.film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN sakila.film f ON fa1.film_id = f.film_id
JOIN sakila.film_actor fa2 ON f.film_id = fa2.film_id
JOIN sakila.actor a2 ON fa2.actor_id = a2.actor_id
WHERE a1.actor_id < a2.actor_id;

SELECT c1.customer_id AS customer1_id, c1.first_name AS customer1_first_name, c1.last_name AS customer1_last_name,
       c2.customer_id AS customer2_id, c2.first_name AS customer2_first_name, c2.last_name AS customer2_last_name,
       r.inventory_id, COUNT(*) AS rental_count
FROM sakila.rental r
JOIN sakila.customer c1 ON r.customer_id = c1.customer_id
JOIN sakila.customer c2 ON r.inventory_id = c2.customer_id
WHERE c1.customer_id < c2.customer_id
GROUP BY c1.customer_id, c2.customer_id, r.inventory_id
HAVING rental_count > 3;

SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM sakila.actor a
CROSS JOIN sakila.film f;


