use quanlisinhvien;
-- hiển thị thông tin môn học có credit lớn nhất
select *
from subject
group by subname
having credit >= all (select credit from subject);

-- hiển thị các thông tin môn học có điểm thi lớn nhất
select *
from mark
group by mark
having mark >= all (select mark from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên
-- xếp hạng theo thứ tự điểm giảm dần
select *,avg(mark)
from student s join mark m on s.studentid = m.studentid
group by s.studentid, s.studentname
order by mark desc;