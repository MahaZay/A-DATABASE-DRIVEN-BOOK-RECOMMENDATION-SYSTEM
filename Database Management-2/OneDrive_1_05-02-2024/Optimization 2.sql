-- Query 1:
SELECT Books2.author, Books2.title, Books2.average_rating
FROM Books2
WHERE (Books2.author, Books2.average_rating) IN (
SELECT author, MAX(average_rating)
FROM Books2
GROUP BY author
);

-- Query 2:
SELECT AVG(average_rating) AS average_rating
FROM Books2
WHERE ratings_count > 1000;

-- Query 3:
SELECT author
FROM Books2
GROUP BY author
HAVING COUNT(DISTINCT genres) > 1;

-- Query 4:
SELECT Books2.publisher, AVG(Books2.average_rating) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count
FROM Books2
GROUP BY Books2.publisher;

-- Query 5:
SELECT Genres.genre_name, AVG(Books2.average_rating) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count, AVG(Books2.num_pages) AS average_number_of_pages
FROM Books2
JOIN Genres ON Books2.isbn COLLATE utf8mb4_general_ci = Genres.isbn COLLATE utf8mb4_general_ci
GROUP BY Genres.genre_name;






-- query 6:

SELECT Books2.publisher, Books2.title, Books2.author, Books2.average_rating
FROM Books2
JOIN (
SELECT publisher, MAX(average_rating) AS max_rating
FROM Books2
GROUP BY publisher
) AS top_ratings
ON Books2.publisher = top_ratings.publisher AND Books2.average_rating = top_ratings.max_rating;

-- query 7:
SELECT AVG(average_rating) AS average_rating
FROM Books2
WHERE ratings_count > 1000;

-- query 8:
SELECT author
FROM Books2
GROUP BY author
HAVING COUNT(DISTINCT genres) > 1;

-- query 9:
SELECT Books2.author, Books2.title, Books2.average_rating
FROM Books2
WHERE (Books2.author, Books2.average_rating) IN (
SELECT author, MAX(average_rating)
FROM Books2
GROUP BY author
);

-- Query 10
SELECT user_id, AVG(rating) AS average_rating
FROM Rating
GROUP BY user_id;

-- query 11:

SELECT Genres.genre_name, AVG(Books2.average_rating) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count, AVG(Books2.num_pages) AS average_number_of_pages
FROM Books2
JOIN Genres ON Books2.isbn COLLATE utf8mb4_general_ci = Genres.isbn COLLATE utf8mb4_general_ci
GROUP BY Genres.genre_name;



-- Query 12
SELECT Genres.genre_name, AVG(Books2.average_rating) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count, AVG(Books2.num_pages) AS average_number_of_pages
FROM Books2
JOIN Genres ON Books2.isbn COLLATE utf8mb4_unicode_ci = Genres.isbn COLLATE utf8mb4_unicode_ci
GROUP BY Genres.genre_name;




-- Query 13
SELECT publication_date, COUNT(*) AS books_published, AVG(average_rating) AS average_rating
FROM Books2
GROUP BY publication_date;


-- Query 14 
SELECT Books2.publication_date, Books2.title AS top_rated_book, Books2.author, Books2.average_rating
FROM Books2
WHERE Books2.average_rating = (
    SELECT MAX(average_rating)
    FROM Books2
    WHERE Books2.publication_date = Books2.publication_date
);


-- Query 15

SELECT Books2.publisher, AVG(Books2.average_rating) AS average_rating, SUM(Books2.ratings_count) AS total_ratings_count
FROM Books2
GROUP BY Books2.publisher;



