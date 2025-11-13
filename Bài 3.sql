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

-- Thêm 3 bản ghi nhân viên
INSERT INTO Employees (FirstName, LastName, HireDate, Salary)
VALUES 
('Cham', 'Nguyen', '2022-05-10', 15000000),
('Han', 'Nguyen', '2023-01-20', 18000000),
('Tuong', 'Le', '2021-11-15', 20000000);