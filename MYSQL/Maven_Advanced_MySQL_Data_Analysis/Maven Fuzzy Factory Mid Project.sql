USE mavenfuzzyfactory;

/* 1. Monthly trends for Gsearch sessions and orders */
SELECT
    YEAR(website_sessions.created_at) AS year, 
    MONTH(website_sessions.created_at) AS month, 
    COUNT(DISTINCT website_sessions.website_session_id) AS gsearch_sessions, 
    COUNT(DISTINCT orders.order_id) AS gsearch_orders, 
    COUNT(DISTINCT orders.order_id) / COUNT(DISTINCT website_sessions.website_session_id) AS conversion_rate
FROM website_sessions
JOIN orders 
    ON orders.website_session_id = website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-11-27'
    AND website_sessions.utm_source = 'gsearch'
GROUP BY year, month;

/* 2. Monthly trends for Gsearch, splitting out nonbrand and brand campaigns */
SELECT
    YEAR(website_sessions.created_at) AS year, 
    MONTH(website_sessions.created_at) AS month, 
    COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN website_sessions.website_session_id END) AS nonbrand_sessions, 
    COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN orders.order_id END) AS nonbrand_orders,
    COUNT(DISTINCT CASE WHEN utm_campaign = 'brand' THEN website_sessions.website_session_id END) AS brand_sessions, 
    COUNT(DISTINCT CASE WHEN utm_campaign = 'brand' THEN orders.order_id END) AS brand_orders
FROM website_sessions
JOIN orders 
    ON orders.website_session_id = website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-11-27'
    AND website_sessions.utm_source = 'gsearch'
GROUP BY year, month;

/* 3. Monthly sessions and orders split by device type for nonbrand Gsearch */
SELECT
    YEAR(website_sessions.created_at) AS year, 
    MONTH(website_sessions.created_at) AS month, 
    COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN website_sessions.website_session_id END) AS desktop_sessions, 
    COUNT(DISTINCT CASE WHEN device_type = 'desktop' THEN orders.order_id END) AS desktop_orders,
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN website_sessions.website_session_id END) AS mobile_sessions, 
    COUNT(DISTINCT CASE WHEN device_type = 'mobile' THEN orders.order_id END) AS mobile_orders
FROM website_sessions
JOIN orders 
    ON orders.website_session_id = website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-11-27'
    AND website_sessions.utm_source = 'gsearch'
    AND website_sessions.utm_campaign = 'nonbrand'
GROUP BY year, month;

/* 4. Monthly trends for Gsearch and other channels */
SELECT
    YEAR(website_sessions.created_at) AS year, 
    MONTH(website_sessions.created_at) AS month, 
    COUNT(DISTINCT CASE WHEN utm_source = 'gsearch' THEN website_sessions.website_session_id END) AS gsearch_paid_sessions,
    COUNT(DISTINCT CASE WHEN utm_source = 'bsearch' THEN website_sessions.website_session_id END) AS bsearch_paid_sessions,
    COUNT(DISTINCT CASE WHEN utm_source IS NULL AND http_referer IS NOT NULL THEN website_sessions.website_session_id END) AS organic_search_sessions,
    COUNT(DISTINCT CASE WHEN utm_source IS NULL AND http_referer IS NULL THEN website_sessions.website_session_id END) AS direct_type_in_sessions
FROM website_sessions
JOIN orders 
    ON orders.website_session_id = website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-11-27'
GROUP BY year, month;

/* 5. Session to order conversion rates by month */
SELECT
    YEAR(website_sessions.created_at) AS year, 
    MONTH(website_sessions.created_at) AS month, 
    COUNT(DISTINCT website_sessions.website_session_id) AS total_sessions, 
    COUNT(DISTINCT orders.order_id) AS total_orders, 
    COUNT(DISTINCT orders.order_id) / COUNT(DISTINCT website_sessions.website_session_id) AS conversion_rate    
FROM website_sessions
JOIN orders 
    ON orders.website_session_id = website_sessions.website_session_id
WHERE website_sessions.created_at < '2012-11-27'
GROUP BY year, month;

/* 6. Estimate revenue from Gsearch lander test */
CREATE TEMPORARY TABLE first_test_pageviews AS
SELECT
    website_pageviews.website_session_id, 
    MIN(website_pageviews.website_pageview_id) AS min_pageview_id
FROM website_pageviews 
JOIN website_sessions 
    ON website_sessions.website_session_id = website_pageviews.website_session_id
    AND website_sessions.created_at < '2012-07-28'
    AND website_pageviews.website_pageview_id >= 23504
    AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY website_pageviews.website_session_id;

CREATE TEMPORARY TABLE nonbrand_test_sessions_w_landing_pages AS
SELECT 
    first_test_pageviews.website_session_id, 
    website_pageviews.pageview_url AS landing_page
FROM first_test_pageviews
JOIN website_pageviews 
    ON website_pageviews.website_pageview_id = first_test_pageviews.min_pageview_id
WHERE website_pageviews.pageview_url IN ('/home','/lander-1');

CREATE TEMPORARY TABLE nonbrand_test_sessions_w_orders AS
SELECT
    nonbrand_test_sessions_w_landing_pages.website_session_id, 
    nonbrand_test_sessions_w_landing_pages.landing_page, 
    orders.order_id
FROM nonbrand_test_sessions_w_landing_pages
JOIN orders 
    ON orders.website_session_id = nonbrand_test_sessions_w_landing_pages.website_session_id;

SELECT
    landing_page, 
    COUNT(DISTINCT website_session_id) AS sessions, 
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT order_id) / COUNT(DISTINCT website_session_id) AS conversion_rate
FROM nonbrand_test_sessions_w_orders
GROUP BY landing_page;

SELECT 
    COUNT(website_session_id) AS sessions_since_test
FROM website_sessions
WHERE created_at < '2012-11-27'
    AND website_session_id > 17145
    AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand';

/* 7. Full conversion funnel from landing pages to orders */
USE mavenfuzzyfactory;

CREATE TEMPORARY TABLE session_level_made_it_flagged AS
SELECT
    website_session_id, 
    MAX(homepage) AS saw_homepage, 
    MAX(custom_lander) AS saw_custom_lander,
    MAX(products_page) AS product_made_it, 
    MAX(mrfuzzy_page) AS mrfuzzy_made_it, 
    MAX(cart_page) AS cart_made_it,
    MAX(shipping_page) AS shipping_made_it,
    MAX(billing_page) AS billing_made_it,
    MAX(thankyou_page) AS thankyou_made_it
FROM (
    SELECT
        website_sessions.website_session_id, 
        website_pageviews.pageview_url, 
        CASE WHEN pageview_url = '/home' THEN 1 ELSE 0 END AS homepage,
        CASE WHEN pageview_url = '/lander-1' THEN 1 ELSE 0 END AS custom_lander,
        CASE WHEN pageview_url = '/products' THEN 1 ELSE 0 END AS products_page,
        CASE WHEN pageview_url = '/the-original-mr-fuzzy' THEN 1 ELSE 0 END AS mrfuzzy_page, 
        CASE WHEN pageview_url = '/cart' THEN 1 ELSE 0 END AS cart_page,
        CASE WHEN pageview_url = '/shipping' THEN 1 ELSE 0 END AS shipping_page,
        CASE WHEN pageview_url = '/billing' THEN 1 ELSE 0 END AS billing_page,
        CASE WHEN pageview_url = '/thank-you-for-your-order' THEN 1 ELSE 0 END AS thankyou_page
    FROM website_sessions 
    JOIN website_pageviews 
        ON website_sessions.website_session_id = website_pageviews.website_session_id
    WHERE website_sessions.utm_source = 'gsearch' 
        AND website_sessions.utm_campaign = 'nonbrand' 
        AND website_sessions.created_at < '2012-07-28'
        AND website_sessions.created_at > '2012-06-19'
    ORDER BY website_sessions.website_session_id, website_pageviews.created_at
) AS pageview_level
GROUP BY website_session_id;

-- Part 1: Conversion funnel counts
SELECT
    CASE 
        WHEN saw_homepage = 1 THEN 'saw_homepage'
        WHEN saw_custom_lander = 1 THEN 'saw_custom_lander'
        ELSE 'uh oh... check logic' 
    END AS segment, 
    COUNT(DISTINCT website_session_id) AS sessions,
    COUNT(DISTINCT CASE WHEN product_made_it = 1 THEN website_session_id END) AS to_products,
    COUNT(DISTINCT CASE WHEN mrfuzzy_made_it = 1 THEN website_session_id END) AS to_mrfuzzy,
    COUNT(DISTINCT CASE WHEN cart_made_it = 1 THEN website_session_id END) AS to_cart,
    COUNT(DISTINCT CASE WHEN shipping_made_it = 1 THEN website_session_id END) AS to_shipping,
    COUNT(DISTINCT CASE WHEN billing_made_it = 1 THEN website_session_id END) AS to_billing,
    COUNT(DISTINCT CASE WHEN thankyou_made_it = 1 THEN website_session_id END) AS to_thankyou
FROM session_level_made_it_flagged 
GROUP BY segment;

-- Part 2: Conversion funnel click rates
SELECT
    CASE 
        WHEN saw_homepage = 1 THEN 'saw_homepage'
        WHEN saw_custom_lander = 1 THEN 'saw_custom_lander'
        ELSE 'uh oh... check logic' 
    END AS segment, 
    COUNT(DISTINCT CASE WHEN product_made_it = 1 THEN website_session_id END) / COUNT(DISTINCT website_session_id) AS lander_click_rate,
    COUNT(DISTINCT CASE WHEN mrfuzzy_made_it = 1 THEN website_session_id END) / COUNT(DISTINCT CASE WHEN product_made_it = 1 THEN website_session_id END) AS products_click_rate,
    COUNT(DISTINCT CASE WHEN cart_made_it = 1 THEN website_session_id END) / COUNT(DISTINCT CASE WHEN mrfuzzy_made_it = 1 THEN website_session_id END) AS mrfuzzy_click_rate,
    COUNT(DISTINCT CASE WHEN shipping_made_it = 1 THEN website_session_id END) / COUNT(DISTINCT CASE WHEN cart_made_it = 1 THEN website_session_id END) AS cart_click_rate,
    COUNT(DISTINCT CASE WHEN billing_made_it = 1 THEN website_session_id END) / COUNT(DISTINCT CASE WHEN shipping_made_it = 1 THEN website_session_id END) AS shipping_click_rate,
    COUNT(DISTINCT CASE WHEN thankyou_made_it = 1 THEN website_session_id END) / COUNT(DISTINCT CASE WHEN billing_made_it = 1 THEN website_session_id END) AS billing_click_rate
FROM session_level_made_it_flagged
GROUP BY segment;

-- 8. Revenue per billing page session during the test period
SELECT
    billing_version_seen, 
    COUNT(DISTINCT website_session_id) AS sessions, 
    SUM(price_usd) / COUNT(DISTINCT website_session_id) AS revenue_per_billing_page_seen
FROM (
    SELECT 
        website_pageviews.website_session_id, 
        website_pageviews.pageview_url AS billing_version_seen, 
        orders.order_id, 
        orders.price_usd
    FROM website_pageviews 
    LEFT JOIN orders
        ON orders.website_session_id = website_pageviews.website_session_id
    WHERE website_pageviews.created_at > '2012-09-10'
        AND website_pageviews.created_at < '2012-11-10'
        AND website_pageviews.pageview_url IN ('/billing','/billing-2')
) AS billing_pageviews_and_order_data
GROUP BY billing_version_seen;

-- Number of billing page sessions for the past month
SELECT 
    COUNT(website_session_id) AS billing_sessions_past_month
FROM website_pageviews 
WHERE website_pageviews.pageview_url IN ('/billing','/billing-2') 
    AND created_at BETWEEN '2012-10-27' AND '2012-11-27';