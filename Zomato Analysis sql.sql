CREATE DATABASE zomato_analysis;

SELECT * FROM country;
SELECT * FROM currency;
SELECT * FROM zomatosql2;



SELECT Count("restaurantnameCustom") from zomatosql2;

----- Q1 Find the Numbers of Resturants based on City and Country.

SELECT City, count(RestaurantID) FROM zomatosql2
GROUP BY City; 

SELECT  CountryName, count(RestaurantID) FROM zomatosql2
GROUP BY CountryName; 

----- We can use Group By Fir both City And Country
SELECT City, CountryName, count(RestaurantID) FROM zomatosql2
GROUP BY City, CountryName; 


----- Q2) Numbers of Resturants opening based on Year , Quarter , Month

----- Total Resturants Open Yearwise ------
SELECT DISTINCT(Yearopening) AS year, COUNT(*)
FROM zomatosql2
GROUP BY year;

----- Total Resturants Open Quarter ----
SELECT DISTINCT(Quarteropening) AS quartero, COUNT(*)
FROM zomatosql2
GROUP BY quartero
ORDER BY quartero;

-------- Total Resturants Open MonthWise---
SELECT DISTINCT(Monthnames) AS Montho, COUNT(*)
FROM zomatosql2
GROUP BY Montho
ORDER BY Montho;

----- Q3)Count of Resturants based on Average Ratings--
SELECT Rating AS Individualrating,
COUNT(*) AS ResturantCount
FROM zomatosql2
WHERE Rating IS NOT NULL
GROUP BY Rating 
ORDER BY rating ASC;


-- Q4)Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets

SELECT Average_Cost_for_two_in_Dollar,
COUNT(*) AS TotalRestrurants
FROM (SELECT CASE
       WHEN Average_Cost_for_two_in_Dollar BETWEEN 0 AND 300 THEN "0-300"
	   WHEN Average_Cost_for_two_in_Dollar BETWEEN 301 AND 600 THEN "301-600"
       ELSE "other"
      END AS Average_Cost_for_two_in_Dollar
      FROM zomatosql2)
      AS Subquery
      GROUP BY Average_Cost_for_two_in_Dollar;
      
 -- Q5)Percentage of Resturants based on "Has_Table_booking"     
 
 SELECT Has_Table_booking,
 COUNT(*) AS TotalRestaurants,
 ROUND((COUNT(*) / (SELECT COUNT(*) FROM zomatosql2)) * 100,2) AS Percentage
 FROM zomatosql2
 GROUP BY Has_Table_booking; 
 
 -- Q6)Percentage of Resturants based on "Has_Online_delivery"
 
 SELECT Has_Online_delivery,
 COUNT(*) AS TotalRestaurants,
 ROUND((COUNT(*) / (SELECT COUNT(*) FROM zomatosql2)) * 100,2) AS Percentage
 FROM zomatosql2
 GROUP BY Has_Online_delivery;
