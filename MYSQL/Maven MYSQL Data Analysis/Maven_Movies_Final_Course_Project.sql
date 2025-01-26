USE mavenmovies;

/* 1. Managers' names and full addresses at each store */
SELECT 
    staff.first_name AS manager_first_name, 
    staff.last_name AS manager_last_name,
    address.address, 
    address.district, 
    city.city, 
    country.country
FROM store
JOIN staff ON store.manager_staff_id = staff.staff_id
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

/* 2. List of each inventory item stocked */
SELECT 
    inventory.store_id, 
    inventory.inventory_id, 
    film.title, 
    film.rating, 
    film.rental_rate, 
    film.replacement_cost
FROM inventory
JOIN film ON inventory.film_id = film.film_id;

/* 3. Summary of inventory items by rating at each store */
SELECT 
    inventory.store_id, 
    film.rating, 
    COUNT(inventory.inventory_id) AS inventory_items
FROM inventory
JOIN film ON inventory.film_id = film.film_id
GROUP BY inventory.store_id, film.rating;

/* 4. Diversification of inventory in terms of replacement cost */
SELECT 
    inventory.store_id, 
    category.name AS category, 
    COUNT(inventory.inventory_id) AS films, 
    AVG(film.replacement_cost) AS avg_replacement_cost, 
    SUM(film.replacement_cost) AS total_replacement_cost
FROM inventory
JOIN film ON inventory.film_id = film.film_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY inventory.store_id, category.name
ORDER BY total_replacement_cost DESC;

/* 5. List of customer names, store, active status, and full addresses */
SELECT 
    customer.first_name, 
    customer.last_name, 
    customer.store_id,
    customer.active, 
    address.address, 
    city.city, 
    country.country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id;

/* 6. Customer names, total lifetime rentals, and sum of all payments */
SELECT 
    customer.first_name, 
    customer.last_name, 
    COUNT(rental.rental_id) AS total_rentals, 
    SUM(payment.amount) AS total_payment_amount
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY customer.first_name, customer.last_name
ORDER BY total_payment_amount DESC;

/* 7. List of advisor and investor names */
SELECT
    'investor' AS type, 
    first_name, 
    last_name, 
    company_name
FROM investor
UNION 
SELECT 
    'advisor' AS type, 
    first_name, 
    last_name, 
    NULL
FROM advisor;

/* 8. Coverage of most-awarded actors */
SELECT
    CASE 
        WHEN actor_award.awards = 'Emmy, Oscar, Tony' THEN '3 awards'
        WHEN actor_award.awards IN ('Emmy, Oscar', 'Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
        ELSE '1 award'
    END AS number_of_awards, 
    AVG(CASE WHEN actor_award.actor_id IS NULL THEN 0 ELSE 1 END) AS pct_with_one_film
FROM actor_award
GROUP BY 
    CASE 
        WHEN actor_award.awards = 'Emmy, Oscar, Tony' THEN '3 awards'
        WHEN actor_award.awards IN ('Emmy, Oscar', 'Emmy, Tony', 'Oscar, Tony') THEN '2 awards'
        ELSE '1 award'
    END;