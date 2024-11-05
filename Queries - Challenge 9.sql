-- 1: List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
e.emp_no AS "Employee Number",
e.last_name AS "Last Name", 
e.first_name AS "First Name", 
e.sex AS "Gender", 
s.salary AS "Salary"
FROM employees AS e
JOIN salaries AS s
ON e.emp_no = s.emp_no;



-- 2: List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
first_name AS "First Name", 
last_name AS "Last Name", 
hire_date AS "Hire Date"
FROM employees
WHERE hire_date LIKE '%1986';


-- 3: List the manager of each department along with their department number, department name, 
--    employee number, last name, and first name.
SELECT
t.title AS "Position",
m.dept_no AS "Department Number",
d.dept_name AS "Department",
m.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name"
FROM dept_manager AS m
JOIN departments AS d
ON d.dept_no = m.dept_no
JOIN employees AS e
ON m.emp_no = e.emp_no
JOIN titles AS t
ON e.emp_title_id = t.title_id;



-- 4: List the department number for each employee along with that employee’s employee number, 
--    last name, first name, and department name.
SELECT
m.dept_no AS "Department Number",
m.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
d.dept_name AS "Department"
FROM dept_emp AS m
JOIN departments AS d
ON d.dept_no = m.dept_no
JOIN employees AS e
ON m.emp_no = e.emp_no;


-- 5: List first name, last name, and sex of each employee whose first name is Hercules and 
--    whose last name begins with the letter B.
SELECT 
first_name AS "First Name", 
last_name AS "Last Name", 
sex AS "Gender"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';



-- 6: List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
d.dept_name AS "Department"
FROM employees AS e
JOIN dept_emp AS dp
ON e.emp_no = dp.emp_no
JOIN departments AS d
ON dp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- 7: List each employee in the Sales and Development departments, including their employee number, last name, 
--    first name, and department name.
SELECT
e.emp_no AS "Employee Number",
e.last_name AS "Last Name",
e.first_name AS "First Name",
d.dept_name AS "Department"
FROM employees AS e
JOIN dept_emp AS dp
ON e.emp_no = dp.emp_no
JOIN departments AS d
ON dp.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


-- 8: List the frequency counts, in descending order, of all the employee last names 
--    (that is, how many employees share each last name). 
SELECT last_name, COUNT(last_name) AS "Frequency of Repeated Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Frequency of Repeated Last Names" DESC;