SELECT *
FROM Parks_and_Recreation.employee_demographics;

SELECT first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10 + 10
FROM Parks_and_Recreation.employee_demographics;
# PEMDAS; order of operation within my sequl

SELECT DISTINCT first_name
FROM Parks_and_Recreation.employee_demographics;

SELECT DISTINCT Gender
FROM Parks_and_Recreation.employee_demographics;

SELECT DISTINCT first_name, gender
FROM Parks_and_Recreation.employee_demographics;