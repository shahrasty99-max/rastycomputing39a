create database LMS_DB;
use LMS_DB;
drop database LMS_DB;


create table students(
student_id int auto_increment primary key,
first_name varchar(100),
last_name varchar(100),
email varchar(100),
registration_date DATE,
country varchar(100));

create table Instructors(
instructor_id int primary key auto_increment,
instructor_name varchar(100),
  specialization varchar(100),
  joining_date date
  );

create table Courses(
course_id int primary key auto_increment,
course_name varchar(100),
category varchar(50),
course_fee decimal(10,2),
instructor_id int,
foreign key (instructor_id)
references Instructors(instructor_id));

create table Enrollments(
enrollment_id int primary key auto_increment,
enrollment_date date,
completion_status varchar(20),
student_id int,
course_id int,
foreign key (student_id)
references Students(student_id),
foreign key (course_id )
references Courses (course_id ));

create table Assignments(
assignment_id int primary key auto_increment,
course_id int,
assignment_tittle varchar(100),
max_marks int,
due_date date,
foreign key (course_id )
references Courses (course_id ));

create table Assignment_Submissions(
submission_id int primary key auto_increment,
assignment_id int,
student_id int,
marksobtained int,
submission_date date,
foreign key (student_id)
references Students(student_id),
foreign key (assignment_id)
references Assignments(assignment_id));


create table Payments(
payment_id int primary key auto_increment,
student_id int,
amount_paid decimal(10,2),
payment_date date,
payment_method varchar(20),
foreign key (student_id)
references Students(student_id));

INSERT INTO students (first_name, last_name, email, registration_date, country) VALUES
('Rasty', 'Sah', 'rasty.sah@example.com', '2026-01-10', 'Nepal'),
('Ram', 'Sharma', 'ram.sharma@example.com', '2026-01-12', 'Nepal'),
('Sita', 'Gupta', 'sita.gupta@example.com', '2026-01-15', 'India'),
('Raj', 'Rai', 'raj.rai@example.com', '2026-01-20', 'Nepal'),
('Riya', 'Sharma', 'riya.sharma@example.com', '2026-01-25', 'Nepal'),
('Anil', 'Kumar', 'anil.kumar@example.com', '2026-02-01', 'India'),
('Sunita', 'Thapa', 'sunita.thapa@example.com', '2026-02-05', 'Nepal'),
('Prakash', 'Yadav', 'prakash.yadav@example.com', '2026-02-10', 'Nepal'),
('Maya', 'Singh', 'maya.singh@example.com', '2026-02-15', 'India'),
('Kiran', 'Joshi', 'kiran.joshi@example.com', '2026-02-20', 'Nepal'),
('Deepak', 'Adhikari', 'deepak.adhikari@example.com', '2026-02-25', 'Nepal'),
('Priya', 'Mehta', 'priya.mehta@example.com', '2026-03-01', 'India'),
('Suresh', 'Khadka', 'suresh.khadka@example.com', '2026-03-05', 'Nepal'),
('Alok', 'Verma', 'alok.verma@example.com', '2026-03-10', 'India'),
('Nisha', 'Pandey', 'nisha.pandey@example.com', '2026-03-15', 'Nepal'),
('Manoj', 'Shrestha', 'manoj.shrestha@example.com', '2026-03-20', 'Nepal'),
('Pooja', 'Rani', 'pooja.rani@example.com', '2026-03-25', 'India'),
('Santosh', 'Bista', 'santosh.bista@example.com', '2026-03-30', 'Nepal'),
('Komal', 'Chaudhary', 'komal.chaudhary@example.com', '2026-04-05', 'India'),
('Dipendra', 'Maharjan', 'dipendra.maharjan@example.com', '2026-04-10', 'Nepal');


select * from students;

INSERT INTO Instructors (instructor_name, specialization, joining_date) VALUES
('Amit Sharma', 'Computer Science', '2024-01-10'),
('Sunita Thapa', 'Mathematics', '2024-02-15'),
('Rajesh Gupta', 'Physics', '2024-03-05'),
('Maya Singh', 'Chemistry', '2024-04-20'),
('Prakash Yadav', 'Biology', '2024-05-12'),
('Kiran Joshi', 'Information Technology', '2024-06-01'),
('Ramesh Rai', 'Electronics', '2024-07-18'),
('Anita Kumari', 'English Literature', '2024-08-25'),
('Deepak Shrestha', 'Economics', '2024-09-10'),
('Saraswati Lama', 'History', '2024-10-05');

select * from Instructors;

INSERT INTO Courses (course_name, category, course_fee, instructor_id) VALUES
('Database Systems', 'Computer Science', 1500.00, 1),
('Calculus I', 'Mathematics', 1200.00, 2),
('Quantum Mechanics', 'Physics', 1800.00, 3),
('Organic Chemistry', 'Chemistry', 1600.00, 4),
('Genetics', 'Biology', 1400.00, 5),
('Web Development', 'IT', 2000.00, 6),
('Digital Circuits', 'Electronics', 1700.00, 7),
('British Literature', 'English', 1300.00, 8),
('Microeconomics', 'Economics', 1500.00, 9),
('World History', 'History', 1100.00, 10);
select * from Courses;

INSERT INTO Enrollments (enrollment_date, completion_status, student_id, course_id) VALUES
('2026-03-01', 'Completed', 1, 1),
('2026-03-02', 'In Progress', 2, 2),
('2026-03-03', 'Completed', 3, 3),
('2026-03-04', 'In Progress', 4, 4),
('2026-03-05', 'Completed', 5, 5),
('2026-03-06', 'In Progress', 6, 6),
('2026-03-07', 'Completed', 7, 7),
('2026-03-08', 'In Progress', 8, 8),
('2026-03-09', 'Completed', 9, 9),
('2026-03-10', 'In Progress', 10, 10);

select * from Enrollments;

INSERT INTO Assignments (course_id, assignment_tittle, max_marks, due_date) VALUES
(1, 'ER Diagram Project', 100, '2026-03-15'),
(2, 'Integration Problems', 50, '2026-03-18'),
(3, 'Wave Function Analysis', 75, '2026-03-20'),
(4, 'Organic Lab Report', 80, '2026-03-22'),
(5, 'Genetics Case Study', 60, '2026-03-25'),
(6, 'HTML & CSS Website', 100, '2026-03-28'),
(7, 'Logic Gate Simulation', 70, '2026-03-30'),
(8, 'Poetry Analysis Essay', 40, '2026-04-02'),
(9, 'Market Demand Report', 90, '2026-04-05'),
(10, 'Ancient Civilizations Paper', 50, '2026-04-08');
select * from Assignments;

INSERT INTO Assignment_Submissions (assignment_id, student_id, marksobtained, submission_date) VALUES
(1, 1, 90, '2026-03-14'),
(2, 2, 45, '2026-03-17'),
(3, 3, 70, '2026-03-19'),
(4, 4, 75, '2026-03-21'),
(5, 5, 55, '2026-03-24'),
(6, 6, 95, '2026-03-27'),
(7, 7, 65, '2026-03-29'),
(8, 8, 35, '2026-04-01'),
(9, 9, 85, '2026-04-04'),
(10, 10, 40, '2026-04-07');
select * from  Assignment_Submissions;

INSERT INTO Payments (student_id, amount_paid, payment_date, payment_method) VALUES
(1, 1500.00, '2026-03-01', 'Cash'),
(2, 1200.00, '2026-03-02', 'Credit Card'),
(3, 1800.00, '2026-03-03', 'Bank Transfer'),
(4, 1600.00, '2026-03-04', 'Cash'),
(5, 1400.00, '2026-03-05', 'Debit Card'),
(6, 2000.00, '2026-03-06', 'Credit Card'),
(7, 1700.00, '2026-03-07', 'Bank Transfer'),
(8, 1300.00, '2026-03-08', 'Cash'),
(9, 1500.00, '2026-03-09', 'Debit Card'),
(10, 1100.00, '2026-03-10', 'Credit Card');
select * from Payments;
-- -------------------------------1)-------------------------------- 
SELECT s.first_name, s.last_name
FROM Students s
JOIN Payments p
ON s.student_id = p.student_id
WHERE p.amount_paid > (
    SELECT AVG(amount_paid)
    FROM Payments
);
-- --------------------------2)-------------------
select course_name from Courses where course_fee > (select avg (course_fee)from courses);
-- --------------------------------3)-------------------------------------
SELECT i.instructor_id, i.instructor_name, c.course_name, c.course_fee
FROM Instructors i
JOIN Courses c ON i.instructor_id = c.instructor_id
WHERE c.course_fee = (
    SELECT MAX(course_fee)
    FROM Courses
);
-- --------------------------4)--------------------- 
SELECT s.student_id, first_name, c.course_name, c.course_fee
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_fee = (
    SELECT MAX(course_fee)
    FROM Courses
);
-- ----5)-------- 
SELECT assignment_id, assignment_tittle, max_marks
FROM Assignments
WHERE max_marks > (
    SELECT AVG(max_marks)
    FROM Assignments
);
-- ------6)-------
SELECT DISTINCT s.student_id, first_name
FROM Students s
JOIN Assignment_Submissions a 
    ON s.student_id = a.student_id;
    
   --  ---------7)--------
   SELECT s.student_id, first_name
FROM Students s
LEFT JOIN Assignment_Submissions a 
    ON s.student_id = a.student_id
WHERE a.submission_id IS NULL;

-- --------8)---------
SELECT DISTINCT c.course_id, c.course_name
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id;

-- --------9)--------
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- --------10)---------
SELECT i.instructor_id, i.instructor_name
FROM Instructors i
LEFT JOIN Courses c ON i.instructor_id = c.instructor_id
WHERE c.course_id IS NULL;

-- ---------11)--------
SELECT s.student_id, first_name
FROM Students s
WHERE (
    SELECT SUM(p.amount_paid)
    FROM Payments p
    WHERE p.student_id = s.student_id
) > (
    SELECT AVG(total_payment)
    FROM (
        SELECT SUM(amount_paid) AS total_payment
        FROM Payments
        GROUP BY student_id
    ) AS sub
);
































