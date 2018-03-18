USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(100) NOT NULL,
    album  VARCHAR(100) NOT NULL,
    release_date INT NOT NULL,
    sales DECIMAL(10, 2) NOT NULL,
    genre VARCHAR (100) NOT NULL,
    PRIMARY KEY (id)
);

