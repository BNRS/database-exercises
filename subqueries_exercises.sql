USE employees;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
  SELECT emp_no
  FROM dept_manager
)
LIMIT 10;


# Find all the employees with the same hire date as employee 101010 using a sub-query. 69 Rows
SELECT * FROM employees
WHERE hire_date = (
  SELECT hire_date FROM employees
  WHERE emp_no = 101010
);
# same response
SELECT first_name, last_name, emp_no
FROM employees
WHERE hire_date = (
  SELECT hire_date FROM employees WHERE emp_no = 101010
);

# Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles

select *
from employees
  join titles
    on titles.emp_no = employees.emp_no
where first_name in (
  select first_name
  from employees
  where first_name = "aamod"
);

select distinct title
from employees
  join titles
    on titles.emp_no = employees.emp_no
where first_name in (
  select first_name
  from employees
  where first_name = "aamod"
);

# Find all the current department managers that are female.
SELECT first_name, last_name, gender
FROM employees
WHERE gender = 'F' AND emp_no IN (
  SELECT emp_no
  FROM dept_manager
  WHERE dept_manager.to_date > curdate()
);


# Find all the current department managers that are male.

SELECT first_name, last_name, gender
FROM employees
WHERE gender = 'M' AND emp_no IN (
  SELECT emp_no
  FROM dept_manager
  WHERE dept_manager.to_date > curdate()
);












