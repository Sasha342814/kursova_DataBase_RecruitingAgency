CREATE OR ALTER PROCEDURE dbo.sp_GetContactInfo
    @CandidateID INT = NULL,               
    @Phone NVARCHAR(20) = NULL,            
    @PageSize INT = 20,                    
    @PageNumber INT = 1,                    
    @SortColumn VARCHAR(128) = 'id',        
    @SortDirection BIT = 0                  
AS
BEGIN
    SET NOCOUNT ON;

    IF @CandidateID IS NOT NULL
       AND NOT EXISTS (SELECT 1 FROM Candidate WHERE id = @CandidateID)
    BEGIN
        PRINT 'Incorrect @CandidateID value';
        RETURN;
    END

    SELECT
        id AS CandidateID,
        first_name,
        last_name,
        phone_number,
        email,
        specialization
    FROM Candidate
    WHERE
        (@CandidateID IS NULL OR id = @CandidateID)
        AND (@Phone IS NULL OR phone_number LIKE '%' + @Phone + '%')

    ORDER BY
        CASE WHEN @SortDirection = 0 THEN
            CASE @SortColumn
                WHEN 'id' THEN CAST(id AS NVARCHAR(50))
                WHEN 'first_name' THEN first_name
                WHEN 'last_name' THEN last_name
                WHEN 'phone_number' THEN phone_number
                WHEN 'email' THEN email
                WHEN 'specialization' THEN specialization
            END
        END ASC,
        CASE WHEN @SortDirection = 1 THEN
            CASE @SortColumn
                WHEN 'id' THEN CAST(id AS NVARCHAR(50))
                WHEN 'first_name' THEN first_name
                WHEN 'last_name' THEN last_name
                WHEN 'phone_number' THEN phone_number
                WHEN 'email' THEN email
                WHEN 'specialization' THEN specialization
            END
        END DESC

    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY;
END;
GO

EXEC dbo.sp_GetContactInfo;

EXEC dbo.sp_GetContactInfo @CandidateID = 5;

EXEC dbo.sp_GetContactInfo @Phone = '098';

EXEC dbo.sp_GetContactInfo 
    @SortColumn = 'email',
    @SortDirection = 0;

EXEC dbo.sp_GetContactInfo 
    @SortColumn = 'last_name',
    @SortDirection = 1;

EXEC dbo.sp_GetContactInfo 
    @PageSize = 5,
    @PageNumber = 2;
    