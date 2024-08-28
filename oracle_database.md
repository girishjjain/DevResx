# Oracle Database

## Queries
* Alter a table and add new column 
  ```sql
  ALTER TABLE table_name
  ADD column_name TIMESTAMP NULL;
  ```
* Finding all tables that have couple of given columns
  ```sql
  select table_name, count(table_name) from user_tab_cols where column_name = 'CLAIM_ID' OR column_name='MEMBER_DOB' group by table_name having count(table_name) > 1;
  ```
* List all tables
  ```sql
  select * from user_tables
  ```
* Get current date 
  ```sql
  select SYSDATE from dual;
  ```
  * `SYSDATE` function takes no parameter and returns current date and time
  * `DUAL` - In Oracle Database, DUAL is a special, single-row, single-column table that is part of the Oracle data dictionary. It is often used as a dummy table to select or compute values that do not actually come from a table or to call functions or expressions that do not require data from a table. 