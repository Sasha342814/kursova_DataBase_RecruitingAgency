INSERT INTO SeniorityLevel (level_name) VALUES
('Intern'), ('Junior'), ('Middle'), ('Senior'), ('Lead'),
('Principal'), ('Architect'), ('Expert'), ('Master'), ('Director');

INSERT INTO EmploymentType (type_name) VALUES
('Full-time'), ('Part-time'), ('Remote'), ('Hybrid'), ('Contract'),
('Internship'), ('Temporary'), ('Seasonal'), ('Project-based'), ('On-site');

INSERT INTO InterviewStatus (status_name) VALUES
('Scheduled'), ('Completed'), ('Canceled'), ('Failed'), ('Passed'),
('Rescheduled'), ('Awaiting'), ('In Progress'), ('Not Started'), ('Declined');

INSERT INTO ApplicationStatus (status_name) VALUES
('Submitted'), ('Reviewed'), ('Interview Scheduled'), ('Rejected'), ('Accepted'),
('On Hold'), ('In Review'), ('Withdrawn'), ('Failed Test'), ('Offer Sent');

INSERT INTO JobCategory (category_name) VALUES
('IT / Software'), ('Design'), ('Marketing'), ('Sales'), ('Education'),
('Healthcare'), ('Logistics'), ('Engineering'), ('Finance'), ('HR');

INSERT INTO Candidate (first_name, last_name, email, phone_number, resume, specialization, seniority_level_id)
VALUES
('Олександр','Харук','alex1@example.com','0981112233','Resume text...','Backend',3),
('Марія','Коваленко','maria2@example.com','0972223344','Resume text...','UI/UX',2),
('Ігор','Семенов','igor3@example.com','0933334455','Resume text...','Data Science',4),
('Анна','Левченко','anna4@example.com','0994445566','Resume text...','Frontend',1),
('Дмитро','Орлов','dima5@example.com','0965556677','Resume text...','DevOps',5),
('Наталія','Сидоренко','nata6@example.com','0916667788','Resume text...','QA',2),
('Андрій','Мельник','mel7@example.com','0957778899','Resume text...','Backend',3),
('Олег','Воробей','vor8@example.com','0948889900','Resume text...','GameDev',1),
('Катерина','Степаненко','kat9@example.com','0930001122','Resume text...','ML',4),
('Сергій','Петренко','ser10@example.com','0982223344','Resume text...','SysAdmin',3);

INSERT INTO Employer (company_name, contact_person, email, phone_number, company_website)
VALUES
('SoftServe','Іван Коваль','soft1@example.com','0501234567','softserve.com'),
('GlobalLogic','Марія Сич','glob2@example.com','0662345678','globallogic.com'),
('EPAM','Олег Гринь','epam3@example.com','0673456789','epam.com'),
('Sigma Software','Анна Дрозд','sigma4@example.com','0684567890','sigma.com'),
('Luxoft','Дмитро Орел','lux5@example.com','0975678901','luxoft.com'),
('ELEKS','Сергій Левчук','eleks6@example.com','0936789012','eleks.com'),
('Innovecs','Олег Рибак','inv7@example.com','0947890123','innovecs.com'),
('Genesis','Катерина Вовк','gen8@example.com','0958901234','gen.tech'),
('Ajax Systems','Юрій Мельник','ajax9@example.com','0969012345','ajax.systems'),
('Rozetka','Ігор Савчук','roz10@example.com','0990123456','rozetka.com');

INSERT INTO JobVacancy (job_title, description, salary, location, category_id, employment_type_id, employer_id)
VALUES
('Backend Developer','Node.js, SQL',3000,'Kyiv',1,1,1),
('UI/UX Designer','Figma, UX',2000,'Lviv',2,3,2),
('Data Scientist','ML, Python',3500,'Kyiv',1,3,3),
('Frontend React Dev','React.js',2500,'Odessa',1,1,4),
('QA Engineer','Manual QA',1500,'Dnipro',1,4,5),
('DevOps Engineer','Docker, AWS',4000,'Kyiv',1,1,6),
('Project Manager','Agile/Scrum',2800,'Lviv',10,1,7),
('Game Developer','Unity C#',3200,'Kyiv',1,3,8),
('ML Engineer','TensorFlow',3600,'Kharkiv',1,3,9),
('System Administrator','Linux',1800,'Kyiv',1,1,10);

INSERT INTO AgencyEmployee (full_name, position, email, phone_number)
VALUES
('Іван Ткаченко','HR Manager','hr1@example.com','0501112233'),
('Анна Ковтун','Recruiter','hr2@example.com','0502223344'),
('Марія Козак','Recruiter','hr3@example.com','0503334455'),
('Олег Вишневський','IT Recruiter','hr4@example.com','0504445566'),
('Андрій Жук','Senior Recruiter','hr5@example.com','0505556677'),
('Юлія Дуб','HR Assistant','hr6@example.com','0506667788'),
('Ірина Руда','Coordinator','hr7@example.com','0507778899'),
('Петро Лис','Team Lead','hr8@example.com','0508889900'),
('Катерина Орел','Recruiter','hr9@example.com','0509990011'),
('Сергій Сокіл','HR Manager','hr10@example.com','0500001122');

INSERT INTO Skill (skill_name) VALUES
('Python'), ('Java'), ('C++'), ('SQL'), ('HTML/CSS'),
('JavaScript'), ('React'), ('Node.js'), ('Docker'), ('AWS');

INSERT INTO CandidateSkill (candidate_id, skill_id) VALUES
(1,4),(1,8),(2,5),(2,7),(3,1),(3,10),(4,6),(5,9),(6,3),(7,2);

INSERT INTO Application (candidate_id, vacancy_id, employer_id, status_id)
VALUES
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,5,5,5),
(6,6,6,6),
(7,7,7,7),
(8,8,8,8),
(9,9,9,9),
(10,10,10,10);

INSERT INTO Interview (application_id, interview_datetime, location, status_id)
VALUES
(1,'2025-01-11 10:00','Kyiv',1),
(2,'2025-01-12 11:00','Lviv',2),
(3,'2025-01-13 12:00','Kyiv',3),
(4,'2025-01-14 13:00','Odessa',4),
(5,'2025-01-15 14:00','Dnipro',5),
(6,'2025-01-16 15:00','Kyiv',6),
(7,'2025-01-17 09:00','Lviv',7),
(8,'2025-01-18 16:00','Kyiv',8),
(9,'2025-01-19 17:00','Kharkiv',9),
(10,'2025-01-20 18:00','Kyiv',10);
