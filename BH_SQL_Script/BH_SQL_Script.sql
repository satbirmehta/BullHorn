--------------------------------------------------------
--  File created - Monday-December-05-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BHPOST
--------------------------------------------------------

  CREATE TABLE "HR"."BHPOST" 
   (	"POSTID" NUMBER, 
	"POSTDATE" DATE DEFAULT NULL, 
	"POSTTEXT" VARCHAR2(141 BYTE) DEFAULT NULL, 
	"BHUSERID" NUMBER DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BHUSER
--------------------------------------------------------

  CREATE TABLE "HR"."BHUSER" 
   (	"BHUSERID" NUMBER, 
	"USERNAME" VARCHAR2(50 BYTE), 
	"USERPASSWORD" VARCHAR2(50 BYTE), 
	"MOTTO" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"USEREMAIL" VARCHAR2(100 BYTE), 
	"JOINDATE" DATE DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.BHPOST
SET DEFINE OFF;
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (1,to_date('03-DEC-16','DD-MON-RR'),'My post user2',2);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (21,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 8',2);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (8,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 1',1);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (9,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 2',2);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (10,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 3',3);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (11,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 4',4);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (12,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 5',4);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (13,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 6',3);
Insert into HR.BHPOST (POSTID,POSTDATE,POSTTEXT,BHUSERID) values (14,to_date('16-JUN-16','DD-MON-RR'),'This is a sample post 7',1);
REM INSERTING into HR.BHUSER
SET DEFINE OFF;
Insert into HR.BHUSER (BHUSERID,USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values (1,'user 1','password','motto for user 1','user1@domain.com',to_date('16-JUN-16','DD-MON-RR'));
Insert into HR.BHUSER (BHUSERID,USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values (2,'user 2','password','motto for user 2','user2@domain.com',to_date('16-JUN-16','DD-MON-RR'));
Insert into HR.BHUSER (BHUSERID,USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values (3,'user 3','password','motto for user 3','user3@domain.com',to_date('16-JUN-16','DD-MON-RR'));
Insert into HR.BHUSER (BHUSERID,USERNAME,USERPASSWORD,MOTTO,USEREMAIL,JOINDATE) values (4,'user 4','password','motto for user 4','user4@domain.com',to_date('16-JUN-16','DD-MON-RR'));
--------------------------------------------------------
--  DDL for Index BHPOST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."BHPOST_PK" ON "HR"."BHPOST" ("POSTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BHUSER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."BHUSER_PK" ON "HR"."BHUSER" ("BHUSERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger T_HRBHPOST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."T_HRBHPOST" 
before insert
on HR.BHPOST
referencing new as new
for each row
begin
  if(:new.POSTID is null) then
 select s_HRBHPOST.nextval
  into :new.POSTID
  from dual;
  end if;
end;
----------------
/
ALTER TRIGGER "HR"."T_HRBHPOST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger T_HRBHUSER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HR"."T_HRBHUSER" 
before insert
on HR.BHUSER
referencing new as new
for each row
begin
  if(:new.BHUSERID is null) then
 select s_HRBHUSER.nextval
  into :new.BHUSERID
  from dual;
  end if;
end;
/
ALTER TRIGGER "HR"."T_HRBHUSER" ENABLE;
--------------------------------------------------------
--  Constraints for Table BHPOST
--------------------------------------------------------

  ALTER TABLE "HR"."BHPOST" ADD CONSTRAINT "BHPOST_PK" PRIMARY KEY ("POSTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."BHPOST" MODIFY ("POSTID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BHUSER
--------------------------------------------------------

  ALTER TABLE "HR"."BHUSER" ADD CONSTRAINT "BHUSER_PK" PRIMARY KEY ("BHUSERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "HR"."BHUSER" MODIFY ("USEREMAIL" NOT NULL ENABLE);
  ALTER TABLE "HR"."BHUSER" MODIFY ("USERPASSWORD" NOT NULL ENABLE);
  ALTER TABLE "HR"."BHUSER" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "HR"."BHUSER" MODIFY ("BHUSERID" NOT NULL ENABLE);
