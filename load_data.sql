CREATE OR REPLACE PROCEDURE Load_Warehouse AS
BEGIN
   -- Truncate the warehouse tables
  execute immediate 'TRUNCATE TABLE network';
  execute immediate 'TRUNCATE TABLE rank';
  execute immediate 'TRUNCATE TABLE skills';
  execute immediate 'TRUNCATE TABLE task';
  execute immediate 'TRUNCATE TABLE equipment';
  execute immediate 'TRUNCATE TABLE language';
  execute immediate 'TRUNCATE TABLE country';
  execute immediate 'TRUNCATE TABLE spy';


INSERT INTO country (NAME, CODE,CONTINENT)
   (SELECT * FROM ORA_mn133.country);

INSERT INTO city (CITY_NAME, COUNTRY_CODE, ZIP, NAME)
   (SELECT * FROM ORA_mn133.city);
   
INSERT INTO skills (SKILL_ID, SKILL_LEVEL,TRAINING_YEARS)
   (SELECT * FROM ORA_mn133.skills);
INSERT INTO network (NETWORKID,PASSCODE,ISCONNECTED,NAME)
   (SELECT * FROM ORA_mn133.network);
INSERT INTO language (LANG_ID, CODE, NAME,ISOFFICIAL,ID)
   (SELECT * FROM ORA_mn133.language);
INSERT INTO rank (rankid,rankname,star_awarded,id)
   (SELECT * FROM ORA_mn133.rank);
INSERT INTO task (TASKID, DIFFICULTY_LEVEL,ISCOMPLETED,DAYS_NEEDED,DATE_COMPLETED, ID)
   (SELECT * FROM ORA_mn133.task);
INSERT INTO equipment (EQUIP_ID, EQUIP_NAME,TYPE,ID)
   (SELECT * FROM ORA_mn133.equipment);
INSERT INTO spy (ID,CODENAME,RANKID, SUPERVISORID, NETWORKID, SKILL_ID, EQUIP_ID, LANG_ID, TASKID)
(Select ORA_mn133.spy.ID, ORA_mn133.spy.CODENAME, ORA_mn133.spy.RANKID, ORA_mn133.spy.SUPERVISORID, ORA_mn133.spy.NETWORKID, ORA_mn133.spy.SKILL_ID, ORA_mn133.equipment.EQUIP_ID, ORA_mn133.language.LANG_ID, ORA_mn133.task.TASKID from 
ORA_mn133.spy
left join ORA_mn133.equipment on equipment.id = ORA_mn133.spy.id
left join ORA_mn133.language on ORA_mn133.spy.id = ORA_mn133.language.id
left join ORA_mn133.task on ORA_mn133.spy.id =  ORA_mn133.task.id );
END;
