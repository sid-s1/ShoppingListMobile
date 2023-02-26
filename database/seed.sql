-- TRUNCATE will delete table - similar to DELETE function except it's faster as it removes space allocation immediately too
-- 'restart identity' will restart the primary key serialisation order instead of using 'continue identity' which is the default
-- 'cascade' will ensure that the tables get truncated even if there are foreign key references present
-- To plug in below value, after navigating into project folder, first comment out the 'jobs' table commands; run psql app_minder < database/seed.sql
-- Then, comment out 'users' table commands; run psql app_minder < database/seed.sql

TRUNCATE users RESTART IDENTITY CASCADE;
INSERT INTO users (buyer_name,business_name,email,hashed_pw,sec_qns,sec_ans) VALUES
('Sid',null,'sid@sid.com','sid','qns','ans'),
('Suhas',null,'suhas@suhas.com','suhas','qns','ans'),
('Aditya',null,'aditya@aditya.com','aditya','qns','ans'),
(null,'Pushpas marketplace','pushpa@pushpa.com','pushpa','qns','ans');

TRUNCATE items RESTART IDENTITY CASCADE;
INSERT INTO items (item_name,item_price) VALUES
('Paneer Bhurji',15),
('Poha',10),
('Tofu Fry',12),
('Sabudana Khichdi',13),
('Dal',8),
('Dal Methi',10),
('Rice',4),
('Veg Pulav',12),
('Mix Veg',10),
('Salmon Curry',15);

TRUNCATE seller_items RESTART IDENTITY CASCADE;
INSERT INTO seller_items (seller_id,item_date,item_id) VALUES 
(4,'2022/12/1',1),
(4,'2022/12/1',2),
(4,'2022/12/2',3),
(4,'2022/12/2',4),
(4,'2022/12/3',5),
(4,'2022/12/3',6),
(4,'2022/12/4',7),
(4,'2022/12/4',8),
(4,'2022/12/5',9),
(4,'2022/12/5',10),
(4,'2022/12/6',1),
(4,'2022/12/6',2),
(4,'2022/12/7',3),
(4,'2022/12/7',4),
(4,'2022/12/8',5);

TRUNCATE purchases RESTART IDENTITY CASCADE;
INSERT INTO purchases (seller_item_id,buyer_id) VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,2),
(2,3),
(3,1),
(3,2),
(3,3),
(4,1),
(4,2),
(5,1),
(5,1),
(5,1),
(6,2),
(6,2),
(6,2),
(7,1),
(7,2),
(7,3),
(8,1),
(8,2),
(9,2),
(9,3),
(10,1),
(10,2);
