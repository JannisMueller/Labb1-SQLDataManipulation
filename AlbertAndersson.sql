DROP TABLE SuccessfulMissions

--Anv�nd �select into� f�r att ta ut kolumnerna �Spacecraft�, �Launch date�,
--�Carrier rocket�, �Operator�, samt �Mission type� f�r alla lyckade uppdrag
--(Successful outcome) och s�tt in i en ny tabell med namn �SuccessfulMissions�.

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

--I kolumnen �Operator� har det smugit sig in ett eller flera mellanslag f�re
--operat�rens namn. Skriv en query som uppdaterar �SuccessfulMissions� och
--tar bort mellanslagen kring operat�r.

Update 
	SuccessfulMissions
SET
	Operator = TRIM(Operator)

GO

--Skriv en query som tar bort alla uppdrag utf�rda 2010 eller senare fr�n
--�SuccessfulMissions� DELETE FROM 	SuccessfulMissionsWHERE [Launch date] >= '2010-10-01 00:00:00.0000000'GO
--Skriv en select query som tar ut, grupperar, samt sorterar p� kolumnerna
--�Operator� och 
-- �Mission type� 
-- fr�n �SuccessfulMissions�. 

-- Som en tredje kolumn
--�Mission count� i resultatet vill vi ha antal uppdrag av varje operat�r och typ. Ta
--bara med de grupper som har fler �n ett (>1) uppdrag av samma typ och
--operat�r. SELECT 	Operator,	[Mission type],	Count([Mission type]) AS 'Mission Count'FROM SuccessfulMissionsGROUP BY Operator, [Mission Type]
	HAVING Count([Mission type]) > 1
ORDER BY Operator, [Mission type]

GO

--- SLUTAT H�R ----

--Users
--Ta ut samtliga rader och kolumner fr�n tabellen �Users�, men sl� ihop
--�Firstname� och �Lastname� till en ny kolumn �Name�, 
-- samt l�gg till en extra kolumn �Gender� som du ger v�rdet �Female� f�r alla anv�ndare vars n�st sista
--siffra i personnumret �r j�mn, och v�rdet �Male� f�r de anv�ndare d�r siffran �r
--udda. 

--S�tt in resultatet i en ny tabell �NewUsers�

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

