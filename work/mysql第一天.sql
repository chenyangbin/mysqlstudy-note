
数据库用户名: root
密码:        mysql

-- 在sql 文件中表示注释
-- 数据库的操作

    -- 链接数据库
    mysql -uroot -pmysql
    -- 退出数据库
    exit
    -- 查看创建数据库
    show databases;   必须有s
    -- 查看当前正在使用的数据库
    select database();   # NULL指的是空
    -- 使用数据库
    use jing_dong;
    -- sql语句最后需要有分号;结尾
    -- 显示数据库版本
    select verison()
    -- 显示时间
    select now()
    -- 创建数据库 create
    create database demo;
    -- 指定字符集 不是 utf-8
    create database demo charset=utf8;   # 必须是utf8字符集

    -- 查看数据库的创建语句
    show create database demo;

    -- 删除数据库
    drop database demo;



-- 数据表的操作

    -- 查看当前数据库中所有表
    show tables;

    -- 创建表
    -- unsigned 没有符号, 没有负数
    -- auto_increment表示自动增长
    -- 创建一个学生的数据表(id、name、age、high、gender、cls_id)
    -- create table 数据表名字 (字段 类型 约束[, 字段 类型 约束]);
    -- 多个约束 不分先后顺序
    -- enum 表示枚举
    -- 最后一个字段不要添加逗号
    create table students (字段名 字段类型 字段约束);
# 在使用的时候最好将制表符去掉
create table students (
    id int unsigned primary key auto_increment,
    name varchar(15) not null,
    age tinyint unsigned default 0,
    high decimal(5,2) default 0.0,
    gender enum('男','女','中性','保密') default '保密',  # 默认从1开始, 枚举值(1,2,3)和原始值('男','女',)在使用上是等价的
    cls_id int unsigned not null
);

    -- 查看表的创建语句
    show create table students;

    -- 查看表结构
    desc students;


    -- 修改表结构  alter add/modify/change
    -- 修改表-添加字段
    -- alter table 表名 add 列名 类型/约束;
    -- 生日信息
    alter table students add birthday datetime default "2011-11-11 11:11:11";

    -- 修改表-修改字段：不重命名版
    -- alter table 表名 modify 列名 类型及约束;
    alter table students modify birthday date default "2011-11-11";

    -- 修改表-修改字段：重命名版
    -- alter table 表名 change 原列名 新列名 类型及约束;
    alter table students change birthday birth date default "2011-11-11";

    -- 修改表-删除字段
    alter table students drop birth;

    -- 删除表
    drop table students;


-- 数据增删改查(curd)

    -- 增加 insert
    	-- insert [into] 表名 values (值1,值2,...)
        -- 全列插入  值和表的字段的顺序一一对应
        -- 占位符: 只有主键字段才有占位符的概念 0, default, NULL
        -- 全列插入在实际开发中用的不多 如果表结构一旦发生变化, 全列插入就会报错
        insert into students values (0,'小乔', 18, 180.00, '女',2);
        insert into students values (0,'小乔', 18, 180.00, '女'); # 错误
        insert into students values (default,'大乔', 19, 180.00, '女',2);
        -- 指定列插入
        -- 值和列一一对应
        -- insert into 表名 (列1,...) values(值1,...)
        insert into students (name, high, gender), cls_id values ('张飞', 190.00, '保密', 1);

        -- 多行插入  批量插入
        -- insert into 表名 (列1,...) values (值1,...),(值1,...),...
        insert into students values (0,'孙尚香', 18, 180.00, '女',2),(0,'甄姬', 20, 170.00, '女',3);
        insert into students (name, high, gender, cls_id) values ('张飞', 190.00, '保密', 1), ('关羽', 190.00, '男', 1);

    -- 修改 update
    -- where 表示修改的范围
    -- update 表名 set 列1=值1,列2=值2... [where 条件]
    -- 没有where 进行条件限制就是全表更新
    update students set age = 30 where id = 4; -- sql中  通过一个等于号表示相等

    -- 删除 delete
        -- 物理删除
        -- DELETE FROM tbname [where 条件判断]
        delete from students where id = 5;

select * from students;

-- SQL 查询
    -- 查询基本使用 select
        -- 查询所有列
        -- select * from 表名;

        -- 指定字段查询

        -- sql 中表示相等 使用 = 而不是 ==

        -- 指定条件查询

        -- 查询指定列

        -- 字段的顺序

        -- 可以使用as为列或表指定别名
