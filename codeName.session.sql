-- Task 1 
Select c.first_name || '' || c.last_name AS customer_name,
SUM(oi.quantity *oi.unit_price) AS total_spend
FROM customers AS c
JOIN orders as o 
ON o.customer_id = c.id 
JOIN order_items AS oi 
ON oi.order_id = o.id
GROUP BY c.id, customer_name
ORDER BY total_spend DESC
LIMIT 5;


-- Task 2
SELECT p.category,
SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items AS oi
JOIN orders AS o 
ON oi.order_id = o.id 
JOIN products AS p 
ON oi.product_id = p.id 
GROUP BY p.category
ORDER BY revenue DESC

-- Task 3
SELECT
e.first_name,   
e.last_name,
d.name AS department_name,
e.salary,
dept.avg_salary
FROM employees e
JOIN departments d
    ON e.department_id = d.id
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) dept
    ON e.department_id = dept.department_id
WHERE e.salary > dept.avg_salary
ORDER BY department_name, salary DESC;

-- Task 4

SELECT
    city,
    loyalty_level,
    COUNT(*) AS customer_count
FROM customers
GROUP BY city, loyalty_level
ORDER BY city, loyalty_level;