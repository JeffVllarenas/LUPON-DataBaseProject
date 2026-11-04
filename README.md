# 🏛️ Barangay Case Management Database

> 500 made-up complaints. 22 tables. 11 ready-made routines. Zero real people harmed. 🎉

Welcome! This package turns an **empty** `barangay_case_management_system1` database into a fully stocked playground, with cases that move through the whole Katarungang Pambarangay process: filing, mediation, conciliation, settlement and CTFA.

---

## 📦 What's in the box?

| File | What it does | Run it |
|---|---|---|
| `barangay_case_management_system1.sql` | Builds the 22 empty tables | First, once |
| `seed_all_tables.sql` | Fills **every** table with sample data | Second, once |
| `barangay_routines.sql` | Creates 1 function + 10 stored procedures | Third (safe to re-run) |
| `barangay_queries.sql` | 33 ready-to-run `SELECT` queries | Any time |

---

## 🚀 Quick start (about 5 minutes)

Tick them off as you go ✅

- [ ] Open **phpMyAdmin** and create an empty database named `barangay_case_management_system1`
- [ ] Click the database, open the **Import** tab, and import `barangay_case_management_system1.sql`
- [ ] Import `seed_all_tables.sql` the same way
- [ ] Import `barangay_routines.sql` the same way
- [ ] Open the **Routines** tab and check that you see **11** routines
- [ ] Open the **SQL** tab and run `CALL sp_outcome_summary();` to see your first result 🎯

> ⚠️ **Run the seed script only once.** A second run gives duplicate-ID errors. If you need a clean start, drop the database and begin again from step 1.

---

## 🗺️ The journey of a case

Every one of the 500 cases ends up in exactly one of these four endings:

```
                  📝 Complaint filed
                         │
        ┌────────────────┼──────────────────────┐
        ▼                ▼                      ▼
  🙈 Respondent     🤝 Mediation          ⚖️ Mediation fails
  doesn't show      succeeds                    │
        │                │                      ▼
        ▼                ▼               👥 Pangkat is chosen
  📜 Summon +       ✅ Amicable           and constituted
  rescheduled       settlement                  │
  hearing           (mediation)                 ▼
                                         🗣️ Conciliation hearing
                                          ┌──────┴──────┐
                                          ▼             ▼
                                   ✅ Amicable      📄 CTFA issued
                                   settlement       (go to court)
                                   (conciliation)
```

### 📊 The sample data at a glance

| Ending | Cases | Tables it touches |
|---|---:|---|
| 🙈 Respondent absent (FTA) | 125 | `notice_of_hearing_fta`, `summon` |
| ✅ Settled in mediation | 125 | `notice_of_hearing_mediation`, `amicable_settlement_mediation`, `summon` |
| ✅ Settled in conciliation | 125 | the three Pangkat notice tables, `amicable_settlement_conciliation` |
| 📄 CTFA issued | 125 | the three Pangkat notice tables, `ctfa` |
| **Total** | **500** | |

Plus: 26 case types, 4 roles, 12 Lupon members, 1 Punong Barangay, 12 user accounts and about 2,600 SMS messages. 📱

---

## 🎮 Routine cheat sheet

Open the **SQL** tab, paste a line, press **Go**.

| I want to... | Type this |
|---|---|
| See everything about case #1 | `CALL sp_case_summary(1);` |
| Look up a case by its number | `CALL sp_case_by_number('2026-0001');` |
| Watch a case's timeline | `CALL sp_case_timeline(1);` |
| List all cases in a stage | `CALL sp_cases_by_stage('CTFA issued');` |
| Find a person by name | `CALL sp_search_person('Santos');` |
| See hearings in a date range | `CALL sp_hearings_between('2026-10-01', '2026-11-30');` |
| Read the texts sent for a case | `CALL sp_sms_history(1);` |
| Get a monthly report | `CALL sp_monthly_report(2026);` |
| See who handles the most cases | `CALL sp_pangkat_workload();` |
| Get the grand totals | `CALL sp_outcome_summary();` |
| Ask what stage a case is in | `SELECT fn_case_stage(1);` |

<details>
<summary>🏷️ <b>Valid stage names</b> (click to open)</summary>

Use these exactly as written with `sp_cases_by_stage`:

- `Filed`
- `Respondent absent - rescheduled`
- `For mediation`
- `Settled in mediation`
- `For conciliation`
- `Settled in conciliation`
- `CTFA issued`

</details>

<details>
<summary>💡 <b>Parameter tips</b></summary>

- Numbers (case IDs, years) go in **without** quotes: `CALL sp_case_summary(25);`
- Text and dates go **in** quotes: `'2026-0001'`, `'2026-10-01'`
- Dates use **year-month-day**
- `sp_pangkat_workload()` and `sp_outcome_summary()` need nothing between the brackets

</details>

---

## 🧭 "I want to know..." finder

| Question | Where to look |
|---|---|
| How many rows does each table have? | Query 1 in `barangay_queries.sql` |
| Which case type is the most common? | Query 4 |
| Which barangay files the most complaints? | Query 7 |
| How long do cases take to resolve? | Query 26 |
| Whose phone number failed to get the SMS? | Query 22 |
| Is my data consistent? | Query 33 (the health check) 🩺 |
| Which scheduled hearings are overdue? | Query 32 |

Queries are in the file in the same order as this list's numbers. Run them **one at a time**, because phpMyAdmin only shows the last result when you run many at once.

---

## 🗂️ The 22 tables

<details>
<summary>👤 <b>People and places</b></summary>

`complainant`, `respondent`, `comp_addr_tbl`, `res_addr_tbl`, `punong_barangay`, `lupon_members`, `role_tb`, `user_tb`

</details>

<details>
<summary>📝 <b>The case itself</b></summary>

`complaint_form`, `case_type`, `case_schedule`, `tracking_tb`

</details>

<details>
<summary>📬 <b>Notices and summons</b></summary>

`notice_of_hearing_fta`, `notice_of_hearing_mediation`, `notice_of_hearing_conciliation`, `notice_chosen_pangkat`, `notice_constitution_pangkat`, `summon`

</details>

<details>
<summary>🏁 <b>Outcomes</b></summary>

`amicable_settlement_mediation`, `amicable_settlement_conciliation`, `ctfa`

</details>

<details>
<summary>📱 <b>Messages</b></summary>

`sms_log`: every SMS sent to or received from a complainant or respondent

</details>

---

## 🔑 Test logins

The 12 sample users come from the Lupon members. The pattern:

| Part | Pattern | Example (member 1) |
|---|---|---|
| Username | first initial + last name | `rabellanosa` |
| Email | username + `@barangay.gov.ph` | `rabellanosa@barangay.gov.ph` |
| Password | `Brgy@` + member number + `#26` | `Brgy@01#26` |
| Contact | `0917` + a number | `09170001111` |

> 🚨 **These passwords are plain-text placeholders for testing only.** The `password` column is `varchar(11)`, which is too short for a hashed password. Before using this for real, widen the column (for example `varchar(255)`) and store hashes.

---

## 🧯 Oops! Troubleshooting

<details>
<summary>❌ <b>"Duplicate entry ... for key PRIMARY"</b></summary>

You ran the seed script a second time. Drop the database, recreate it empty, and import the files again in order.

</details>

<details>
<summary>❌ <b>"FUNCTION fn_case_stage does not exist"</b></summary>

The function wasn't created. Import `barangay_routines.sql` again, since it creates the function before the procedures that need it.

</details>

<details>
<summary>❌ <b>Routines import fails near "DELIMITER"</b></summary>

Use the **Import** tab, or paste into the **SQL** tab with the Delimiter box left as `;`. The file already contains its own `DELIMITER $$` lines.

</details>

<details>
<summary>🤔 <b>I ran many queries and only see one result</b></summary>

That's normal in phpMyAdmin. Run queries one at a time.

</details>

<details>
<summary>😬 <b>I dropped a routine or a table by accident</b></summary>

- Routine: import `barangay_routines.sql` again.
- Table or database: rebuild from the original dump, then import the seed script and the routines again.

</details>

---

## 🧠 Mini quiz

Test yourself. Answers are hidden. 🙈

**1. Which routine shows the full story of one case, in date order?**
<details><summary>Show answer</summary>`sp_case_timeline` ⏳</details>

**2. A case has a CTFA. Which two tables prove it?**
<details><summary>Show answer</summary>`ctfa` has the certificate, and `tracking_tb` shows the status `CTFA`.</details>

**3. How many cases ended in each outcome?**
<details><summary>Show answer</summary>125 each. 🎯</details>

**4. What does `SELECT fn_case_stage(1);` return?**
<details><summary>Show answer</summary>The current stage of case 1, such as `Settled in mediation`.</details>

---

## 📝 Good to know

- 🎭 **All data is fictional.** Names, addresses, phone numbers and messages were generated and are not real people.
- 📅 Cases are dated from January to October 2026. The oldest cases have progressed furthest.
- 🔁 Cases where the respondent didn't appear show `For Mediation` in `tracking_tb`, since they're waiting for the rescheduled hearing.
- 🧪 Test everything on a copy of your database before using it for anything real.

Happy querying! 🥳
