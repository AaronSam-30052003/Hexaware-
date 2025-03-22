--CASE STUDY- FINANCE MANAGEMENT
USE CASESTUDY;
GO
-- CREATE USERS TABLE
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- CREATE EXPENSECATEGORIES TABLE
CREATE TABLE ExpenseCategories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name VARCHAR(255) NOT NULL
);

-- CREATE EXPENSES TABLE
CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    category_id INT,
    date DATE NOT NULL,
    description VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES ExpenseCategories(category_id)
);
