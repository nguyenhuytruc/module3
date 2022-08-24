use quanlibanhang;
insert into customer
values (1, 'Minh Quan', 10),
		(2, 'Ngoc Oanh', 20),
        (3, 'Hong Ha', 50);
        
insert into orders(oid, cid,odate)
values(1, 1, '2006-03-21');
insert into orders (oid, cid,odate)
values(2, 2, '2006-03-23');
insert into orders (oid, cid,odate)
values(3, 1 , '2006-03-16');

insert into product (pid, pname, pprice)
values (1, 'May Giat', 3),
		(2, 'Tu Lanh', 5),
        (3, 'Dieu Hoa', 7),
        (4, 'Quat', 1),
        (5, 'Bep Dien', 2);
        
insert into orderdetail (oid,pid,odqty)
values (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);
        
select oid,odate,ototalprice
from orders;

select cName,pName
from customer c join orders o 
on c.cID=o.cID join orderdetail od 
on o.oID=od.oID join product p 
on od.pID=p.pID;

select cName,count(o.cID)
from customer c left join orders o on c.cID=o.cID
group by cName
having count(o.cID)=0;

select *,sum(odQTY*pPrice) as total
from orders o left join orderdetail od 
on o.oID=od.oID join product p 
on p.pID=od.pID;