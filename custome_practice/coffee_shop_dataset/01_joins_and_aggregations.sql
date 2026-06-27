use coffee_shop_db


select * from customers

select * from products

select * from orders


-- Q1 Find customers who placed more than 2 order
select c.customer_id,c.customer_name 
from customers c
join orders o 
on  c.customer_id = o.customer_id
group by c.customer_id 
having count(*)>2

-- Q2 Show the total quantity sold for each product category.
select p.product_id,p.product_name,count(*) as Quantity
from products p 
join orders o
on o.product_id=p.product_id
group by product_id 


-- Q3 Find the top 5 customers who spent the most money.
select c.customer_id,c.customer_name,sum(p.price*o.quantity) as spend
from orders o
join products p 
	on o.product_id = p.product_id
join customers c
	on o.customer_id = c.customer_id
group by c.customer_id
order by spend desc
limit 5


-- Q4 ⭐ Find products that were purchased in more than one store location.
select p.product_id,p.product_name,count(distinct o.store_location) as store_count
from products p
join orders o
	on o.product_id=p.product_id
group by p.product_id 
having count(distinct o.store_location)>1

-- Q5 Calculate the average order quantity by payment method.
select o.payment_method,round(avg(o.quantity),2) as average_quantity
from orders o
group by o.payment_method

-- Q6 Find customers who joined in February 2025 and made at least one purchase.
select distinct c.customer_id,c.customer_name
from customers c
join orders o
on o.customer_id=c.customer_id
where c.join_date between '2025-02-01' and '2025-02-28'

-- Q7 ⭐ Show the days where total items sold exceeded 4 units.
select order_date,sum(quantity) as item_sold
from orders
group by order_date 
having sum(quantity)>4

-- Q8 Find the highest revenue-generating product.
select p.product_id,p.product_name,sum(price*quantity) as Revenue
from products p
join orders o
on o.product_id = p.product_id
group by product_id
order by Revenue desc 
limit 1

-- Q9 ⭐ Find customers who purchased from more than one category.
select c.customer_id,c.customer_name,count(distinct p.category) as category_count
from orders o
join customers c
	on c.customer_id=o.customer_id
join products p
	on p.product_id=o.product_id
group by customer_id
having count(distinct p.category)>1


-- Q10 Find the city with the highest total sales amount.
select o.store_location,sum(o.quantity*p.price) total_sales
from orders o
join products p
	on p.product_id=o.product_id
group by store_location 
order by total_sales desc
limit 1



