以下数据均按照课件做的，一些查询语句就不一一列出来了，童鞋们动手练习练习啊

分组
1.group by

INSERT INTO `students` VALUES (1, '⼩明 ', 18, 180, '⼥ ', 1, NULL);
INSERT INTO `students` VALUES (2, '⼩⽉⽉ ', 18, 180, '⼥ ', 2, NULL);
INSERT INTO `students` VALUES (3, '彭于晏 ', 29, 185, '男 ', 1, NULL);
INSERT INTO `students` VALUES (4, '刘德华 ', 59, 175, '男 ', 2, NULL);
INSERT INTO `students` VALUES (5, '⻩蓉 ', 38, 160, '⼥ ', 1, NULL);
INSERT INTO `students` VALUES (6, '凤姐 ', 28, 150, '保密 ', 2, NULL);
INSERT INTO `students` VALUES (7, '王祖贤 ', 18, 172, '⼥ ', 1, NULL);
INSERT INTO `students` VALUES (8, '周杰伦 ', 36, NULL, '男 ', 1, NULL);
INSERT INTO `students` VALUES (9, '程坤 ', 27, 181, '男 ', 2, NULL);
INSERT INTO `students` VALUES (10, '刘亦菲 ', 25, 166, '⼥ ', 2, NULL);
INSERT INTO `students` VALUES (11, '⾦星 ', 33, 162, '中性 ', 3, NULL);
INSERT INTO `students` VALUES (12, '静⾹ ', 12, 180, '⼥ ', 4, NULL);
INSERT INTO `students` VALUES (13, '周杰 ', 34, 176, '⼥ ', 5, NULL);
INSERT INTO `students` VALUES (14, '郭靖 ', 12, 170, '男 ', 4, NULL);

一、查询案例
1.创建数据表
-- 创建 "京东" 数据库
create database jing_dong charset=utf8;
-- 使⽤ "京东" 数据库
use jing_dong;
-- 创建⼀个商品goods数据表
create table goods(
id int unsigned primary key auto_increment not null,
name varchar(150) not null,
cate_name varchar(40) not null,
brand_name varchar(40) not null,
price decimal(10,3) not null default 0,
is_show bit not null default 1,
is_saleoff bit not null default 0
);

2.插入数据
-- 向goods表中插⼊数据
insert into goods values(0,'r510vc 15.6英⼨笔记本','笔记本','华硕','3399',default,default);
insert into goods values(0,'y400n 14.0英⼨笔记本电脑','笔记本','联想','4999',default,default);
insert into goods values(0,'g150th 15.6英⼨游戏本','游戏本','雷神','8499',default,default);
insert into goods values(0,'x550cc 15.6英⼨笔记本','笔记本','华硕','2799',default,default);
insert into goods values(0,'x240 超极本','超级本','联想','4880',default,default);
insert into goods values(0,'u330p 13.3英⼨超极本','超级本','联想','4299',default,default);
insert into goods values(0,'svp13226scb 触控超极本','超级本','索尼','7999',default,default);
insert into goods values(0,'ipad mini 7.9英⼨平板电脑','平板电脑','苹果','1998',default,default);
insert into goods values(0,'ipad air 9.7英⼨平板电脑','平板电脑','苹果','3388',default,default);
insert into goods values(0,'ipad mini 配备 retina 显示屏','平板电脑','苹果','2788',default,default);
insert into goods values(0,'ideacentre c340 20英⼨⼀体电脑 ','台式机','联想','3499',default,default
insert into goods values(0,'vostro 3800-r1206 台式电脑','台式机','戴尔','2899',default,default);
insert into goods values(0,'imac me086ch/a 21.5英⼨⼀体电脑','台式机','苹果','9188',default,default
insert into goods values(0,'at7-7414lp 台式电脑 linux ）','台式机','宏碁','3699',default,default);
insert into goods values(0,'z220sff f4f06pa⼯作站','服务器/⼯作站','惠普','4288',default,default);
insert into goods values(0,'poweredge ii服务器','服务器/⼯作站','戴尔','5388',default,default);
insert into goods values(0,'mac pro专业级台式电脑','服务器/⼯作站','苹果','28888',default,default);
insert into goods values(0,'hmz-t3w 头戴显示设备','笔记本配件','索尼','6999',default,default);
insert into goods values(0,'商务双肩背包','笔记本配件','索尼','99',default,default);
insert into goods values(0,'x3250 m4机架式服务器','服务器/⼯作站','ibm','6888',default,default);
insert into goods values(0,'商务双肩背包','笔记本配件','索尼','99',default,default);

查询所有价格⼤于平均价格的商品，并且按价格降序排序
select id,name,price from goods
where price > (select round(avg(price),2) as avg_price from goods)
order by price desc;

查询每种类型中最贵的电脑信息
select * from goods
inner join
(
select
cate_name,
max(price) as max_price,
min(price) as min_price,
avg(price) as avg_price,
count(*) from goods group by cate_name
) as goods_new_info
on goods.cate_name=goods_new_info.cate_name and goods.price=goods_new_info.max_price;

2. 创建 "商品分类"" 表
-- 创建商品分类表
create table if not exists goods_cates(
id int unsigned primary key auto_increment,
name varchar(40) not null
);

4. 创建 "商品品牌表" 表
通过create...select来创建数据表并且同时写⼊记录,⼀步到位
select brand_name from goods group by brand_name;
-- 在创建数据表的时候⼀起插⼊数据
-- 注意: 需要对brand_name ⽤as起别名，否则name字段就没有值
create table goods_brands (
id int unsigned primary key auto_increment,
name varchar(40) not null) select brand_name as name from goods group by brand_name;

7.外键
查询所有商品的详细信息 (通过内连接)
select g.id,g.name,c.name,b.name,g.price from goods as g
inner join goods_cates as c on g.cate_id=c.id
inner join goods_brands as b on g.brand_id=b.id;

查询所有商品的详细信息 (通过左连接)
select g.id,g.name,c.name,b.name,g.price from goods as g
left join goods_cates as c on g.cate_id=c.id
left join goods_brands as b on g.brand_id=b.id;

注意: goods 中的 cate_id 的类型⼀定要和 goods_cates 表中的 id 类型⼀致
create table goods(
id int primary key auto_increment not null,
name varchar(40) default '',
price decimal(5,2),
cate_id int unsigned,
brand_id int unsigned,
is_show bit default 1,
is_saleoff bit default 0,
foreign key(cate_id) references goods_cates(id),
foreign key(brand_id) references goods_brands(id)
);
