-- Database: northwindt

-- DROP DATABASE IF EXISTS northwindt;

select company_name from suppliers
where exists( Select product_name from products
			where products.supplier_id= suppliers.supplier_id
			and unit_price<20)
			
select company_name from suppliers
inner join products
on products.supplier_id= suppliers.supplier_id
			and unit_price<20	
			
--Tarrihler arasında sipariş almış olan çalışanlar
select employee_id, first_name, last_name from employees
where exists(select * from orders
			where employees.employee_id= orders.employee_id
			AND orders.order_date between '3/5/1998' AND '4/9/1998')
			
select employees.employee_id, employees.first_name, employees.last_name from employees
inner join orders
on employees.employee_id= orders.employee_id
AND orders.order_date between '3/5/1998' AND '4/9/1998'	

Select product_name from products
Where unit_price >= ALL(Select unit_price from order_details )