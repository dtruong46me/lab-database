-- 1. Write a query to get the first name and hire date from the employees table where 
-- hire date is between '1987-06-01' and '1987-07-30'.
select first_name, last_name, hire_date
from employees
where hire_date between '1987-06-01' and '1987-07-30';

-- 2. Write a query to get the first name, last name who joined in the month of June.
select first_name, last_name, hire_date
from employees
where month(hire_date) = '6';

-- 3. Write a query to get the first name of employees who joined in 1987
select first_name, last_name, hire_date
from employees
where year(hire_date) = '1987';

-- 5. Write a query to get an employee�s ID, last name, and date of first salary of the 
-- employees (assuming employees receive salary on the first day of the next month)
select employee_id, last_name, date_add(LAST_DAY(hire_date), interval 1 day) AS first_salary_date
from employees;

-- 6. Write a query to get first name, hire date and years of experience of the employees.
select first_name, hire_date, timestampdiff(year, hire_date, curdate()) as years_of_exp
from employees;

-- 7. Write a query to get the different department IDs, hire years, and number of employees 
-- who have joined corresponding department in corresponding year.
select department_id, year(hire_date) as hire_year, count(employee_id) as num_employees
from employees
group by department_id, year(hire_date);