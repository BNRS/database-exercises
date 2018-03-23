DROP DATABASE IF EXISTS adlister;
CREATE DATABASE IF NOT EXISTS adlister;
USE adlister;
CREATE TABLE IF NOT EXISTS users (
  user_id int UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS ads (
  ad_id int UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  category TINYINT NOT NULL,
  date_listed DATETIME NOT NULL,
  created_by INT UNSIGNED NOT NULL,
  FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS category (
  id int UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
  category VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS category_ad (
  category_id INT UNSIGNED NOT NULL,
  ad_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (category_id) REFERENCES category(id),
  FOREIGN KEY (ad_id) REFERENCES ads(ad_id)
);

INSERT INTO users (first_name, last_name, email, password)
VALUES ('Cooper', 'Hanke','test@test.com','password'),
  ('Ben','Rasmussen','another@test.com','password'),
  ('Another','User','example.com','password');

INSERT INTO category (category)
VALUES ('help wanted'),
  ('for sale'),
  ('jobs');

INSERT INTO ads (title, description, category, date_listed, created_by)
VALUES ('Chevy Silverado','Black, 144000, new tires, $1200 OBO',2,now(),1),
  ('Web Developer needed!','In search of good help, where there might not be any!',1,now(),2);

INSERT INTO category_ad (category_id, ad_id)
VALUES (2,1), (1,2);

-- each time we add something, we would write code to do this exactly:
INSERT INTO ads(title, description, category, date_listed, created_by)
  VALUE ('New Item', 'Sale going quickly!', 2, now(), 3);
INSERT INTO category_ad (category_id, ad_id)
VALUES (2, 3),(3, 3);

SELECT email
FROM adlister.ads AS ads
  JOIN users u ON ads.created_by = u.user_id
WHERE ad_id IS NOT NULL ; -- in production, the where would come from a user requesting an ad

SELECT c.category
FROM ads
  JOIN category_ad a ON ads.ad_id = a.ad_id
  JOIN category c ON a.category_id = c.id
WHERE a.ad_id IS NOT NULL AND a.ad_id = 3;

SELECT email
FROM users
  JOIN ads ON users.user_id = ads.created_by
WHERE ad_id = 1;
-- logic here is that we want the email, so then we get the email from the user, which gets from the ads
-- the part i would want a program to ask is the "where ad_id = 4' part, where 4 comes from the application that calls for the update

-- showing the ads of all users that have been posted
SELECT title, description, c.category
FROM ads
  JOIN users u ON ads.created_by = u.user_id
  JOIN category_ad a ON ads.ad_id = a.ad_id
  JOIN category c ON a.category_id = c.id
WHERE user_id = 1;