USE codeup_test_db;

-- In select_exercises.sql write queries to find the following information. Before each item, output a caption explaining the results:
--
-- The name of all albums by Pink Floyd.

-- The year Sgt. Pepper's Lonely Hearts Club Band was released
-- The genre for Nevermind
-- Which albums were released in the 1990s
-- Which albums had less than 20 million certified sales
-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

SELECT 'The name of all albums by Pink Floyd' AS '//////////////////////////////////////////////////////////////////////';
SELECT album FROM albums WHERE artist = 'Pink Floyd';

SELECT 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' AS '//////////////////////////////////////////////////////////////////////';
SELECT  release_date FROM albums WHERE album = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT 'The genre for Nebvermind' AS '//////////////////////////////////////////////////////////////////////';
SELECT genre FROM albums WHERE album = 'Nevermind';

SELECT 'Which albums were released in the 1990s' AS '//////////////////////////////////////////////////////////////////////';
SELECT album FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT 'Which albums had less than 20 million certified sales' AS '//////////////////////////////////////////////////////////////////////';
SELECT album, sales FROM albums WHERE sales < 20;

SELECT 'All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?' AS '//////////////////////////////////////////////////////////////////////';
SELECT album, genre FROM albums WHERE genre = 'Rock' || genre = 'Hard rock' || genre = 'Progressive rock';