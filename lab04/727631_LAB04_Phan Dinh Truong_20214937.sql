-- 1. Write a query to find the name (first_name, last_name) and the salary of the employees who have 
-- a higher salary than the employee whose last_name='Bull'.
select concat(first_name, ' ', last_name) as fullname, salary
from employees
where salary > (
	select salary 
    from employees
    where last_name = 'Bull'
);

-- 2. Write a query to find the name (first_name, last_name) of all employees who work in the IT 
-- department (‘IT’ is the name of the department).
select concat(first_name, ' ', last_name) as fullname
from employees e, departments d
where e.department_id = d.department_id and department_name = 'IT';

-- 3. Write a query to find the name (first_name, last_name) of the employees who have a manager and 
-- worked in a USA based department (country_name is ‘United States of America’ and country_id is ‘US’).
select concat(first_name, ' ', last_name) as fullname
from employees e, departments d, locations l
where e.manager_id in (select employee_id from employees)
and e.department_id = d.department_id
and d.location_id = l.location_id
and country_id = 'US';

-- 4. Write a query to find the name (first_name, last_name) of the employees who are managers.
select concat(first_name, ' ', last_name) as fullname
from employees
where employee_id in (
	select manager_id
    from employees
);

-- 5. Write a query to find the name (first_name, last_name), and salary of the employees 
-- whose salary is greater than the average salary.
select concat(first_name, ' ', last_name) as fullname, salary
from employees
where salary > (
	select avg(salary)
    from employees
);

-- 6. Write a query to find the name (first_name, last_name), and salary of the employees
-- who earn more than the average salary and works in any of the IT departments (they have name start with ‘IT’).
select concat(first_name, ' ', last_name) as fullname, salary
from employees e, departments d
where e.department_id = d.department_id
and department_name = 'IT'
and salary > (
	select avg(salary)
    from employees
);

-- 7. Write a query to find the name (first_name, last_name), and salary of the employees who earn
-- more than the earning of Mr. Bell (Bell is his last name).
select concat(first_name, ' ', last_name) as fullname, salary
from employees
where salary > (
	select salary
    from employees
    where last_name = 'Bell'
);

-- 8. Write a query to find the name (first_name, last_name), and salary of the employees who earn
-- the same salary as the minimum salary for all departments.
select concat(first_name, ' ', last_name) as fullname, salary
from employees
where salary = (
	select min(salary) from employees where department_id in (
		select department_id from departments
    )
);

-- 9. Write a query to find the name (first_name, last_name), and salary of the employees whose
-- salary is greater than the average salary of all departments (in other word, greater than
-- every average salary of all corresponding departments).
SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS avg
ON e.department_id = avg.department_id
WHERE e.salary > avg.avg_salary;

-- 10. Write a query to find the name (first_name, last_name) and salary of the employees who earn 
-- a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the 
-- results of the salary of the lowest to highest.
select concat(first_name, ' ', last_name) as fullname, salary
from employees
where salary > (
	select max(salary)
    from employees
    where job_id = 'SH_CLERK'
)
order by salary desc;

-- 11. Write a query to find the name (first_name, last_name) of the employees who are not 
-- supervisors/managers.
select employee_id, concat(first_name, ' ', last_name) as fullname
from employees
where employee_id not in (
	select manager_id
    from employees
);

-- 12. Write a query to display the employee ID, first name, last name, salary of all employees whose
-- salary is above average for their departments.
select e.employee_id, e.first_name, e.last_name, e.salary, s.salary
from employees e, (select avg(salary) as salary, department_id from employees group by department_id) s
where e.salary > s.salary 
and e.department_id = s.department_id;

-- 13. Write a query to fetch even numbered records from employees table.
select * 
from employees 
where employee_id % 2 = 1;

-- 14. Write a query to find the 5th maximum salary in the employees table.
select salary
from (
	select distinct salary
	from employees
	order by salary desc
	limit 5
) s
order by salary asc
limit 1;

-- 15. Write a query to find the 4th minimum salary in the employees table.
select salary
from (
	select distinct salary
	from employees
	order by salary asc
	limit 4
) as s
order by salary desc
limit 1;


-- 16. Write a query to select the last 10 records from a table.
select *
from (
	select *
	from employees
	order by employee_id desc
    limit 10
) s
order by employee_id asc;

-- 17. Write a query to list the department ID and name of all the departments where no employee is working.
select *
from departments
where department_id not in (
	select department_id
    from employees
);

-- 18. Write a query to get 3 maximum salaries.
select distinct salary
from employees
order by salary desc
limit 3;

-- 19. Write a query to get 3 minimum salaries.
select distinct salary
from employees
order by salary asc
limit 3;

-- 20. Write a query to get nth max salaries of employees.
select *
from employees 
where salary = (
	select distinct salary
	from employees
	order by salary desc
	limit (8-1),1
);

-- 1. Write a query to display the name (first_name, last_name) and salary for all employees 
-- whose salary is not in the range $10,000 through $15,000. 
select concat(first_name, ' ', last_name) as full_name, salary
from employees
where salary < 10000 or salary > 15000;

-- 2. Write a query to display the name (first_name, last_name) and department ID of all 
-- employees in departments 30 or 100 in ascending order. 
select concat(first_name, ' ', last_name) as full_name, department_id
from employees
where department_id = 30 or department_id = 100
order by full_name asc;

-- 3. Write a query to display the name (first_name, last_name) and salary for all employees 
-- whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100. 
select concat(first_name, ' ', last_name) as full_name, salary, department_id
from employees
where (salary < 10000 or salary > 15000)
and (department_id != 30 and department_id != 30);

-- 4. Write a query to display the name (first_name, last_name) and hire date for all employees 
-- who were hired in 1987. 
select concat(first_name, ' ', last_name) as full_name, hire_date
from employees
where year(hire_date) = '1987';

-- 5. Write a query to display the first_name of all employees who have both "b" and "c" in 
-- their first name. 
select first_name
from employees
where first_name like '%b%' and first_name like '%c%';

-- 6. Write a query to display the last name, job, and salary for all employees whose job is 
-- that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, 
-- or $15,000. 


-- 7. Write a query to display the last name of employees whose names have exactly 6 characters. 

