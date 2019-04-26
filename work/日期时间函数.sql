-- 时间日期函数的使用

-- 获取当前日期 curdate() 将当前的日期按照 yyyy-mm--dd的格式返回
-- current_date 功能类同上
select curdate();
select current_date();

-- 2 获取当前时间 curtime() / current_time 返回hh-mm-ss格式的时间
select curtime();
select current_time();

-- 3 获取当前日期和时间 current_timestamp()/ localetime()/ now()/ sysdate()  均反返回yy-mm-dd hh-mm-ss格式时间
select current_timestamp();
select localtime();
select localtimestamp();
select now();
select sysdate();

-- 4 时间戳函数 unix_timestamp(date) 返回1970.01.01 00.00.00 距今时间的秒数
select unix_timestamp();
select unix_timestamp(now());

-- 5 世界标准日期函数 utc_date 返回yy-mm-dd 的世界标准日期 世界时UT即格林尼治平太阳时间,是指格林尼治所在地的标准时间,
select utc_date();

-- 6 世界标准时间  返回hh-mm-ss格式的格林尼治时间 并非本地时间
select utc_time();

-- 7 时间标准日期时间   返回日期时间
select utc_timestamp();  

-- 8 获取日期中的月份 month(date)  返回date中的月份
select month(now());
select month('2016-07-25');
select monthname(now());  -- 返回日期中的月份英文名字
select monthname('2017-05-23'); 

-- 9 获取对应时间是星期几  dayname(d)  返回那天是星期几
select dayname(now());
select dayname('2018-06-20');  -- 

-- 10 获取对应时间的月份名字 monthname()
select monthname(now());
select monthname('2017-08-20');

-- 11 获取某日期是一年中第几周
select week(now());

-- 12 获取某天是一年中的第几天, 一个月中的第几天, 一周中的第几天
select dayofyear(now());  -- 返回该日期是一年中的第几天
select dayofmonth(now()); -- 返回该日是一月中的第几天
select dayofweek(now());  -- 返回该日期是一周中的第几天

-- 13 
