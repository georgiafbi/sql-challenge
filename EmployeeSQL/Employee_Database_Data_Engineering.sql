-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/b9YDHu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
-- Determine the relations
-- replace /relationship/ with the type of relationship to corresponding table
drop table departments, titles, employees;

CREATE TABLE departments(
    dept_no VARCHAR(30)   NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30)   NOT NULL
);

select * from departments;

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
