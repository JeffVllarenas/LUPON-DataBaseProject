# ⚖️ LUPON Database
### *Organizing Records. Supporting Justice. Strengthening Communities.*

<p align="center">
  <img src="https://img.shields.io/badge/Database-MySQL-blue?style=for-the-badge&logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/Tool-phpMyAdmin-orange?style=for-the-badge&logo=phpmyadmin&logoColor=white" />
  <img src="https://img.shields.io/badge/Environment-XAMPP-FB7A24?style=for-the-badge&logo=xampp&logoColor=white" />
</p>

Welcome to the **LUPON Database Repository!** 👋

This repository contains the MySQL database for a Barangay Lupon Case Management System. It is designed to organize and manage records related to barangay dispute resolution under the **Katarungang Pambarangay**.

The database supports case management, complainant and respondent records, hearing schedules, settlement records, case progress tracking, SMS history, and reporting.

---

## 📌 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [✨ Database Features](#-database-features)
- [⚙️ Stored Functions and Procedures](#️-stored-functions-and-procedures)
- [🛠️ Technologies Used](#️-technologies-used)
- [🚀 Getting Started](#-getting-started)
- [💻 Sample SQL Queries](#-sample-sql-queries)
- [🔒 Project Notes](#-project-notes)
- [⭐ Support the Project](#-support-the-project)

---

## 🎯 Project Overview

The LUPON Database serves as the data storage foundation of a Barangay Lupon Case Management System.

It provides an organized database structure for storing, retrieving, and maintaining records involved in barangay dispute resolution.

It also includes stored functions and procedures that support common database operations, such as retrieving case information, checking case stages, searching persons, monitoring hearing schedules, and generating reports.

**The goal is simple: Keep records organized and make case information easier to manage.**

## ✨ Database Features

| Feature | Description |
|---|---|
| 👤 Complainant Records | Stores complainant information and contact details. |
| 👥 Respondent Records | Stores respondent information and contact details. |
| 📁 Case Management | Stores complaint information and barangay case numbers. |
| 📍 Address Management | Maintains separate address records for complainants and respondents. |
| 📅 Hearing Management | Stores hearing schedules, types, and statuses. |
| 🤝 Settlement Records | Maintains mediation and conciliation settlement records. |
| 📜 Case Progress Tracking | Supports monitoring of case stages and updates. |
| 📱 SMS History | Stores SMS communication records related to cases. |
| 📊 Reports | Supports case statistics, outcome summaries, and Pangkat workload monitoring. |
| ⚙️ Stored Routines | Provides reusable database operations through stored functions and procedures. |

## ⚙️ Stored Functions and Procedures

The database includes one stored function and ten stored procedures to support different database operations.

### 🔹 Stored Function

| Function | Purpose |
|---|---|
| `fn_case_stage()` | Determines the current recorded stage of a complaint based on its related records. |

### 🔹 Stored Procedures

| Stored Procedure | Purpose |
|---|---|
| `sp_case_summary()` | Retrieves detailed case information, including parties, addresses, schedules, and tracking information. |
| `sp_case_by_number()` | Retrieves case information using a barangay case number. |
| `sp_case_timeline()` | Displays the recorded sequence of events in a case. |
| `sp_cases_by_stage()` | Retrieves cases based on their current stage. |
| `sp_search_person()` | Searches complainants and respondents by name. |
| `sp_hearings_between()` | Retrieves hearing schedules within a specified date range. |
| `sp_sms_history()` | Retrieves SMS communication history for a specific case. |
| `sp_monthly_report()` | Generates a monthly case report for a selected year. |
| `sp_pangkat_workload()` | Displays the number of conciliation cases assigned to Pangkat members. |
| `sp_outcome_summary()` | Summarizes recorded case outcomes. |

<details>
<summary>📖 Explore the case stages</summary>

The `fn_case_stage()` function checks related case records and returns one of the following stages:

- Filed
- CTFA issued
- Settled in conciliation
- For conciliation
- Settled in mediation
- For mediation
- Respondent absent - rescheduled

</details>

## 🛠️ Technologies Used

- **MySQL** – Relational database management system.
- **phpMyAdmin** – Database administration and management.
- **XAMPP** – Local development environment.
- **SQL** – Database queries, stored functions, and stored procedures.

## 🚀 Getting Started

Ready to explore the database? Follow these steps!

### 1. Prepare the Environment

- Install [XAMPP](https://www.apachefriends.org/).
- Open XAMPP Control Panel.
- Start **Apache** and **MySQL**.

### 2. Open phpMyAdmin

Visit:

```text
http://localhost/phpmyadmin
```

### 3. Create the Database

Create a new database named:

```sql
CREATE DATABASE lupon_db;
```

### 4. Import the SQL Files

If you are using separate SQL files:

1. Select the `lupon_db` database.
2. Click the **Import** tab.
3. Import `schema.sql` first.
4. Import `sample_data.sql` next.
5. Import `barangay_routines.sql` last.
6. Wait for each import process to finish.

**Alternative:** You can import `lupon_db.sql` directly if it already contains the complete database structure and records.

🎉 Your database is now ready to explore!

## 💻 Sample SQL Queries

Explore some of the important SQL queries used in the LUPON database. These examples demonstrate how records are retrieved, connected, monitored, and summarized.

### 1. 📁 Retrieve Case Records

Displays the main case information, including case number, case type, complainant, respondent, complaint details, and tracking status.

```sql
SELECT cf.Complaint_id, cf.Brgy_case_no, ct.Case_type,
  CONCAT(co.Complainant_Fname, ' ', co.Complainant_Mname, ' ', co.Complainant_Lname) AS complainant,
  CONCAT(re.Respondent_Fname, ' ', re.Respoondent_Mname, ' ', re.Respondent_Lname) AS respondent,
  cf.Complaint_reason, cf.Relief, cf.Date_of_CreationCF,
  cf.OfficialReceipt_no, tr.trackingtbl_status,
  CONCAT(pb.PB_Fname, ' ', pb.PB_Lname) AS punong_barangay
FROM complaint_form cf
JOIN case_type ct ON ct.Case_type_id = cf.Case_type_id
JOIN complainant co ON co.Complainant_id = cf.Complainant_id
JOIN respondent re ON re.Respondent_id = cf.Respondent_id
JOIN punong_barangay pb ON pb.PB_id = cf.PB_id
LEFT JOIN tracking_tb tr ON tr.Complaint_id = cf.Complaint_id
ORDER BY cf.Complaint_id;
```

### 2. 👥 Retrieve Complainant and Respondent Details

Retrieves the personal information, contact numbers, and addresses of both parties involved in a case.

```sql
SELECT cf.Complaint_id, cf.Brgy_case_no,
  CONCAT(co.Complainant_Fname, ' ', co.Complainant_Lname) AS complainant,
  co.Contact_no AS complainant_contact,
  CONCAT_WS(', ', ca.house_no, ca.street_name, ca.purok,
    ca.barangay, ca.municipality_city, ca.province,
    ca.postal_code) AS complainant_address,
  CONCAT(re.Respondent_Fname, ' ', re.Respondent_Lname) AS respondent,
  re.Contact_no AS respondent_contact,
  CONCAT_WS(', ', ra.house_no, ra.street_name, ra.purok,
    ra.barangay, ra.municipality_city, ra.province,
    ra.postal_code) AS respondent_address
FROM complaint_form cf
JOIN complainant co ON co.Complainant_id = cf.Complainant_id
JOIN comp_addr_tbl ca ON ca.comp_addr_id = co.comp_addr_id
JOIN respondent re ON re.Respondent_id = cf.Respondent_id
JOIN res_addr_tbl ra ON ra.res_addr_id = re.res_addr_id
ORDER BY cf.Complaint_id;
```

### 3. 📜 Monitor Case Stages

Determines the current recorded stage of each case based on its related notices, settlements, and Certificate to File Action (CTFA) records.

```sql
SELECT cf.Complaint_id, cf.Brgy_case_no,
  CASE
    WHEN c.CTFA_id IS NOT NULL THEN 'CTFA issued'
    WHEN sc.ASC_id IS NOT NULL THEN 'Settled in conciliation'
    WHEN cp.NoticeOfHearingCP_id IS NOT NULL THEN 'For conciliation'
    WHEN sm.ASM_id IS NOT NULL THEN 'Settled in mediation'
    WHEN mp.NoticeOfHearingMP_id IS NOT NULL THEN 'For mediation'
    WHEN fta.NoticeOfHearing_FTA_id IS NOT NULL
      THEN 'Respondent absent - rescheduled'
    ELSE 'Filed'
  END AS stage
FROM complaint_form cf
LEFT JOIN ctfa c ON c.Complaint_id = cf.Complaint_id
LEFT JOIN amicable_settlement_conciliation sc
  ON sc.Complaint_id = cf.Complaint_id
LEFT JOIN notice_of_hearing_conciliation cp
  ON cp.Complaint_id = cf.Complaint_id
LEFT JOIN amicable_settlement_mediation sm
  ON sm.Complaint_id = cf.Complaint_id
LEFT JOIN notice_of_hearing_mediation mp
  ON mp.Complaint_id = cf.Complaint_id
LEFT JOIN notice_of_hearing_fta fta
  ON fta.Complaint_id = cf.Complaint_id
ORDER BY cf.Complaint_id;
```

### 4. 📅 View Upcoming Hearing Schedules

Retrieves scheduled hearings set for today or future dates, including the case number, hearing type, time, complainant, and respondent.

```sql
SELECT cs.schedule_id, cf.Brgy_case_no,
  cs.Hearing_type, cs.Hearing_date,
  cs.Hearing_time, cs.Remarks,
  CONCAT(co.Complainant_Fname, ' ', co.Complainant_Lname) AS complainant,
  CONCAT(re.Respondent_Fname, ' ', re.Respondent_Lname) AS respondent
FROM case_schedule cs
JOIN complaint_form cf ON cf.Complaint_id = cs.Complaint_id
JOIN complainant co ON co.Complainant_id = cf.Complainant_id
JOIN respondent re ON re.Respondent_id = cf.Respondent_id
WHERE cs.Schedule_status = 'Scheduled'
  AND cs.Hearing_date >= CURDATE()
ORDER BY cs.Hearing_date, cs.Hearing_time;
```

### 5. 📊 Count Cases by Case Type

Shows the total number of recorded cases for each case type.

```sql
SELECT ct.Case_type_id, ct.Case_type,
  COUNT(cf.Complaint_id) AS total_cases
FROM case_type ct
LEFT JOIN complaint_form cf
  ON cf.Case_type_id = ct.Case_type_id
GROUP BY ct.Case_type_id, ct.Case_type
ORDER BY total_cases DESC, ct.Case_type;
```

### 6. 📆 Generate Monthly Case Reports

Counts the number of cases filed per month based on their creation dates.

```sql
SELECT
  DATE_FORMAT(Date_of_CreationCF, '%Y-%m') AS month_filed,
  COUNT(*) AS total_cases
FROM complaint_form
GROUP BY month_filed
ORDER BY month_filed;
```

### 7. 🤝 Summarize Case Outcomes

Provides a summary of recorded case outcomes, including failure to appear, mediation settlements, conciliation, and CTFA issuance.

```sql
SELECT 'Respondent absent (FTA)' AS outcome,
  COUNT(*) AS total_cases
FROM notice_of_hearing_fta

UNION ALL

SELECT 'Settled in mediation', COUNT(*)
FROM amicable_settlement_mediation

UNION ALL

SELECT 'Referred to conciliation', COUNT(*)
FROM notice_of_hearing_conciliation

UNION ALL

SELECT 'Settled in conciliation', COUNT(*)
FROM amicable_settlement_conciliation

UNION ALL

SELECT 'CTFA issued', COUNT(*)
FROM ctfa;
```

**Note:** These queries are based on the database tables and SQL statements in this repository. Results depend on the available records in the database.

---

## 🔒 Project Notes

- This repository focuses on the database component of the LUPON Case Management System.
- Use sample records for testing and demonstration.
- Do not upload confidential personal information or actual case records.
- Back up your database before making major changes.
- Import stored routines only after the required database tables have been created.
- Use the appropriate SQL file depending on whether you need the complete database or separate database components.

## ⭐ Support the Project

If you find this project useful, consider giving this repository a **star ⭐** on GitHub!

Your support is appreciated.

---

<p align="center">
  <b>⚖️ LUPON Database</b><br>
  <i>Building a more organized approach to barangay case management.</i>
</p>
