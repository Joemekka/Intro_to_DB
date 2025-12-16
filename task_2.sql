CREATE TABLE Authors (
        author_id INT AUTO_INCREMENT PRIMARY KEY,
        author_name VARCHAR(250),       
);

CREATE TABLE Books (
        book_id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(130),
        author_id INT NOT NULL,
        price DOUBLE,
        publication_date DATE,
        FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Customers (
        customer_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_name VARCHAR(215),
        email VARCHAR(215),
        address TEXT
);

CREATE TABLE Orders (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
        order_date DATE
);

CREATE TABLE Order_Details (
        order_detail_id INT AUTO_INCREMENT PRIMARY KEY;
        order_id INT NOT NULL,
        book_id INT NOT NULL,
        quantity DOUBLE,
        FOREIGN KEY order_id REFERENCES Orders(order_id) ON DELETE CASCADE ON UPDATE  CASCADE,
        FOREIGN KEY book_id REFERENCES Books(book_id) ON DELETE CASCADE ON UPDATE CASCADE
);
