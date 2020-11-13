SELECT
    Spacecraft,
    [Launch date],
    [Carrier rocket],
    Operator,
    [Mission type]
INTO
    SuccessfulMissions
FROM 
    MoonMissions
WHERE 
    Outcome = 'Successful';

GO

UPDATE 
    SuccessfulMissions
SET 
    Operator = TRIM(Operator);

GO

DELETE FROM
     SuccessfulMissions
WHERE [Launch date] > '2009';

GO

SELECT
    Operator,
    [Mission type],
    Count([Mission type]) AS 'Mission Count'
FROM
    SuccessfulMissions
GROUP BY 
    Operator, 
    [Mission Type]
HAVING 
    Count([Mission type]) > 1
ORDER BY 
    Operator, 
    [Mission type];

GO

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

GO

SELECT
    UserName,
    COUNT(UserName) as 'Duplicates'
FROM
    NewUsers
GROUP BY 
    UserName
HAVING 
   COUNT(UserName) > 1;

GO

UPDATE NewUsers SET UserName = 'sigp01' WHERE [Name] = 'Sigfrid Petersson'
UPDATE NewUsers SET UserName = 'sigp02' WHERE [Name] = 'Sigrid Pettersson'
UPDATE NewUsers SET UserName = 'felb01' WHERE [Name] = 'Felicia Bertilsson';

GO

DELETE FROM
     NewUsers
WHERE 
    SUBSTRING(ID,1,2) < 70 
AND
    GENDER = 'Female';

GO

INSERT INTO
    NewUsers
VALUES 
    ('841014-1231', 'janmue',
    '47551f837eb5a3f260sd124fdfd03730', 'Jannis',
    'Mueller','jannis.mueller@hotmail.de',
    '0723-068922','Jannis Mueller','Male');
GO

SELECT
    Gender,
    AVG(DATEDIFF(year, LEFT(id,6), GETDATE())) AS "average age"
FROM
    NewUsers
GROUP BY
    Gender;

GO