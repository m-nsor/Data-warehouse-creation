# Data-warehouse-creation
Designing and implementing an operational database and a data warehouse for a fictional spy organization on Oracle

# Spirogyra Spy Network 

Account for operational database implementation:  (ORA_mn133).
Account for data warehouse implementation: (ORA_cvc104).
![image](https://github.com/m-nsor/Data-warehouse-creation/assets/86014570/9eb7a79d-dbd5-4491-9b91-b077711974aa)


#Project Overview 

The Spirogyra network, a spy network, is an intelligent private security organization that undertakes operations in different countries for the interest of the organization. The spy network has spies and informants who are invisible, with different tasks assigned to them in various countries. The database for this spy network will keep records of all spies and the task assigned to them. It will safeguard the information of the base, spies, country, network, city, etc. about this organization as well as help coordinate the activities of this organization.

#Database creation
The entity-relationships diagram for the database is er_diagram.png and the schema is schema.png
The database is created using the create_table.sql and populated with project_data.sql
The database is tested with working_queries.sql

#Table Population

The fake data for the tables were obtained from mockaroo, a popular site used to generate fake data. To use mockaroo, you need to create a free account and sign in. For the first dataset, input the field names and types. The format must be CSV. Generate the dataset instead of downloading it. The dataset will be saved for reference and download. In generating a new dataset that has foreign key which is in the previous dataset, input the field name with the foreign key and in the TYPE, search for the dataset column. This will give the option to select the previous dataset and the name of the attribute which is a foreign key in the new dataset being generated. Then you must manually check the data for mistakes, for instance, the primary key and foreign key attributes cannot have null entries, but it is common to have null entries for primary key and foreign key on mockaroo. Also, check that the foreign key entries are consistent with the parent keys.

#Introduction to the Data Warehouse

The subject of the data warehouse is the Spirogyra Network’s will be its espionage operations. The data warehouse will store organization-related information, including the base, spies, informants, countries, networks, cities, equipment, skills, and assigned duties. The proposed outcome is to have a centralized data repository that can help coordinate the activities and missions of the organization, enhance decision-making, and provide insights into the performance of the organization.
![image](https://github.com/m-nsor/Data-warehouse-creation/assets/86014570/f58e8088-37b9-47fe-9ec5-d631a62aa4cd)


#Schema

As defined above, star schema is a popular design for organizing data in a data warehouse where it consists of a central fact table that is surrounded by one or more dimension tables. The fact table contains the quantitative measures that are being analyzed, while the dimension tables contain the descriptive attributes that provide context for the measures  (Pal, 2023).The fact table typically has a primary key made up of a combination of foreign keys from the dimension tables. Each record in the fact table represents a unique combination of the dimensional attributes and the measures associated with them. Each dimension table typically has a primary key that is referenced in the fact table as a foreign key. The star schema is a simple and intuitive design that makes it easy to query the data warehouse for analytical purposes. It is also highly scalable, as new dimensions or measures can be easily added to the schema without affecting the existing structure. However, it can lead to redundant data storage if the same dimensional attributes are used in multiple fact tables.
There are different types of measures which can be used including additive, semi-additive, and non-additive. Additive refers to a summarization across all dimensions. This means the query will be applicable for all dimensions. Semi-Additive refers to a summarization across the sum of dimensions.
For this project, the fact table in the data warehouse is the spy table, which contains information about the spies' duties, skills, equipment used, city, rank, and language. The spy table will have foreign keys pointing to the country, network, skills, rank, task, equipment, and language dimension tables.
In this data warehouse, there are various measures. The proposed measures are as follows:
●	Find the spies for a particular task
●	Find the spies that use a particular language in a specific city.
●	Time required to complete the tasks
●	 Task completed ratio of all spies.
●	Rate of success in completing tasks
The dimensions of this data warehouse are:
●	Network dimension: stores information about the network, such as the network ID, name, and type.
●	Equipment dimension: stores information about the equipment, such as the equipment ID, the spy ID, the type of equipment, and the status of the equipment.
●	Task dimension: stores information about the task, such as the task ID, the task type,  the difficulty of the task, and the spy ID.
●	Skills dimension: stores information about the network, such as the skill ID and level.
●	Rank dimension: stores information about the network, such as the rank ID, name and star award.
●	Language dimension: stores information about the language, such as the language ID, name, code, and the spy ID.
![image](https://github.com/m-nsor/Data-warehouse-creation/assets/86014570/4c3f613b-f750-4b1e-8d9e-47d97b0d23ad)

#Data Warehouse Implementation

The database is implemented using the create_table.sql


#Load Data to Warehouse Procedure 

The query in load_data.sql loads the data from the transactional database in the oracle account ORA_mn133 to the data warehouse in the oracle account ORA_cvc104. First it removes any data that might be present in the tables and then copies the data from the transactional tables. The load function below is repeatable because it removes any data that is in the tables before a load is performed. By removing previous data, it ensures that the data is not duplicated. Additionally, we can alter our function to check if the record exists already and if it does we either update or ignore the record.
![image](https://github.com/m-nsor/Data-warehouse-creation/assets/86014570/7132ddc3-cfde-4895-b3f1-65972e7dd67b)




