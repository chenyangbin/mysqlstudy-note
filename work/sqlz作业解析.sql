CREATE DATABASE demo2;
use demo2;

-- 创建数据库demo2练习
CREATE TABLE class (
    cid INT AUTO_INCREMENT PRIMARY KEY,
    caption VARCHAR(32) NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 插入数据班级
insert into class values('1',"三年二班");
insert into class values('2',"一年三班");
insert into class values('3',"三年一班");
insert into class values('4',"三年二班");
insert into class values('5',"一年二班");
insert into class values('6',"三年三班");
insert into class values('7',"三年一班");
insert into class values('8',"三年二班");
insert into class values('9',"一年三班");
insert into class values('10',"三年三班");
insert into class values('11',"一年三班");


-- 创建学生表student
CREATE TABLE student (
    sid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    gender VARCHAR(8) NOT NULL,
    class_id INT NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 插入学生数据
insert into student values('1',"张三","女",'1');
insert into student values('2',"李四","女",'4');
insert into student values('3',"王五","男",'2');
insert into student values('4',"赵六","女",'3');
insert into student values('5',"田七","女",'5');
insert into student values('6',"江北","男",'10');
insert into student values('7',"齐八","女",'8');
insert into student values('8',"魏九","女",'9');
insert into student values('9',"老石","男",'7');
insert into student values('10',"钱电","女",'6');
insert into student values('11',"张三","男",'11');

-- 创建课程表course

CREATE TABLE course (
    cid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cname VARCHAR(16) NOT NULL,
    teacher_id INT NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 插入课程数据course
insert into course values('1',"生物",'1');
insert into course values('2',"体育",'2');
insert into course values('3',"物理",'3');

-- 创建教师表 teacher
CREATE TABLE teacher (
    tid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tname VARCHAR(32) NOT NULL
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 导入教师数据alter
insert into teacher values('1',"赵老师");
insert into teacher values('2',"钱老师");
insert into teacher values('3',"孙老师");


-- 创建成绩表score
CREATE TABLE score (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    number INT NOT NULL,
    PRIMARY KEY (student_id , course_id)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8;

-- 导入成绩数据
insert into Score values('1' , '1' , 80);
insert into Score values('1' , '2' , 90);
insert into Score values('1' , '3' , 99);
insert into Score values('2' , '1' , 70);
insert into Score values('2' , '2' , 60);
insert into Score values('2' , '3' , 80);
insert into Score values('3' , '1' , 80);
insert into Score values('3' , '2' , 80);
insert into Score values('3' , '3' , 75);
insert into Score values('4' , '1' , 50);
insert into Score values('4' , '2' , 30);
insert into Score values('4' , '3' , 20);
insert into Score values('5' , '1' , 76);
insert into Score values('5' , '2' , 87);
insert into Score values('6' , '1' , 31);
insert into Score values('6' , '3' , 34);
insert into Score values('7' , '2' , 89);
insert into Score values('7' , '3' , 98);

-- 查看成绩数据

select * from course;

select * from score;


-- 习题

-- 6 查看数据库所有的表

show tables;

-- 7 查询所有的搜括老师的姓名
select tname from teacher;

-- 8 查询班级有多少种性别
select distinct gender from student;

-- 9 查询生物课程比物理课程成绩高的童鞋的学生学号
	-- 1 查询出所有学生的生物成绩,和物理成绩
    -- 2 进行比较
    
select student_id, number as sw from student left join score on student.sid = score.student_id where course_id = 1;   -- 拿到所有人的生物成绩`

select student_id, number as wl from student left join score on student.sid = score.student_id where course_id = 3;   -- 拿到所有人的物理成绩`


select A.student_id, sw, wl from (select student_id, number as sw from student left join score on student.sid = score.student_id where course_id = 1) as A left join (select student_id, number as wl from student left join score on student.sid = score.student_id where course_id = 3
) as B on A.student_id = B.student_id where  sw > if(isnull(wl), 0, wl);

-- 10 








