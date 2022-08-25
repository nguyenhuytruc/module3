delimiter //
-- tham số loại IN
create procedure getCusById
(IN cusNum INT (11))
begin
	select * from customers where customerNumber = cusNum;
end; //
call getCusById(175);

delimiter //
-- tham số loại OUT
create procedure GetCustomersCountByCity(
IN in_city varchar(50),
OUT total int
)
begin
	select count (customerNumber)
    into total
    from customers
    where city = in_city;
end;//
call GetCustomersCountByCity('Lyon', @total);
select @total;

delimiter //
-- tham số INOUT
create procedure SetCounter(
INOUT counter int,
IN inc int)
begin
	set counter = counter + inc;
end;//
set @counter = 1;
call SetCounter(@counter,1); -- 2
call SetCounter(@counter,1); -- 3
call SetCounter(@counter,5); -- 8
select @counter; -- 8