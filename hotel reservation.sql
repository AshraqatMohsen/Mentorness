SELECT * FROM data_base.`hotel reservation dataset`;

-- 1. What is the total number of reservations in the dataset?
select count(*) as total_res from `hotel reservation dataset`;

-- 2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(*) AS total_res
FROM `hotel reservation dataset`
GROUP BY type_of_meal_plan
ORDER BY total_res DESC
LIMIT 1;

-- 3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) as avg_price_per_room from `hotel reservation dataset` where no_of_children>0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select count(*) as total_res from `hotel reservation dataset` where year(arrival_date)=2018;

-- 5. What is the most commonly booked room type?
select room_type_reserved,count(*) as total_res from `hotel reservation dataset` 
group by room_type_reserved 
order by total_res DESC limit 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select count(*) as weekend_res from `hotel reservation dataset` where no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
select max(lead_time) as max_lead_time from `hotel reservation dataset`;
select min(lead_time) as min_lead_time from `hotel reservation dataset`;

-- 8. What is the most common market segment type for reservations?
select market_segment_type,count(*) as total_res from `hotel reservation dataset`
group by market_segment_type 
order by total_res DESC limit 1;

-- 9. How many reservations have a booking status of "Confirmed"?
select count(*) as confirmed from `hotel reservation dataset` where booking_status = "Not_Canceled";

-- 10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as total_adults from `hotel reservation dataset`;
select sum(no_of_children) as total_children from `hotel reservation dataset`;
-- or
 select sum(no_of_adults) as total_adults, sum(no_of_children) as total_children from `hotel reservation dataset`;
 
 -- 11. What is the average number of weekend nights for reservations involving children?
 select avg(no_of_weekend_nights) as avg_of_weekend_nights from `hotel reservation dataset` where no_of_children>0;
 
 -- 12. How many reservations were made in each month of the year?
 select month(arrival_date) as month_res,count(*) as total_res from `hotel reservation dataset`
 group by month_res ;
 
 -- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
 select room_type_reserved , avg(no_of_weekend_nights) as avg_of_weekend_nights ,avg(no_of_week_nights) as avg_of_week_nights
 from `hotel reservation dataset`
 group by room_type_reserved ;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved,count(*) as total_res , avg(avg_price_per_room) as avg_price from `hotel reservation dataset`
where  no_of_children>0 
group by room_type_reserved;

-- 15. Find the market segment type that generates the highest average price per room.
select market_segment_type, avg(avg_price_per_room) as avg_price from `hotel reservation dataset`
group by market_segment_type
order by avg_price DESC limit 1;