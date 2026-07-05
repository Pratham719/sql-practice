use coffee_shop_db

select * from customers

select * from products

select * from orders

-- Q11 — Find customers who placed orders on at least 3 different dates.
select c.customer_id,c.customer_name,count(distinct o.order_date) as different_dates
from orders o
join customers c
on c.customer_id = o.customer_id
group by c.customer_id 
having count(distinct o.order_date)>2


-- Q23 — Show dates where more than 3 distinct products were sold.
select distinct order_date,count(*)
from orders 
group by order_date
having count(*)>3


-- Q28 — Find products purchased by at least 5 different customers. ⭐
select o.product_id,count(distinct c.customer_id) as no_of_customer
from customers c
join orders o
on c.customer_id=o.customer_id
group by product_id
having count(distinct c.customer_id)>4


-- Q19 — Find products purchased by customers from more than one city. ⭐
select p.product_id,p.product_name,count(distinct store_location) as city_count
from products p
join orders o
on o.product_id = p.product_id
group by product_id 
having count(distinct store_location)>1


-- Q29 — Find customers whose latest purchase happened after 2025-04-20.
select c.customer_id,c.customer_name,c.city,c.join_date,o.order_date
from customers c
join orders o
on c.customer_id=o.customer_id
where order_date>'2025-04-20'

-- Q14 — Find customers who purchased both Coffee and Dessert categories. ⭐
select c.customer_id,c.customer_name
from orders o
join customers c
	on o.customer_id=c.customer_id
join products p
	on p.product_id=o.product_id
where p.category in("Coffee","Dessert")
group by customer_id
having count(distinct p.category)>1


-- Q24 — Find customers who never purchased Bakery items. ⭐
select distinct c.customer_id,c.customer_name
from customers c
left join orders o
	on c.customer_id=o.customer_id
left join products p
	on p.product_id=o.product_id and p.category="Bakery"
where p.category is null


-- Q30 — For each city show total customers, total orders, and total revenue sorted by revenue.
select c.city,count(distinct c.customer_id) as total_customer,count(distinct o.order_id) as total_orders,sum(o.quantity * p.price) as total_revenue
from customers c
join orders o 
	on o.customer_id=c.customer_id
join products p
	on p.product_id=o.product_id
group by c.city
order by total_revenue desc


-- Q22 — Find the most ordered product in each category (include ties). ⭐
select product_id,
       product_name,
       category,
       order_count
from (
    select p.product_id,
           p.product_name,
           p.category,
           count(*) as order_count,
           rank() over (partition by p.category order by count(*) desc) as rnk
    from products p
    join orders o on o.product_id = p.product_id
    group by p.product_id, p.category
) ranked
where rnk = 1;


-- Q13 — Find products ordered more than the average quantity per order. ⭐
select p.product_id,p.product_name,sum(o.quantity) as quantity
from products p
join orders o 
on o.product_id=p.product_id
group by product_id
having sum(o.quantity)>
	(select avg(order_quantity) 
		from 
		(
		select sum(o2.quantity) as order_quantity 
		from orders o2
		group by order_id
		) as sub
)