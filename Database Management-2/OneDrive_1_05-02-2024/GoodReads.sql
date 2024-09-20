CREATE DATABASE BOOKDB;

USE BOOKDB;

CREATE TABLE Authors (
  author_id INT PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL
);


CREATE TABLE Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  goodreads_book_id INT UNIQUE,
  best_book_id INT,
  work_id INT,
  books_count INT,
  isbn VARCHAR(13) UNIQUE,
  original_publication_year INT,
  original_title VARCHAR(255),
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
  ratings_5 INT,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors (author_id)
);

CREATE TABLE Genres (
  genre_id INT PRIMARY KEY,
  genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE Book_genres (
  book_id INT,
  genre_id INT,
  PRIMARY KEY (book_id, genre_id),
  FOREIGN KEY (book_id) REFERENCES books (book_id),
  FOREIGN KEY (genre_id) REFERENCES Genres (genre_id)
);


CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);


CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    username VARCHAR(255),
    CONSTRAINT PK_USER PRIMARY KEY (user_id)
);


CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT,
    book_id INT,
    user_id INT,
    rating_value FLOAT,
    PRIMARY KEY (rating_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
