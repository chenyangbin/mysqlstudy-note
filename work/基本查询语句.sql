-- 基本查询语
--  select 查询字段 from 数据源 where 过滤条件 group by 分组字段 order by 结果排序 limit 显示条件
-- 查询字段:可以是多个字段,逗号隔开
-- 数据源: 可以是多个表,逗号隔开
-- 过滤条件: 过滤数据源 字段+ [=, <> !=, <, >, >=, <=,] + 条件
-- 分组字段:使用group by 对数据源中按照字段分组
-- 结果排序:使用order by 对查询结果按照升序降序排序,默认升序
-- limit:   使用limit 对查询结果进行限制显示 limit(a, b) a跳过a条数据,每次显示b条数据


-- ** 单表内查询

-- 1 查询指定字段
-- select 字段名from 表名

-- 2 查询多个字段
-- select 字段1, 字段2,...from 表名

-- 3 查询所有字段
-- select * from 表名   *:标识匹配所有字段

-- 4 条件查询
-- select 字段1, 字段2.. from 表名 where 查询条件
-- 查询过滤条件 对字段过滤条件有 =, <> !=, <, >, >=, <=, 

-- 5 in 指定范围查询  not in则相反
-- select 字段 from 表 wherer 字段 in 字段条件

-- 6 between and  范围内值查询
-- select 字段 from 表 where 字段 between 范围低值 and 范围高值

-- 7 like 模糊匹配查询
-- select 字段 from 表 where 字段 like 模糊匹配符( _ %)  
-- _ 一次只匹配一个任意字符  %:一次匹配任意长度字符

-- 8 null 空值查询
-- select 字段 from 表 where 字段 is null 

-- 9 is not null 查找字段不为空的记录
-- select 字段 from 表 where 字段 is not null

-- 10 and 多条件同时满足查询,使查询结果更精确
-- select 字段 from 表 where 字段过滤条件1 and 字段过滤条件2 and ....
-- and 连接 字段过滤条件必须都满足

-- 11 or 多条件只需满足一个或多个的查询ALTER
-- select 字段 from 表 where 字段+过滤条件1 or 字段+过滤条件2 or ...
-- or 连接 字段过滤条件只需要满足一个即可

-- 12 distinct 查询结果不重复
-- select distinct 字段 from 表 where 字段+过滤条件
-- distinct 查询结果过滤重复的字段

-- 13 order by 查询结果排序 单字段排序
-- select 字段 from 表 where 字段+过滤条件 order by 排序字段 (默认升序A~Z 1-...)
-- 降序
-- select 字段 from 表 where 字段+过滤条件 order by 排序字段 desc

-- 14 order by 查询结果品排序 多字段排序
-- -- select 字段1, 字段2, ... from 表 where 字段+过滤条件 order by 排序字段1, 排序字段2, ... (默认升序A~Z 1-...)

-- ** 分组查询 group by  对字段进行分组 对分组内容查询
-- 将数据分为多个逻辑组, 可以使用max, min, count, sum, group_concat, avg 对每个逻辑组进行计算
-- 分组条件 主表中的某个值有多个对应内容, 或者主表关联的子表有多个对应值

-- 1 创建分组 单字段分组
-- select 字段 from 表 group by  分组字段

-- 2 多字段分组
-- select 字段 from 表 group by 字段1, 字段2, ...

-- 3 having 分组字段条件查询 字段过滤
-- having 和 group by 连用  用来过滤查询分组查询结果, 满足分组having的条件的结果才会显示

-- 4 limit(a, b) 对查询结果限制显示
-- select 字段 from 表 limit  a, b     a:跳过条数 b:显示条数


-- ** 聚合函数分析查询
-- avg 返回字段分组数据的均值
-- count 返回字段分组数据的条数
-- max 返回字段愤怒中数据的最大值
-- min 返回字段分组数据的最小值
-- sum 返回字段分组数据的总和

-- 1 count 由查询结果返回列中包含的数据行数
-- count(*)  计算表中的总行数,不管是否为null
-- select count(*) from 表  

-- count(字段)  计算指定字段的有效行数 不统计null行
-- select count(*) from 表

-- 2 count 和group by 合用 统计不同分组中的记录的行数
-- select 字段, count(字段1) from 表 group  by 字段  查询分组中的字段1的数条数
use demo2;
show databases;
select count(*) from students;
select * from score;
select *,group_concat(course_id), count(course_id) from score GROUP BY student_id;

-- 3 sum返回指定字段的总和
-- select 字段, sum(字段) from 表 
-- sum 和group by 合用 返回每个分组的总和
-- select 字段, sum(字段1) from 表 group by 字符段

-- 4 avg 返回指定列的均值
-- select avg(字段) from 表 
-- avg 和 group by 合用 返回每个分组的均值
-- select avg(字段) from 表 group by 字段
select *,group_concat(course_id), count(course_id), avg(number) from score GROUP BY student_id;

-- 5 max 返回指定列的最大值
-- select max(字段) from 表 
-- max 和 group by 合用 返回分组中的最大值
select max(number) from score;
select *,group_concat(course_id), group_concat(number), count(course_id), max(number) from score GROUP BY student_id;

-- 6 min 类同max

-- * 连接多个表查询 内连接, 自连接(特殊的内链接) 外连接
-- 内链接自查询, 外连接查询:多个表连接查询
-- 多个表中存在意义相同的字段,通过这些字段进行表关联,进而完成表见查询


-- 1 内连接查询 只有满足条件的记录才能出现在结果关系中 表与表的连接通过意义相同的字段连接,存在空记录的显示在结果中
-- select 字段1, 字段2,... from where 表1, 表2, 表... where 表1.字段n = 表2.字段x 
-- 查询的字段可以是在同一个中的,也可以是不同的表中的
show tables;
select * from student, score where student.sid = score.student_id;
select * from student inner join score on student.sid = score.student_id;

-- 2 表1 inner join 表2 on 连接条件 内连接
-- inner join 是标准语法,可保证连接不会忘记忘记连接条件, 使用where连接则影响子查询性能
-- selecct 字段 from 表1 inner join 表2 on 表1.字段n = 表2.字段n 
select * from student left join score on student.sid = score.student_id;   -- 查询结果包含没有关联的null值

-- 3 自关联查询 自关联是特殊的内链接, 一张物理表分出数个逻辑表们进行逻辑表间的关联查询
-- 关联的逻辑表为了区分,要进行取别名
-- select A.查询字段1, B.查询字段2,...  from 表1 as A, 表1 as B where A.字段x = B.字段x 过滤条件;

-- inner join 自关联查询
-- select A.查询字段1, B.查询字段2,...  from 表1 as A inner join 表1 as B  on  A.字段x = B.字段x 过滤条件;  

-- 4 外连接查询 left join / right join 
-- 外连接查询多个表中相关联的行, 内连接时仅仅返回查询结果中符合查询条件和连接条件的行
-- 单有时候 需要查询结果包含没有关联行中的数据

-- left join 返回左表中所有记录和右表中连接字段相等记录
-- select 字段 from 左表 left outer join on 右表 左表.字段n = 右表.字段x  返回左表所有记录,包括右表关联字段

-- right join 类同 left join

-- 5 复合条件连接查询 通过过滤条件对连接查询限制查询结果
-- select 字段 from 表1 inner join 表2 on 表1.字段x = 表2.字段n and 过滤条件(字段+过滤条件)
select * from student left join score on student.sid = score.student_id and number > 60;   -- 复合条件过滤

-- ** 子查询(嵌套查询) 
-- 将子查询的结果作为外层查询的过滤条件
-- 查询可以基于多表
-- 子查询常用操作符 any, some, all, in, exist
-- 子查询中可以使用笔比较运算符 <, >, >=, <=, != ...

-- 1 any, some 子查询 满足子查询的任意一个比较条件,就返回一个结果作为外层的查询条件
select * from score where number > 60;

-- 2 all 子查询 同时满足子查询的所有返回值, 作为查询条件

-- 3 exists 
-- exist 后接一个子查询
-- 查询对exist 后的子查询判断, 如果exist后的子查询有返回行,就进行外层查询,如果exist后的内存查询无结果,外层也不查询
-- sselect 字段 from 表 where exist ( select 字段 from 表  where 条件)  -- 内存查询有效返回就进行外层查询
select * from score where exists (select name from student where name = '张三');   -- 如果student表中有张三就查询所有人分数


-- 4 in 查询 将内层的查询结果序列作为外层的查询的条件
-- select 字段 from 表 where 字段 in (select 字段 from 表 where 字段过滤条件)   in 后返回的是查询序列


-- * 查询结果合并 union / union all

-- union 合并结果并去重排序
-- select 字段 from 表 union select 字段 from 表 ....  执行时候删除重复记录,返回行唯一

-- union all 怒删除重复行,也不排序
-- 用法同union 


-- * 正则表达式查询  regexp + 正则匹配符

-- 1 ^匹配特定字符或者字符串开头的记录
-- select 字段 from 表 where 字段 regexp '^xxx'   -- 匹配以xxx开头的字段记录
select name from student where name REGEXP '^张';


-- 2 $匹配特定字符结尾的字符或字符串记录
-- select 字段 from 表 where 字段 regexp 'xxx&'   -- 匹配以xxx结尾的字段记录
select name from student where name REGEXP '三$';

-- 3 * 和 + 匹配多字符
-- * 匹配*前的字符任意多次,包括0次
select name from student where name REGEXP '^张a*';  
select name from student where name REGEXP '三*';

-- 4 + 匹配+前的字符至少一次
select name from student where name REGEXP '三+'; 

-- 5 | 匹配多个字符 用|隔开匹配的多个字符
select name from student where name REGEXP '七|三|李'; 

-- 6 [xxx]  匹配集合中的任意一个字符
select * from student where name REGEXP '[张田李王]';

-- 7 [^xxx] 匹配直到字符以外的字符 类同6

-- * 查询结果插入表中
-- insert into 插入表名 插入字段列 select 字段列 from 表  where 过滤条件








