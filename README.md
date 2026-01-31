#  **Modern Data Warehouse & Analytics End-to-End Project**  

👋 Hello, Data World! 
- My name is **Steven Omonaa Dokubo** ! 😁
- A CompTia Certified Data Analyst.

Welcome to this **Modern Data Warehouse & Analytics End-to-End Project** project using **PostgreSQL**! 

---
## 📖 Project Overview

This project involves:

1. **Data Architecture**: Designing a Modern Data Warehouse Using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
2. **ETL Pipelines**: Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting**: Creating SQL-based reports and dashboards for actionable insights.


## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
|   ├── data_integeration.drawio        # Draw.io file for the data integration diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md          # Consistent naming guidelines for tables, columns, and files
│   
├── reports/
|   ├── 1_gold_layer_datasets/          # Datasets used for reporting and analysis.
│   ├── eda/                            # Exploratory Data Analysis (EDA) scripts.
│   ├── advanced_eda/                   # Advanced EDA scripts and analyses.
│   ├── 12_report_customers.sql         # SQL script for the customer report.
│   └── 13_report_products.sql          # SQL script for the product report.

├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── gold/                           # Scripts for creating analytical models
│   ├── silver/                         # Scripts for cleaning and transforming data
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├──                                                   
└── LICENCE                             # License information for the repository
```

## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers:
![Data Architecture](docs/data_architecture.drawio.png)

1. **Bronze Layer**: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

## Data integration 
To understand the data integration between the different tables and see the relationship bettween them, the following integration architecture shows that:

![data integration](docs/data_integration.drawio.png)

## Data modeling 

After creating the bronze layer which hosts the raw data and then the silver layer in which we did data transformation, in the gold layer the data is modelled according to the star schema having a fact table and dimensions.

The data model is like the following: 

![data model](docs/data_model.drawio.png)

 The data flow is explained in the following graph: 

![data flow](docs/data_flow.drawmio.png)

## 📢 **Connect & Collaborate!**  

💡 **Want to contribute?** Fork this repo and submit a **pull request**!  
📩 **Got questions?** Open an **issue** or reach out to me!  

📧 Email me at: [stevenomonaa@gmail.com)  

## 📌 **Follow me on:**  
[![LinkedIn](www.linkedin.com/in/steven-dokubo-405351357)
[![X](https://x.com/stevenomonaa)
