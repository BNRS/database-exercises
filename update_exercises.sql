USE codeup_test_db;

-- Write SELECT statements to output each of the following with a caption:
--
-- All albums in your table.
-- All albums released before 1980
-- All albums by Michael Jackson
-- After each SELECT add an UPDATE statement to:
--
-- Make all the albums 10 times more popular (sales * 10)
-- Move all the albums before 1980 back to the 1800s.
-- Change 'Michael Jackson' to 'Peter Jackson'
-- Add SELECT statements after each UPDATE so you can see the results of your handiwork

-- SELECT 'All albums from albums table' AS '//////////////////////////////////////////////////////////////////////';
-- SELECT album FROM albums;
--
-- SELECT 'Which albums were released before 1980' AS '//////////////////////////////////////////////////////////////////////';
-- SELECT album, release_date FROM albums WHERE release_date < 1980;
--
-- SELECT 'All albums by MJ' AS '//////////////////////////////////////////////////////////////////////';
-- SELECT album FROM albums WHERE artist = 'Michael Jackson';
--
-- SELECT 'All by ID' AS '//////////////////////////////////////////////////////////////////////';
-- SELECT id, artist, album, release_date, genre, sales FROM albums;

-- SELECT 'Make all the albums 10 times more popular (sales * 10)' AS '//////////////////////////////////////////////////////////////////////';
-- UPDATE albums SET sales = sales*10;
-- SELECT * from albums;

-- SELECT 'Albums released before 1980 back to the 1800's' AS 'info';
-- UPDATE albums set release_date = release_date - 99;
-- SELECT * from albums WHERE release_date<1980;


-- SELECT "Albums by Michael Jackson" AS "info";
-- UPDATE albums set artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
-- SELECT * from albums WHERE artist = 'Peter Jackson';



