--MoonMission
SELECT
    Spacecraft,
    [Launch date],
    [Carrier rocket],
    Operator,
    [Mission type]
INTO
    SuccessfulMissions
FROM 
    MoonMissions;   
GO
UPDATE SuccessfulMissions
SET Operator = TRIM(Operator,1)
GO
SELECT * FROM SuccessfulMissions;


--Users
SELECT * FROM Users;

SELECT
     *,
    FirstName + ' ' + LastName as 'Name',
    CASE
        WHEN  SUBSTRING (ID,10,1) % 2 = 0 THEN 'Female'
        ELSE 'Male'
        END as 'Gender'
INTO
    NewUsers
FROM 
Users;



SELECT * FROM NewUsers;