create view list_1 as
select e.emp_no as "Employee Number",e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
from employees as e
inner join salaries as s on
e.emp_no = s.emp_no;

CREATE VIEW list_2 AS
SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE hire_date > '1985-12-31' and hire_date < '1987-01-01'; 

create view list_3 AS
select dpm.dept_no as "Department Number", dp.dept_name as "Department Name", dpm.emp_no as "Manager Employee Number", e.last_name as "Last Name", e.first_name as "First Name"
from dept_manager as dpm
inner join departments as dp on dp.dept_no = dpm.dept_no
inner join employees as e on e.emp_no = dpm.emp_no;

create view list_4 as
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
from employees as e
inner join dept_emp as de on de.emp_no = e.emp_no
inner join departments as d on d.dept_no = de.dept_no;

create view list_5 as
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name Like '%Hercules%' and last_name Like 'B%';

create view list_6 as
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", dp.dept_name as "Department Name"
from employees as e
inner join (select s.dept_name, d.emp_no 
			from dept_emp as d inner join (select * from departments 
										  where dept_name Like '%Sales%') as s on s.dept_no = d.dept_no) 
										  as dp on dp.emp_no = e.emp_no;
										  

create view list_7 as
select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", edd.dept_name as "Department Name"
from employees as e
inner join (select de.emp_no, de.dept_no, ds.dept_name
from dept_emp as de
inner join (select * from departments where dept_name Like '%Development%' or dept_name Like '%Sales%') as ds on ds.dept_no = de.dept_no) as edd on edd.emp_no = e.emp_no;

create view list_8 as
select last_name, count(*) as "Last Name Frequency Count" from employees group by last_name order by count(last_name) desc;