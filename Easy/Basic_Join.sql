
/* Population Census */
/* Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
Input Format
The CITY and COUNTRY tables are described as follows:*/

SELECT SUM(T.POP_CITY) AS POP FROM
(SELECT CITY.POPULATION AS POP_CITY, 
       CITY.CountryCode AS COUNTRYCODE, 
       COUNTRY.CONTINENT AS CONTINENT
FROM CITY INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code WHERE COUNTRY.CONTINENT = 'Asia') T


/* Average Population of Each Continent*/
/* Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
Input Format
The CITY and COUNTRY tables are described as follows:*/

SELECT AFRICA.NAME AS AFRICA_CITIES FROM 
(SELECT CITY.NAME AS NAME,
        CITY.COUNTRYCODE AS COUNTRYCODE,
        COUNTRY.CONTINENT AS CONTINENT 
 FROM CITY INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code WHERE COUNTRY.CONTINENT = 'Africa') AFRICA
 
 /* Average Population of Each Continent */
/*Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average c
ity populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
Input Format
The CITY and COUNTRY tables are described as follows:*/

SELECT 
    COUNTRY.CONTINENT, 
    FLOOR(AVG(CITY.POPULATION))
FROM 
    CITY 
INNER JOIN 
    COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY 
    CONTINENT 
 

 /* Average Population of Each Continent */
/*Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't 
want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -
- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name
and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, 
order those particular students by their marks in ascending order.

Write a query to help Eve.*/    
      
SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS JOIN GRADES
WHERE students.marks >= grades.min_mark 
AND students.marks <= grades.max_mark
ORDER BY GRADE DESC, NAME



