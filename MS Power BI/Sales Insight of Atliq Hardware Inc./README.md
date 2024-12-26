# Sales Insights Dashboard

![Sales Insights](./Sales%20Insights%20-%20Data%20Analysis%20Project%20Code%20Basics.jpg)

This project showcases a **Sales Insights Dashboard** created using Power BI. It provides actionable insights into the sales performance of Atliq Hardware Inc., a computer hardware business, helping the company navigate challenges in a dynamic market. 

This project is an excellent demonstration of end-to-end data analysis using SQL and Power BI, aimed at delivering impactful dashboards that can drive business decisions.

---

## 🚀 Key Features
- **Dynamic Revenue Tracking**: 
  - Total revenue: ₹984.81M
  - Total sales quantity: 2M units
- **Market Insights**: 
  - Revenue and sales quantity by market (e.g., Delhi NCR, Mumbai).
- **Customer Analysis**: 
  - Top 5 customers, with Electricalsara Stores generating the highest revenue.
- **Product Insights**: 
  - Top-performing products and their contribution to total revenue.
- **Trend Analysis**: 
  - Monthly revenue trends from 2017 to 2020.

---

## 📂 Project Deliverables
- **Dashboard File**: [Sales Insights - Data Analysis Project Code Basics.pbix](https://github.com/mdalhasanbappy/Portfolios/blob/main/MS%20Power%20BI/Sales%20Insight%20of%20Atliq%20Hardware%20Inc./Sales%20Insights%20-%20Data%20Analysis%20Project%20Code%20Basics.pbix)
- **SQL Database Dump**: [db_dump.sql](https://github.com/mdalhasanbappy/Portfolios/blob/main/MS%20Power%20BI/Sales%20Insight%20of%20Atliq%20Hardware%20Inc./db_dump.sql)
- **Project Report**: [Sales Insights - Data Analysis Project Code Basics.pdf](https://github.com/mdalhasanbappy/Portfolios/blob/main/MS%20Power%20BI/Sales%20Insight%20of%20Atliq%20Hardware%20Inc./Sales%20Insights%20-%20Data%20Analysis%20Project%20Code%20Basics.pdf)

---

## 🛠️ Tools and Technologies
1. **Power BI**: 
   - Interactive dashboard creation.
   - Data cleaning, transformation, and visualization.
2. **MySQL**: 
   - Raw data storage and querying.
   - ETL operations to extract, transform, and load data into Power BI.
3. **SQL Queries**: 
   - Data exploration and transformation (e.g., filtering, aggregation, and joins).

---

## 📊 Insights and Use Cases
- **Strategic Decision-Making**:
  - Identify top-performing markets, customers, and products.
  - Track revenue trends to predict future sales performance.
- **Operational Efficiency**:
  - Pinpoint underperforming regions and improve market focus.
  - Highlight product demand patterns to optimize inventory.

---

## 📝 Project Workflow
1. **Data Extraction**:
   - Data pulled directly from MySQL database containing sales transactions, customer details, and product information.
   - [MySQL Installation Guide](https://www.youtube.com/watch?v=WuBcTJnIuzo).

2. **Data Analysis Using SQL**:
   - Sample Queries:
     - Show all customer records: `SELECT * FROM customers;`
     - Revenue by year and market: `SELECT SUM(sales_amount) FROM transactions WHERE market_code='Mark001';`
   - A full list of SQL queries used can be found in the project documentation.

3. **Data Cleaning & Transformation**:
   - Conducted in Power BI.
   - Currency normalization: Sales values in USD converted to INR.

4. **Dashboard Development**:
   - Built an interactive dashboard in Power BI to visualize sales insights.

---

## 📥 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/mdalhasanbappy/Portfolios.git
