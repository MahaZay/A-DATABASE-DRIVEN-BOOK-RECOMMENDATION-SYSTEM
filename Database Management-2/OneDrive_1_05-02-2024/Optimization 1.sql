-- Number of tables in the database
SELECT COUNT(*) AS table_count FROM information_schema.tables WHERE table_schema = 'booksdb';

-- Size of each table in the database
SELECT table_name, ROUND(((data_length + index_length) / 1024 / 1024), 2) AS table_size_mb
FROM information_schema.tables
WHERE table_schema = 'booksdb'
ORDER BY (data_length + index_length) DESC;

-- Number of records in each table
SELECT table_name, table_rows
FROM information_schema.tables
WHERE table_schema = 'booksdb'
ORDER BY table_rows DESC;

-- Most frequently accessed tables based on queries
SELECT table_name, COUNT(*) AS query_count
FROM information_schema.tables
JOIN information_schema.columns USING (table_schema, table_name)

GROUP BY table_name
ORDER BY query_count DESC;

-- Show slow queries
SHOW VARIABLES LIKE 'slow_query_log';
SHOW VARIABLES LIKE 'long_query_time';

-- Enable slow query logging
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 1;

-- View slow query log
SHOW GLOBAL VARIABLES LIKE 'slow_query_log_file';

-- Analyze slow queries
SELECT * FROM mysql.slow_log;
