CREATE TABLE authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(255) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

LOAD DATA LOCAL INFILE '/Users/mahahazimezayour/Downloads/goodreads_authors_noID.csv' 
INTO TABLE authors
CHARACTER SET utf8mb4
FIELDS TERMINATED By ','
IGNORE 1 LINES 
(authors);

ALTER TABLE authors
ADD author_id INT PRIMARY KEY AUTO_INCREMENT FIRST,
AUTO_INCREMENT = 1;

SELECT *
FROM `booksdb`.`authors`;

CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  goodreads_book_id INT UNIQUE,
  best_book_id INT,
  work_id INT,
  books_count INT,
  isbn VARCHAR(13) UNIQUE,
  authors VARCHAR(500),
  original_publication_year INT,
  title VARCHAR(255) NOT NULL,
  language_code VARCHAR(255),
  average_rating DECIMAL(3,2),
  ratings_count INT,
  work_ratings_count INT,
  work_text_reviews_count INT,
  ratings_1 INT,
  ratings_2 INT,
  ratings_3 INT,
  ratings_4 INT,
  ratings_5 INT
) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

 
LOAD DATA LOCAL INFILE '/Users/mahahazimezayour/Downloads/cleaning2-csv (1).csv'
INTO TABLE Books
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 LINES
(book_id, goodreads_book_id, best_book_id, work_id, books_count, isbn, authors, original_publication_year, title, language_code, average_rating, ratings_count, work_ratings_count, work_text_reviews_count, ratings_1, ratings_2, ratings_3, ratings_4, ratings_5);

CREATE TABLE book_author(
  book_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255) 
);



CREATE TABLE Genres (
  genre_id INT PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL,
  title VARCHAR(255),
  isbn VARCHAR(255) UNIQUE
);

INSERT INTO genres (genre_name,title, isbn)
SELECT genres, title, isbn
FROM books2;

CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY
);


CREATE TABLE rating (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  book_id INT,
  rating INT,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (book_id) REFERENCES books2);
  
  LOAD DATA LOCAL INFILE 
  INTO TABLE rating
  CHARACTER SET utf8mb4
  FIELDS TERMINATED BY ','
  IGNORE 1 LINES
  (user_id, book_id, rating);
  
ALTER TABLE rating
ADD FOREIGN KEY (book_id) REFERENCES (book_id),
ADD FOREIGN KEY (user_id) REFERENCES (book_id);

  
  
  
  
SELECT *
FROM `booksdb`.`books`;

SELECT *
FROM `booksdb`.`books2`;

SELECT *
FROM `booksdb`.`genres`;




SELECT DISTINCT book_id
FROM rating
WHERE book_id NOT IN (SELECT book_id FROM books);

CREATE TEMPORARY TABLE missing_books (
  book_id INT PRIMARY KEY
);

SELECT DISTINCT rating.book_id
FROM rating
LEFT JOIN books
    ON rating.book_id = books.book_id
WHERE books.book_id IS NULL;

