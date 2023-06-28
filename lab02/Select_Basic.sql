-- 1. Write a query to display the names (first_name, last_name) using alias name 
-- First Name", "Last Name" from the employees.
select first_name as "First Name", last_name as "Last Name"
from employees;

-- 2. Write a query to get unique department ID from employee table.
select distinct department_id
from employees;

-- 3. Write a query to get all employee details (from employee table) who are hired in 2022.
select *
from employees
where hire_date between '2022-01-01' and '2022-12-31';

-- 4. Write a query to get the names (first_name, last_name), salary, PF of the employees 
-- (PF is calculated as 15% of salary).
select first_name, last_name, salary, (0.15 * salary) as PF
from employees;

-- 5. Write a query to get the names (first_name, last_name), salary, PF of the employees 
-- if PF is greater than 10000.
select first_name, last_name, salary, (0.15 * salary) as PF 
from employees
where (0.15 * salary) > 10000;

-- 6. Write a query to get the list of employees and full information of their department 
select *
from employees e, departments d
where e.department_id = d.department_id;

-- 7. Write a query to calculate 171*214+625.
select 171*214+625;

-- 8. Write a query to get the total salaries payable to employees.
select sum(salary)
from employees;

-- 9. Write a query to get the maximum and minimum salary from employees table.
select min(salary), max(salary)
from employees;

-- 10. Write a query to get the average salary and number of employees in the employees table.
select avg(salary), count(employee_id)
from employees;

-- 11. Write a query to get the number of employees working with the company.
select count(*)
from employees;

-- 12. Write a query to get the number of jobs available in the employees table.
select count(distinct job_id)
from employees;

-- 13. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the 
-- employees from employees table.
select concat(first_name, ' ', last_name) as Name
from employees;

-- 14. Write a query to get first name from employees table after removing white spaces from both side. 
select trim(first_name) as 'First Name'
from employees;

-- 15. Write a query to select first 10 records from a table. 
select * 
from employees
limit 10;

-- 16. Write a query to get monthly salary (round 2 decimal places) of each employee
--Note : Assume the salary field provides the 'annual salary' information.
select format(salary / 12.0, 'N2') as monthly_salary
from employees;

-- 17. Write a query to get monthly salary (round 2 decimal places) of each employee if monthly 
-- salary is smaller than 5000
select format(salary / 12.0, 'N2') as monthly_salary
from employees
where salary / 12.0 > 5000;