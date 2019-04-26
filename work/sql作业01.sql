-- 作业alter

use demo;

-- 创建班级表
create table class(   -
	cid int auto_increment primary key,
    caption varchar(10)


);

show databases;
use demo;
select * from class;
-- 插入班级数据
insert into class values(1, '三年二班');
insert into class values(2, '一年二班');
insert into class values(3, '三年一班');

select * from class;

-- 创建学生表
create table student(   
	sid int auto_increment primary key,
    name varchar(10),
    gender varchar(10),
    class_id int(10)

);

use demo;
-- 插入学生数据
insert into student(sid, name, gender, class_id) values (1, '张三', '女', 1);
insert into student(sid, name, gender, class_id) values (2, '李四', '男', 1);
insert into student(sid, name, gender, class_id) values (3, '王五', '男', 2);

select * from student;



-- 创建教师表
create table teacher(
	tid int auto_increment primary key,
    tname varchar(10)

);
-- 插入老师数据
insert into teacher values (1, '赵老师');
insert into teacher values (2, '钱老师');
insert into teacher values (3, '孙老师');
select * from teacher;

-- 创建 course课程表

create table course(
	cid int auto_increment primary key,
    cname varchar(10),
    teacher_id int(10)
    );
-- 插入 course 数据
insert into course values(1, '体育', 1);
insert into course values(2, '体育', 2);    
insert into course values(3, '物理', 3);

update course set cname = '生物' where cid = 1;
select * from course;

-- 创建 score表
create table score(
	sid int auto_increment primary key,
    student_id varchar(10),
    corse_id int(5),
    number int(10)

);

alter table score change student_id student_id int(10);
desc score;

-- 插入score 数据alter
insert into score values(1, 1, 1, 60);
insert into score values(2, 1, 2, 59);
insert into score values(3, 2, 3, 100);
select * from score;

-- 查看数据库索引数据表

show tables;

-- 查看所有老师姓名

select tname from teacher;

-- 查看班级性别
select gender  from student group by gender;

-- 查看生物课程比物理课程高的所有学生的编号
-- select sid from student where 
select  student.sid, student.name, score.number  from student, score where student.sid = score.student_id;

select student.sid,student.name, score.number from student inner join score on student.sid = score.student_id;

-- 先查每个人的生物成绩,再差每个人物理成绩,最后对比
use demo;

select number from course inner join score on course.cid = score.corse_id 
where corse_id = 1;

select number from course inner join score on course.cid = score.corse_id 
where corse_id = 2;

select sid from score 
	where 
    (select number from course inner join score on course.cid = score.corse_id where corse_id = 1)  -- 生物成绩
	>
    (select number from course inner join score on course.cid = score.corse_id where corse_id = 3); -- 物理成绩

use demo;

select student_id,name, avg(number) from score  inner join 
student on score.student_id = student.sid group by name having avg(number) > 60;


select 
	name as '名字',
    student.sid as '学号', 
    count(corse_id) as '选课数',
    sum(number) as '总成绩' 
from 
    student  left outer join  score 
on  
	student.sid = score.student_id 
group by 
	name;

use demo;
    
select count(tname) as '赵xx个数'  from teacher where teacher.tname like'赵__';

select 
	student_id, name 
from 
	student  left outer join  score 
on  
	student.sid = score.student_id 
where 
	corse_id != 2;
    
    
select 
	name,
    student_id,
    group_concat(corse_id)
from 
	student  left outer join  score 
on  
	student.sid = score.student_id 
group by
	student_id
;

select student_id,name from teacher left outer join score on tid = corse_id 

left join student on student_id = student.sid where tname = '孙老师';

select * from student left outer join score on student.sid = student_id group by corse_id;

select student_id, name from student left outer join score on student.sid = student_id where number<60;

select 
	name,
    student.sid
from 
	student  left outer join  score 
on  
	student.sid = score.student_id 
group by
	student_id
having
	count(corse_id)<3
;


select class_id from student where sid = 2; 

select sid, name from student where  class_id = (select student.class_id from student where sid = 2);



