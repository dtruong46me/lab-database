-- 1. Write a query to display the names (first_name, last_name) using alias name 
-- First Name", "Last Name" from the employees.
select first_name as "First Name", last_name as "Last Name"
from employees

-- 2. Write a query to get unique department ID from employee table.
select distinct department_id
from employees

-- 3. Write a query to get all employee details (from employee table) who are hired in 2022.
select *
from employees
where hire_date between '2022-01-01' and '2022-12-31'

-- 4. Write a query to get the names (first_name, last_name), salary, PF of the employees 
-- (PF is calculated as 15% of salary).
select first_name, last_name, salary, (0.15 * salary) as PF
from employees

-- 5. Write a query to get the names (first_name, last_name), salary, PF of the employees 
-- if PF is greater than 10000.
select first_name, last_name, salary, (0.15 * salary) as PF 
from employees
where (0.15 * salary) > 10000

-- 6. Write a query to get the list of employees and full information of their department 
select *
from employees e, departments d
where e.department_id = d.department_id

-- 7. Write a query to calculate 171*214+625.
select 171*214+625

-- 8. Write a query to get the total salaries payable to employees.
select sum(salary)
from employees

-- 9. Write a query to get the maximum and minimum salary from employees table.
select min(salary), max(salary)
from employees

-- 10. Write a query to get the average salary and number of employees in the employees table.
select avg(salary), count(employee_id)
from employees

-- 11. Write a query to get the number of employees working with the company.
select count(*)
from employees

-- 12. Write a query to get the number of jobs available in the employees table.
select count(distinct job_id)
from employees

-- 13. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the 
-- employees from employees table.
select concat(first_name, ' ', last_name) as Name
from employees

-- 14. Write a query to get first name from employees table after removing white spaces from both side. 
select trim(first_name) as 'First Name'
from employees

-- 15. Write a query to select first 10 records from a table. 
select top (10) * 
from employees 

-- 16. Write a query to get monthly salary (round 2 decimal places) of each employee
--Note : Assume the salary field provides the 'annual salary' information.
select format(salary / 12.0, 'N2') as monthly_salary
from employees;

-- 17. Write a query to get monthly salary (round 2 decimal places) of each employee if monthly 
-- salary is smaller than 5000
select format(salary / 12.0, 'N2') as monthly_salary
from employees
where salary / 12.0 > 5000


-- -------------------------------------------------------------------------

-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, 
-- country_name) of all the departments.
select distinct d.location_id, street_address, postal_code, city, state_province, country_name
from departments d join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id

-- 2. Write a query to find the name (first_name, last name), department ID and department name 
-- of all the employees.
select concat(first_name, ' ', last_name), e.department_id, department_name
from employees e join departments d on e.department_id = d.department_id

-- 3. Write a query to find the name (first_name, last_name), job, department ID and department 
-- name of the employees who works in London.
select concat(first_name, ' ', last_name) as name, e.job_id, e.department_id, d.department_name
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id 
where l.city = 'London'

-- 4. Write a query to find the employee id, name (last_name) along with their manager 
-- (manager_id, last_name).
select e1.employee_id, e1.last_name, e2.employee_id, e2.last_name
from employees e1 join employees e2 on e1.manager_id = e2.employee_id

-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who 
-- was hired after 'Jones'.
select concat(first_name, ' ', last_name) as name, hire_date
from employees
where hire_date > (
	select hire_date from employees where last_name = 'Jones'
)

-- 7. Write a query to find the employee ID, job title, number of days between ending date and 
-- starting date for all jobs in department having id 90.
select jh.employee_id, j.job_title, datediff(day, jh.start_date, jh.end_date) as num_days
from job_history jh join jobs j on jh.job_id = j.job_id
where jh.department_id = 90

-- 9. Write a query to display the department name, manager name, and city.
select d.department_name, e.first_name, l.city
from departments d join employees e on d.manager_id = e.employee_id
join locations l on d.location_id = l.location_id

-- 11. Write a query to display job title, employee (id, name), and the difference between 
-- salary of the employee and minimum salary for the job.
select j.job_title, e.employee_id, concat(e.first_name, ' ', e.last_name) as name, 
salary - (select min(salary) from employees)
from jobs j join employees e on j.job_id = e.job_id

-- 12. Write a query to display the job history that were done by any employee who is currently 
-- drawing more than 10000 of salary.
select * 
from job_history 
where employee_id in (select employee_id from employees where salary > 10000);


-- -------------------------------------------------------------------------
-- 1. Write a query to list the number of jobs available in the employees table.
select count(distinct job_id) 
from employees

-- 2. Write a query to get the total salaries payable to employees in each department.
select department_id, sum(salary)
from employees 
group by department_id

-- 3. Write a query to get the minimum salary for each job
select job_id, min(salary)
from employees
group by job_id

-- 4. Write a query to get the maximum salary of an employee working as a Programmer (job title)
select max(salary) as max_salary
from employees
where job_id = (select job_id from jobs where job_title = 'Programmer')

-- 5. Write a query to get the average salary and number of employees working the department 90 (department id).
select avg(salary) as average_salary, count(employee_id) as count_employees
from employees e
where department_id = 90

-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary) as max_, min(salary) as min_, sum(salary) as total_, avg(salary) as avg_
from employees

-- 8. Write a query to get the difference between the highest and lowest salaries.
select max(salary) - min(salary) as salary_diff
from employees

-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select manager_id, min(salary) as min_salary
from employees
group by manager_id

-- 11. Write a query to get the average salary for each job ID excluding programmer.
select job_id, avg(salary) as avg_salary
from employees 
where job_id in (select job_id from jobs where job_title != 'Programmer')
group by job_id

-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary 
-- is greater than or equal to $4000.
select job_id, max(salary)
from employees
group by job_id
having max(salary) > 4000

-- 14. Write a query to get the average salary for all departments employing more than 10 employees.
select department_id, avg(salary) as avg_salary
from employees
group by department_id
having count(department_id) > 10