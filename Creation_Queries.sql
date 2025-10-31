USE StudentsDB;
GO
-- Delete old Table if exist
IF OBJECT_ID('dbo.Attendance', 'U') IS NOT NULL DROP TABLE dbo.Attendance;
IF OBJECT_ID('dbo.Scores', 'U') IS NOT NULL DROP TABLE dbo.Scores;
IF OBJECT_ID('dbo.Students', 'U') IS NOT NULL DROP TABLE dbo.Students;
GO

-- Stuedent Table
CREATE TABLE dbo.Students (
    student_id VARCHAR(50) PRIMARY KEY,
    student_name VARCHAR(50),
    ParentEduc VARCHAR(50),
    ParentMaritalStatus VARCHAR(50),
    IsFirstChild VARCHAR(10),
    NrSiblings INT,
    TransportMeans VARCHAR(50),
    LunchType VARCHAR(50),
    PracticeSport VARCHAR(50)  
);
GO

--Scores TAble
CREATE TABLE dbo.Scores (
    score_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id VARCHAR(50) NOT NULL,
    MathScore FLOAT,
    ReadingScore FLOAT,
    WritingScore FLOAT,
    TotalPerformance FLOAT,
    CONSTRAINT FK_Scores_Students FOREIGN KEY (student_id)
        REFERENCES dbo.Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

-- Attendance Table
CREATE TABLE dbo.Attendance (
    attendance_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id VARCHAR(50) NOT NULL,
    AttendanceRate FLOAT,
    WklyStudyHours_num FLOAT,
    CONSTRAINT FK_Attendance_Students FOREIGN KEY (student_id)
        REFERENCES dbo.Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO
