# SQL Projects

**Course:** DATA 581 - Data Visualization | Gonzaga University  
**Author:** Harrison Christophersen | MSDS Candidate  

---

## HR Employee SQL Analysis

**File:** `HR_Employee_Analysis.sql`  
**Dataset:** 50 HR employee records across 5 departments, built directly into the script - no external file needed  
**Tool used in class:** [DB Fiddle](https://www.db-fiddle.com) (browser-based, no install required)

---

### Overview

A structured SQL analysis of a simulated HR employee dataset. The script is organized in three sections: schema and data setup, core in-class queries covering fundamental SQL concepts, and extended analytics queries that go deeper into workforce insights.

---

### How to Run

1. Go to https://sqliteonline.com
2. Click **SQLite** in the top bar
3. Paste the contents of `HR_Employee_Analysis.sql` and click **Run**

> Note: SQLite uses `strftime('%Y','now')` instead of `YEAR(CURRENT_DATE)` for the tenure query. All other queries run as-is.

---

### Script Contents

**Section 1 - Schema & Data**
Creates the `Departments` and `Employees` tables and loads 50 employee records across 5 departments (Engineering, Marketing, Finance, Operations, Human Resources).

**Section 2 - In-Class Queries**

| Concept | Example |
|---------|---------|
| SELECT | Retrieve all columns, select specific fields, limit results |
| WHERE | Filter by salary, age, gender, multiple conditions |
| ORDER BY | Sort by salary descending, age ascending |
| Aggregates | COUNT, AVG, MAX, MIN |
| GROUP BY | Headcount and average salary by job level |
| INNER JOIN | Employee names with department names |
| JOIN + GROUP BY | Average salary by department |

**Section 3 - Extended Analytics**

| Query | Purpose |
|-------|---------|
| Salary summary | Min, max, avg, and range in a single query |
| Salary by dept + job level | Cross-tabulation of compensation structure |
| Gender breakdown by dept | Headcount and avg salary split by gender per department |
| Tenure calculation | Years at company derived from HireDate |
| Above-average earners | Employees earning above the company average using a subquery |
| Longest-tenured per dept | Most senior employee in each department using a correlated subquery |
