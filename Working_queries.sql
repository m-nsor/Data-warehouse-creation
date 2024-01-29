
--1. Get all tasks for spy with codename 'Aturo'
SELECT *
FROM Task
LEFT JOIN spy
ON task.id = spy.id
WHERE codename='Aturo';

--2. Get all informant from countries in south America. 
SELECT informant.codeName
FROM informant
INNER JOIN country
ON informant.name=country.name
where continent='South America';


--3. Get all supervisorID of spies from south America. 
Select SPY.supervisorID
FROM network
INNER JOIN country
ON network.name=country.name
INNER JOIN spy
ON network.networkID=SPY.networkID
WHERE continent='South America';

--4. Get all Infor of skill_level of 5. 
Select *
from Skills
where skill_level='5';


--5. Select country and the network id in that country. 
Select Country.Name, NETWORK.networkID
FROM network
INNER JOIN country
ON network.name=country.name
INNER JOIN spy
ON network.networkID=SPY.networkID;

--6. Get total number of spies who speak Chinese 
SELECT count(spy.ID)
FROM spy
INNER JOIN language
on spy.id=language.id
WHERE name ='Chinese';


-- 7. Get number of informats
SELECT COUNT(*) as TotalInformants 
FROM Informant;

--8. Get all equipment used by spy Relay
SELECT equipment.equip_id,equipment.equip_name, equipment.type
from Equipment
LEFT JOIN spy
ON equipment.id = spy.id
WHERE codename='Relay';

--9. Get the network id that connect informant and spy
Select  NETWORK.networkID
from informant
inner JOIN network
on informant.name=network.name
inner JOIN SPY
on network.networkID=SPY.networkID;

--10. Get all spies who have 3 stars awarded 
Select spy.codename
from spy
LEFT JOIN rank
ON spy.id=rank.id
WHERE star_awarded=3;
