-- Database: northwindt

-- DROP DATABASE IF EXISTS northwindt;

CREATE DATABASE northwindt
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Turkish_Turkey.1254'
    LC_CTYPE = 'Turkish_Turkey.1254'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
--61. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select product_name,category_name,company_name from products p 
inner join categories c on p.category_id = c.category_id 
inner join suppliers s on p.supplier_id = s.supplier_id 
where units_on_order = (select max(units_on_order) from products) 

--62. Kaç ülkeden müşterim var
select count(distinct(country)) as HowManyCountries from customers 
--63. Hangi ülkeden kaç müşterimiz var
select country, count(customer_id) from customers
group by country

--64. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select sum(od.unit_price*od.quantity) as totalPrice from orders o
inner join order_details od
on od.order_id = o.order_id
inner join products p
on od.product_id = p.product_id
where o.employee_id=3 and 
order_date between (select order_date from orders where date_part('year',order_date) 
					= (select  date_part('year',order_date) from orders order by order_date desc limit 1) 
					and date_part('month',order_date)=1 order by order_date limit 1) AND CAST(NOW() AS DATE) 

--65. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?
select SUM(od.unit_price*od.quantity) as carpim from order_details od
inner join orders o
on od.order_id=o.order_id 
where od.product_id=10 and o.order_date= BETWEEN '1998-02-06' and '1998-05-06'
order by order_date DESC

--HATA VAR TEKRAR BAKMALI, hatırladığım kadarıyla yazdım.

66. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?
67. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun
68. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri
69. Brezilya’da olmayan müşteriler
70. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
71. Faks numarasını bilmediğim müşteriler
72. Londra’da ya da Paris’de bulunan müşterilerim
73. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
74. C ile başlayan ürünlerimin isimleri ve fiyatları
75. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
76. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
77. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
78. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
79. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
80. Faks numarasını bilmediğim müşteriler
81. Müşterilerimi ülkeye göre sıralıyorum:
82. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
83. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
84. 1 Numaralı kategoride kaç ürün vardır..?
85. Kaç farklı ülkeye ihracat yapıyorum..?