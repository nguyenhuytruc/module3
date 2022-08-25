select* from demo.products;

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index uidx_productCode on products (productCode);
explain select * from products where productCode = 'c2';

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index cidx_productNamePrice on products(productName,productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where productName = 'beer' or productPrice = 10000;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view as
select productCode, productName, productPrice, productStatus
from products;
select * from product_view;

-- Tiến hành sửa đổi view
create or replace view product_view as
select productCode, productName, productPrice, productStatus, productAmount
from products
where productName = 'tra sua';

-- Xóa view
drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure finAllProduct()
begin
	select * from products;
end; //

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProduct(
in pid int,
in pCode varchar(45),
in pName varchar(45),
in pPrice decimal(12,0),
in pAmount int,
in pDescription varchar(45),
in pStatus bit(1),
out message varchar(45)
)
begin
	insert into `demo`.`products`(`id`,`productCode`, `productName`,`productPrice`, `productAmount`, `productDescription`,`productStatus`)
    values(id ,pCode, pName, pPrice, pAmount, pDescription, pStatus);
	set message = 'thêm thành công';
end;//

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure editProduct(
in pid int,
in pCode varchar(45),
in pName varchar(45),
in pPrice decimal(12,0),
in pAmount int,
in pDescription varchar(45),
in pStatus bit(1),
out message varchar(45)
)
begin
	declare flag boolean;
    set flag = true;
    if(not exists(select id from products where id = pid)) then
    set message = 'id không tồn tại';
    set flag = false;
    end if;
    
    if(flag = true) then
    update products set id = pid,
						productCode = pCode,
                        productName = pName,
                        productPrice = pPrice,
                        productAmount = productAmount,
                        productDescription = pDescription,
                        productStatus = pStatus
                        where id = pid;
	set message = 'Sửa thành công';
	end if;
end;//

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteProduct(
in pid int,
out message varchar(45)
)
begin
	declare flag boolean;
    set flag = true;
    if(not exists(select id from products where id = pid)) then
    set message = 'id không tồn tại';
    set flag = false;
    end if;
    
    if(flag = true) then
    delete from products where id = pid;
    set message = ' Xóa thành công';
    end if;
end;//
