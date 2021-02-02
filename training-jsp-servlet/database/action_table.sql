use trainingjspservlet;

select * from trainingjspservlet.news;

select * from trainingjspservlet.role;

select * from trainingjspservlet.user;

select * from trainingjspservlet.category;


SELECT * FROM trainingjspservlet.news LIMIT 2, 3;

delete from news;

SELECT * FROM user AS u INNER JOIN role AS r ON u.roleid = r.id WHERE u.username = 'admin'AND u.password = '123456' AND u.status = 1;


SELECT * FROM news WHERE id = 36;