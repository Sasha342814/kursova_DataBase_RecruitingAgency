SELECT 
    c.id,
    c.first_name,
    c.last_name,
    c.specialization,
    s.level_name AS Seniority
FROM Candidate c
LEFT JOIN SeniorityLevel s ON c.seniority_level_id = s.id;

SELECT 
    c.first_name + ' ' + c.last_name AS Candidate,
    s.skill_name AS Skill
FROM CandidateSkill cs
JOIN Candidate c ON cs.candidate_id = c.id
JOIN Skill s ON cs.skill_id = s.id
ORDER BY Candidate;

SELECT 
    j.job_title,
    e.company_name AS Employer,
    j.salary,
    j.location,
    jc.category_name AS Category,
    et.type_name AS EmploymentType
FROM JobVacancy j
JOIN Employer e ON j.employer_id = e.id
LEFT JOIN JobCategory jc ON j.category_id = jc.id
LEFT JOIN EmploymentType et ON j.employment_type_id = et.id;

SELECT 
    a.id AS ApplicationID,
    c.first_name + ' ' + c.last_name AS Candidate,
    j.job_title AS Vacancy,
    e.company_name AS Employer,
    st.status_name AS ApplicationStatus,
    a.apply_date
FROM Application a
JOIN Candidate c ON a.candidate_id = c.id
JOIN JobVacancy j ON a.vacancy_id = j.id
JOIN Employer e ON a.employer_id = e.id
JOIN ApplicationStatus st ON a.status_id = st.id
ORDER BY a.id;

SELECT 
    i.id AS InterviewID,
    c.first_name + ' ' + c.last_name AS Candidate,
    j.job_title AS Vacancy,
    e.company_name AS Employer,
    i.interview_datetime,
    i.location,
    ist.status_name AS InterviewStatus
FROM Interview i
JOIN Application a ON i.application_id = a.id
JOIN Candidate c ON a.candidate_id = c.id
JOIN JobVacancy j ON a.vacancy_id = j.id
JOIN Employer e ON a.employer_id = e.id
JOIN InterviewStatus ist ON i.status_id = ist.id;

SELECT 
    s.level_name AS SeniorityLevel,
    COUNT(c.id) AS CandidatesCount
FROM SeniorityLevel s
LEFT JOIN Candidate c ON c.seniority_level_id = s.id
GROUP BY s.level_name
ORDER BY CandidatesCount DESC;

SELECT 
    e.company_name AS Employer,
    COUNT(j.id) AS VacanciesCount
FROM Employer e
LEFT JOIN JobVacancy j ON j.employer_id = e.id
GROUP BY e.company_name
ORDER BY VacanciesCount DESC;

SELECT 
    j.location,
    j.job_title,
    j.salary,
    e.company_name AS Employer
FROM JobVacancy j
JOIN Employer e ON j.employer_id = e.id
WHERE j.salary = (
    SELECT MAX(salary)
    FROM JobVacancy
    WHERE location = j.location
)
ORDER BY j.location;

SELECT 
    c.first_name + ' ' + c.last_name AS Candidate,
    COUNT(cs.skill_id) AS TotalSkills
FROM Candidate c
LEFT JOIN CandidateSkill cs ON c.id = cs.candidate_id
GROUP BY c.first_name, c.last_name
ORDER BY TotalSkills DESC;

SELECT 
    c.first_name + ' ' + c.last_name AS Candidate,
    c.email,
    c.specialization,
    sl.level_name AS Seniority,
    sk.skill_name AS Skill
FROM Candidate c
LEFT JOIN SeniorityLevel sl ON c.seniority_level_id = sl.id
LEFT JOIN CandidateSkill cs ON c.id = cs.candidate_id
LEFT JOIN Skill sk ON cs.skill_id = sk.id
ORDER BY Candidate;
