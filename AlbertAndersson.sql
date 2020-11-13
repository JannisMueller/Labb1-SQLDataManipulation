DROP TABLE SuccessfulMissions

--Använd ”select into” för att ta ut kolumnerna ’Spacecraft’, ’Launch date’,
--’Carrier rocket’, ’Operator’, samt ’Mission type’ för alla lyckade uppdrag
--(Successful outcome) och sätt in i en ny tabell med namn ”SuccessfulMissions”.

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
	Outcome = 'Successful'

GO

--I kolumnen ’Operator’ har det smugit sig in ett eller flera mellanslag före
--operatörens namn. Skriv en query som uppdaterar ”SuccessfulMissions” och
--tar bort mellanslagen kring operatör.

Update 
	SuccessfulMissions
SET
	Operator = TRIM(Operator)

GO

--Skriv en query som tar bort alla uppdrag utförda 2010 eller senare från
--”SuccessfulMissions” DELETE FROM 	SuccessfulMissionsWHERE [Launch date] >= '2010-10-01 00:00:00.0000000'GO
--Skriv en select query som tar ut, grupperar, samt sorterar på kolumnerna
--’Operator’ och 
-- ’Mission type’ 
-- från ”SuccessfulMissions”. 

-- Som en tredje kolumn
--’Mission count’ i resultatet vill vi ha antal uppdrag av varje operatör och typ. Ta
--bara med de grupper som har fler än ett (>1) uppdrag av samma typ och
--operatör. SELECT 	Operator,	[Mission type],	Count([Mission type]) AS 'Mission Count'FROM SuccessfulMissionsGROUP BY Operator, [Mission Type]
	HAVING Count([Mission type]) > 1
ORDER BY Operator, [Mission type]

GO

--- SLUTAT HÄR ----

--Users
--Ta ut samtliga rader och kolumner från tabellen ”Users”, men slå ihop
--’Firstname’ och ’Lastname’ till en ny kolumn ’Name’, 
-- samt lägg till en extra kolumn ’Gender’ som du ger värdet ’Female’ för alla användare vars näst sista
--siffra i personnumret är jämn, och värdet ’Male’ för de användare där siffran är
--udda. 

--Sätt in resultatet i en ny tabell ”NewUsers”

SELECT 
	*,
	FirstName + ' ' + LastName AS 'Name',
	CASE
		WHEN 
			SUBSTRING(id, 10, 1) % 2 = 1 THEN 'Male'
		ELSE 'Female'
	END AS 'Gender'
INTO 
	NewUsers
FROM USERS;

GO

