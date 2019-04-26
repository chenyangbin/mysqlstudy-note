-- 数据库优化: 使查询更快, 资源更省
-- 优化内容
-- 优化文件系统,提高磁盘IO读写速度
-- 优化表结构,索引,查询语句,使擦汗寻响应更快.
-- 优化操作系统调度策略,提高mysql负载能力

-- 1 查看数据库性能参数 
-- show status like 'value'
-- value 参数connections连接次数, uptime上线时间, slow_queries慢查询次数, com_select查询操作次数, com_insert插入操作次数, com_update更新操作次数, com_delete删除操作次数



