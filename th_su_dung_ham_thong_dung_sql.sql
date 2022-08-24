use quanlisinhvien;

-- sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select address, count(studentid) as 'số lượng học viên'
from student
group by address;

-- dùng hàm avg để tính đtb các môn học của mỗi học viên
select s.studentid, s.studentname,avg(mark)
from student s join mark m on s.studentid = m.studentid
group by s.studentid, s.studentname;

-- hiển thị học viên có đtb trên 15
select s.studentid, s.studentname,avg(mark)
from student s join mark m on s.studentid = m.studentid
group by s.studentid, s.studentname
having avg(mark) > 15;

-- sử dụng hàm all để tìm hv có đtb lớn nhất
select s.studentid, s.studentname,avg(mark)
from student s join mark m on s.studentid = m.studentid
group by s.studentid, s.studentname
having avg(mark) >= all (select avg(mark) from mark group by mark.studentid);



