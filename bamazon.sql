DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products (
	item_id INT NOT NULL AUTO_INCREMENT,
	product_name VARCHAR(50) NULL,
	department_name VARCHAR(50) NULL,
	price DECIMAL(10,2) NULL,
	stock_quantity INT NULL,
	PRIMARY KEY (item_id)
);


-- INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Toy Solar Car", "Toys & Games" 2.71, 1000), ("Pill Box AM/PM", "Health & Personal Car", 7.99, 12560), ("USA Strong Nylon Cable Ties 100 Pack", "Tools & Home Improvement", 14.97, 7439), ("Ice Age: Collision Course", "Movies" 14.99, 20394), ();

INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Toy Solar Car", "Toys & Games", 2.71, 1000);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Pill Box AM/PM", "Health & Personal Car", 7.99, 12560);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("USA Strong Nylon Cable Ties 100 Pack", "Tools & Home Improvement", 14.97, 7439);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Ice Age: Collision Course", "Movies", 14.99, 20394);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Beatles Glass Locket Round Pendant", "Jewelery", 21.95, 735);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("#Sparky Coffee Mug", "Drinkware", 13.50, 75);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Blue Q Lunch Handy Tote", "Clothing", 11.85, 48);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("AstroAI Digital Multimeter", "Electrical", 13.99, 894);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Formula Whitney Mint Bed-in-a-Bag Bedding Set, Twin XL", "Bedding", 75.69, 244);
INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ("Nylon Portable Hammock", "Camping & Hiking", 52.84, 182);
