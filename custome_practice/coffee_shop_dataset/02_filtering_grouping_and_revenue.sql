use coffee_shop_db

select * from customers

select * from products

select * from orders

-- -------------------------------------------------------------------
-- Phase — 1
-- -------------------------------------------------------------------

-- Q18 — Find all orders where customer purchased more than 2 units in a single order.
select order_id,quantity
from orders
where quantity>2

-- Q21 — Show customers who placed exactly one order.
select c.customer_id,c.customer_name
from orders o
join customers c
on o.customer_id = c.customer_id
group by customer_id
having count(*)=3

-- Q12 — Show each store location and number of unique customers.
select store_location,count(distinct customer_id) as number_of_unique_customer
from orders 
group by store_location


-- Q15 — Find total revenue generated per payment method.
select o.payment_method,sum(o.quantity * p.price) as Revenue
from orders o
join products p
on p.product_id = o.product_id
group by o.payment_method


-- Q25 — Calculate daily revenue and sort highest to lowest.
select o.order_date,sum(o.quantity * p.price) as Revenue
from orders o
join products p
on p.product_id = o.product_id
group by order_date 
order by Revenue desc


-- -------------------------------------------------------------------
-- Phase — 2
-- -------------------------------------------------------------------

-- Q16 — Find the product category with highest total quantity sold.
select p.category,sum(o.quantity) as total_quantity_sold
from products p
join orders o
on o.product_id=p.product_id
group by category
order by total_quantity_sold desc
limit 1

-- Q20 — Find average spending per order for each store location.
select o.store_location,round(avg(p.price * o.quantity),2) as average_spending
from orders o
join products p
on p.product_id=o.product_id
group by store_location

-- Q17 — Display customers whose total spending exceeds ₹1000.
select c.customer_id,c.customer_name,sum(o.quantity * p.price ) as total_spending
from orders o
join products p
on o.product_id=p.product_id
join customers c
on c.customer_id=o.customer_id
group by c.customer_id
having total_spending>1000


-- Q26 — Find categories where average product price exceeds ₹180.
select p.category,round(avg(p.price),2) as average_price
from products p
join orders o
on o.product_id = p.product_id
group by p.category
having average_price > 180

-- Q27 — Show customer cities sorted by total quantity purchased.
select o.store_location,sum(o.quantity) as total_quantity
from orders o
group by store_location 
order by total_quantity desc
