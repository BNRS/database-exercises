USE employees;

# Integrate MySQL's built in functions into our existing queries

# Copy the order_by_exercises.sql script and save it as functions_exercises.sql.
SELECT CONCAT(last_name, ' ', first_name)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

# Update your queries for employees whose names start and end with 'E'.
# Use concat() to combine their first and last name together as a single column in your results.

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no DESC;


# For your query of employees born on Christmas and hired in the 90s, use datediff()
# to find how many days they have been working at the company (Hint: You will also need to use now() or curdate())

SELECT *, DATEDIFF(NOW(), hire_date)
FROM employees
WHERE hire_date LIKE '199%'
          AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;



SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name LIKE 'ne%'
GROUP BY first_name
ORDER BY first_name;

select count(first_name) from employees
where first_name is not null;

SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT avg(salary)
FROM salaries
WHERE emp_no = 10001;

SELECT emp_no, avg(salary)
FROM salaries
GROUP BY emp_no
LIMIT 10;

