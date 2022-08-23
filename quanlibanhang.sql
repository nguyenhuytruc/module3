create database quanlibanhang;
use quanlibanhang;
create table customer (
cid int not null auto_increment primary key,
cname varchar(50),
cage int);
create table orders (
oid int not null auto_increment primary key,
cid int,
odate date,
ototalprice float,
foreign key (cid) references customer (cid)
);
create table product(
pid int not null auto_increment primary key,
pname varchar(50),
pprice float
);
create table orderdetail(
oid int,
pid int,
odqty int,
primary key(oid,pid),
foreign key (oid) references orders(oid),
foreign key (pid) references product(pid));