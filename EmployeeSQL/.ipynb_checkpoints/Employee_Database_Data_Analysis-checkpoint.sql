--#### Data Analysis
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
create view list_1 as
select e.emp_no as "Employee Number",e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
from employees as e
inner join salaries as s on
e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW list_2 AS
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE hire_date > '1985-12-31' and hire_date < '1987-01-01'; 

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
create view list_3 AS
select dpm.dept_no as "Department Number", dp.dept_name as "Department Name", dpm.emp_no as "Manager Employee Number", e.last_name as "Last Name", e.first_name as "First Name"
from dept_manager as dpm
inner join departments as dp on dp.dept_no = dpm.dept_no
inner join employees as e on e.emp_no = dpm.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
create view list_4 as
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
from employees as e
inner join dept_emp as de on de.emp_no = e.emp_no
inner join departments as d on d.dept_no = de.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
create view list_5 as
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name Like '%Hercules%' and last_name Like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
create view list_6 as
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", dp.dept_name as "Department Name"
from employees as e
inner join (select s.dept_name, d.emp_no 
			from dept_emp as d inner join (select * from departments 
										  where dept_name Like '%Sales%') as s on s.dept_no = d.dept_no) 
										  as dp on dp.emp_no = e.emp_no;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
create view list_7 as
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", edd.dept_name as "Department Name"
from employees as e
inner join (select de.emp_no, de.dept_no, ds.dept_name
from dept_emp as de
inner join (select * from departments where dept_name Like '%Development%' or dept_name Like '%Sales%') as ds on ds.dept_no = de.dept_no) as edd on edd.emp_no = e.emp_no;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
create view list_8 as
select last_name, count(*) as "Last Name Frequency Count" from employees group by last_name order by count(last_name) desc;

--bonues. Creates a view of a table for salary by title
create view list_bonus as
select t.title as "Title", s.salary as "Salaries"
from employees as e
inner join titles as t on t.title_id = e.emp_title_id
inner join salaries as s on s.emp_no = e.emp_no;

--Please run the following individually to view the view of tables created above. 
select * from list_1;
select * from list_2;
select * from list_3;
select * from list_4;
select * from list_5;
select * from list_6;
select * from list_7;
select * from list_8;
select * from list_bonus;