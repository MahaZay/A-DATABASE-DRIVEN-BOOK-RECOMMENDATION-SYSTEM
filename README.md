

## **Database-Driven Book Recommendation System**

---

## Project Description
This project demonstrates the development of a **Book Recommendation System** using SQL databases and data from Goodreads. The system leverages data management principles and analytics to provide personalized book recommendations for readers and actionable insights for publishers, authors, and booksellers.

The project utilizes **MySQL** for database creation, management, and querying. Visualizations were implemented using Metabase to connect data insights with business objectives.

---

## Key Features
1. **Database Structure**:
   - Schema designed with entities such as `Books`, `Authors`, `Genres`, `Users`, and `Ratings`.
   - Relationships established via foreign keys to ensure data integrity.

2. **Data Sources**:
   - Primary dataset sourced from Goodreads (via Kaggle).
   - Additional genres data integrated for enhanced recommendations.

3. **Querying**:
   - Efficient SQL queries to identify:
     - Top-rated books.
     - Most popular genres and authors.
     - Trends by publication year.

4. **Optimization**:
   - Query performance was enhanced using indexing and query restructuring.
   - Slow query logging and analysis were performed.

5. **Visualization**:
   - Data visualized using Metabase for trends, ratings, and decision support.

---

## Prerequisites
- **MySQL Server & Workbench** (for database setup and management).
- **Metabase** (for data visualization).
- Basic understanding of SQL and database relationships.

---

## Installation Instructions

### Step 1: Set Up the Database
1. Import the provided SQL files:
   - `booksdb1.sql` - Database schema creation.
   - `GoodReads.sql` - Data loading scripts.

2. Use the `LOAD DATA INFILE` command (or similar) to load raw CSV files into MySQL tables.

### Step 2: Execute Queries
- Use the `Queries.sql` script to perform analysis and generate insights:
  - Popular genres.
  - Highest-rated authors/books.
  - Trends across years.

### Step 3: Optimization
- Run optimization scripts:
   - `Optimization 1.sql` - Database structure optimization.
   - `Optimization 2.sql` - Query performance improvements.

### Step 4: Visualization
1. Connect the MySQL database to Metabase.
2. Use SQL queries to fetch insights and generate scatterplots, bar charts, and tables.

---

## File Structure
- `booksdb1.sql` – SQL script for creating the database schema.
- `GoodReads.sql` – SQL script for data insertion.
- `Queries.sql` – SQL queries for analysis.
- `Optimization 1.sql` – Optimization script 1.
- `Optimization 2.sql` – Optimization script 2.
- **Documentation** – `A DATABASE-DRIVEN BOOK RECOMMENDATION SYSTEM.pdf`.

---

## Contributions
Developed by:
- Maha Hazimé-Zayour 
- Incheol Jeong
- Tejesh Reddy Koki
- Vignesh Govindaraj

---

## License
This project is open for educational purposes. Proper credit must be given to the contributors and data sources.

---
