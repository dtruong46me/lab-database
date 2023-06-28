-- 1. Write a query to list the number of jobs available in the employees table.
select count(distinct job_id) 
from employees;

-- 2. Write a query to get the total salaries payable to employees in each department.
select department_id, sum(salary)
from employees 
group by department_id;

-- 3. Write a query to get the minimum salary for each job
select job_id, min(salary)
from employees
group by job_id;

-- 4. Write a query to get the maximum salary of an employee working as a Programmer (job title)
select max(salary) as max_salary
from employees
where job_id = (select job_id from jobs where job_title = 'Programmer');

-- 5. Write a query to get the average salary and number of employees working the department 90 (department id).
select avg(salary) as average_salary, count(employee_id) as count_employees
from employees e
where department_id = 90;

-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees.
select max(salary) as max_, min(salary) as min_, sum(salary) as total_, avg(salary) as avg_
from employees;

-- 8. Write a query to get the difference between the highest and lowest salaries.
select max(salary) - min(salary) as salary_diff
from employees;

-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select manager_id, min(salary) as min_salary
from employees
group by manager_id;

-- 11. Write a query to get the average salary for each job ID excluding programmer.
select job_id, avg(salary) as avg_salary
from employees 
where job_id in (select job_id from jobs where job_title != 'Programmer')
group by job_id;

-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary 
-- is greater than or equal to $4000.
select job_id, max(salary)
from employees
group by job_id
having max(salary) > 4000;

-- 14. Write a query to get the average salary for all departments employing more than 10 employees.
select department_id, avg(salary) as avg_salary
from employees
group by department_id
having count(department_id) > 10;