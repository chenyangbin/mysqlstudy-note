-- 加密函 数password
select password('123456');  -- 返回加密后的密码

-- 加密函数 MD5(str)
select md5('123456');  -- 返回md5的128位校验和

-- 加密函数encode(str, pswd_str)  解密函数decode(str, pswd_str)
select encode('abcd', '123456');  -- 使用pswd_str 作为密码加密str
-- 解密函数decode 类同加密函数


