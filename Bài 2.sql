-- Cú pháp tạo bảng
CREATE DATABASE CompanyDB;

USE CompanyDB;

-- Tạo bảng Employees
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Thêm cột HireDate (kiểu DATE )
ALTER TABLE Employees
ADD COLUMN HireDate DATE;

-- Thêm cột Salary (kiểu INT)
ALTER TABLE Employees
ADD COLUMN Salary INT;