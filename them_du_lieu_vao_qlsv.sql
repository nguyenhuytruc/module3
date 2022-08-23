use quanlisinhvien;
insert into class
value (1, 'A1', '2008-12-20',1);
insert into class
value (2, 'A2', '2008-12-22', 1);
insert into class
value (3, 'B3', current_date, 0);

insert into student(studentname, address, phone, status, classid)
value ('Truc', 'Hue' , '0901517061', 1, 1);
insert into student(studentname, address,status, classid)
value ('Nhat', 'Ha Noi', 1,1);
insert into student (studentname, address, phone, status, classid)
value ('Hoa', 'HCM', '0123456789', 0, 2);

insert into subject
value (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
insert into mark (subid, studentid, mark, examtimes)
value (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);