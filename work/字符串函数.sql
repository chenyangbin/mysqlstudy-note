-- use demo1;

-- 计算字符串字符个数 char_length(s) 返回s中字符的个数
select char_length('我喜欢哈哈哈哈');

-- 统计字符串的字节长度 length(s) 返回s的所占空间的字节数
select length('我喜欢你');   -- 一个汉字占3个字节
select length('abcd1234');   -- 字幕数字占1个字节

-- 合并字符串 concat(s1, s2, ...)  返回合并的字符串序列  `
select concat('我', '喜欢', '你', '但是', '现在', '命运', '不','允许');

-- 如果序列中有null 返回null
select concat('我', '喜欢', '你', '但是', '现在', '命运', '不',null);

-- 带有连接符的字符串的合并 concat_ws(连接符, s1, s2, ....)   返回使用连接符连接的字符串
select concat_ws('*', '喜欢', '你', '但是', '现在', '命运', '不');  

-- 替换字符串函数 insert(s1, x, len, s2)  s1源字符串, x替换起始位置, len替换长度, s2替换符
-- 使用s2 对s1 进行从x位置开始len个胀肚的替换
-- x位置可为正负
-- 如果len的长度大于其他字符串, 则从x的位置起始替换可以替换的
select insert('abcdefght', 2, 4, '12345');
select insert('abcdefght', 2, 20, '12345');

-- 转换小写 lower(s)/ lcase(s)  返回s转换成小写
select lower('abcdefgADFDF');
select lower('abcdefgAD你FDF');

-- 转换大写upper(s)/ ucase(s) 返回s转换成大写
select upper('我喜欢ni');

-- 获取源字符串的指定长度
-- 从源字符串左边开始获取 left(s, n)  返回字符串s左起的n个字符串
select left('你好,我喜欢你', 2);

-- 从元字符串的右边开始获取n个字符 right(s, n)
select right('你好,我喜欢你', 2);

-- 填充字符串,对字符串进行指定长度的填充 左填充/右填充
-- 做填充 lpad(s1, len, s2)  使用s2 对s1 进行左起填充直到总长度达到len  pad 单词padding
select lpad('喜欢你', 10, '我');
select lpad('喜欢你', -10, '我');   -- 填充长度为负,返回空
select lpad('喜欢你', 1, '我');   -- 填充长度小于源字符串,则对源字符串进行len的截取

-- 右填充 rpad(s1, len, s2)  类同lpad

-- 删除空格函数 左空格删除 ltrim 右空格删除 rtrim  
-- 左空格删除 ltrim  trim:修剪
select ltrim('    我 喜欢 你!');

-- 右空格删除 rtrim
select rtrim('   哈哈哈  你    ');

-- 删除指定字符串 trim(s1 from s)  删除s1的两端所有包含s的字符
select trim('你' from '你我你');


-- 重复生成字符串 reoeat(s, n)  重复生成s,n次
select repeat('你', 20);


-- 生成空格函数space(n) 返回n个空格的字符串alter
select space(50);

-- 替换函数replace(s,s1,s2) 使用s2替代s中的所有s1
select replace('xxxx.yyyy.zzzz', 'x', 'a');

-- 比较字符串大小的函数 strcamp(s1, s2)  s1 < s2 返回-1, s1>s2,返回1 s1=s2,返回0

select strcmp('txt', 'txtt');
select strcmp('txtx', 'txt');

--  获取子串函数 substring(s, n, len) s,源字符串 n起始返回位置 len,返回字符个数
select substring('absdefg', 2, 2);   -- 左起第2个开始,返回2个字符
select substring('absdefg', -2, 2);  -- 右起第2个开始,返回2个
select substring('absdefg', 2);      -- 左起第2个开始,返回所有


-- mid(s, n, len) 功能同 substring


-- 匹配子字符串在源字符串的起始位置 locate(str1, str)  返回str1 在str 中的起始位置

select locate('abcdefg', '123456abcdefgh');
select locate('abcdefg', '123456abcdef');   

-- position(str1 in str) 功能同locate
-- insert(str, str1) 功能同locate
select instr('123456789', '456');   -- 返回后者在前者中的起始位置

-- 字符串反转逆序函数 reverse(s)  返回s的逆序
select reverse('123456789');

-- 返回指定位置的字符串 elt(n, str1, str2, str3, strn...)  返回strn序列中的位于第n个位置的str
select elt(2, '1', '2', '3', '4', '5');   -- 返回第二个位置的str

-- 返回指定字符串咋源字符串序列中第一次出现的位置  field(s, s1, s2, s3...)  返回s在s序列中第一次出现的位置
select field('ni', 'wp', 'shi', 'ni' 'da', 'ye', 'ni');
select field('你', '我', '是', '你', '大', '爷', '你');    -- 只返回第一次出现的位置


-- 返回子串源串列表中的位置 find_in_set(s1, s2)
select  find_in_set('你', '我,是,你,大,也,你');   --值返回第s1在s2中一次出现的位置

-- 选取二进制位对应的字符串函数 make_set(x, s1, s1, ...)
-- x 数值, 转换为二进制 将二进制中对应的1位在后续的字符串序列中对应位返回





