USE employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
GROUP BY full_name
ORDER BY full_name
LIMIT 25;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT hire_date, COUNT(*) as number_hired
FROM employees
GROUP BY hire_date
ORDER BY number_hired DESC
LIMIT 10;

# Return 10 employees in a result set named 'full_name' in the format of 'lastname, firstname' for each employee.
# Add the date of birth for each employee as 'DOB' to the query.

# Update the query to format full name to include the employee number so it is formatted as 'employee number -
# lastname, firstname'.

SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name, birth_date AS DOB
FROM employees
LIMIT 10;


SELECT *
FROM employees;

describe departments;
describe dept_emp;
describe dept_manager;
describe employees;
describe salaries;






# Add an index to make sure all album names combined with the artist are unique.
# Try to add duplicates to test the constraint.
USE codeup_test_db;

# Add an index to make sure all album names combined with the artist are unique (Multiple-Column Indexes)
ALTER TABLE albums
  ADD UNIQUE (artist, album);

# Trying to add duplicates to test the constraint.
# [23000][1062] Duplicate entry 'Eagles-Their Greatest Hits 1971–1975' for key 'artist'
INSERT INTO albums (artist, album, release_date, genre, sales)
  VALUE ('Eagles', 'Their Greatest Hits 1971–1975',	1976,	'Rock, Soft rock, Folk rock', 32);

DESCRIBE albums;
SHOW KEYS FROM albums;



