USE codeup_test_db;


SELECT  'Albums released after 1991' AS 'info';
DELETE from albums WHERE release_date > 1991;

SELECT 'Disco Albums' AS 'info';
DELETE from albums WHERE genre = 'disco';

SELECT 'Albums by Whitney Houston' AS 'info';
DELETE from albums where artist = 'Whitney Houston';