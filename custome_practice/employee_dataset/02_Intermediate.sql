
-- -------------------------------------------
-- level 2 - 
-- -------------------------------------------
USE company_db;

-- Find the average salary of all employees.
select avg(salary) 
from employees 

-- Find the highest salary.
select * 
from employees 
where salary=(select max(salary) from employees)

-- Find the lowest salary
select * 
from employees 
where salary=(select min(salary) from employees)

-- Count how many employees are in each department.
select department,count(*) 
from employees 
group by department

-- Find the total bonus paid by the company
select sum(bonus) as totol_bonus_paid 
from employees

-- Find departments having more than 10 employees.
select department,count(*) 
from employees 
group by department 
having count(*)>10


-- Find the average salary of each department.
select department,avg(salary)
from employees
group by department 

-- Find the city with the most employees.
select city,count(*) as emp_count 
from employees 
group by city
order by count(*) desc 
limit 1

-- Find the total salary expense.
select sum(salary) from employees






