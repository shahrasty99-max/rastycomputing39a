-- create database college;
use college;
-- create table user(
-- user_id int auto_increment primary key,
-- username varchar(40) not null,
-- user_password varchar(100) not null,
-- role enum ('teacher','student') not null
-- );
-- drop table user;
-- create table notice(
-- notice_id int auto_increment primary key,
-- title varchar(50) not null,
-- content varchar(100) not null,
-- created_by varchar(100) not null,
-- create_at datetime default current_timestamp
-- );
-- drop table notice;
--  
-- INSERT INTO user (user_id, username, user_password, role) VALUES
-- (1, 'prof_sharma',   'teach@123', 'teacher'),
-- (2, 'prof_mehta',    'teach@456', 'teacher'),
-- (3, 'prof_verma',    'teach@789', 'teacher'),
-- (4, 'rahul_student', 'stud@123',  'student'),
-- (5, 'priya_student', 'stud@456',  'student'),
-- (6, 'amit_student',  'stud@789',  'student');

-- INSERT INTO notice(notice_id, title, content, created_by, create_at) VALUES
-- (1, 'Annual Sports Day',      'Held on 5th June at 8AM.',   1, '2025-05-01 09:00:00'),
-- (2, 'Exam Schedule Released', 'Exams start from 15th May.', 1, '2025-05-02 10:30:00'),
-- (3, 'Library Closure Notice', 'Closed Saturday for work.',  2, '2025-05-03 11:00:00'),
-- (4, 'Workshop on AI & ML',    'Workshop on 20th-21st May.', 2, '2025-05-04 12:00:00'),
-- (5, 'Fee Payment Reminder',   'Last date is 20th May.',     3, '2025-05-05 09:30:00'),
-- (6, 'College Holiday Notice', 'Holiday on 12th May.',       3, '2025-05-06 08:00:00');

-- delimiter $$
-- Create procedure registeruser(
--     IN p_username      varchar(100),
--     IN p_user_password varchar(255),
--     IN p_role          enum('teacher', 'student')
-- )
-- BEGIN
--     -- Check if username already exists
--     IF EXISTS (SELECT 1 FROM user WHERE username = p_username) THEN
--         select 'Error: Username already exists.' AS message;
--     ELSE
--         insert into user (username, user_password, role)
--         values (p_username, p_user_password, p_role);
--  
--         select 'User registered successfully.' AS message;
--     END IF;
-- END$$ 
-- delimiter ;
-- drop procedure registeruser;
-- call registeruser ('rasty', '1234', 'student');

-- DELIMITER $$
-- CREATE PROCEDURE userlogin(
--     IN p_username      VARCHAR(100),
--     IN p_user_password VARCHAR(255)
-- )
-- BEGIN
--     DECLARE v_count INT;
--     -- Check if matching credentials exist
--     SELECT COUNT(*) INTO v_count
--     FROM user
--     WHERE username = p_username
--       AND user_password = p_user_password;
--  
--     IF v_count = 0 THEN
--         SELECT 'Error: Invalid username or password.' AS message;
--     ELSE
--         -- Return user details (excluding password for safety)
--         SELECT user_id,
--                username,
--                role,
--                'Login successful.' AS message
--         FROM user
--         WHERE username = p_username
--           AND user_password = p_user_password;
--     END IF;
-- END$$
-- DELIMITER ;
-- call userlogin('rasty', '1234');
-- -- 3createnotice
-- DELIMITER $$
--   
--  create procedure createnotice(in p_user_id int,in p_title varchar(50),in p_content varchar(70))
--  BEGIN
--  insert into notice (title, content, created_by)values(p_title, p_content, p_user_id);
--  select 'Notice created successfully.' as message;
--  END$$
--  DELIMITER ;

call createnotice(1, 'Exam Schedule Released',
--     'Mid-term exam schedule.');
-- 5 viewnotice--          
 DELIMITER $$ 
  create procedure viewnotice()
 BEGIN
 select n.notice_id,n.title,n.content,u.username as created_by,n.created_at
 from notice n
 join user u on n.created_by = u.user_id
  order by n.created_at DESC;
 END$$
 DELIMITER ;

 delimiter $$
 create procedure updatenotice(in p_user_id   int,in p_notice_id int,in p_title varchar(50),
  in p_content varchar(100))
 begin
  if not exists (select 1 from notice where notice_id = p_notice_id) then
 select 'Error: Notice not found.' as message;
 else
 update notice
 set title = p_title,content = p_content where notice_id = p_notice_id;
  select 'Notice updated successfully.' as message;
  end if;
 end$$
 delimiter ;


 drop procedure updatenotice;
 call updatenotice( 1,1, 'Annual Sports Day - UPDATED',
     'Annual Sports Day .');
    
    
    
    delimiter $$
create procedure deletenotice(in p_user_id int,in p_notice_id int)
begin
    if not exists (select 1 from notice where notice_id = p_notice_id) then
        select 'Error: Notice not found.' as message;
    else
        delete from notice
        where notice_id = p_notice_id;
        select 'Notice deleted successfully.' as message;
    end if;
end$$
delimiter ;
call deletenotice(1, 3);




 




