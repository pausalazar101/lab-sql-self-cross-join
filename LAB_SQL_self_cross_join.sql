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



SELECT c1.customer_id, c2.customer_id, COUNT(*) AS coincidences
FROM (
    SELECT r.customer_id, r.inventory_id, i.film_id, f.title
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON f.film_id = i.film_id
) AS c1
JOIN (
    SELECT r.customer_id, r.inventory_id, i.film_id, f.title
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON f.film_id = i.film_id
) AS c2 ON c1.film_id = c2.film_id
WHERE c1.customer_id <> c2.customer_id
GROUP BY c1.customer_id, c2.customer_id
HAVING COUNT(*) > 3
ORDER BY c1.customer_id, c2.customer_id;




SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM sakila.actor a
CROSS JOIN sakila.film f;


