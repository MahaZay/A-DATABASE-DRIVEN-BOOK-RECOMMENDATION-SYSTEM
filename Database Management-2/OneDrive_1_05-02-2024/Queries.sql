# Question 1 (Authors):





# How are their books received by GoodReads users, and what can impact book ratings and sales?

# Query 1: Retrieve the books with the highest ratings from each author.

SELECT Books2.author, Books2.title, Books2.average_rating
FROM Books2
WHERE (Books2.author, Books2.average_rating) IN (
SELECT author, MAX(average_rating)
FROM Books2
GROUP BY author
);

# Query 2: Calculate the average rating for books with more than 1000 ratings.

SELECT AVG(average_rating) AS average_rating
FROM Books2
WHERE ratings_count > 1000;

# Query 3: Find the authors who have written books in multiple genres.

SELECT author
FROM Books2
GROUP BY author
HAVING COUNT(DISTINCT genres) > 1;

# Query 4: Find the average rating and total ratings count for books published by each publisher.

SELECT Books2.publisher, AVG(Books2.average_rating) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count
FROM Books2
GROUP BY Books2.publisher;

# Query 5: Find the average rating, total ratings count, and average number of pages for books in each genre
#Same question in publischer 

SELECT Genres.genre_name, AVG(Books2.average_rating COLLATE utf8mb4_general_ci) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count, AVG(Books2.num_pages) AS average_number_of_pages
FROM Books2
JOIN Genres ON Books2.isbn COLLATE utf8mb4_general_ci = Genres.isbn COLLATE utf8mb4_general_ci
GROUP BY Genres.genre_name;



# Business Question 2 (Booksellers):




# What books/authors are most popular among GoodReads users, and what factors influence user reviews and ratings?
#(provide insights into popular books/authors and factors influencing user reviews and ratings for Booksellers.)

# Query 6: Retrieve the top-rated book from each publisher.


SELECT Books2.publisher, Books2.title, Books2.author, Books2.average_rating
FROM Books2
JOIN (
SELECT publisher, MAX(average_rating) AS max_rating
FROM Books2
GROUP BY publisher
) AS top_ratings
ON Books2.publisher = top_ratings.publisher AND Books2.average_rating = top_ratings.max_rating;

# Query 7: Calculate the average rating for books with more than 1000 ratings.

SELECT AVG(average_rating) AS average_rating
FROM Books2
WHERE ratings_count > 1000;

# Query 8: Find the authors who have written books in multiple genres.

SELECT author
FROM Books2
GROUP BY author
HAVING COUNT(DISTINCT genres) > 1;


#Query 9: Retrieve the books with the highest ratings from each author.

SELECT Books2.author, Books2.title, Books2.average_rating
FROM Books2
JOIN (
    SELECT author, MAX(average_rating) AS max_rating
    FROM Books2
    GROUP BY author
) AS T ON Books2.author = T.author AND Books2.average_rating = T.max_rating;


#Query 10: Calculate the average rating given by each user.
check user_id and rating 

SELECT user_id, AVG(rating) AS average_rating
FROM Rating
GROUP BY user_id;


# Business Question 3 (Publishers):



# What genres of books are most popular, and how do different factors impact book ratings and sales?
# (provide insights into the popularity of book genres, the impact of different factors on book ratings and sales, 
# and the performance of books published by each publisher.)


# Query 11: Find the average rating, total ratings count, and average number of pages for books in each genre.

SELECT Genres.genre_name, AVG(Books2.average_rating COLLATE utf8mb4_general_ci) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count, AVG(Books2.num_pages) AS average_number_of_pages
FROM Books2
JOIN Genres ON Books2.isbn COLLATE utf8mb4_general_ci = Genres.isbn COLLATE utf8mb4_general_ci
GROUP BY Genres.genre_name;

### Query 12: Retrieve the top-rated book and its author from each genre.
#LOST CONNECTION 

SELECT Genres.genre_name, Books2.title AS top_rated_book, Books2.author
FROM Books2
JOIN Genres ON Books2.isbn COLLATE utf8mb4_general_ci = Genres.isbn COLLATE utf8mb4_general_ci
WHERE Books2.average_rating COLLATE utf8mb4_general_ci = (
    SELECT MAX(average_rating COLLATE utf8mb4_general_ci)
    FROM Books2
    WHERE Genres.genre_name = Genres.genre_name
);

# Query 13: Find the number of books published per year and the average rating of books published in each year.

SELECT publication_date, COUNT(*) AS books_published, AVG(average_rating) AS average_rating
FROM Books2
GROUP BY publication_date;

# Query 14: Retrieve the top-rated book from each year along with its author.

SELECT Books2.publication_date, Books2.title AS top_rated_book, Books2.author, Books2.average_rating
FROM Books2
WHERE Books2.average_rating = (
    SELECT MAX(average_rating)
    FROM Books2
    WHERE Books2.publication_date = Books2.publication_date
);


# Query 15: Find the average rating and total ratings count for books published by each publisher.

SELECT Books2.publisher, AVG(Books2.average_rating) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count
FROM Books2
GROUP BY Books2.publisher;




# Business Question 4 (Readers): SEE NUMBRR OF QUERIES


# How can readers discover new books/authors based on popularity, genre, or other factors?


# Query 12: Retrieve the top-rated book and its author from each genre.


# Query 6: Retrieve the top-rated book from each publisher.


# Query 9: Retrieve the books with the highest ratings from each author.


# Query 15: Find the average rating, total ratings count, and average number of pages for books in each genre.