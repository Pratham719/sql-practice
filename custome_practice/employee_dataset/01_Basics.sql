-- -------------------------------------------
-- level 1 - Easy
-- -------------------------------------------

USE company_db;

-- Display all employees.
select * from employees ;

-- Display only employee names, department, and salary
select * from employees where employee_id=1;

-- Find employees who work in the IT department.
select * from employees where department like "IT"

-- Find employees whose salary is greater than 70000.
select * from employees where salary>70000 

-- Display employees from London.
select * from employees where city like "London"

-- Find employees who joined after 2021.
select * from employees where joining_date>'2021-12-31'

-- Display employees sorted by salary
select * from employees order by salary

-- Show the top 10 highest-paid employees
select * from employees order by salary desc limit 10

-- Find employees whose age is between 25 and 35
select * from employees where age between 25 and 35

-- Display employees whose first name starts with "A".
select * from employees where first_name like "A%"


