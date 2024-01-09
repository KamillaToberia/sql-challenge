--Drop the name of tables if exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

--Create tables
CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no));

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR,
	PRIMARY KEY (title_id));	

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no));

--View the sucessfull data entry
SELECT* FROM departments;
SELECT* FROM titles;
SELECT* FROM employees;
SELECT* FROM dept_emp;
SELECT* FROM dept_manager;
SELECT* FROM salaries;