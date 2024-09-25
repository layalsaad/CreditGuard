<img src="./readme/title1.svg"/>

<br><br>

<!-- project philosophy -->
<img src="./readme/title2.svg"/>

> A scalable data warehouse built with efficient ETL process to ensure data integrity and accuracy for fraud detection, along with an ML model and some analytical insights.
>
> CreditGuard aims to prepare well structured data in a data warehouse for analysis, and to prepare an ethical ML model for fraud prediction to proactively manage risks while using a dashboard to visualize insights and support informed decision-making.

### User Stories
- As a data engineer, I want a scalable data warehouse, so I can manage large volumes of transaction data accurately.
- As a data scientist, I want an explainable and clean fraud detection model, so I can predict fraudulent transactions with high accuracy and fairness.
- As a business analyst, I want an iteractive dashboard, so I can visualize fraud trends and risk factors.

<br><br>
<!-- Tech stack -->
<img src="./readme/title3.svg"/>

###  CreditGuard is built using the following technologies:

- This project uses the [Pandas](https://pandas.pydata.org/docs/). Pandas is an open source library providing high-performance, easy-to-use data structures and data analysis tools for the Python programming language.
- For the ML model, the project uses the [Scikit-learn](https://scikit-learn.org/stable/) that is a simple and efficient tool for predictive data analysis.
- To store the data warehouse, the project uses the [MySQL Workbench](https://dev.mysql.com/doc/workbench/en/) for data warehouse storage, development, and administration.

<br><br>
<!-- Data Warehouse Design -->
<img src="./readme/title5.svg"/>

###  Architecting Data Excellence: Innovative Database Design Strategies:

<img src="./readme/screens/Fraudulent activities.png">


<br><br>


<!-- Implementation -->
<img src="./readme/title6.svg"/>


### Dashboard Screens 
| Credit card fraud analysis | Bank fraud analysis |
| ---| ---|
| ![Credit card](./readme/screens/credit_card.png) | ![Bank](./readme/screens/bank.png) |
|  Fraud analysis | Non fraud analysis  |
| ---| ---|
| ![Fraud](./readme/screens/fraud.png) | ![Non fraud](./readme/screens/non_fraud.png) |
| Credit card drill | Bank drill |
| ---| ---|
| ![cc_drill](./readme/screens/cc_drill.png) | ![b_drill](./readme/screens/b_drill.png) |
<br><br>


<!-- Prompt Engineering -->
<img src="./readme/title7.svg"/>

###  Fraud Prediction Model

 - Objective: This model aims to predict every record that corresponds to a transaction if it is considered as fraud or not based on the data it has been trained on, and helps in detecting potential fraud in real-time, supporting proactive risk management.

 - Algorithm: Random Forest Classifier, tested to have the best performance out of Decision Tree, Logistic Regression, Support Vector Machine, K-nearesn Neighbors, and Gradient Boost Classifier.

 - Evaluation: This algorithm was accurate by 75%, with a high precision of 80%, a good recall or 46%, an F1 score of 58% balancing the precision and recall values, and a ROC AUC of 70%.

 - Features: the most important features that affect our model prediction are the type of transaction whether bank or credit card, the category, customer job, and the merchant.

 - Data processing: the data was already cleaned and transformed in the ETL process, in addition to that the age and the amount were subjected to binning according the the values.

 - Results: the model has reached an accuracy of 75% that can be enhanced more by adding more records and more trainings, but for for now this model gives accepted results.

<br><br>

<!-- Validation -->
<img src="./readme/title9.svg"/>

###  Precision in Development: Harnessing the Power of Validation:

- This project employs rigorous validation checks in SQL to ensure data consistency between the staging area and the data warehouse. This process verifies that the data loaded into the warehouse matches the source data, ensuring accuracy and integrity throughout the ETL pipeline.

<br><br>


<!-- How to run -->
<img src="./readme/title10.svg"/>

> To set up CreditGuard, follow these steps:

### Prerequisites

Basic knowledge in python and rubbing sql queries in MySQL Workbench would be a good start, in addition to some knowledge in Power BI navigation and visuals. 

### Installation


1. Clone the repo
   git clone [github](https://github.com/layalsaad/CreditGuard.git)
2. Install the required packages
   ```sh
   pip install -r requirements.txt
   ```
3. Open the sql scripts raw_staging_schema.sql, transformed_staging_schema.sql, and     data_warehouse_schema.sql in MySQL Workbench to create the staging area and data warehouse schemas
4. Open extract_transform.ipynb in any code editor and run all cells.
5. Run loaded_once.sql, monthly_load.sql, weekly_load.sql, and daily_load.sql in MySQL Workbench to load the data into the data warehouse. And noow u have the data warehouse ready for any analysis u would like to do.
6. Running the time_series_analysis.ipynb and the network_analysis.ipynb would perform some time series and network analysis on the data to get into more deep and detailed inights.
7. Run all cells of model_functions.ipynb in the code editor, then model_analysis.ipynb and check out the analysis and insights. This model can be used to predict any transaction if fraud or not given the required information.
8. Install Power BI desktop (https://www.microsoft.com/en-us/download) and open CreditGuard.pbix for some data analytics.



Now, you should be able to run CreditGuard locally and explore its features.