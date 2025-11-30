CREATE OR ALTER PROCEDURE dbo.sp_AddCandidate
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Resume NVARCHAR(MAX),
    @Specialization NVARCHAR(100),
    @SeniorityLevelID INT
AS
BEGIN
    
    IF EXISTS (SELECT 1 FROM Candidate WHERE email = @Email)
    BEGIN
        PRINT 'Candidate with this email already exists.';
        RETURN;
    END

    INSERT INTO Candidate (first_name, last_name, email, phone_number, resume, specialization, seniority_level_id)
    VALUES (@FirstName, @LastName, @Email, @Phone, @Resume, @Specialization, @SeniorityLevelID);

    PRINT 'Candidate successfully created.';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_AddApplication
    @CandidateID INT,
    @VacancyID INT,
    @EmployerID INT,
    @StatusID INT = 1  
AS
BEGIN
   
    IF NOT EXISTS (SELECT 1 FROM Candidate WHERE id = @CandidateID)
    BEGIN
        PRINT 'Candidate does not exist.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM JobVacancy WHERE id = @VacancyID)
    BEGIN
        PRINT 'Vacancy does not exist.';
        RETURN;
    END

    INSERT INTO Application (candidate_id, vacancy_id, employer_id, status_id)
    VALUES (@CandidateID, @VacancyID, @EmployerID, @StatusID);

    PRINT 'Application successfully created.';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_ScheduleInterview
    @ApplicationID INT,
    @DateTime DATETIME,
    @Location NVARCHAR(100),
    @StatusID INT = 1  
AS
BEGIN
    
    IF NOT EXISTS (SELECT 1 FROM Application WHERE id = @ApplicationID)
    BEGIN
        PRINT 'Application does not exist.';
        RETURN;
    END

    INSERT INTO Interview (application_id, interview_datetime, location, status_id)
    VALUES (@ApplicationID, @DateTime, @Location, @StatusID);

    PRINT 'Interview successfully scheduled.';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_UpdateInterviewStatus
    @InterviewID INT,
    @NewStatusID INT
AS
BEGIN
   
    IF NOT EXISTS (SELECT 1 FROM Interview WHERE id = @InterviewID)
    BEGIN
        PRINT 'Interview does not exist.';
        RETURN;
    END

    UPDATE Interview
    SET status_id = @NewStatusID
    WHERE id = @InterviewID;

    PRINT 'Interview status updated.';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_HireCandidate
    @ApplicationID INT
AS
BEGIN
    DECLARE @CandidateID INT;

    
    SELECT @CandidateID = candidate_id FROM Application WHERE id = @ApplicationID;

    IF @CandidateID IS NULL
    BEGIN
        PRINT 'Application does not exist.';
        RETURN;
    END

    UPDATE Application
    SET status_id = 5 
    WHERE id = @ApplicationID;

    PRINT 'Candidate successfully hired.';
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_RejectApplication
    @ApplicationID INT
AS
BEGIN
   
    IF NOT EXISTS (SELECT 1 FROM Application WHERE id = @ApplicationID)
    BEGIN
        PRINT 'Application does not exist.';
        RETURN;
    END

    UPDATE Application
    SET status_id = 4 
    WHERE id = @ApplicationID;

    PRINT 'Application rejected.';
END;
GO

EXEC dbo.sp_AddCandidate 
    @FirstName='Олег', 
    @LastName='Петренко',
    @Email='test@example.com',
    @Phone='0991234567',
    @Resume='Resume text...',
    @Specialization='Backend',
    @SeniorityLevelID=3;

    EXEC dbo.sp_AddApplication 
    @CandidateID=1, 
    @VacancyID=3, 
    @EmployerID=2;

    EXEC dbo.sp_ScheduleInterview 
    @ApplicationID=1,
    @DateTime='2025-01-12 10:00',
    @Location='Kyiv';

    EXEC dbo.sp_UpdateInterviewStatus 
    @InterviewID=2,
    @NewStatusID=5;

    EXEC dbo.sp_HireCandidate @ApplicationID=4;

    EXEC dbo.sp_RejectApplication @ApplicationID=7;