show databases;   --

create database demo1;   -- 创建数据库

drop database demo1; -- 数据库

show databases;  -- 查看已有数据库

show engines;   -- 查看数据库支持的引擎

show variables like 'storage_engine';  

use demo;   -- 使用数据库

create table demo1(
	id int primary key

    )engine = InnoDB;    -- 创建表的时候设置数据库引擎

create table demo2(

	id int primary key,
    name varchar(10),
    owoner varchar(10),
    sex char(10),
    death char(10)
    )engine = MyISAM;
    
    
show databases;

use demo;

show tables;

select * from demo2;  -- 选择表

show variables like 'storage_engine';

desc demo2; -- 查看表
describe demo2;  -- 查看表

show create table demo2;  -- 查看详细信息
 
 alter table demo2 rename to demo3;  -- 修改表名
 
 show tables;
 
 alter table demo3 modify name varchar(30);
 
 desc demo3; -- 查看表的数据
 
 alter table demo3 change name name1 varchar(10); -- 修改字段名alter
 
 desc demo3; -- 查看表数据
 
 alter table demo3 add age int(10) not null;   -- 添加新字段带有约束条件
 
 desc demo3;
 
show tables; -- 查看表alter

drop table demo1;  -- 删除表

alter table demo3 drop age;  -- 删除表中的age字段

desc demo3;  -- 表内容alter

alter table demo3 modify death char(10) first; -- 将death字段插入到第一列

desc demo3;

alter table demo3 modify sex char after name1;  -- 字段位置调整到指定字段后alter


desc demo3;

show create table demo3; -- 查看表的属性信息alter

alter table demo3 engine = InnoDB;  -- 修改表使用的引擎alter

show create table demo3;

create table sigkey(                -- 设置单主键约束

	id int(10) auto_increment,  -- 主键 暂未设置主键, 约束-自动增加
    name char not null,
    age int(10) default 0,
    hight char(10)  default 10,
	gender char(10), 
    primary key(id)  -- 设置单主键 主键必须要有,可以有多个

);

desc sigkey;

create table mulkey(         -- 多主键约束设置

	id int(10) auto_increment,
    name char(10),
    age int(10) default 10,
    hight int(10) not null,
    sex char(10),
    primary key(id, name)  -- 设置多主键, 逗号隔开
    

);

create table maintable(

	id int(10) auto_increment primary key,
    name char(10),
    location char(10)
);

create table  sontable(

	id int(10) primary key,
    name char(10),
    salaryid int(10),   
    constraint frkey foreign key (salaryid) references maintable(id)   -- 本表为主表 有自己的主键,外键,外键用来关联别的 表



);

use demo;

show tables;

desc demo3;

desc maintable;

desc sontable;


show create table sontable;   -- 查看表的详细信息


show create table maintable;    -- 查看表的详细信息


 
create table note(              -- 创建一个示例表用于删除无关表
	id int(10) auto_increment primary key
    
);

show tables;

drop table if exists note;  -- 删除无关联表

show tables;  -- 显示存在表

create table noet(
	id int(10) auto_increment,
    name char(10)



);


 -- 时间格式的数据alter
 
create database timetest;
use timetest;
 
 create table time(
 
 record int auto_increment primary key,
 years year,
 times time,
 datimes datetime,
 timestamps timestamp
 
 );    -- 创建时间示例
 
 desc time;
 
 insert into time(years) values (2019);

insert into time(years) values (20);

desc time;

select years from time;
select * from time;



-- 数据的增删改查

-- 增加数据 insert


create table insertdata(
	id int auto_increment primary key,
    name varchar(10),
    age int,
    sex char,
    cord int
);

insert into insertdata values(7,'aneng', 18, '男', 88);  -- 单行插入


insert into insertdata(name, age, sex, cord) values('严鹏', 18, '男', 88);  -- 单行 指定 插入


select * from insertdata;   -- 查看 数据


insert into insertdata(name, age, sex, cord) values ('宴请', 23, '女', 100), ('李阳', 23, '男', 20);

select * from insertdata;

create table insertold(
	id int auto_increment primary key,
    name varchar(10),
    age int,
    sex char,
    cord int
);


alter table insertold add sex char;   -- 添加字段alter

alter table insertold add cord int;

select * from insertold;

insert into insertold values(1, '黄', 18, '男', 88);  -- 单行插入

insert into insertold(nameold, ageold, sex, cord) values ('龙', 23, '女', 100), ('李阳', 23, '男', 20);

select * from insertold;

insert into insertold( nameold, ageold, sex, cord) select name, age, sex, cord  from insertdata;   -- 查询结果存入新表

select * from insertold;

delete from insertold where id = 1;

delete from insertold  where ageold between 18 and 20;

create table students(
	id int unsigned primary key auto_increment not null,
    name varchar(20) default ' ',
    age tinyint unsigned default 0,
    height decimal(5,2),
    gender enum('男', '女', '保密', '中性') default '保密',
    cls_id int unsigned default 0,
    is_delete bit default 0


);

show tables;
desc students;



INSERT INTO `students` VALUES (1, '李明 ', 18, 180, '男', 1, NULL);
INSERT INTO `students` VALUES (2, '大大', 18, 180, '男', 2, NULL);
INSERT INTO `students` VALUES (3, '彭于晏', 29, 185, '男', 1, NULL);
INSERT INTO `students` VALUES (4, '刘德华 ', 59, 175, '男', 2, NULL);
INSERT INTO `students` VALUES (5, '晃晃蓉 ', 38, 160, '女', 1, NULL);
INSERT INTO `students` VALUES (6, '凤姐 ', 28, 150, '保密 ', 2, NULL);
INSERT INTO `students` VALUES (7, '王祖贤 ', 18, 172, '女', 1, NULL);

INSERT INTO `students` VALUES (8, '周杰伦 ', 36, NULL, '男 ', 1, NULL);
INSERT INTO `students` VALUES (9, '程坤 ', 27, 181, '男 ', 2, NULL);
INSERT INTO `students` VALUES (10, '刘亦菲 ', 25, 166, '女 ', 2, NULL);
INSERT INTO `students` VALUES (11, '安大星 ', 33, 162, '中性 ', 3, NULL);
INSERT INTO `students` VALUES (12, '静京', 12, 180, '女', 4, NULL);
INSERT INTO `students` VALUES (13, '周杰 ', 34, 176, '男', 5, NULL);
INSERT INTO `students` VALUES (14, '郭靖 ', 12, 170, '男 ', 4, NULL);


create table classes(
	id int unsigned auto_increment primary key,
    name varchar(30) not null
);

insert into classes values(1, 'python01'), (2, 'python02');

desc students;  -- 查看结构alter

select * from students;


-- 查询指定字段

select name, height from students;

select name as 名字, height as 身高 from students;

select s.name, s.cls_id from students as s;   -- 表取别名

select * from s;

show tables;

  -- 去重alter
  
  
  select distinct gender from students;  -- 去重
  
  select * from students where age >18;   -- 条件查询 where
  
  select * from students where age>18 and gender = '女';       -- 条件逻辑判断查询
  
  select * from students;
  
  update students set name = '小程坤' where id = 9;         -- 修改字段名
  
  select * from students where name like '小%%';
  
  select * from students where name like '%杰%';             -- 匹配含有杰的字段
  
  
  
  select * from students where name like '__';               -- 匹配两个子的名的字段 _ 下划线表示统配任意一个字符
  
  select * from students where age in (18,34,45.50);         -- 范围查找 in
  
  select * from students where age not in (18);              -- 排除范围查找alter
  
  select distinct * from students where age not in (18);    
  
  select  * from students where age between 18 and 30;        -- select between and 范围查找包含边界值
  
  select * from students where age not between 18 and 30;      -- 排除范围查询
  
  select * from students where not age between 18 and 30;      -- not换位置具有同等效果
  
  select * from students where height is null;          -- 查询空条件判断
  
  
  
  use timetest;
-- 查询排序alter

select * from students where age between 18 and 50 and gender = '男' order by age asc;    -- 查询指定范围的年龄的男性并按照年龄排序alter

-- order by asc 升序   desc 降序

select * from students where age between 18 and 50 and gender = '男' order by age desc;    -- 查询指定范围的年龄的男性并按照年龄排序alter

-- 多字段排序,在第一个排序字段后,相同的字段再按照新的方式排序

select * from students where age between 18 and 50 and gender = '男' order by age desc, id asc;    -- 查询指定范围的年龄的男性并按照年龄排序alter


select max(age) from students;

select avg(height) from students;

-- 嵌套条件查询alter

select name from students where height = (select max(height) from students);    -- 嵌套查询 将查询结果作为另一个查询的输入


select round(avg(age), 2)  from students;          -- round 保留设定位数的四舍五入  round(数字, 保留位数)



alter table students add countlie int default 0;

desc students;

-- alter table students modify countlie int generated always  as (age = height) virtual;

select gender, count(*) as countsex  from students group by gender;

-- group_concat 查询结果拼接

select gender, group_concat(name) as tongji from students group by gender;    -- 使用con_cat 将结果拼接


-- 对查到的数据进行统计 count(*)
select gender, group_concat(name) as tongji, count(*) as '数量' from students group by gender;    -- 使用group_concat 将结果拼接

select gender, count(*) from students group by gender having gender = '男';   -- 分组之后的数据进一步筛选 having 

 -- 查找相同性别的平均年龄最大年龄,人数
 select gender, round((age), 2) as avgage, max(age) as maxage, count(gender) as genderjishu from students group by gender;    -- 使用round 保留小数alter


-- 查询平均年龄查过30岁的性别以及姓名
select gender, group_concat(name), avg(age)   from students group by gender having avg(age) > 25;


-- limit  start, count   -- 选择性数据

select * from students limit 2, 4;

select students.name, classes.name from students, classes;

select * from students, classes where students.cls_id = classes.id;    -- 笛卡尔机查询 条件见查询

-- 连接查询

select students.name, classes.name from students inner join classes on students.cls_id = classes.id;   -- 连接后产生一个中间临时

select s.name, c.name from students as s inner join classes as c on s.cls_id = c.id;

select s.*, c.* from students as s inner join classes as c on s.cls_id = c.id;          -- 内链接 将满足条件的数据合成一张临时表

select s.*, c.* from students as s left  join classes as c on s.cls_id = c.id;          -- 内链接 将满足条件的数据合成一张临时表

use timetest;

create table areas(
	aid int primary key,
    atitle varchar(20),
    pid int

);

INSERT INTO `areas` VALUES ('110000', '北京市', NULL);

select * from timetest.areas;
-- load data local infile '‪C:\Users\bin\Desktop\areas.sql' INTO TABLE areas;
drop table demo.areas;

select * from timetest.areas;

select * from areas;

select  *   from areas where atitle like '__市' or atitle like '__区';

-- 自关联查询

select p.atitle, c.atitle from areas as p inner join areas as c on c.pid = p.aid where p.atitle = '武汉市';  -- 自关联查询




select * from areas where atitle like '广东_';


select * from students where  age in (select age students where age in (18, 20 ,30));    -- 子查询 嵌套查询


select * from students  where cls_id in (1,2);

-- 查询编班级年龄最大身高最高的学生

-- 
use timetest;

select max(age), max(height) from students;

select * from students where (age, height) = (select max(age), max(height) from students);   -- 行级子查询















