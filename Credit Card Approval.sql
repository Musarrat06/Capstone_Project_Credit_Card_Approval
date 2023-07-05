USE bank_data;
SELECT * FROM bank_data.credit_card;

-- 1. Group the customers based on their income type and find the average of their annual income.
SELECT Ind_id, Type_income, AVG(Annual_income) AS "Average Income" 
FROM credit_card 
GROUP BY Ind_id, Type_income;

-- 2. Find the female owners of cars and property.
SELECT Ind_id, Gender, Car_owner, Propert_owner, Marital_status, Education, Housing_type 
FROM credit_card 
WHERE gender = 'female' AND car_owner = 'yes' AND Propert_owner = 'yes';

-- 3. Find the male customers who are staying with their families.
SELECT Ind_id, Gender, Car_owner, Propert_owner, Marital_status, Education, Housing_type 
FROM credit_card 
WHERE gender = 'male' AND Housing_type = 'with parents';

-- 4. Please list the top five people having the highest income.
SELECT * FROM credit_card 
ORDER BY Annual_income DESC LIMIT 5;

-- 5. How many married people are having bad credit?
SELECT c.Ind_id, Gender, Marital_status, Annual_income, Type_income, Age, Approval 
FROM credit_card c
RIGHT JOIN credit_card_label cl
ON c.Ind_id = cl.Ind_id 
WHERE Marital_status = 'married' AND Approval = 'Rejected';

-- 6. What is the highest education level and what is the total count?
SELECT count(*) AS "Total No. of Customers", Education 
FROM credit_card
GROUP BY Education;

-- 7. Between married males and females, who is having more bad credit? 
SELECT Gender, Marital_status, Approval, count(Approval) as "Number of bad credit card" 
FROM credit_card c
RIGHT JOIN credit_card_label cl
ON c.Ind_id = cl.Ind_id 
WHERE Approval = 'Rejected' AND Marital_status = "married"
GROUP BY Gender, Marital_status;
