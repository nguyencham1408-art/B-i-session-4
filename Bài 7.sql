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

-- Cập nhật lương của nhân viên có EmployeeID = 2
UPDATE Employees
SET Salary = 4800
WHERE EmployeeID = 2;

-- Cập nhật ngày tuyển dụng của nhân viên tên David
UPDATE Employees
SET HireDate = '2021-08-01'
WHERE FirstName = 'David';



SET SQL_SAFE_UPDATES = 1;

-- Xóa nhân viên có EmployeeID = 1
DELETE FROM Employees
WHERE EmployeeID = 1;

-- Xóa tất cả nhân viên có lương thấp hơn 5000
DELETE FROM Employees
WHERE Salary < 5000;
INSERT INTO Employees (FirstName, LastName, HireDate, Salary)
VALUES 
('Cham', 'Nguyen', '2022-05-10', 15000000),
('Han', 'Nguyen', '2023-01-20', 18000000),
('Tuong', 'Le', '2021-11-15', 20000000);
SELECT * 
FROM Employees;

--  Hiển thị nhân viên có Salary > 5000
SELECT * 
FROM Employees
WHERE Salary > 5000;

-- ️ Hiển thị nhân viên sắp xếp theo HireDate giảm dần (mới nhất trước)
SELECT * 
FROM Employees
ORDER BY HireDate DESC;

-- Tạo bảng Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Thêm dữ liệu mẫu cho bộ phận
INSERT INTO Departments (DepartmentName)
VALUES ('HR'), ('IT'), ('Finance'), ('Marketing');
ALTER TABLE Employees
ADD COLUMN DepartmentID INT,
ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

UPDATE Employees SET DepartmentID = 1 WHERE EmployeeID = 1;
UPDATE Employees SET DepartmentID = 2 WHERE EmployeeID = 2;
UPDATE Employees SET DepartmentID = 3 WHERE EmployeeID = 3;

SELECT d.DepartmentName, COUNT(e.EmployeeID) AS SoLuongNhanVien
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

SELECT d.DepartmentName, AVG(e.Salary) AS LuongTrungBinh
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

SELECT d.DepartmentName, AVG(e.Salary) AS LuongTrungBinh
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING AVG(e.Salary) > 5000;
