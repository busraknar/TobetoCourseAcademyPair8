--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı
select product_name,category_name,company_name from products p inner join categories c on p.category_id = c.category_id 
inner join suppliers s on p.supplier_id = s.supplier_id where units_on_order = (select max(units_on_order) from products) 

--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
select product_id,product_name,company_name,phone from products p inner join suppliers s on p.supplier_id = s.supplier_id 
where units_in_stock = 0

--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
select ship_address,first_name,last_name,order_date from orders o inner join employees e on o.employee_id = e.employee_id
where extract (year from order_date) = 1998 and extract (month from order_date)=3


--28. 1997 yılı şubat ayında kaç siparişim var?
select count(*) from orders where extract (year from order_date)=1997 and extract (month from order_date) = 2

--select date_part('year',order_date) from orders

--29. London şehrinden 1998 yılında kaç siparişim var?
select count(*) from orders where lower (ship_city) = 'london' and date_part('year',order_date)=1998


--30. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
select contact_name,phone from orders o inner join customers c on o.customer_id = c.customer_id
where date_part('year',order_date)=1997 

--31. Taşıma ücreti 40 üzeri olan siparişlerim
select * from orders where freight >40 order by freight

--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
select ship_city,contact_name,company_name from orders o
inner join customers c on o.customer_id=c.customer_id
where freight >40 order by freight

--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf)
select order_date,ship_city,upper(first_name || ' ' ||last_name) as full_name from orders o
inner join employees e on o.employee_id = e.employee_id
where date_part('year',order_date) = 1997

--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
select contact_name,(REGEXP_REPLACE(phone, '\D', '', 'g')) AS formatted_phone,order_date from customers c inner join orders o
on c.customer_id = o.customer_id
where date_part('year',order_date) = 1997

--\D: Bu düzenli ifade, rakam olmayan karakterleri temsil eder. Yani, metin içindeki sayı olmayan karakterleri seçer.
--'': Bu, seçilen rakam olmayan karakterlerin boş bir karakterle ('' ile temsil edilen boşluk) değiştirilmesini sağlar.
--'g': Bu, düzenli ifadeyi küresel (global) bir şekilde uygular. Yani, metindeki tüm rakam olmayan karakterleri seçer ve değiştirir, sadece ilk bulunanı değil.

--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
select order_date,contact_name,first_name,last_name from orders o 
inner join customers c on c.customer_id=o.customer_id
inner join employees e on e.employee_id=o.employee_id 

--36. Geciken siparişlerim?
select * from orders where required_date < shipped_date

--37. Geciken siparişlerimin tarihi, müşterisinin adı
select order_date,company_name from orders o
inner join customers c
on o.customer_id=c.customer_id
where o.required_date < o.shipped_date

--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select product_name,category_name,quantity from orders o
inner join order_details od
on o.order_id = od.order_id
inner join products p
on p.product_id=od.product_id
inner join categories c
on p.category_id=c.category_id
where o.order_id=10248

--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select product_name,company_name from orders o
inner join order_details od
on o.order_id = od.order_id
inner join products p
on p.product_id=od.product_id
inner join suppliers s
on p.supplier_id=s.supplier_id
where o.order_id=10248



--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select product_name,quantity from orders o
inner join order_details od
on od.order_id = o.order_id
inner join products p
on od.product_id = p.product_id
where o.employee_id=3 and date_part('year',order_date)=1997
order by quantity


--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select sum(quantity) as quant, od.order_id,e.first_name,e.last_name, e.employee_id, o.order_date from orders o
inner join order_details od on od.order_id = o.order_id
inner join employees e on e.employee_id = o.employee_id
where date_part('year',order_date)=1997
group by od.order_id,e.first_name,e.last_name,e.employee_id, o.order_date
order by quant desc limit 1

--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
select sum(quantity) as quant,e.first_name,e.last_name, e.employee_id from orders o
inner join order_details od on od.order_id = o.order_id
inner join employees e on e.employee_id = o.employee_id
where date_part('year',order_date)=1997
group by e.employee_id,e.first_name,e.last_name
order by quant desc limit 1

--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select product_name,unit_price,category_name from products p
inner join categories c
on p.category_id=c.category_id
where unit_price = (select max(unit_price) from products)
--order by unit_price desc limit 1


--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select first_name,last_name,order_date,order_id from orders o
inner join employees e
on o.employee_id = e.employee_id
order by order_date


--45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select od.order_id, avg(unit_price) from orders o
inner join order_details od
on o.order_id = od.order_id
group by od.order_id
order by od.order_id desc limit 5


--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select product_name, category_name, sum(quantity) from orders o
inner join order_details od
on od.order_id=o.order_id
inner join products p
on p.product_id=od.product_id
inner join categories c
on c.category_id=p.category_id
where date_part ('month', order_date) = 1
group by product_name,category_name


--47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
select * from orders o
inner join order_details od
on o.order_id=od.order_id
where quantity > (select avg (quantity) from order_details)
order by quantity


--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select product_name,category_name,company_name,quantity,order_date,p.product_id from orders o
inner join order_details od
on o.order_id = od.order_id
inner join products p
on od.product_id=p.product_id
inner join categories c
on c.category_id=p.category_id
inner join suppliers s
on s.supplier_id = p.supplier_id
group by od.product_id,product_name,category_name,company_name,quantity,order_date,p.product_id
order by quantity desc limit 2


--49. Kaç ülkeden müşterim var


--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?


--51. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
select product_name,category_name,quantity from orders o
inner join order_details od
on o.order_id = od.order_id
inner join products p
on p.product_id=od.product_id
inner join categories c
on p.category_id=c.category_id
where o.order_id=10248

--52. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
select product_name,company_name from orders o
inner join order_details od
on o.order_id = od.order_id
inner join products p
on p.product_id=od.product_id
inner join suppliers s
on p.supplier_id=s.supplier_id
where o.order_id=10248

--53. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
select product_name,quantity from orders o
inner join order_details od
on od.order_id = o.order_id
inner join products p
on od.product_id = p.product_id
where o.employee_id=3 and date_part('year',order_date)=1997
order by quantity


--54. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
select sum(quantity) as quant, od.order_id,e.first_name,e.last_name, e.employee_id, o.order_date from orders o
inner join order_details od on od.order_id = o.order_id
inner join employees e on e.employee_id = o.employee_id
where date_part('year',order_date)=1997
group by od.order_id,e.first_name,e.last_name,e.employee_id, o.order_date
order by quant desc limit 1

--55. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
select sum(quantity) as quant,e.first_name,e.last_name, e.employee_id from orders o
inner join order_details od on od.order_id = o.order_id
inner join employees e on e.employee_id = o.employee_id
where date_part('year',order_date)=1997
group by e.employee_id,e.first_name,e.last_name
order by quant desc limit 1

--56. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
select product_name,unit_price,category_name from products p
inner join categories c
on p.category_id=c.category_id
where unit_price = (select max(unit_price) from products)
--order by unit_price desc limit 1

--57. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select first_name,last_name,order_date,order_id from orders o
inner join employees e
on o.employee_id = e.employee_id
order by order_date

--58. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select od.order_id, avg(unit_price) from orders o
inner join order_details od
on o.order_id = od.order_id
group by od.order_id
order by od.order_id desc limit 5

--59. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select product_name, category_name, sum(quantity) from orders o
inner join order_details od
on od.order_id=o.order_id
inner join products p
on p.product_id=od.product_id
inner join categories c
on c.category_id=p.category_id
where date_part ('month', order_date) = 1
group by product_name,category_name

--60. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
select * from orders o
inner join order_details od
on o.order_id=od.order_id
where quantity > (select avg (quantity) from order_details)
order by quantity