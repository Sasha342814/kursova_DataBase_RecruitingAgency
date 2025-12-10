CREATE OR ALTER PROCEDURE dbo.sp_SetCandidate
    @id INT = NULL OUTPUT,
    @first_name NVARCHAR(50) = NULL,
    @last_name NVARCHAR(50) = NULL,
    @email NVARCHAR(100) = NULL,
    @phone_number NVARCHAR(20) = NULL,
    @resume NVARCHAR(MAX) = NULL,
    @specialization NVARCHAR(100) = NULL,
    @seniority_level_id INT = NULL
AS
BEGIN
    BEGIN TRY

        IF @id IS NULL
        BEGIN
    
            SET @id = 1 + ISNULL(
                (SELECT TOP(1) id FROM Candidate ORDER BY id DESC), 
                0
            );

            INSERT INTO Candidate
            (id, first_name, last_name, email, phone_number, resume, specialization, seniority_level_id)
            VALUES
            (@id, @first_name, @last_name, @email, @phone_number, @resume, @specialization, @seniority_level_id);
        END

        ELSE
        BEGIN
            UPDATE TOP(1) Candidate
            SET
                first_name         = ISNULL(@first_name, first_name),
                last_name          = ISNULL(@last_name, last_name),
                email              = ISNULL(@email, email),
                phone_number       = ISNULL(@phone_number, phone_number),
                resume             = ISNULL(@resume, resume),
                specialization      = ISNULL(@specialization, specialization),
                seniority_level_id  = ISNULL(@seniority_level_id, seniority_level_id)
            WHERE id = @id;
        END

    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO


CREATE OR ALTER PROCEDURE dbo.sp_SetEmployer
    @id INT = NULL OUTPUT,
    @company_name NVARCHAR(100) = NULL,
    @contact_person NVARCHAR(100) = NULL,
    @email NVARCHAR(100) = NULL,
    @phone_number NVARCHAR(20) = NULL,
    @company_website NVARCHAR(200) = NULL
AS
BEGIN
    BEGIN TRY

        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM Employer ORDER BY id DESC), 0)

            INSERT INTO Employer(id, company_name, contact_person, email, phone_number, company_website)
            VALUES (@id, @company_name, @contact_person, @email, @phone_number, @company_website)
        END
        ELSE
        BEGIN
            UPDATE TOP(1) Employer
            SET company_name    = ISNULL(@company_name, company_name),
                contact_person  = ISNULL(@contact_person, contact_person),
                email           = ISNULL(@email, email),
                phone_number    = ISNULL(@phone_number, phone_number),
                company_website = ISNULL(@company_website, company_website)
            WHERE id = @id
        END

    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END;
GO


CREATE OR ALTER PROCEDURE dbo.sp_SetJobVacancy
    @id INT = NULL OUTPUT,
    @job_title NVARCHAR(100) = NULL,
    @description NVARCHAR(MAX) = NULL,
    @salary DECIMAL(10,2) = NULL,
    @location NVARCHAR(100) = NULL,
    @category_id INT = NULL,
    @employment_type_id INT = NULL,
    @employer_id INT = NULL
AS
BEGIN
    BEGIN TRY
        
        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM JobVacancy ORDER BY id DESC), 0)

            INSERT INTO JobVacancy(id, job_title, description, salary, location, category_id, employment_type_id, employer_id)
            VALUES (@id, @job_title, @description, @salary, @location, @category_id, @employment_type_id, @employer_id)
        END
        ELSE
        BEGIN
            UPDATE TOP(1) JobVacancy
            SET job_title          = ISNULL(@job_title, job_title),
                description        = ISNULL(@description, description),
                salary             = ISNULL(@salary, salary),
                location           = ISNULL(@location, location),
                category_id        = ISNULL(@category_id, category_id),
                employment_type_id = ISNULL(@employment_type_id, employment_type_id),
                employer_id        = ISNULL(@employer_id, employer_id)
            WHERE id = @id
        END

    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END;
GO


CREATE OR ALTER PROCEDURE dbo.sp_SetSkill
    @id INT = NULL OUTPUT,
    @skill_name NVARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRY
        
        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM Skill ORDER BY id DESC), 0)

            INSERT INTO Skill(id, skill_name)
            VALUES (@id, @skill_name)
        END
        ELSE
        BEGIN
            UPDATE TOP(1) Skill
            SET skill_name = ISNULL(@skill_name, skill_name)
            WHERE id = @id
        END

    END TRY
    BEGIN CATCH 
        PRINT ERROR_MESSAGE()
    END CATCH
END;
GO


CREATE OR ALTER PROCEDURE dbo.sp_SetCandidateSkill
    @id INT = NULL OUTPUT,
    @candidate_id INT = NULL,
    @skill_id INT = NULL
AS
BEGIN
    BEGIN TRY
        
        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM CandidateSkill ORDER BY id DESC), 0)

            INSERT INTO CandidateSkill(id, candidate_id, skill_id)
            VALUES (@id, @candidate_id, @skill_id)
        END
        ELSE
        BEGIN
            UPDATE TOP(1) CandidateSkill
            SET candidate_id = ISNULL(@candidate_id, candidate_id),
                skill_id     = ISNULL(@skill_id, skill_id)
            WHERE id = @id
        END

    END TRY
    BEGIN CATCH 
        PRINT ERROR_MESSAGE()
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_SetApplication
    @id INT = NULL OUTPUT,
    @candidate_id INT = NULL,
    @vacancy_id INT = NULL,
    @employer_id INT = NULL,
    @status_id INT = NULL,
    @apply_date DATE = NULL
AS
BEGIN
    BEGIN TRY
        
        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM Application ORDER BY id DESC), 0)

            INSERT INTO Application(id, candidate_id, vacancy_id, employer_id, status_id, apply_date)
            VALUES (@id, @candidate_id, @vacancy_id, @employer_id, @status_id, ISNULL(@apply_date, GETDATE()))
        END
        ELSE
        BEGIN
            UPDATE TOP(1) Application
            SET candidate_id = ISNULL(@candidate_id, candidate_id),
                vacancy_id   = ISNULL(@vacancy_id, vacancy_id),
                employer_id  = ISNULL(@employer_id, employer_id),
                status_id    = ISNULL(@status_id, status_id),
                apply_date   = ISNULL(@apply_date, apply_date)
            WHERE id = @id
        END

    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END;
GO


CREATE OR ALTER PROCEDURE dbo.sp_SetInterview
    @id INT = NULL OUTPUT,
    @application_id INT = NULL,
    @interview_datetime DATETIME = NULL,
    @location NVARCHAR(100) = NULL,
    @status_id INT = NULL
AS
BEGIN
    BEGIN TRY
        
        IF @id IS NULL
        BEGIN
            SET @id = 1 + ISNULL((SELECT TOP(1) id FROM Interview ORDER BY id DESC), 0)

            INSERT INTO Interview(id, application_id, interview_datetime, location, status_id)
            VALUES (@id, @application_id, @interview_datetime, @location, @status_id)
        END
        ELSE
        BEGIN
            UPDATE TOP(1) Interview
            SET application_id      = ISNULL(@application_id, application_id),
                interview_datetime  = ISNULL(@interview_datetime, interview_datetime),
                location            = ISNULL(@location, location),
                status_id           = ISNULL(@status_id, status_id)
            WHERE id = @id
        END

    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END;
GO

DECLARE @newID INT;

EXEC dbo.sp_SetCandidate
    @id = @newID OUTPUT,
    @first_name = 'Влад',
    @last_name = 'Кравчук',
    @email = 'vlad.k@example.com',
    @phone_number = '0991112233',
    @resume = 'New resume text...',
    @specialization = 'Backend',
    @seniority_level_id = 3;

SELECT @newID AS CreatedCandidateID;

EXEC dbo.sp_SetCandidate
    @id = 3,
    @phone_number = '0995556677', 
    @specialization = 'Machine Learning';

EXEC dbo.sp_SetCandidate
    @id = 5,
    @email = 'new_email@example.com';
