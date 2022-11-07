# Read Me

### Housing Market Analysis

The data was taken from the redfin database which you can find [here](#https://www.redfin.com/news/data-center/) or by copy and pasting the following:

> https://www.redfin.com/news/data-center/


<br>

The overall goal of this project was to perform a thorough exploration of the data, followed by a few attempts at building forecasting models to predict future sale prices. Future possible additions to the project include: linear regression, KNN, etc.

<br>

The contents of this project are as follows:
- ***Jupyter***: this folder contains any notebooks (and python files, etc) that are relevant to this project.
    - **Getting Started**: Simply tests the connection to the mysql database.
    - **ETL/EDA**: Contains three notebooks and one python file, one notebook for ETL, two notebooks for EDA, and a python file containing some of the useful functions used within the notebooks. We handle three tables from the Redfin housing data: *National* level, *State* level, and *County* level. Due to their significant size and missing data, we perform modeling on only one of these data sets, for now.
    - **Modeling and Forecasting**: So far, this folder contains a python file with relevant functions and a notebook for forecasting modeling. In the future, the python file will be useful for linear regression or other correlation analysis. 
- ***MySQL_***: This folder contains the sql files needed to generate the initial database and run basic queries and the raw Redfin housing market data.
    - **sql files**: there are three sql files; one for generating tables, one for inserting data, and one for general queries. The general queries are stored in a new table within the database.
    - **Raw Redfin data**: You can find the data via the dropbox link.

<br>

If you wish to regenerate the database and run each notebook, you can first run generate_tables.sql, followed by Data_insert.sql, as long as the raw data is in the same directory. If you wish to generate the queries database, you can run Queries.sql, as well. The EDA notebook contains some database manipulation which will be reflected in the same  MySQL database. You may need to modify the connection within the notebooks based on where you are hosting the database. Keep in mind that some of the notebooks are very memory intensive; the project was completed within a docker container with 16 GB of RAM and 8 cores allocated to the container.

