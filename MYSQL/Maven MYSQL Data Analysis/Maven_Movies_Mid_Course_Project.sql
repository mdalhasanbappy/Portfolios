USE mavenmovies;

/* 1. List of all staff members */
SELECT 
    first_name, 
    last_name, 
    email, 
    store_id
FROM staff;

/* 2. Separate counts of inventory items held at each store */
SELECT 
    store_id, 
    COUNT(*) AS inventory_items
FROM inventory
GROUP BY store_id;

/* 3. Count of active customers for each store */
SELECT 
    store_id, 
    COUNT(*) AS active_customers
FROM customer
WHERE active = 1
GROUP BY store_id;

/* 4. Count of all customer email addresses */
SELECT 
    COUNT(email) AS emails
FROM customer;

/* 5. Count of unique film titles in inventory at each store and unique categories of films */
SELECT 
    store_id, 
    COUNT(DISTINCT film_id) AS unique_films
FROM inventory
GROUP BY store_id;

SELECT 
    COUNT(DISTINCT name) AS unique_categories
FROM category;

/* 6. Replacement cost of films */
SELECT 
    MIN(replacement_cost) AS least_expensive, 
    MAX(replacement_cost) AS most_expensive, 
    AVG(replacement_cost) AS average_replacement_cost
FROM film;

/* 7. Average and maximum payment processed */
SELECT
    AVG(amount) AS average_payment, 
    MAX(amount) AS max_payment
FROM payment;

/* 8. List of customer IDs with count of rentals, highest volume customers at the top */
SELECT 
    customer_id, 
    COUNT(*) AS number_of_rentals
FROM rental
GROUP BY customer_id
ORDER BY number_of_rentals DESC;
