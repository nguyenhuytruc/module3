use quanlisinhvien;

select *
from student
where studentname like 'h%';

select *
from class
where startdate like '_____12%';

select *
from subject
where credit between 3 and 5;

update student
set classid = 2
where studentid = 1;

select studentname, subname, mark
from student, subject, mark
order by mark, studentname desc;