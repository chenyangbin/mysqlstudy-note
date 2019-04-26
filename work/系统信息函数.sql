-- 获取sql版本
select version();

-- 获取当前连接次数
select connection_id();
-- 
-- 显示运行线程 ,连接状态, 查询语句
show PROCESSLIST; 

-- 查看用户
select user(), current_user(),session_user();

-- 查看字符串的字符集的排序方式
select charset('你好 ');
select charset('nihao');

-- 查看最后一个自动生成的ID值
select last_insert_id();


