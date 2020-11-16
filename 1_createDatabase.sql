USE master;
	CREATE DATABASE drogaytsev_motors
	ON (NAME=drogaytsev_motors,
		FILENAME = 'C:\bd\drogaytsev_motors.mdf',
		SIZE = 10,
		MAXSIZE = 100,
		FILEGROWTH = 5)
	LOG ON
		(NAME=drogaytsev_log,
		FILENAME = 'C:\bd\drogaytsev_motors_log.ldf',
		SIZE = 40,
		MAXSIZE = 100,
		FILEGROWTH = 10);
		GO
USE drogaytsev_motors;
	CREATE TABLE car (
		id_car INTEGER NOT NULL CONSTRAINT PK_id_car PRIMARY KEY IDENTITY(1,1), 
		vin VARCHAR(17) UNIQUE , 
		product INTEGER NOT NULL, 
		mileage INTEGER DEFAULT(0), 
		color VARCHAR(15) NOT NULL
		);
	GO
	CREATE TABLE product (
		id_product INTEGER NOT NULL CONSTRAINT PK_id_product PRIMARY KEY IDENTITY, 
		modification INTEGER, 
		date_storage DATE, 
		price MONEY CHECK(price > 0)
		);
	GO
	CREATE TABLE modification (
		id_modification INTEGER NOT NULL CONSTRAINT PK_id_modification PRIMARY KEY IDENTITY(1,1),
		body_type VARCHAR(15) NOT NULL, 
		count_of_doors INTEGER NOT NULL CHECK(count_of_doors BETWEEN 2 AND 6), 
		count_of_seats INTEGER NOT NULL DEFAULT(5), 
		engine_type VARCHAR(15) NOT NULL, 
		engine_volume FLOAT NOT NULL, 
		transmission VARCHAR(15) NOT NULL, 
		drive_unit VARCHAR(15) NOT NULL,
		issue_year INTEGER NOT NULL CHECK (issue_year > 2015), 
		model INTEGER NOT NULL
		);
	GO
	CREATE TABLE model (
		id_model INTEGER NOT NULL CONSTRAINT PK_id_model PRIMARY KEY IDENTITY, 
		model_name VARCHAR(25) NOT NULL, 
		mark INTEGER NOT NULL
		);
	GO
	CREATE TABLE mark (
		id_mk INTEGER NOT NULL CONSTRAINT PK_id_mk PRIMARY KEY IDENTITY(1,1), 
		mk_name VARCHAR(25) NOT NULL UNIQUE
		);
	GO
	CREATE TABLE purchase (
		id_purchase INTEGER NOT NULL CONSTRAINT PK_id_purchase PRIMARY KEY IDENTITY, 
		client INTEGER NOT NULL DEFAULT(0),
		car INTEGER NOT NULL, 
		seller INTEGER NOT NULL DEFAULT(0), 
		sale_price MONEY NOT NULL, 
		sale_date DATE, 
		type_of_payment VARCHAR(15) NOT NULL
		);
	GO
	CREATE TABLE client (
		id_client INTEGER NOT NULL CONSTRAINT PK_id_client PRIMARY KEY IDENTITY, 
		surname VARCHAR(30) NOT NULL,
		firstname VARCHAR(30) NOT NULL, 
		patronymic VARCHAR(30) NOT NULL DEFAULT('Нет'), 
		passport VARCHAR(15) NOT NULL UNIQUE, 
		address VARCHAR(255) NOT NULL,
		phone VARCHAR(15) NOT NULL UNIQUE
		);
	GO
	CREATE TABLE seller (
		id_seller INTEGER NOT NULL CONSTRAINT PK_id_seller PRIMARY KEY IDENTITY, 
		surname VARCHAR(30) NOT NULL,
		firstname VARCHAR(30) NOT NULL, 
		patronymic VARCHAR(30) NOT NULL DEFAULT('Нет'), 
		phone VARCHAR(15) NOT NULL UNIQUE
		);
	GO
	CREATE TABLE history (
		id INTEGER IDENTITY PRIMARY KEY,
		car_id INTEGER NOT NULL,
		operation NVARCHAR(255) NOT NULL,
		create_at DATETIME NOT NULL DEFAULT GETDATE(),
		);
	GO
	ALTER TABLE car 
		ADD CONSTRAINT FK_product 
		FOREIGN KEY (product) 
		REFERENCES product(id_product) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
	GO
	ALTER TABLE product 
		ADD CONSTRAINT FK_modification 
		FOREIGN KEY (modification) 
		REFERENCES modification(id_modification) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
	GO
	ALTER TABLE modification 
		ADD CONSTRAINT FK_model 
		FOREIGN KEY (model) 
		REFERENCES model(id_model) 
		ON DELETE CASCADE
		ON UPDATE CASCADE;
	GO
	ALTER TABLE model 
		ADD CONSTRAINT FK_mark 
		FOREIGN KEY (mark) 
		REFERENCES mark(id_mk) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
	GO
	ALTER TABLE purchase 
		ADD CONSTRAINT FK_car 
		FOREIGN KEY (car)
		REFERENCES car(id_car)
		ON DELETE CASCADE 
		ON UPDATE CASCADE;
	GO
	ALTER TABLE purchase 
		ADD CONSTRAINT FK_client 
		FOREIGN KEY (client) 
		REFERENCES client(id_client)
		ON DELETE SET DEFAULT 
		ON UPDATE CASCADE;
	GO
	ALTER TABLE purchase 
		ADD CONSTRAINT FK_seller
		FOREIGN KEY (seller) 
		REFERENCES seller(id_seller) 
		ON DELETE SET DEFAULT 
		ON UPDATE CASCADE;
	GO
	ALTER DATABASE drogaytsev_motors 
		SET RECOVERY FULL;  
	GO