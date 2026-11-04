# ⚖️ LUPON Database
### *Organizing Records. Supporting Justice. Strengthening Communities.*

<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL-blue?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/Tool-phpMyAdmin-orange?style=for-the-badge&logo=phpmyadmin&logoColor=white" />
  <img src="https://img.shields.io/badge/Environment-XAMPP-FB7A24?style=for-the-badge&logo=xampp&logoColor=white" />
</p>

Welcome to the **LUPON Database Repository!** 👋

This repository contains the MySQL database for a Barangay Lupon Case Management System. It is designed to organize and manage records related to barangay dispute resolution under the **Katarungang Pambarangay**.

The database helps organize complainant and respondent information, case records, hearing schedules, settlements, and other related information.

---

## 📌 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [✨ Database Features](#-database-features)
- [🛠️ Technologies Used](#️-technologies-used)
- [📂 Repository Structure](#-repository-structure)
- [🚀 Getting Started](#-getting-started)
- [🗃️ Database Contents](#️-database-contents)
- [💻 Sample SQL Query](#-sample-sql-query)
- [📸 Screenshots](#-screenshots)
- [📝 Project Notes](#-project-notes)

---

## 🎯 Project Overview

The LUPON Database serves as the data storage foundation of a Barangay Lupon Case Management System.

Its main purpose is to provide an organized database structure for storing, retrieving, and maintaining records involved in barangay dispute resolution.

**The goal is simple:** Keep records organized, accessible to authorized personnel, and easier to manage.

## ✨ Database Features

| Feature | Description |
|---|---|
| 👤 Complainant Records | Stores complainant information. |
| 👥 Respondent Records | Stores respondent information. |
| 📁 Case Management | Stores information about filed cases. |
| 📍 Address Records | Maintains separate address records for complainants and respondents. |
| 📅 Hearing Records | Stores hearing schedules and related information. |
| 🤝 Settlement Records | Stores information about case settlements. |
| 📄 Case Documentation | Organizes records related to case proceedings. |

## 🛠️ Technologies Used

- **MySQL** – Relational database management system.
- **phpMyAdmin** – Database administration and management.
- **XAMPP** – Local development environment.

## 📂 Repository Structure

```text
lupon-database/
│
├── database/
│   ├── lupon_db.sql
│   ├── schema.sql
│   └── sample_data.sql
│
├── documentation/
│   ├── database_overview.md
│   ├── database_tables.md
│   ├── relationships.md
│   └── erd.png
│
├── screenshots/
│   ├── database_structure.png
│   ├── database_designer.png
│   └── sample_records.png
│
├── README.md
└── .gitignore
```

## 🚀 Getting Started

Want to explore the database? Follow these steps!

### 1. Prepare the Environment

- Install [XAMPP](https://www.apachefriends.org/).
- Open XAMPP Control Panel.
- Start **Apache** and **MySQL**.

### 2. Open phpMyAdmin

Visit:

`http://localhost/phpmyadmin`

### 3. Create the Database

Create a new database named:

`lupon_db`

### 4. Import the SQL File

1. Select the `lupon_db` database.
2. Click the **Import** tab.
3. Choose `lupon_db.sql` from the database folder.
4. Click **Import** or **Go**.
5. Wait for the import process to finish.

🎉 Congratulations! Your database is ready to explore.

## 🗃️ Database Contents

This repository contains three main SQL files:

| File | Purpose |
|---|---|
| `lupon_db.sql` | Complete database export containing structure and data. |
| `schema.sql` | Database structure, including tables and relationships. |
| `sample_data.sql` | Sample records for testing and development. |

<details>
<summary>📖 Click here to understand the SQL files</summary>

**1. lupon_db.sql**

The complete database backup. Use this if you want to restore the database in one import.

**2. schema.sql**

Contains the database structure, such as table definitions, columns, keys, and relationships.

**3. sample_data.sql**

Contains example records that can be imported separately for testing.

</details>

## 💻 Sample SQL Query

Want to see how SQL works? Here is a simple example of retrieving case records:

```sql
SELECT *
FROM case_table;
```

To retrieve a specific case:

```sql
SELECT *
FROM case_table
WHERE case_id = 1;
```

## 📸 Screenshots

Explore the database structure and design below.

<!-- Add your screenshots here -->

| Database Structure | Database Designer |
|---|---|
| Add screenshot here | Add screenshot here |

## 📝 Project Notes

- This repository focuses on the database component of the LUPON Case Management System.
- Sample records should be used for testing and demonstration.
- Do not upload confidential personal information or actual case records.
- Keep a backup of your database before making major changes.

---

## 🤝 Contributions & Development

This project may be improved through database optimization, additional relationships, improved queries, and other database enhancements.

If you have suggestions or improvements, feel free to explore the repository.

## ⭐ Support the Project

If you find this project useful, consider giving this repository a **star ⭐** on GitHub!

Your support is appreciated.

---

<p align="center">
  <b>⚖️ LUPON Database</b><br>
  <i>Building a more organized approach to barangay case management.</i>
</p>
