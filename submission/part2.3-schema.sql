/*

pgAdmin4 Steps
- Create the database: MSUDA-project-ETL-crowdfunding
- Create the tables: Open and run part2.3-schema.sql (this file)
- Import the data: Right click each table, in the order of creation, and import from resources/output (make sure Header is selected in Options)

ERROR IMPORTING THE DATA?
Check which table is empty, you need to fill that one first

*/

DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS contacts;

CREATE TABLE IF NOT EXISTS category (
    category_id TEXT PRIMARY KEY NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS subcategory (
    subcategory_id TEXT PRIMARY KEY NOT NULL,
    subcategory TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS contacts (
    contact_id INT PRIMARY KEY NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS campaign (
    cf_id INT PRIMARY KEY NOT NULL,
    contact_id INT NOT NULL,
    company_name TEXT NOT NULL,
    description TEXT NOT NULL,
    goal DOUBLE PRECISION NOT NULL,
    pledged DOUBLE PRECISION NOT NULL,
    outcome TEXT NOT NULL,
    backers_count INT NOT NULL,
    country TEXT NOT NULL,
    currency TEXT NOT NULL,
    launch_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    category_id TEXT NOT NULL,
    subcategory_id TEXT NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);