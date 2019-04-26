-- 视图: 从一个或多个表导出的虚拟表,可以像表一样操作
-- 视图作用: 只取需要的数据操作,减少冗余. 安全通过权限管理,不同的用户只能看到特定的视图数据
-- 视图既可以建立在一张表,也可以建立在多张表上

-- 1 creat view 创建视图
-- creat(创建)/replace(替换)  algorithm =  (undefined/merge/temptable) view view_name (属性列) as select_statement with (cascade/local/) check option
-- 参数
-- algorithm: 视图选择算法 undefined自动选择, merge视图语句视图定义结合, temptable视图结果存入临时表
-- view_name: 视图名
-- select_statement: select 选择状态

-- 2 单表创建视
-- 默认情况下, 视图的字段和表的字段相同, 也可以通过直到视图字段名而创建视图
-- creat  view 视图名 as select 字段1, 字段2,... from 表名

select * from student;

create view view_student as select name, gender, gender+name from student;

select * from view_student;

-- 3 多表创建视图
-- create view 视图名 (视图字段1, 视图字段2,...) as select 表1.字段, 表2.字段  from 表1, 表2 where 表1.字段 = 表2.字段 

-- 4 查看视图 describe 视图名

-- 5 查看视图信息 show table status 视图名;

-- 6 查看视图详细信息 show ctreate view 视图名;

-- 7 查看所有视图定义 查看information.schema 数据库西安的view信息
-- select * from information_schema.views;

-- 7 修改视图 当源表发生变化的时候,通过修改视图保持一致
-- 修改视图语句完全和创建视图语句一样, 当视图存在就修改, 不存在就创建

-- 8 alter 修改视图
-- alter view 视图名 (视图字段) as select 表字段 from 表;

-- 9 update 更新视图  插入更新删除数据,视图实际为内层中的虚拟表
-- UPDATE 视图名 set 字段 = 字段值
-- insert into 视图名 values (字段1,字段2...)
-- delete from 视图名 where 字段 = 字段值

-- 10 视图删除
-- drop view if exist 视图名



