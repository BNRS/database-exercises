USE employees;

# Modify your first query to order by first name.
# The first result should be Irena Reutenauer and the last result should be Vidya Simmen.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;


# Update the query to order by first name and then last name.
# The first result should now be Irena Acton and the last should be Vidya Zweizig.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

# Change the order by clause so that you order by last name before first name.
# Your first result should still be Irena Acton but now the last result should be Maya Zyda.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

# Find all employees whose last name starts with 'E'
# Modify with order by. Your results should not change!
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;


# Find all employees hired in the 90s and born on Christmas.
SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date, hire_date DESC;




