create database Retail_Analytics ;
Use Retail_Analytics;

Create Table Sales_Data(
order_id VARCHAR(20),
order_date DATE,
customer_id VARCHAR(20),
city VARCHAR(50),
sales_channel VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
quantity INT,
unit_price DECIMAL(10,2),
discount_pct INT,
gross_amount DECIMAL(12,2),
discount_amount DECIMAL(12,2),
net_amount DECIMAL(12,2),
payment_method VARCHAR(50)
);

select count(*) as total_records
from sales_data;

Select
    min(order_date) as first_date,
    max(order_date) as last_date
from sales_data;

select count(distinct customer_id) as unique_customers
from sales_data;

select distinct city
from sales_data
order by city;

select distinct category
from sales_data
order by category;


select
    date_format(order_date, '%Y-%m') AS order_month,
    sum(net_amount) as total_revenue
from sales_data
group by date_format(order_date, '%Y-%m')
order by order_month;

select
    customer_id,
    sum(net_amount) as total_revenue
from sales_data
group by customer_id
order by total_revenue desc
limit 10;

select 
    city,
    sales_channel,
    sum(net_amount) as total_revenue
from sales_data
group by city, sales_channel
order by total_revenue desc;

select 
    category,
    sub_category,
    sum(net_amount) as total_revenue,
    sum(quantity) as total_qty
from sales_data
group by category, sub_category
order by total_revenue desc;

select 
    category,
    avg(discount_pct) as avg_discount_pct
from sales_data
group by category;













