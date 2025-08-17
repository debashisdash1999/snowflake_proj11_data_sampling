--  TASK 1: Random Sampling of Data
-- Use the demo warehouse
USE WAREHOUSE demo;

-- Create a database for random sampling data
CREATE OR REPLACE DATABASE sales_db_random_sampling;

-- Create a table for sales data
CREATE OR REPLACE TABLE sales_data (
    order_id INTEGER,
    customer_id INTEGER,
    customer_name STRING,
    order_date DATE,
    product STRING,
    quantity INTEGER,
    price FLOAT,
    complete_address STRING
);

-- Create a named stage pointing to the S3 bucket
CREATE OR REPLACE STAGE s3_stage
URL='s3://snowflake-hands-on-data/sample_data_heavy_files/'
CREDENTIALS = (AWS_KEY_ID=88888888888 
               AWS_SECRET_KEY=888888888888
              );

-- Load data from the stage into the sales_data table
COPY INTO sales_data
FROM @s3_stage/sales_data_sample_large.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

-- Perform random sampling of 5% from the sales_data table
SELECT * FROM sales_data SAMPLE (5);

-- Drop the created stage, table, and database
DROP TABLE IF EXISTS sales_data;
DROP STAGE IF EXISTS s3_stage;
DROP DATABASE IF EXISTS sales_db_random_sampling;



--  TASK 2: SYSTEM Sampling Method
-- Set the demo warehouse for execution
USE WAREHOUSE demo;  

-- Create a new database for this assignment
CREATE OR REPLACE DATABASE sales_db_system_sampling;  

-- Create a stage to access external S3 data
CREATE OR REPLACE STAGE s3_stage  
URL='s3://snowflake-hands-on-data/sample_data_heavy_files/'
CREDENTIALS = (AWS_KEY_ID=88888888888888 
               AWS_SECRET_KEY=8888888888888888
              );  

-- Define a table structure for storing sales data
CREATE OR REPLACE TABLE sales_data (  
    order_id INTEGER,
    customer_id INTEGER,
    customer_name STRING,
    order_date DATE,
    product STRING,
    quantity INTEGER,
    price FLOAT,
    complete_address STRING
);

-- Load data from the specified S3 stage into the table
COPY INTO sales_data  
FROM @s3_stage/sales_data_sample_large.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');  

-- Retrieve a random sample of 5% of the data using SYSTEM sampling method
SELECT * FROM sales_data SAMPLE SYSTEM (5);  

-- Drop the sales_data table to clean up
DROP TABLE IF EXISTS sales_data;  

-- Drop the S3 stage to remove access configuration
DROP STAGE IF EXISTS s3_stage;  

-- Drop the database created for this assignment
DROP DATABASE IF EXISTS sales_db_system_sampling;

