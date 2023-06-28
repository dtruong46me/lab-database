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

-- 1. Write a query to get every phone number in the employees table, within the phone number 
-- the substring '124' will be replaced by '999'.
select phone_number, 
replace(phone_number, '124', '999') as phone_replace
from employees;

-- 2. Write a query to append '@example.com' to email field.
select email, concat(lower(email), '@example.com') as email_address
from employees;

-- 3. Write a query to get the employee id, name (first name + last name) and hire month.
select concat(first_name, ' ', last_name) as full_name, month(hire_date) as hire_month
from employees;

-- 4. Write a query to get the employee id, email id (discard the last three characters).
select employee_id, left(email, length(email)-3) as email_id
from employees;

-- 5. Write a query to find all employees where first names are in the upper case.
select *
from employees
where upper(first_name) = first_name;

-- 6. Write a query to extract the last 4 characters of phone numbers.
select phone_number, right(phone_number, 4) as last_chars
from employees;

-- 7. Write a query to get the last word of the street address.
SELECT REVERSE(SUBSTRING_INDEX(REVERSE(street_address), ' ', 1)) AS last_word
FROM locations;

-- 8. Write a query to get the locations that have minimum street address length
SELECT *
FROM locations
WHERE LENGTH(street_address) = (SELECT MIN(LENGTH(street_address)) FROM locations);

-- 9. Write a query to display the first word from those job titles which contain more than one word.
SELECT job_title, SUBSTRING_INDEX(job_title, ' ', 1) AS first_word
FROM jobs
WHERE LENGTH(job_title) - LENGTH(REPLACE(job_title, ' ', '')) > 0;

-- 10. Write a query to display the length of first name for employees where the last name contains character 'c' after 2nd position.*/
SELECT first_name, LENGTH(first_name) AS length
FROM employees
WHERE SUBSTRING(last_name, 3) LIKE '%c%';

-- 11. Write a query that displays the first name and the length of the first name for all employees
-- whose name starts with the letters 'A', 'J' or 'M'. Sort the results by the employees' first names.
SELECT first_name, LENGTH(first_name) AS length
FROM employees
WHERE first_name LIKE 'A%' OR first_name LIKE 'J%' OR first_name LIKE 'M%'
ORDER BY first_name;


--12.	Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT first_name, LPAD(salary, 10, '$') AS SALARY
FROM employees;

--13.	Write a query to display the first eight characters of the employees' first names and indicate the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.
SELECT LEFT(first_name, 8) AS first_name, CONCAT('$', FLOOR(salary / 1000), 'K') AS salary
FROM employees
ORDER BY salary DESC;

--14.	Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE DAY(hire_date) = 7 OR MONTH(hire_date) = 7;
