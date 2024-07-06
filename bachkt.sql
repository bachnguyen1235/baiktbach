create table Categories(
category_id int PRIMARY key,
category_name text
);
create table Products(
product_id int primary key,
product_name text,
category_id int,
price int,
FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
create table Customers(
customer_id int primary key,
customer_name text,
email text
);
create table Orders(
order_id int primary key,
customer_id int ,
order_date text,
foreign key (customer_id) REFERENCES Customers(customer_id)
);
create table OrderDetails(
order_detail_id int primary key,
order_id int,
product_id int,
quantity int,
foreign key (order_id) REFERENCES Orders(order_id),
foreign key (product_id) REFERENCES Products(product_id)
);
insert into Categories(category_id,category_name)
value(1,"Dien thoai"),(2,"Laptop"),(3,"PC");
insert into Products(product_id,product_name,category_id,price)
value (1,"xiaomi",1,12000000),(2,"assus",2,20000000),(3,"pcBach",3,300000000);
insert into Customers(customer_id,customer_name,email)
value(1,"bach","bach@gmail.com"),(2,"kien","Kien@gmail.com"),(3,"long","long@gmail.com");
insert into Orders(order_id,customer_id,order_date)
value(1,1,"4/5/2024"),(2,2,"3/5/2024"),(3,3,"1/2/2024");
insert into OrderDetails(order_detail_id,order_id,product_id,quantity)
value(1,1,1,1),(2,2,2,1),(3,3,3,1);
update OrderDetails
set quantity = 3
where OrderDetails.order_detail_id =1;
-- cau1:
select Products.product_name 
from Orders
inner join OrderDetails on orders.order_id = orderdetails.order_id
inner join products on OrderDetails.product_id = Products.product_id
where orders.order_id = 1;
-- cau2:
select sum(products.price*OrderDetails.quantity) as tong_hoa_don
from Orders
inner join OrderDetails on orders.order_id = orderdetails.order_id
inner join products on OrderDetails.product_id = Products.product_id
where orders.order_id = 1;
-- cau3
SELECT products.product_id, Products.product_name
FROM products
LEFT JOIN OrderDetails ON Products.product_id = OrderDetails.product_id
WHERE OrderDetails.product_id IS NULL;
 -- cau4
SELECT categories.category_name, COUNT(products.product_id) AS so_luong_san_pham
FROM categories 
LEFT JOIN products ON categories.category_id = products.category_id
GROUP BY categories.category_name;
-- cau 5
SELECT customers.customer_name, SUM(OrderDetails.quantity) AS number_dadat
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN OrderDetails ON orders.order_id = OrderDetails.order_id
GROUP BY customers.customer_name;
-- cau6
SELECT categories.category_name, COUNT(products.product_id) AS soluonglonnhat
FROM categories 
LEFT JOIN products ON categories.category_id = products.category_id
GROUP BY categories.category_name
ORDER BY soluonglonnhat DESC
LIMIT 1;
-- cau7
SELECT c.category_name, SUM(od.quantity) AS soluongdadat
FROM Categories c
LEFT JOIN products p ON c.category_id = p.category_id
LEFT JOIN OrderDetails od ON p.product_id = od.product_id
LEFT JOIN orders o ON od.order_id = o.order_id
GROUP BY c.category_name;










