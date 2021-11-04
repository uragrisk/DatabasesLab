CREATE DATABASE IF NOT EXISTS hryshkin;
USE hryshkin;

DROP TABLE IF EXISTS package;
DROP TABLE IF EXISTS delivery_adress;
DROP TABLE IF EXISTS recipient;
DROP TABLE IF EXISTS sender;
DROP TABLE IF EXISTS parcel_machine;
DROP TABLE IF EXISTS post_office;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS region;








CREATE TABLE region (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
 PRIMARY KEY (id)
) ENGINE = InnoDB;

CREATE TABLE city (
name VARCHAR(50) NOT NULL,
region_id INT NOT NULL,
PRIMARY KEY (name),
CONSTRAINT fk_city_region
FOREIGN KEY (region_id)
REFERENCES region (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE post_office (
  id INT NOT NULL AUTO_INCREMENT,
  street VARCHAR(45) NOT NULL,
  number INT NOT NULL,
  city_name VARCHAR(50) NOT NULL,
  open_time TIME NOT NULL,
  close_time TIME NOT NULL,
  PRIMARY KEY (id),
  INDEX city_name (city_name ASC),
  CONSTRAINT fk_post_office_city
    FOREIGN KEY (city_name)
    REFERENCES city (name)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE parcel_machine (
  id INT NOT NULL AUTO_INCREMENT,
  street VARCHAR(45) NULL,
  number INT NULL,
  city_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_parcel_machine_city
    FOREIGN KEY (city_name)
    REFERENCES city (name)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE recipient (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NULL,
surname VARCHAR(30) NULL,
phone_number VARCHAR(12) NULL,
pasport_seria VARCHAR(20) NULL,
street VARCHAR(50) NULL,
zip CHAR(5) NULL,
city_name VARCHAR(50) NOT NULL,
PRIMARY KEY (id),
CONSTRAINT fk_recipient_city
FOREIGN KEY (city_name)
REFERENCES city (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE sender (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NULL,
surname VARCHAR(30) NULL,
phone_number VARCHAR(12) NULL,
pasport_seria VARCHAR(20) NULL,
PRIMARY KEY (id))
ENGINE = InnoDB;

CREATE TABLE delivery_adress (
id INT NOT NULL AUTO_INCREMENT,
street VARCHAR(45) NULL,
city_name VARCHAR(50) NOT NULL,
delivery_to_department VARCHAR(45) NULL,
PRIMARY KEY (id),
CONSTRAINT fk_delivery_adress_city
FOREIGN KEY (city_name)
REFERENCES city (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE package(
  id INT NOT NULL AUTO_INCREMENT,
  weigh FLOAT NULL,
  description VARCHAR(50) NULL,
  post_office_id INT NULL,
  recipient_id INT NOT NULL,
  sender_id INT NOT NULL,
  parcel_machine_id INT NULL,
  delivery_adress_id INT NOT NULL,
  PRIMARY KEY (id, recipient_id, sender_id),
  UNIQUE INDEX id_UNIQUE (id ASC),
  CONSTRAINT fk_package_post_office
    FOREIGN KEY (post_office_id)
    REFERENCES post_office (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_package_recipient
    FOREIGN KEY (recipient_id)
    REFERENCES recipient (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_package_sender
    FOREIGN KEY (sender_id)
    REFERENCES sender (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_package_parcel_machine
    FOREIGN KEY (parcel_machine_id)
    REFERENCES parcel_machine (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_package_delivery_adress
    FOREIGN KEY (delivery_adress_id)
    REFERENCES delivery_adress (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO region (name) VALUES 
('Kharkiv'),('Kyiv'),('Lviv'),('Transcarpathian'),('Volyn');

INSERT INTO city (name, region_id) VALUES 
('Kharkiv', 1),('Kyiv', 2),('Lviv', 3),('Mukachevo', 4),('Lutsk', 5);

INSERT INTO post_office(street, number, city_name, open_time, close_time) VALUES 
('Lychakivska 156', 40,'Lviv', '08:30:00', '19:30:00'),
('Khreshchatyk 1' , 1 ,'Kyiv' , '08:00:00','18:00:00'),
('Zelena 68', 56, 'Kharkiv', '09:00:00','19:00:00'),
('Svitla 97', 93, 'Lutsk', '08:00:00','19:00:00'),
('Lvivska 103', 43, 'Mukachevo', '08:00:00','19:00:00');

INSERT INTO parcel_machine(street, number, city_name) VALUES 
('Zelena  568', 1008, 'Kharkiv'),
('Khreshchatyk 123', 123, 'Kyiv'),
('Volya 56', 145, 'Lutsk');

INSERT INTO sender (name, surname, phone_number, pasport_seria) VALUES 
('Yura', 'Hryshkin', '+38099568236', '0012356'),
('Igor', 'Naliv', '+38099789823', '1235694'),
('Maxym', 'Gort', '+38096789823', '6589452');

INSERT INTO recipient(name, surname, phone_number, pasport_seria, street, zip, city_name) VALUES 
('Andrii','Horich','+38099648823','36987','Bila 98','00103','Kyiv'),
('Vova','Heroi','+38097648823','69488','Nova 96/8','75236','Lviv'),
('Nazar','Hrushch','+38095848823','36987','Pole 98','58754','Lutsk');

INSERT INTO delivery_adress (street, city_name) VALUES 
('Nova 96/8', 'Lviv'),
('Pole 98', 'Lutsk'),
('Zelena  68', 'Kharkiv');

INSERT INTO package (weigh, description, post_office_id, recipient_id, sender_id, parcel_machine_id, delivery_adress_id) VALUES 
(0.5, 'Apple', 1, 3, 1, NULL, 3),
(1.1, 'Food', NULL, 1, 2, 3, 1),
(50, 'Door', 3, 3, 1, NULL, 2);


