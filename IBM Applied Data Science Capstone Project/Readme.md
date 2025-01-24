
# 🚀 SpaceX Data Science Capstone Project  

**Author:** Md Al Hasan  
**Duration:** 2020 - 2021  
**Certification:** [IBM Data Science](https://coursera.org/verify/professional-cert/Z3MWAD4BYE8Y)  

This project focuses on analyzing SpaceX Falcon 9 rocket launches to determine factors that influence the success of the first-stage booster landings. Using a combination of data analysis, interactive visualizations, and machine learning, the project answers key business and technical questions related to cost-efficient commercial space travel.

---

## 📄 Project Overview  

SpaceX revolutionized commercial space travel by significantly reducing the cost of rocket launches, thanks to reusable first-stage boosters. This project analyzes publicly available data to predict the success of these booster landings and identifies the critical factors affecting their success rates.  

### Key Objectives:  
- Understand how variables like payload mass, launch site, number of flights, and orbits affect landing success.  
- Explore trends in landing success rates over the years.  
- Identify the best machine learning model for binary classification to predict landing success.  

---

## 🛠️ Methodology  

The project follows a structured data science workflow:  

1. **Data Collection**  
   - SpaceX REST API  
   - Web Scraping from SpaceX Wikipedia page  

2. **Data Wrangling**  
   - Cleaning and preparing data for analysis  
   - Encoding categorical variables for machine learning  

3. **Exploratory Data Analysis (EDA)**  
   - Visualizing trends and relationships using Python and SQL  
   - Insights into success rates by launch sites, orbits, payload mass, and years  

4. **Interactive Visual Analytics**  
   - **Folium**: Built an interactive map for launch site locations and outcomes  
   - **Plotly Dash**: Developed dashboards for dynamic data exploration  

5. **Machine Learning**  
   - Models used: Logistic Regression, Support Vector Machines (SVM), Decision Tree, K-Nearest Neighbors (KNN)  
   - Best model: **Decision Tree** (highest accuracy and F1 score)  

---

## 📊 Key Results  

### 🔍 Exploratory Data Analysis  
- **Success Trends**: Success rates increased significantly over the years, with KSC LC-39A being the most successful launch site.  
- **Payload Mass vs Success**: Launches with payloads between 2000-5500 kg had the highest success rates.  
- **Orbit Insights**: Orbits like ES-L1, GEO, and SSO achieved 100% success rates, while SO had a 0% success rate.  

### 🗺️ Interactive Visualizations  
- **Launch Sites**: Most sites are near the equator and coasts, minimizing risks from failed launches.  
- **Success Distribution**: Launch site KSC LC-39A had the highest success rates for both payload mass and total launches.  

### 🤖 Predictive Analysis  
- **Best Model**: Decision Tree Model  
- **Accuracy**: The Decision Tree outperformed other models in predicting landing success, achieving the highest overall accuracy.  

---

## 📁 Project Structure  

| File/Notebook                                | Description                                                                                     |  
|----------------------------------------------|-------------------------------------------------------------------------------------------------|  
| [1. Data Collection with REST API.ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/1.%20Data%20Collection%20with%20REST%20API.ipynb)  | Data collection using SpaceX REST API and conversion to structured format.                     |  
| [2. Data Collection with Web Scraping.ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/2.%20Data%20Collection%20with%20Web%20Scraping.ipynb)  | Web scraping SpaceX data from Wikipedia.                                                      |  
| [3. Data Wrangling (EDA).ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/3.%20Data%20Wrangling%20(EDA).ipynb)  | Cleaning and preprocessing data for analysis.                                                 |  
| [4. EDA with Data Visualization.ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/4.%20EDA%20with%20Data%20Visualization.ipynb)  | Visualizing trends and patterns in the dataset.                                               |  
| [5. EDA with SQL.ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/5.%20EDA%20with%20SQL.ipynb)  | Performing SQL queries for deeper insights.                                                   |  
| [6. Interactive Visualization Analytics and Dashboards.ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/6.%20Interactive%20Visualization%20Analytics%20and%20Dashboards.ipynb)  | Interactive maps with Folium and dashboards with Plotly Dash.                                 |  
| [7. Space_X_Dash_App.py](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/7.%20Space_X_Dash_App.py)  | Python script for the interactive SpaceX dashboard.                                           |  
| [8. Machine Learning Prediction.ipynb](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/8.%20Machine%20Learning%20Prediction.ipynb)  | Machine learning models for landing success prediction.                                       |  
| [IBM Data Science Capstone Project Presentation.pdf](https://github.com/mdalhasanbappy/Portfolios/blob/main/IBM%20Applied%20Data%20Science%20Capstone%20Project/IBM%20Data%20Science%20Capstone%20Project%20Presentation.pdf)  | Final presentation summarizing the project and its findings.                                  |  

---

## 🛠️ Tech Stack  

- **Data Collection**: REST API, Web Scraping (BeautifulSoup)  
- **Data Wrangling & EDA**: Python (Pandas, NumPy), SQL  
- **Visualization**: Matplotlib, Seaborn, Plotly Dash, Folium  
- **Machine Learning**: Scikit-learn  
- **Deployment**: Plotly Dash  

---

## 🌟 Highlights  

- Built an end-to-end data science pipeline integrating API, web scraping, EDA, interactive visualizations, and machine learning.  
- Developed actionable insights and tools for space launch analysis, with a focus on cost efficiency and success prediction.  
- Gained hands-on experience with REST APIs, SQL queries, and advanced visualization libraries.  

---

## 📞 Contact  

For collaboration or queries, feel free to reach out:  
- **GitHub**: [mdalhasanbappy](https://github.com/mdalhasanbappy)  
- **LinkedIn**: [Md Al Hasan](https://www.linkedin.com/in/mdalhasanbappy/)  

---

This capstone project exemplifies my skills in data science and demonstrates my ability to tackle real-world problems with data-driven solutions.  

---
