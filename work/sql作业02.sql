use demo1;

-- 插入补充数据
insert into class values (4, '三年二班');
insert into class values (5, '一年二班');
insert into class values (6, '三年三班');
insert into class values (7, '三年一班');
insert into class values (8, '三年二班');
insert into class values (9, '一年三班');

desc class;
select * from class;

-- 插入补充数据
insert into student values (4, '赵六', '女', 3);
insert into student values (5, '田七', '女', 2);
insert into student values (6, '江北', '男', 3);
insert into student values (7, '齐八', '女', 3);
insert into student values (8, '魏九', '女', 1);
insert into student values (9, '老石', '男', 2);

-- 插入补充数据
insert into score values (4, 3, 2, 62);
insert into score values (5, 2, 2, 75);
insert into score values (6, 3, 2, 59);
insert into score values (7, 3, 1, 94);
insert into score values (8, 1, 3, 85);
insert into score values (9, 2, 1, 53);

-- 查询选修有一门课程的全部学生学号姓名
select *  from score inner join student on student.sid = score.student_id;

select score.student_id, count(*) from score group by score.student_id;


select * from student, score where score.student_id = student.sid;  






