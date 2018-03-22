USE join_test_db;

# Create a database named join_test_db and run the SQL provided in the Join Example DB section above;
# to create the same setup used for this lesson.
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

# Insert 4 new users into the database. One should have a NULL role.
# The other three should be authors.

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', null),
  ('mike', 'mike@example.com', null),
  ('ben', 'ben@example.com', null),
  ('chris', 'chris@example.com', 2),
  ('david', 'david@example.com', 2),
  ('rodger', 'rodger@example.com', 2);

# Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson.
# Before you run each query, guess the expected number of results.

#JOIN
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

#LEFT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
  LEFT JOIN roles ON users.role_id = roles.id;

#RIGHT JOIN
SELECT users.name AS user_name, roles.name AS role_name
FROM users
  RIGHT JOIN roles ON users.role_id = roles.id;

# Here is the above right join query rewritten as a left join:
SELECT users.name as user_name, roles.name as role_name
FROM roles
  LEFT JOIN users ON users.role_id = roles.id;

# Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries.
# Use count and the appropriate join type to get a list of roles along with the number of users that has the role.
# Hint: You will also need to use group by in the query.

-- answer goes here --




USE employees;
# Using the example in the Associative Table Joins section as a guide, write a query that shows each department
# along with the name of the current manager for that department.

SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees as e
  JOIN dept_manager as dm
    ON e.emp_no = dm.emp_no
  JOIN departments AS d
    ON dm.dept_no = d.dept_no
WHERE dm.to_date LIKE '9999%'
ORDER BY d.dept_name;

# Find the name of all departments currently managed by women.

SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager, gender AS Gender
FROM employees as e
  JOIN dept_manager as dm
    ON e.emp_no = dm.emp_no
  JOIN departments AS d
    ON dm.dept_no = d.dept_no
WHERE dm.to_date LIKE '9999%' AND gender = 'F'
ORDER BY d.dept_name;

# Find the current titles of employees currently working in the Customer Service department.

SELECT titles.title AS Title, COUNT(titles.title) AS Employee_Count
FROM employees
  JOIN titles
    ON employees.emp_no = titles.emp_no
  JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
  JOIN departments
    ON dept_emp.dept_no = departments.dept_no
WHERE titles.to_date LIKE '9999%'
      AND departments.dept_name LIKE 'Cust%'
GROUP BY titles.title
ORDER BY Employee_Count DESC;

# use the 'latter' then the 'closest'


SELECT *
FROM titles t
WHERE t.to_date > curdate();


# Find the current salary of all current managers.

select dept_name, concat(first_name, ' ', last_name) as Manager, salary
from departments as d
  join dept_manager as dm
    on d.dept_no = dm.dept_no
  join employees as e
    on dm.emp_no = e.emp_no
  join salaries s
    on dm.emp_no = s.emp_no
where dm.to_date > curdate() AND s.to_date > curdate()
ORDER BY dept_name;

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

show create table titles;







