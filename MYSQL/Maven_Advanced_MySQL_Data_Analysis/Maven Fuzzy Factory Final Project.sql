/*
6. Let’s dive deeper into the impact of introducing new products. Please pull monthly sessions to 
the /products page, and show how the % of those sessions clicking through another page has changed 
over time, along with a view of how conversion from /products to placing an order has improved.
*/

-- first, identifying all the views of the /products page
CREATE TEMPORARY TABLE products_pageviews
SELECT
	website_session_id, 
    website_pageview_id, 
    created_at AS saw_product_page_at

FROM website_pageviews 
WHERE pageview_url = '/products'
;


SELECT 
	YEAR(saw_product_page_at) AS yr, 
    MONTH(saw_product_page_at) AS mo,
    COUNT(DISTINCT products_pageviews.website_session_id) AS sessions_to_product_page, 
    COUNT(DISTINCT website_pageviews.website_session_id) AS clicked_to_next_page, 
    COUNT(DISTINCT website_pageviews.website_session_id)/COUNT(DISTINCT products_pageviews.website_session_id) AS clickthrough_rt,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT products_pageviews.website_session_id) AS products_to_order_rt
FROM products_pageviews
	LEFT JOIN website_pageviews 
		ON website_pageviews.website_session_id = products_pageviews.website_session_id -- same session
        AND website_pageviews.website_pageview_id > products_pageviews.website_pageview_id -- they had another page AFTER
	LEFT JOIN orders 
		ON orders.website_session_id = products_pageviews.website_session_id
GROUP BY 1,2
;

/*
7. We made our 4th product available as a primary product on December 05, 2014 (it was previously only a cross-sell item). 
Could you please pull sales data since then, and show how well each product cross-sells from one another?
*/

CREATE TEMPORARY TABLE primary_products
SELECT 
	order_id, 
    primary_product_id, 
    created_at AS ordered_at
FROM orders 
WHERE created_at > '2014-12-05' -- when the 4th product was added (says so in question)
;

SELECT
	primary_products.*, 
    order_items.product_id AS cross_sell_product_id
FROM primary_products
	LEFT JOIN order_items 
		ON order_items.order_id = primary_products.order_id
        AND order_items.is_primary_item = 0; -- only bringing in cross-sells;




SELECT 
	primary_product_id, 
    COUNT(DISTINCT order_id) AS total_orders, 
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 1 THEN order_id ELSE NULL END) AS _xsold_p1,
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 2 THEN order_id ELSE NULL END) AS _xsold_p2,
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 3 THEN order_id ELSE NULL END) AS _xsold_p3,
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 4 THEN order_id ELSE NULL END) AS _xsold_p4,
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 1 THEN order_id ELSE NULL END)/COUNT(DISTINCT order_id) AS p1_xsell_rt,
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 2 THEN order_id ELSE NULL END)/COUNT(DISTINCT order_id) AS p2_xsell_rt,
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 3 THEN order_id ELSE NULL END)/COUNT(DISTINCT order_id) AS p3_xsell_rt,
    COUNT(DISTINCT CASE WHEN cross_sell_product_id = 4 THEN order_id ELSE NULL END)/COUNT(DISTINCT order_id) AS p4_xsell_rt
FROM
(
SELECT
	primary_products.*, 
    order_items.product_id AS cross_sell_product_id
FROM primary_products
	LEFT JOIN order_items 
		ON order_items.order_id = primary_products.order_id
        AND order_items.is_primary_item = 0 -- only bringing in cross-sells
) AS primary_w_cross_sell
GROUP BY 1;


/*
8. In addition to telling investors about what we’ve already achieved, let’s show them that we still have plenty 
of gas in the tank. Based on all the analysis you’ve done, could you share some recommendations and 
opportunities for us going forward? No right or wrong answer here – I’d just like to hear your perspective!
*/

/* 
Recommendations and Opportunities
Enhance Marketing Strategies:

Focus on High-Performing Channels: Given the strong performance of Gsearch nonbrand and brand campaigns, consider increasing investment in these channels. Additionally, explore opportunities to optimize Bsearch nonbrand campaigns to boost their performance.
Leverage Organic Search: Organic search has shown consistent performance. Invest in SEO strategies to improve organic visibility and drive more traffic without additional ad spend.
Improve Conversion Rates:

Optimize Landing Pages: The Gsearch lander test showed a significant increase in conversion rates. Apply similar optimization techniques to other landing pages to enhance user experience and drive higher conversions.
A/B Testing: Continuously run A/B tests on different elements of the website, such as call-to-action buttons, product descriptions, and checkout processes, to identify and implement the most effective changes.
Expand Product Line:

Introduce New Products: The introduction of new products has positively impacted revenue and margin. Continue to innovate and expand the product line to cater to diverse customer preferences and increase cross-sell opportunities.
Seasonal and Limited Edition Products: Launch seasonal or limited edition products to create a sense of urgency and attract repeat customers.
Enhance Customer Engagement:

Personalized Marketing: Utilize customer data to create personalized marketing campaigns. Tailor product recommendations, email marketing, and promotions based on customer behavior and preferences.
Loyalty Programs: Implement a loyalty program to reward repeat customers and encourage long-term engagement. Offer exclusive discounts, early access to new products, and special promotions to loyal customers.
Optimize Operational Efficiency:

Inventory Management: Improve inventory management practices to ensure optimal stock levels and reduce carrying costs. Implement data-driven forecasting to anticipate demand and avoid stockouts or overstock situations.
Cost Reduction: Identify areas where operational costs can be reduced without compromising quality. Streamline processes and negotiate better terms with suppliers to improve margins.
Expand Market Reach:

International Expansion: Explore opportunities to expand into new geographic markets. Conduct market research to identify regions with high demand for your products and develop strategies to enter those markets effectively.
Partnerships and Collaborations: Form strategic partnerships with other brands or influencers to increase brand visibility and reach new customer segments.
Customer Feedback and Improvement:

Collect and Analyze Feedback: Regularly collect customer feedback through surveys, reviews, and social media. Use this feedback to identify areas for improvement and make data-driven decisions to enhance the customer experience.
Continuous Improvement: Foster a culture of continuous improvement within the organization. Encourage employees to share ideas and suggestions for enhancing products, services, and processes.
By implementing these recommendations, we can continue to drive growth, improve customer satisfaction, and maintain a competitive edge in the market.
*/ 
