# Movie Rental Database Project

Welcome to the **Movie Rental Database Project**, a beginner-friendly SQL project designed to enhance database management and querying skills. This project demonstrates how to create and interact with a relational database using SQL.

---

## 🚀 Project Overview
This project focuses on building a movie rental system that consists of three tables:
1. **Movies**
2. **Customers**
3. **Rentals**

The database is populated with sample data, and various SQL queries are used to answer business-related questions.

---

## 📁 Project Structure
The project includes:

1. **Database Schema**:
   - Create the `Movies`, `Customers`, and `Rentals` tables.
2. **Sample Data**:
   - Populate the tables with realistic data.
3. **SQL Queries**:
   - A set of queries to perform data analysis and solve real-world problems.

---

## 🛠️ Technologies Used
- **SQL**: Core query language.
- **MySQL Workbench** (or any other SQL environment): For executing the queries and managing the database.

---

## 📚 Features
- **Movies Table**: Stores information like title, genre, release year, and rating.
- **Customers Table**: Stores customer details such as name, age, and city.
- **Rentals Table**: Tracks movie rentals with rental and return dates.
- **Analytical Queries**:
  - Retrieve top-rated movies.
  - Identify frequent renters.
  - Calculate average movie ratings by genre.
  - Find rental trends by time period.

---

## 📊 Example Queries
Here are some of the key queries included in this project:

1. **List all movies in the database**:
   ```sql
   SELECT * FROM Movies;
   ```

2. **Find all Sci-Fi movies released after 2000**:
   ```sql
   SELECT * FROM Movies WHERE Genre = 'Sci-Fi' AND ReleaseYear > 2000;
   ```

3. **Retrieve customers aged above 25**:
   ```sql
   SELECT * FROM Customers WHERE Age > 25;
   ```

4. **List all rentals with customer names and movie titles**:
   ```sql
   SELECT Rentals.RentalID, Customers.FirstName, Customers.LastName, Movies.Title, Rentals.RentalDate, Rentals.ReturnDate
   FROM Rentals
   JOIN Customers ON Rentals.CustomerID = Customers.CustomerID
   JOIN Movies ON Rentals.MovieID = Movies.MovieID;
   ```

---

## 🎯 Learning Outcomes
- Understanding relational database design.
- Writing optimized SQL queries.
- Performing JOIN operations to combine data from multiple tables.
- Using aggregate functions like `COUNT`, `AVG`, etc.

---

## 📂 Getting Started
### Prerequisites
- Install MySQL or any preferred SQL environment.
- Basic knowledge of SQL syntax.

### Steps to Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/movie-rental-db.git
   ```
2. Navigate to the project directory:
   ```bash
   cd movie-rental-db
   ```
3. Execute the `movie_rental_db.sql` file in your SQL environment to create and populate the database.
4. Run the provided queries to analyze the data.

---

## 🤝 Contributions
Contributions are welcome! If you have ideas to improve this project, feel free to fork the repository and submit a pull request.

---

## 📜 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🙌 Acknowledgments
Thanks to the open-source community and SQL learners for inspiring this project.

---

Feel free to explore, learn, and improve your SQL skills with this project. Happy coding! 🎉
