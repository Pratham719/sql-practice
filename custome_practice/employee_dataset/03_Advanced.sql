use company_db;

-- Find the employees with the highest salary in each department.
select * 
from employees e 
where e.salary=
(
	select max(salary) 
	from employees 
	where department=e.department
);

-- Find employees earning more than the average salary
select * 
from employees 
where salary>
(
	select avg(salary) 
	from employees
);

-- Find employees who have more than 5 years experience
select * 
from employees 
where experience_years>5;

-- Find the second highest salary
select * 
from employees 
where salary=
(
	select max(salary) 
	from employees 
	where salary<
	(
		select max(salary) 
		from employees 
	)
);

-- Find the employees who received the highest bonus.
select * 
from employees 
where bonus=
(
	select max(bonus) 
	from employees
);

-- Find the department with the highest average salary
select department,avg(salary) as avg_salary
from employees 
group by department 
order by avg_salary desc
limit 1;

-- Find employees who joined before 2020 and have a performance score above 8.
select * 
from employees 
where joining_date<'2020-01-01' and performance_score>8;


-- Find the number of active and inactive employees.
select employment_status,count(*) 
from employees 
group by employment_status;

-- Find employees whose salary is higher than their department average
select * 
from employees e 
where e.salary>
(	
	select avg(salary) 
	from employees 
	where department=e.department
);


-- Find the oldest employee in every department.
select * 
from employees 
order by joining_date limit 1;





