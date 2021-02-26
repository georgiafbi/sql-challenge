--####Data Engineering
--* Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

  --* For the primary keys check to see if the column is unique, otherwise create a [composite key](https://en.wikipedia.org/wiki/Compound_key). Which takes to primary keys in order to uniquely identify a row.
  --* Be sure to create tables in the correct order to handle foreign keys.

--* Import each CSV file into the corresponding SQL table. **Note** be sure to import the data in the same order that the tables were created and account for the headers when importing to avoid errors.
--Creates the normalized tables for the employee database

CREATE TABLE departments(
    dept_no VARCHAR(30)   NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30)   NOT NULL
);


CREATE TABLE titles (
    title_id VARCHAR(30)   NOT NULL PRIMARY KEY,
    title VARCHAR(30)   NOT NULL
);

CREATE TABLE employees(
	emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(30)  NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(30)   NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
    dept_no VARCHAR(30)   NOT NULL,
    emp_no INTEGER  NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
    emp_no INTEGER  NOT NULL,
    dept_no VARCHAR(30)   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);
