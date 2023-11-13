CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  full_name VARCHAR(50),
  phone VARCHAR(30),
  address VARCHAR(100),
  email VARCHAR(50)
 );


CREATE TABLE parts (
  parts_id SERIAL PRIMARY KEY ,
  invoice_id VARCHAR(50)
  
);

CREATE TABLE Service (
  service_id SERIAL PRIMARY KEY,
  order_date DATE,
  service_date DATE,
  next_service DATE,
  service_invoice VARCHAR(50),
  service_invoice_id INTEGER,
  parts_id INTEGER,
  
  FOREIGN KEY (service_invoice_id) REFERENCES service_invoice(service_invoice_id),
  FOREIGN KEY (parts_id) REFERENCES parts(parts_id)
);

CREATE TABLE Invoice (
  invoice_id SERIAL PRIMARY KEY,
  full_name VARCHAR(100),
  billing_address VARCHAR(100),
  payment_medhod VARCHAR(50),
  card_number VARCHAR(50),
  service_invoice VARCHAR(50),
  salesperson_id INTEGER,
  customer_id INTEGER,
  service_id INTEGER,
  
  FOREIGN KEY (salesperson_id)  REFERENCES Salesperson(salesperson_id),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE TABLE cars (
  car_id SERIAL PRIMARY KEY ,
  price NUMERIC(6,2),
  description_serial_number VARCHAR(200),
  model VARCHAR(50),
  make VARCHAR(100),
  invoice_id INTEGER,
  FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id)
);

CREATE TABLE Salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  full_name  VARCHAR(50),
  user_name  VARCHAR(50)
  

);

CREATE TABLE mechanics  (
  mechanic_id SERIAL PRIMARY KEY,
  full_name VARCHAR(50),
  user_name VARCHAR(50),
  service_date VARCHAR(50),
  service_id INTEGER
 
);

CREATE TABLE service_invoice (
  service_invoice_id SERIAL PRIMARY KEY,
  service_type VARCHAR(50),
  service_date DATE,
  basic_service VARCHAR(50),
  mechanic_id VARCHAR(50),
  premium_service VARCHAR(50)
  
);


SELECT *
FROM customer;

SELECT *
FROM cars;

SELECT * 
FROM invoice;

SELECT *
FROM mechaniccs;

SELECT * 
FROM parts;

SELECT *
FROM salesperson

SELECT * 
FROM service;

SELECT *
FROM service_invoice;

INSERT INTO customer 
VALUES ('1', 'White Clover', '123-456-7890', '305-14th ave', 'white.clover@gmail.com');
		
INSERT INTO customer 
VALUES ('2', 'Blue Clover', '123-456-7891', '305-15th ave', 'blue.clover@gmail.com');
INSERT INTO customer 
VALUES ('3', 'Pink Clover', '123-456-7892', '305-16th ave', 'pink.clover@gmail.com');
INSERT INTO customer 
VALUES ('4', 'Green Clover', '123-456-7893', '305-17th ave', 'green.clover@gmail.com');

INSERT INTO cars 
VALUES ('101', '1000.00', 'hybrid 1234', 'RX 300', 'Lexus','1');
		
INSERT INTO invoice
VAlUES ('1', 'White Clover', '305-14th ave', 'card', '4400-4400-5500-6600', '001', '1','1')

INSERT INTO salesperson
VAlUES ('1', 'Kymbat Baibaturova', 'kymbbt');

CREATE OR REPLACE PROCEDURE salesperson1
		salesperson VARCHAR(50), 
		full_name VARCHAR(50), 
		user_name VARCHAR(50),
	    invoice_id VARCHAR(50)

LANGUAGE plpgsql 
AS $$
BEGIN
		
		UPDATE salesperson
		SET invoice_id = invoice.invoice_id 
		WHERE invoice_id = invoice AND invoice_id = salesperson.invoice_id;
		
		
		COMMIT;
END;
$$;

CALL salesperson1();


ALTER TABLE cars
ADD is_serviced VARCHAR(20);