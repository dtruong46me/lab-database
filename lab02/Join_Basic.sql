
-- 1. Write a query to find the addresses (location_id, street_address, city, state_province, 
-- country_name) of all the departments.
select distinct d.location_id, street_address, postal_code, city, state_province, country_name
from departments d join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id;

-- 2. Write a query to find the name (first_name, last name), department ID and department name 
-- of all the employees.
select concat(first_name, ' ', last_name), e.department_id, department_name
from employees e join departments d on e.department_id = d.department_id;

-- 3. Write a query to find the name (first_name, last_name), job, department ID and department 
-- name of the employees who works in London.
select concat(first_name, ' ', last_name) as name, e.job_id, e.department_id, d.department_name
from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id 
where l.city = 'London';

-- 4. Write a query to find the employee id, name (last_name) along with their manager 
-- (manager_id, last_name).
select e1.employee_id, e1.last_name, e2.employee_id, e2.last_name
from employees e1 join employees e2 on e1.manager_id = e2.employee_id;

-- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who 
-- was hired after 'Jones'.
select concat(first_name, ' ', last_name) as name, hire_date
from employees
where hire_date > (
	select hire_date from employees where last_name = 'Jones'
);

-- 7. Write a query to find the employee ID, job title, number of days between ending date and 
-- starting date for all jobs in department having id 90.
select jh.employee_id, j.job_title, datediff(day, jh.start_date, jh.end_date) as num_days
from job_history jh join jobs j on jh.job_id = j.job_id
where jh.department_id = 90;

-- 9. Write a query to display the department name, manager name, and city.
select d.department_name, e.first_name, l.city
from departments d join employees e on d.manager_id = e.employee_id
join locations l on d.location_id = l.location_id;

-- 11. Write a query to display job title, employee (id, name), and the difference between 
-- salary of the employee and minimum salary for the job.
select j.job_title, e.employee_id, concat(e.first_name, ' ', e.last_name) as name, 
salary - (select min(salary) from employees)
from jobs j join employees e on j.job_id = e.job_id;

-- 12. Write a query to display the job history that were done by any employee who is currently 
-- drawing more than 10000 of salary.
select * 
from job_history 
where employee_id in (select employee_id from employees where salary > 10000);

