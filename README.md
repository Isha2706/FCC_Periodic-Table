# 🧪 Periodic Table Database Project

This project is part of the **FreeCodeCamp Relational Database Certification**. It involves creating a PostgreSQL database for the periodic table of elements and writing a **Bash script** to query element information.

## 📦 Files Included

- `periodic_table.sql` – SQL script to create and populate the database with element data.
- `element.sh` – Bash script to retrieve and display element information based on user input.

## 🛠 Technologies Used

- **PostgreSQL** – for creating and managing the relational database.
- **Bash** – to build an interactive script for querying the database.

## 📖 Project Description

- The SQL script creates the necessary tables (`elements`, `properties`, and `types`) and inserts sample data for elements.
- The Bash script accepts one argument: an element's **atomic number**, **symbol**, or **name**.
- It then queries the database and displays detailed information about that element in a readable format.

Example:
```bash
./element.sh H
```

Output:
```bash
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1°C and a boiling point of -252.9°C.
```

## 🗃️ Database Structure

The `periodic_table` database includes the following tables:

- `elements` – atomic number, name, and symbol
- `properties` – foreign key to atomic number, type_id, mass, melting and boiling points
- `types` – mapping of type IDs to names (e.g., metal, nonmetal, metalloid)

## ▶️ How to Run

### 1. Setup the Database
   ```bash
   psql -U postgres -f periodic_table.sql
   ```

### 2. Make the Bash Script Executable
   ```bash
   chmod +x element.sh
   ```

### 3. Run the Script
   ```bash
   ./element.sh 10        # using atomic number
   ./element.sh Ne        # using symbol
   ./element.sh Neon      # using name
   ```

## ❗ Error Handling

If the user input doesn't match any element, the script will return:
```bash
I could not find that element in the database.
```

## 💡 What I Learned

- Writing efficient SQL joins and queries
- Structuring relational databases
- Using Bash to interact with PostgreSQL
- Input validation and error handling in scripts

## 📜 Certification

This project is part of the **[FreeCodeCamp.org](https://www.freecodecamp.org/) Relational Database Certification**.
