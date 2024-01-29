

Create table SKILLS (
 skill_ID varchar(10), 
 skill_level number(2,0),
 training_years number(2,0),
  PRIMARY KEY(skill_ID)
 ); 
 
Create table COUNTRY(
 name varchar(20),
 code varchar(10),
 continent varchar(30),
 PRIMARY KEY(name)
);

Create table NETWORK (
 networkID varchar(10),
 passcode varchar(20),
 isConnected varchar(10),
 name varchar(20),
 PRIMARY KEY(networkID),
 foreign key (name) references COUNTRY(name)
);

Create table LANGUAGE (
 lang_id varchar(10), 
 code varchar(5), 
 name varchar(20), 
 isOfficial varchar(10), 
 ID varchar(20),
 PRIMARY KEY(lang_id)
);

Create table RANK (
 rankID varchar(10), 
 rankName varchar(10), 
 star_awarded number(2,0), 
 ID varchar(20),
 PRIMARY KEY(rankID)
 );
 
Create table EQUIPMENT(
 equip_ID varchar(10), 
 Equip_name varchar(20), 
 type varchar(10), 
 ID varchar(20),
 PRIMARY KEY(equip_ID)
);

Create table TASK (
taskID            varchar(20), 
difficulty_level  varchar(5), 
isCompleted     varchar(10),
Days_needed   number(2,0),
Date_completed    date,       
ID                varchar(20),
PRIMARY KEY(taskID)
);

Create table SPY (
 ID varchar(20), 
 codeName varchar(20),
 rankID varchar(20),
 supervisorID varchar(10), 
 networkID varchar(10), 
 skill_ID varchar(10),
 equip_ID varchar(10),
 lang_id varchar(10),
 taskID varchar(20),
 
 PRIMARY KEY(ID),
 foreign key (networkID) references NETWORK(networkID),
 foreign key (skill_ID) references SKILLS(skill_ID),
 foreign key (equip_ID) references EQUIPMENT(equip_id),
 foreign key (lang_ID) references LANGUAGE(lang_ID),
 foreign key (taskID) references TASK(taskID)
);