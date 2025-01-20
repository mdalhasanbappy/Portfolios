# German Retail Sales Trend Analysis  

This project aims to analyze and visualize retail sales trends in Germany using a combination of Python, Power BI, and machine learning techniques. The dataset spans decades of retail industry data, offering insights into sales performance, growth trends, and sector-specific patterns.  

The project integrates advanced data cleaning, statistical analysis, and interactive visualizations to provide a holistic view of the German retail industry while showcasing the power of open data and data-driven decision-making.  

---

## Table of Contents  

1. [Project Overview](#project-overview)  
2. [Dataset Description](#dataset-description)  
3. [Google Colab Workflow](#google-colab-workflow)  
4. [Power BI Dashboard](#power-bi-dashboard)  
5. [Machine Learning Progress](#machine-learning-progress)  
6. [Files in this Repository](#files-in-this-repository)  
7. [Important Links](#important-links)  
8. [Author and Contact Information](#author-and-contact-information)  

---

## Project Overview  

This project involves:  
- **Data Cleaning and Preprocessing**: Cleaning and transforming raw data for analysis.  
- **Data Analysis and Visualization**: Leveraging Power BI for interactive dashboards and visual insights.  
- **Statistical Analysis**: Testing hypotheses to uncover patterns in retail sales data.  
- **Machine Learning**: Applying time series forecasting and predictive modeling (in progress).  

The results provide a detailed look into sector growth trends, year-over-year comparisons, and future sales predictions, making it relevant for business strategy and policy-making.  

---

## Dataset Description  

The primary dataset is sourced from **govdata.de** and contains comprehensive data on retail industries in Germany.  

- **Original File**: [45212-0003_00.csv](https://www.govdata.de/suche/daten/sozialkaufhauser-und-umsonstladen)  
- **Cleaned File**: [Retail_Sales_Data_De_En.xlsx](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/Retail_Sales_Data_De_En.xlsx)  

### Dataset Features  
- **Industry Details**: Categorized by WZ08 codes and descriptions (translated into English).  
- **Yearly Sales Data**: Retail sales in constant and current prices, with year-over-year changes.  
- **Period**: Covers several decades of German retail industry data.  

**Terms of Use**: The dataset is used in compliance with licensing terms from [govdata.de](https://govdata.de).  

---

## Google Colab Workflow  

The Google Colab notebook ([View Here](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/German_Retail_Sales_Trend_Analysis.ipynb)) outlines the following steps:  

### 1. Data Cleaning (Google Colab)
The dataset was processed in Google Colab using Python to ensure it is clean and ready for analysis. Below are the key steps performed:

1. **Set Up Google Colab:** Prepare the environment.
2. **Mount Google Drive:** Load and manage project files.
3. **Load the CSV File:** Import the dataset for cleaning.
4. **Replace Special Characters:** Ensure data consistency.
5. **Convert Commas to Dots:** Transform numerical formats and change data types to float.
6. **Industry Description Translation:** Translate industry descriptions into English.
7. **Remove Irrelevant Words:** Simplify translated descriptions.
8. **Fill Empty Cells:** Replace missing values with zeros.
9. **Merge Columns:** Combine relevant fields for analysis.

### 2. Data Transformation Strategy
Key transformations performed on the data:

1. **Moving Averages:** Smooth time series data for trend analysis.
2. **Growth Trends:** Calculate year-over-year changes.
3. **Seasonal Adjustments:** Decompose data into seasonal components.
4. **Clustering:** Categorize sectors for better insight.

### 3. Statistical Analysis
Comprehensive statistical methods applied to identify trends and relationships:

1. **Regression Analysis:** Explore dependencies between variables.
2. **Hypothesis Testing:**
   - ANOVA: Compare retail sectors.
   - Paired T-Test: Compare sales across years.
3. **Correlation Analysis:** Assess relationships between key metrics.
4. **Statistical Visualization:** Use Python libraries for visual insights.

### 4. Predictive Modeling (In Progress)
We are building predictive models to forecast retail sales trends:

1. **Time Series Forecasting:** ARIMA and Prophet models.
2. **Machine Learning:** Models for predicting sales changes are being fine-tuned.

**Note:** Machine learning development is still ongoing, and results will be updated in the future.  

---

## Power BI Dashboard  

The Power BI report ([Download PBIX File](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/German%20Retail%20Industry%20Insights.pbix)) provides a detailed and interactive view of the German retail industry.  

### Features:  
1. **Key Metrics**: Year-over-Year Growth, Total Sales, and Average Sales.  
2. **Sector Breakdown**: Interactive charts for sector-specific analysis.  
3. **Trend Analysis**: Historical trends in sales and growth rates.  
4. **Visualization Techniques**:  
   - Bar charts for sector sales.  
   - Line graphs for growth trends over time.  
   - Interactive gauges and pie charts for summary statistics.  

### Dashboard Preview:  
![Dashboard Screenshot](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/German_Retail_Industry_Insights_page-0001.jpg)  

---

## Machine Learning Progress  

The machine learning component of this project is still under development.  

### Planned Enhancements:  
1. **Model Improvement**: Tuning ARIMA and Prophet models for better forecasting accuracy.  
2. **Feature Engineering**: Adding more meaningful predictors to improve the R-squared value.  
3. **Validation and Testing**: Using cross-validation techniques to ensure model reliability.  

Stay tuned for updates in the notebook!  

---

## Files in this Repository  

1. **Google Colab Notebook**:  
   [German_Retail_Sales_Trend_Analysis.ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/German_Retail_Sales_Trend_Analysis.ipynb)  

2. **Power BI Files**:  
   - [PBIX File](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/German%20Retail%20Industry%20Insights.pbix)  
   - [PDF Report](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/German%20Retail%20Industry%20Insights.pdf)  
   - [Dashboard Image](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/German_Retail_Industry_Insights_page-0001.jpg)  

3. **Cleaned Dataset**:  
   [Retail_Sales_Data_De_En.xlsx](https://github.com/mdalhasanbappy/Portfolios/blob/main/German%20Retail%20Sales%20Analysis/Retail_Sales_Data_De_En.xlsx)  

4. **Raw Dataset**:  
   [45212-0003_00.csv](https://www.govdata.de/suche/daten/sozialkaufhauser-und-umsonstladen)  
 

---

## Author and Contact Information  

Md Al Hasan is a data analyst skilled in Python programming, data visualization, and predictive modeling. He specializes in leveraging open data for actionable insights.  

- **GitHub**: [mdalhasanbappy](https://github.com/mdalhasanbappy)  
- **LinkedIn**: [Md Al Hasan](https://www.linkedin.com/in/mdalhasanbappy/)  
- **Email**: [mdalhasanbappy@gmail.com](mailto:mdalhasanbappy@gmail.com)  

Feel free to connect for collaboration or professional opportunities.  
