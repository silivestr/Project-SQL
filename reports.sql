SELECT EXTRACT(YEAR FROM hire_date) AS year, 
    COUNT(*) AS employees_hired 
FROM 
    public.employees 
GROUP BY 
    EXTRACT(YEAR FROM hire_date) 
ORDER BY 
    year; 


SELECT 
d.departments_name AS department,
COUNT(e.ID) AS total_employees,
AVG(s.meaning) AS avg_salary,
MAX(s.meaning) AS max_salary,
SUM(s.meaning) AS total_salary
FROM 
    public.employees e
JOIN 
    public.salaries s ON e.salary_id = s.ID
JOIN 
    public.departments d ON e.department_id = d.ID
GROUP BY 
    d.departments_name 
ORDER BY 
    department; 


SELECT 
year,
    SUM(hired) AS total_hired,
    SUM(fired) AS total_fired
FROM ( 
SELECT 
    EXTRACT(YEAR FROM hire_date) AS year,
    COUNT(*) AS hired,
    0 AS fired
FROM 
    public.employees
GROUP BY 
    EXTRACT(YEAR FROM hire_date)
UNION ALL
SELECT 
    EXTRACT(YEAR FROM last_updated) AS year,
    0 AS hired,
    COUNT(*) AS fired
FROM 
    public.employees
WHERE 
status = FALSE
GROUP BY 
    EXTRACT(YEAR FROM last_updated)
) 
AS turnover
GROUP BY 
year
ORDER BY 
year;



