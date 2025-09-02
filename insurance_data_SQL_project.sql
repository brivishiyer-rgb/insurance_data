CREATE TABLE insurance_data (
    age INT,
    sex VARCHAR(10),
    bmi DECIMAL,
    children INT,
    smoker VARCHAR(5),
    region VARCHAR(50),
    charges DECIMAL
);
----

Select * From insurance_data
--------------------------------

----- Average BMI for males versus females
SELECT
    sex,
    AVG(bmi) AS average_bmi
FROM
    insurance_data
GROUP BY
    sex;
	
-------Number people fall into each age group (e.g., '18-25', '26-40', '41-55', '56+')
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 40 THEN '26-40'
        WHEN age BETWEEN 41 AND 55 THEN '41-55'
        ELSE '56+'
    END AS age_group,
    COUNT(*) AS number_of_people
FROM
    insurance_data
GROUP BY
    age_group
ORDER BY
    age_group;
	
------- top 5 most expensive insurance charges
SELECT
    *
FROM
    insurance_data
ORDER BY
    charges DESC
LIMIT 5;

-----average charge for smokers versus non-smokers
SELECT
    smoker,
   ROUND(AVG(charges), 2) AS average_charges
FROM
    insurance_data
GROUP BY
    smoker;

------How many children do people with the highest charges have?
SELECT
    children
FROM
    insurance_data
ORDER BY
    charges DESC
LIMIT 1;

------ average charge per region for non-smokers
SELECT
    region,
     ROUND(AVG(charges), 2) AS average_non_smoker_charges
FROM
    insurance_data
WHERE
    smoker = 'no'
GROUP BY
    region;

--------average BMI for a person with at least two children
SELECT
    AVG(bmi) AS average_bmi
FROM
    insurance_data
WHERE
    children >= 2;

--------  person with the lowest insurance charge
SELECT
    age, sex, bmi, children, smoker, region, charges
FROM
    insurance_data
ORDER BY
    charges ASC
LIMIT 1;

-------total number of individuals in each region
SELECT
    region,
    COUNT(*) AS number_of_individuals
FROM
    insurance_data
GROUP BY
    region;

--------average charge for people with a BMI greater than 30
SELECT
    AVG(charges) AS average_charges_over_30_bmi
FROM
    insurance_data
WHERE
    bmi > 30;

