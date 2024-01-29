--Example query using ROLLUP/CUBE designation:
 
--1. Find the total number of completed tasks by country and network, and also the overall total.

SELECT Country. Name, network.networkid, COUNT(Task.taskID) AS Completed_Tasks
FROM Task
INNER JOIN Spy ON Task.ID = Spy.ID
INNER JOIN Network ON Spy.networkID = Network.networkID
INNER JOIN Country ON Network.Name = Country.Name
WHERE Task.isCompleted = 'true'
GROUP BY ROLLUP(Country.Name, Network.networkid);
 
--This query uses ROLLUP to generate subtotals and a grand total for the completed tasks by country and network.
 
--2. Display the total number of completed and uncompleted tasks for each network and country, along with the grand total:
 
SELECT COUNTRY.Name, NETWORK.name,
SUM(CASE WHEN TASK.isCompleted = 'true' THEN 1 ELSE 0 END) AS Completed_Tasks,
SUM(CASE WHEN TASK.isCompleted = 'false' THEN 1 ELSE 0 END) AS Uncompleted_Tasks
FROM COUNTRY 
LEFT JOIN CITY ON COUNTRY.Name = CITY.name
LEFT JOIN NETWORK  ON COUNTRY.Name = NETWORK.name
LEFT JOIN SPY  ON NETWORK.networkID = SPY.networkID
LEFT JOIN TASK  ON SPY.ID = TASK.ID
GROUP BY CUBE (COUNTRY.Name, NETWORK.Name);

 
--b. Example query using PARTITION construct:
 
--1. Calculate the moving average of days needed to complete a task for each spy, ordered by spy ID and task ID:
 
 
SELECT Spy.ID, task.date_completed, Task.isCompleted,
AVG(task.days_needed) OVER (PARTITION BY Spy.ID ORDER BY Task.taskID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Moving_Average
FROM Task
INNER JOIN Spy ON Task.ID = Spy.ID
WHERE Task.isCompleted = 'true'
ORDER BY Spy.ID, Task.taskID;

--Rank Query
--This query will generate a ranking for each spy within their respective network based on their skill level.

SELECT ID, codeName, skill_level, 
RANK() OVER(PARTITION BY networkID 
ORDER BY skill_level DESC) as rank
FROM SPY
JOIN skills ON spy.skill_id= skills.skill_id;

--Materialized View
--This will create a materialized view named spy_skill_avg_mv that calculates the average skill level of spies by network. 

CREATE MATERIALIZED VIEW spy_skill_avg_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT networkID, AVG(skill_level) as avg_skill_level
FROM SPY
JOIN skills ON spy.skill_id= skills.skill_id
GROUP BY networkID;


