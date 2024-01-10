-- LIST THE EMPLOYEES NUMBER, LAST NAME, FIRST NAME, SEX, AND SALARY
SELECT employees.emp_no, 
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

--LIST THE FIRST NAME, LAST NAME, AND HIRE DATE FOR EMPLOYEES WHO WERE HIRED IN 1986
SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE DATE_PART('year', hire_date) =1986
ORDER BY emp_no;

--LIST THE MANAGER OF EACH DEPARTMENT, DEPARTMENT NUMBER, NAME, EMPLOYEE NUMBER, 
--LAST NAME, AND FIRST NAME
SELECT dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no=departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no=employees.emp_no
ORDER BY emp_no

--LIST DEPARTMENT NUMBER FOR EACH EMPLOYEE, 
--EMPLOYEE NUMBER, LAST NAME, FIRST NAME, DEPARTMENT NAME.
SELECT departments.dept_no,
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
ORDER BY emp_no

--LIST FIRST NAME, LAST NAME, SEX WHOSE FIRST NAME IS HERCULES AND
--WHOSE LAST NAME BEGINS WITH LETTER B.
SELECT *
FROM employees
WHERE first_name='Hercules' AND last_name LIKE'B%';

--LIST EMPLOYEE FROM SALES, EMPLOYEE NUMBER
--LAST NAME, FIRST NAME, DEPARTMENT NAME
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_no
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_name=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--LIST EMPLOYEE FROM SALES AND DEVELOPMENT, EMPLOYEE NUMBER
--LAST NAME, FIRST NAME, DEPARTMENT NAME
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_no
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name IN ('Sales','Development');

--LIST FRQUENCY COUNTS, DESCENDING ORDER, ALL EMPLOYEES LAST NAME.
SELECT last_name,
COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;

