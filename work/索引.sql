-- 索引即为数据中的单个列,单个字段,或者多个列,多个字段通过数据结构的方式建立快速的查询方式
-- 将要建立的索引字段,通过数据结构的方式来保存,常用的索引查询数据结构为B-TREE 和 B+treeh 和hash
-- 数据结构的查询方式,要比遍历每一行数据的方式来查询要快

-- 创建索引优点
-- 唯一索引,保证数据表中的每一行数据的唯一性
-- 加快查询速度
-- 加速表之间的连接
-- 分组查询和排序子句查询时,减少查询中的分组时间和排序时间

-- 索引缺点
-- 维护索引时间上是对结构树的维护
-- 创建索引实际上创建一种查重的数据结构
-- 索引会占据存储空间
-- 修改数据的时候,索引也要动态维护

-- 索引分类
-- 普通/唯一索引 
-- 普通索引: 索引的列可以有重复值和空值
-- 唯一索引: 索引列的值必须唯一,但可有空值

-- 单列索引, 组合索
-- 单列索引: 一个索引只有单哥列ALTER
-- 组合索引: 表的多个字段组合创建索引 

-- 全文索引: fulltext 索引列支持全文查找 mysql 只有myisam引擎支持

-- 空间索引: 对空间数据类型创建索引 geometry, point, linestring, polygon

-- 索引设计原则ALTER
-- 索引量适量, 经常更新的表列索引尽量少,经常查询的表建立不重复索引, 不同值较多的字段建立索引,  不同值少的不建立索引,  频繁排序分组的列建立索引
-- 查询建立, 少查询少建立

-- 6 创建索引
-- 创建表时创建索引
-- create table 表名(字段.... 索引类型 index 索引名称 索引字段 索引排序方式)
-- 索引类型: unique,唯一 fulltext,全文  spatial,空间
-- 索引名 不设置时候以索引字段为名
-- 索引字段: 被建立索引的字段 
-- 排序方式: asc,升序 desc,降序
create database book;

create table book3 (
	id int(10),
    name varchar(20),
    number int(20),
    index index_number (number)
);

show create table book;


-- 7 unique 创建唯一索引
--  唯一索引是为了减少查询索引列的时间
-- 所有列的值必须唯一, 但可有有空值, 组合所有的时候, 列值组合必须唯一
-- create table 表名(字段.... unique index 索引名称 索引字段 索引排序方式)
create table book4 (
	id int(10),
    name varchar(20),
    number int(20),
    unique index index_number (number)
);


-- 8 单列索引
-- 索引对象为单个字段(单列),一个表中可有多个单列索引
-- 一个索引只能对应资格字段
-- create table 表名(字段.... index 索引名称 索引字段 索引排序方式) 被索引
create table book5 (
	id int(10),
    name varchar(20),
    number int(20),
    index index_number(number, name)
);

-- 9 组合索引
-- 在多个字段上建立一个索引 索引的时候必须包含最左边的字段,否则无法查询
-- create table 表名(字段.... index 索引字段 1, 索引字段2,...索引排序方式)

-- 10 fulltext 全文索引
-- 用于全文搜索,且只有char, varchar, text 支持全文索引的创建
-- 只有myisam引擎支持
-- create table 表名(字段.... fulltext  index 索引名称(索引字段) 索引排序方式)
create table book6 (
	id int(10),
    name varchar(20),
    number VARCHAR(20),
    fulltext index index_number (number)
);

-- 11 alter table / cerate index已经存在的表创建索引
-- alter table 表名 索引类型 index/key 索引名(索引字段(索引长)) asc/deccreate 
-- 

show index from book2;   -- 查看表中的索引

-- alter table / drop index 删除索引
-- alter table 表名 drop index 索引名
alter table book5 drop index index_number;
-- drop index 索引名 on 表名
drop index index_number on book6;



