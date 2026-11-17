-- 测试用SQL，包含多等级风险
UPDATE user_info SET phone = '13800138000' WHERE 1=1; -- P0：无条件全表更新
SELECT * FROM user_order u 
JOIN user_pay p ON u.id = p.user_id 
WHERE u.name LIKE '%小明%' AND p.money = '100'; -- P1：前缀like、隐式转换、SELECT *
SELECT id,account,pwd FROM user WHERE create_time > '2025-01-01'; -- P0：明文查询密码
SELECT * FROM big_table ORDER BY create_time LIMIT 100000,20; -- P1：大偏移分页性能问题
DROP TABLE IF EXISTS temp_log; -- P0：高危删除表DDL