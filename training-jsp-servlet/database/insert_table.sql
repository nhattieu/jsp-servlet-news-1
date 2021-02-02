use trainingjspservlet;

-- role

INSERT INTO role (code, name, createddate, createdby) 
VALUES ("ADMIN", "Quản Trị Hệ Thống", NOW(), "");
INSERT INTO role (code, name, createddate, createdby) 
VALUES ("USER", "Người Dùng", NOW(), "");

-- end role

-- user

INSERT INTO user (username, password, fullname, status, roleid, createddate, createdby) 
VALUES ("admin", "123456", "admin", 1, 1, NOW(), "");
INSERT INTO user (username, password, fullname, status, roleid, createddate, createdby) 
VALUES ("nguyenvana", "123456", "Nguyễn Văn A", 1, 2, NOW(), "");
INSERT INTO user (username, password, fullname, status, roleid, createddate, createdby) 
VALUES ("nguyenvanb", "123456", "Nguyễn Văn B", 1, 2, NOW(), "");
INSERT INTO user (username, password, fullname, status, roleid, createddate, createdby) 
VALUES ("nguyenvanc", "123456", "Nguyễn Văn C", 1, 2, NOW(), "");


-- end user



-- category
 
INSERT INTO category (code, name) VALUES ('the-thao', 'Thể Thao');
INSERT INTO category (code, name) VALUES ('the-gioi', 'Thế Giới');
INSERT INTO category (code, name) VALUES ('chinh-tri', 'Chính Trị');
INSERT INTO category (code, name) VALUES ('thoi-su', 'Thời Sự');
INSERT INTO category (code, name) VALUES ('goc-nhin', 'Góc Nhìn');

-- end category

-- news

INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 1", "tà tưa ahja", "ahihi", "bài viết số 1", 1, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 2", "tà tưa ahja", "ahihi", "bài viết số 2", 2, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 3", "tà tưa ahja", "ahihi", "bài viết số 3", 1, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 4", "tà tưa ahja", "ahihi", "bài viết số 4", 2, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 5", "tà tưa ahja", "ahihi", "bài viết số 5", 1, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 6", "tà tưa ahja", "ahihi", "bài viết số 6", 2, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 7", "tà tưa ahja", "ahihi", "bài viết số 7", 1, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 8", "tà tưa ahja", "ahihi", "bài viết số 8", 2, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 9", "tà tưa ahja", "ahihi", "bài viết số 9", 1, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 10", "tà tưa ahja", "ahihi", "bài viết số 10", 2, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 11", "tà tưa ahja", "ahihi", "bài viết số 11", 2, NOW(), "");
INSERT INTO news (title, thumbnail, shortdescription, content, categoryid, createddate, createdby) 
VALUES ("bài viết số 12", "tà tưa ahja", "ahihi", "bài viết số 12", 2, NOW(), "");

-- end news

-- comment


-- end comment










