--------------------------------------------------------
--  File created - Thursday-May-17-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ALIMENT_PLAN_ALIMENTAR
--------------------------------------------------------

  CREATE TABLE "ALEXIONUT"."ALIMENT_PLAN_ALIMENTAR" 
   (	"ID_PLAN_ALIMENTAR" NUMBER(38,0), 
	"ID_ALIMENT" NUMBER(38,0), 
	"TIP_MASA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ALIMENT
--------------------------------------------------------

  CREATE TABLE "ALEXIONUT"."ALIMENT" 
   (	"ID_ALIMENT" NUMBER(38,0), 
	"DENUMIRE_ALIMENT" VARCHAR2(50 BYTE), 
	"POZA_INCEPUT" BLOB, 
	"CALORII" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" 
 LOB ("POZA_INCEPUT") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES ) ;
REM INSERTING into ALEXIONUT.ALIMENT_PLAN_ALIMENTAR
SET DEFINE OFF;
REM INSERTING into ALEXIONUT.ALIMENT
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ALIMENT_PLAN_ALIMENTAR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ALEXIONUT"."ALIMENT_PLAN_ALIMENTAR_PK" ON "ALEXIONUT"."ALIMENT_PLAN_ALIMENTAR" ("ID_PLAN_ALIMENTAR", "ID_ALIMENT", "TIP_MASA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C0010873
--------------------------------------------------------

  CREATE UNIQUE INDEX "ALEXIONUT"."SYS_C0010873" ON "ALEXIONUT"."ALIMENT" ("ID_ALIMENT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ALIMENT_PLAN_ALIMENTAR
--------------------------------------------------------

  ALTER TABLE "ALEXIONUT"."ALIMENT_PLAN_ALIMENTAR" ADD CONSTRAINT "ALIMENT_PLAN_ALIMENTAR_PK" PRIMARY KEY ("ID_PLAN_ALIMENTAR", "ID_ALIMENT", "TIP_MASA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ALIMENT
--------------------------------------------------------

  ALTER TABLE "ALEXIONUT"."ALIMENT" ADD PRIMARY KEY ("ID_ALIMENT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
