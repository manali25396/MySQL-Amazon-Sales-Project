SELECT * FROM amazon.amazon;

-- Adding new column TimeOfDay  
Alter table amazon add column Time_of_Day varchar(50) not null;

update amazon
set Time_of_Day= (case
when hour(time) between 5 and 12 then "Morning"
when hour(time) between 12 and 16 then "Afternoon"
else "Evening"
end);


/*update amazon
set Time_of_Day=(
case
  when 'time' between "00:00:00" and "12:00:00" then "Morning"
  when 'time' between "12:01:00" and "16:00:00" then "Afternoon"
  else "Evening"
end
);
*/


-- Add column Day_name
alter table amazon add column Day_Name varchar(20);

update amazon
set Day_Name=dayname(Date);


-- Add column Month_Name
alter table amazon add column Month_Name varchar(20) not null;

update amazon
set Month_Name= monthname(Date);

/* Q1. What is the count of distinct cities in the dataset? */
  select count(distinct city) as Distinct_City from amazon.amazon;
  /* output: the distinct number of cities is 3 */
  
  
  /* Q2. For each branch , what is the corresponding city? */
  select branch, city from amazon.amazon
  group by branch, city;
  /* output; for branch A city is Yangon, for branch B city is Madalay, for branch C city is Naypyitaw */
  
  /* Q3. What is the count of distinct product lines in the dataset?*/
  select count(distinct product_line) as Number_of_Distinct_Product from amazon.amazon;
 /* output: The number of distinct product is 6*/
 
 /* Q4. which payment method occurs most frequently?*/
 select payment_method, count(payment_method) from amazon.amazon
 group by payment_method
 order by count(payment_method) desc;
 /* Output: Cash payment method tend to occur most frequently as it is highest in count that is 345 */
 
 /* Q5 Which product line has the highest sales?*/
 select product_line, count(product_line) as sales_count from amazon.amazon
 group by product_line 
 order by sales_count desc;
 /* output: The product line Fashion Accessories has the highest sales*/
 
 
/* Q6. How much revenue is generated each month?*/

select month_name,
sum(total) as Monthly_sales from amazon.amazon
group by month_name
order by Monthly_sales desc; 
/*Output: The revenue generated is January:116292.11, February:95727.58, and March:108867 */


/* Q7. In which month did the cost of goods sold reach its peak?*/
select month_name,
sum(cogs) as Total_cogs
from amazon.amazon
group by month_name order by Total_cogs desc;
/* Output: In January the cost of good sold reached its peak */

/* Q8. which product line generated the highest revenue?*/
select product_line,
SUM(total) as Total_revenue from amazon.amazon
group by product_line order by Total_revenue desc; 
/* Output: Food and beverages is the product line which has generated the highest revenue */

/* Q9. In which city was the highest revenue recorded?*/
select city,
SUM(total) as Total_revenue from amazon.amazon
group by city order by Total_revenue desc;
/* output: the highest revenue was recorded in Naypyitaw */


/* Q10.Which product line incurred the highest Value Added Tax?*/
select product_line,
avg(VAT) as Total_Vat
from amazon.amazon
group by product_line 
order by Total_Vat desc; 
/* Output: The Home and lifestyle has the highest Value Added Tax (VAT) */



/* Q11. Calculate average rating for each product line.*/
select product_line, avg(rating) as Average_Rating
from amazon.amazon
group by product_line; 
/*Output: the average rating for each product line is food and beverages:7.11, Health and beauty:6.98 ect */

/* Q.12 How many unique customer types does the data have */
select distinct(customer_type)
from amazon; 
/*Output: The data has 2 unique customer types */

/* Q13. which customer type occur most frequently*/
select customer_type, count(*) as most_frequently
 from amazon.amazon
 group by customer_type; 
 /* Output: Member customer type occur most frequently */


/* Q14. what is the count of distinct payment methods in the dataset*/

select count(distinct payment_method) as Distinct_Payment_Method
from amazon;
/*output: There are 3 distinct payment methods in the dataset*/

/* Q15. Identify the custoemr type with the highest purchase frequency.*/
select customer_type, count(quantity) as Purchased_frequency
from amazon
group by customer_type; 
/*Output: Member custoemr type has the highest purchase frequency */



/*Q16. Determine the predominent gender among customers*/
select gender, count(*) as customer_count
from amazon
group by gender
order by customer_count desc;
/* output: It is evident that male is predominent gender among customers*/


/*Q17. Determine the distribution of genders within each branch.*/
select branch, gender, count(*)
from amazon
group by Gender, branch
order by branch desc; 
/* output: for branch C female is predominent, while for branch A and B male is the predominent*/

/* Q18. Idemtify the time of day when customers provide most ratings*/
select time_of_day, count(rating) as count_rating
from amazon
group by time_of_day
order by count_rating desc;
/* output: The customers provide most ratings in the afternoon which counts 363*/










