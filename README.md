# Snowflake Project 11: Data Sampling

## Overview
This project focuses on **data sampling in Snowflake**, demonstrating two methods:
1. Random Sampling
2. System Sampling  

The project shows how to create databases, tables, stages, load data from S3, perform sampling, and clean up resources.

---

## Tasks

### TASK 1: Random Sampling of Data
- Create database: `sales_db_random_sampling`
- Create table: `sales_data`
- Load data from S3 stage
- Sample 5% of the data randomly
- Query results to verify sampling
- Cleanup resources

### TASK 2: SYSTEM Sampling Method
- Create database: `sales_db_system_sampling`
- Create table: `sales_data`
- Load data from S3 stage
- Perform SYSTEM sampling (~5% of data)
- Query results to verify sampling
- Cleanup resources

---

## Real-World Relevance
- Random sampling helps in **analyzing large datasets efficiently** without loading the full dataset.  
- SYSTEM sampling is useful for **approximate query results** with minimal performance overhead.  
- Both methods are critical for **data exploration, testing, and building sample datasets** for analytics pipelines.  

---

## Tools & Features Covered
- Snowflake Databases and Tables
- External Stages pointing to S3
- COPY command for data loading
- RANDOM and SYSTEM sampling in Snowflake
- Data cleanup best practices
