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


INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES("Toy Solar Car", "Toys & Games" 2.71, 1000), ("Pill Box AM/PM", "Health & Personal Car", 7.99, 12560), ("USA Strong Nylon Cable Ties 100 Pack", "Tools & Home Improvement", 14.97, 7439), ("Ice Age: Collision Course", "Movies" 14.99, 20394), ();


USE top_songsdb;
ALTER TABLE top5000 ADD INDEX songName (songName);
SELECT FROM * top5000;