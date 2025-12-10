CREATE TABLE SeniorityLevel (
    id INT PRIMARY KEY IDENTITY(1,1),
    level_name NVARCHAR(50) NOT NULL
);

CREATE TABLE EmploymentType (
    id INT PRIMARY KEY IDENTITY(1,1),
    type_name NVARCHAR(50) NOT NULL
);

CREATE TABLE InterviewStatus (
    id INT PRIMARY KEY IDENTITY(1,1),
    status_name NVARCHAR(50) NOT NULL
);

CREATE TABLE ApplicationStatus (
    id INT PRIMARY KEY IDENTITY(1,1),
    status_name NVARCHAR(50) NOT NULL
);

CREATE TABLE JobCategory (
    id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(100) NOT NULL
);

CREATE TABLE Candidate (
    id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone_number NVARCHAR(20),
    resume NVARCHAR(MAX),
    specialization NVARCHAR(100),
    seniority_level_id INT,
    FOREIGN KEY (seniority_level_id) REFERENCES SeniorityLevel(id)
);

CREATE TABLE Employer (
    id INT PRIMARY KEY IDENTITY(1,1),
    company_name NVARCHAR(100) NOT NULL,
    contact_person NVARCHAR(100),
    email NVARCHAR(100) UNIQUE NOT NULL,
    phone_number NVARCHAR(20),
    company_website NVARCHAR(200)
);

CREATE TABLE JobVacancy (
    id INT PRIMARY KEY IDENTITY(1,1),
    job_title NVARCHAR(100) NOT NULL,
    description NVARCHAR(MAX),
    salary DECIMAL(10,2),
    location NVARCHAR(100),
    category_id INT,
    employment_type_id INT,
    employer_id INT,
    FOREIGN KEY (category_id) REFERENCES JobCategory(id),
    FOREIGN KEY (employment_type_id) REFERENCES EmploymentType(id),
    FOREIGN KEY (employer_id) REFERENCES Employer(id)
);

CREATE TABLE AgencyEmployee (
    id INT PRIMARY KEY IDENTITY(1,1),
    full_name NVARCHAR(100) NOT NULL,
    position NVARCHAR(100),
    email NVARCHAR(100),
    phone_number NVARCHAR(20)
);

CREATE TABLE Application (
    id INT PRIMARY KEY IDENTITY(1,1),
    candidate_id INT,
    vacancy_id INT,
    employer_id INT,
    status_id INT,
    apply_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (candidate_id) REFERENCES Candidate(id),
    FOREIGN KEY (vacancy_id) REFERENCES JobVacancy(id),
    FOREIGN KEY (employer_id) REFERENCES Employer(id),
    FOREIGN KEY (status_id) REFERENCES ApplicationStatus(id)
);

CREATE TABLE Interview (
    id INT PRIMARY KEY IDENTITY(1,1),
    application_id INT,
    interview_datetime DATETIME,
    location NVARCHAR(100),
    status_id INT,
    FOREIGN KEY (application_id) REFERENCES Application(id),
    FOREIGN KEY (status_id) REFERENCES InterviewStatus(id)
);

CREATE TABLE Skill (
    id INT PRIMARY KEY IDENTITY(1,1),
    skill_name NVARCHAR(100) NOT NULL
);

CREATE TABLE CandidateSkill (
    id INT PRIMARY KEY IDENTITY(1,1),
    candidate_id INT,
    skill_id INT,
    FOREIGN KEY (candidate_id) REFERENCES Candidate(id),
    FOREIGN KEY (skill_id) REFERENCES Skill(id)
);