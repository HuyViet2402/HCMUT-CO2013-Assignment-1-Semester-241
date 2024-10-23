-- Person --
CREATE TABLE Person(
	Person_ID NUMERIC(10,0) NOT NULL PRIMARY KEY,
	Email TEXT NOT NULL UNIQUE,
	Phone_number NUMERIC(10) NOT NULL UNIQUE,
	First_name TEXT NOT NULL,
	Middle_name TEXT,
	Last_name TEXT
);

-- Author --
CREATE TABLE Author(
	Author_ID NUMERIC(10,0) NOT NULL PRIMARY KEY,
	Number_of_books NUMERIC(5) NOT NULL CHECK(Number_of_books >= 1),
	FOREIGN KEY (Author_ID) REFERENCES Person(Person_ID) ON DELETE CASCADE
);

-- Customer --
CREATE TABLE Customer(
	Customer_ID NUMERIC(10,0) NOT NULL PRIMARY KEY,
	Money_spent NUMERIC(15,3) NOT NULL CHECK(Money_spent >= 0),
	FOREIGN KEY (Customer_ID) REFERENCES Person(Person_ID) ON DELETE CASCADE
);

-- Order --
CREATE TABLE Orders(
	Order_ID NUMERIC(13,0) NOT NULL PRIMARY KEY,
	Total_money NUMERIC(15,3) NOT NULL CHECK(Total_money >= 0),
	Order_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
	Customer_ID NUMERIC(10,0),
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE
);

-- Publisher --
CREATE TABLE Publisher(
	Publisher_ID NUMERIC(6,0) NOT NULL PRIMARY KEY,
	Publisher_name TEXT NOT NULL,
	Address TEXT
);

-- Book --
CREATE TABLE Book(
	Book_ID NUMERIC(13,0) PRIMARY KEY,
	Author_name TEXT NOT NULL,
	Genre TEXT,
	Price NUMERIC(15,3) NOT NULL CHECK(Price >= 0),
	Title TEXT NOT NULL,
	Publish_date DATE NOT NULL,
	Publisher_ID NUMERIC(6,0),
	Author_ID NUMERIC(10,0),
	Conditions TEXT NOT NULL,
	
	FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID) ON DELETE SET NULL,
	FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID) ON DELETE SET NULL
);

-- Order Item--
CREATE TABLE Order_item(
	Order_ID NUMERIC(13,0) NOT NULL,
	Book_ID NUMERIC(13,0) NOT NULL,
	Quantity NUMERIC CHECK(Quantity > 0),
	Discount NUMERIC(2,-2) CHECK(Discount >= 0 and Discount <= 1),
	
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
	FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE
);