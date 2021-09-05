/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     2021/8/31 10:38:12                           */
/*==============================================================*/
delete from qrtz_fired_triggers;
delete from qrtz_simple_triggers;
delete from qrtz_simprop_triggers;
delete from qrtz_cron_triggers;
delete from qrtz_blob_triggers;
delete from qrtz_triggers;
delete from qrtz_job_details;
delete from qrtz_calendars;
delete from qrtz_paused_trigger_grps;
delete from qrtz_locks;
delete from qrtz_scheduler_state;

drop table qrtz_calendars;
drop table qrtz_fired_triggers;
drop table qrtz_blob_triggers;
drop table qrtz_cron_triggers;
drop table qrtz_simple_triggers;
drop table qrtz_simprop_triggers;
drop table qrtz_triggers;
drop table qrtz_job_details;
drop table qrtz_paused_trigger_grps;
drop table qrtz_locks;
drop table qrtz_scheduler_state;

drop table MI_CHINA_INDEX cascade constraints;

drop table MI_HK_CAPITAL cascade constraints;

drop table MI_IPO_CALENDAR cascade constraints;

drop table MI_PLATE_CAPITAL cascade constraints;

drop table MI_REPTILE_RECORD cascade constraints;

drop table MI_SCHEDULE_TASK cascade constraints;

drop table MI_SECURITIES_EXPRESS cascade constraints;

drop sequence SEQ_BULLETIN_ID;

drop sequence SEQ_REPTILE_RECORD_ID;

drop sequence SEQ_SCHEDULED_ID;

create sequence SEQ_BULLETIN_ID
increment by 1
start with 1
 nomaxvalue
 minvalue 1
 nocache;

create sequence SEQ_REPTILE_RECORD_ID
increment by 1
start with 1
 nomaxvalue
 minvalue 1
 nocache;

create sequence SEQ_SCHEDULED_ID
increment by 1
start with 1
 nomaxvalue
 minvalue 1
 nocache;

/*==============================================================*/
/* Table: MI_CHINA_INDEX                                        */
/*==============================================================*/
create table MI_CHINA_INDEX  (
   INDEX_NAME           VARCHAR2(50)                    not null,
   LATEST_PRICE         NUMBER(7,2),
   constraint PK_MI_CHINA_INDEX primary key (INDEX_NAME)
);

comment on table MI_CHINA_INDEX is
'�й�ָ��';

comment on column MI_CHINA_INDEX.INDEX_NAME is
'ָ������';

comment on column MI_CHINA_INDEX.LATEST_PRICE is
'���¼�';

/*==============================================================*/
/* Table: MI_HK_CAPITAL                                         */
/*==============================================================*/
create table MI_HK_CAPITAL  (
   PLATE_NAME           VARCHAR2(100)                   not null,
   NET_CASH_INFLOW      NUMBER(10,2),
   CURRENT_BALANCE      NUMBER(10,2),
   CURRENT_BALANCE_LIMIT NUMBER(10,2),
   constraint PK_MI_HK_CAPITAL primary key (PLATE_NAME)
);

comment on table MI_HK_CAPITAL is
'�۹�ͨ�ʽ���';

comment on column MI_HK_CAPITAL.PLATE_NAME is
'�������';

comment on column MI_HK_CAPITAL.NET_CASH_INFLOW is
'�ֽ�����';

comment on column MI_HK_CAPITAL.CURRENT_BALANCE is
'�����ʽ����';

comment on column MI_HK_CAPITAL.CURRENT_BALANCE_LIMIT is
'�����ʽ��޶�';

/*==============================================================*/
/* Table: MI_IPO_CALENDAR                                       */
/*==============================================================*/
create table MI_IPO_CALENDAR  (
   SECURITIES_ABBR      VARCHAR2(100)                   not null,
   LISTING_DATE         DATE,
   constraint PK_MI_IPO_CALENDAR primary key (SECURITIES_ABBR)
);

comment on table MI_IPO_CALENDAR is
'�¹���������';

comment on column MI_IPO_CALENDAR.SECURITIES_ABBR is
'֤ȯ���';

comment on column MI_IPO_CALENDAR.LISTING_DATE is
'��������';

/*==============================================================*/
/* Table: MI_PLATE_CAPITAL                                      */
/*==============================================================*/
create table MI_PLATE_CAPITAL  (
   PLATE_NAME           VARCHAR2(50)                    not null,
   CURRENT_STATUS       NUMBER(5,2),
   constraint PK_MI_PLATE_CAPITAL primary key (PLATE_NAME)
);

comment on table MI_PLATE_CAPITAL is
'����ʽ������յ��Ƿ�';

comment on column MI_PLATE_CAPITAL.PLATE_NAME is
'�������';

comment on column MI_PLATE_CAPITAL.CURRENT_STATUS is
'�����ǵ��� ';

/*==============================================================*/
/* Table: MI_REPTILE_RECORD                                     */
/*==============================================================*/
create table MI_REPTILE_RECORD  (
   REPTILE_RECORD_ID    NUMBER(10)                      not null,
   REPTILE_DESCRIPTION  VARCHAR2(100),
   REPTILE_ADDRESS      VARCHAR2(300),
   REPTILE_START        TIMESTAMP,
   REPTILE_END          TIMESTAMP,
   REPTILE_TABLE        VARCHAR2(50),
   REPTILE_ID           NUMBER(8),
   constraint PK_MI_REPTILE_RECORD primary key (REPTILE_RECORD_ID)
);

comment on table MI_REPTILE_RECORD is
'�����¼';

comment on column MI_REPTILE_RECORD.REPTILE_RECORD_ID is
'�����¼id';

comment on column MI_REPTILE_RECORD.REPTILE_DESCRIPTION is
'������Ϊ˵��';

comment on column MI_REPTILE_RECORD.REPTILE_ADDRESS is
'�����ַ';

comment on column MI_REPTILE_RECORD.REPTILE_START is
'���濪ʼʱ��';

comment on column MI_REPTILE_RECORD.REPTILE_END is
'�������ʱ��';

comment on column MI_REPTILE_RECORD.REPTILE_TABLE is
'�������ݱ�  ��ȡ������ȡ�����ݱ������';

/*==============================================================*/
/* Table: MI_SCHEDULE_TASK                                      */
/*==============================================================*/
create table MI_SCHEDULE_TASK  (
   REPTILE_ID           NUMBER(8)                       not null,
   REPTILE_NAME         VARCHAR2(20),
   SCHEDULE_DESCRIPTION VARCHAR2(100),
   THREAD_NUMBER        NUMBER(2),
   SCHEDULE_FLAG        NUMBER(1),
   CRON_TAB             VARCHAR2(100),
   constraint PK_MI_SCHEDULE_TASK primary key (REPTILE_ID)
);

comment on table MI_SCHEDULE_TASK is
'�������ʱ����ʹ�ã�';

comment on column MI_SCHEDULE_TASK.REPTILE_ID is
'����id';

comment on column MI_SCHEDULE_TASK.REPTILE_NAME is
'��������';

comment on column MI_SCHEDULE_TASK.SCHEDULE_DESCRIPTION is
'����';

comment on column MI_SCHEDULE_TASK.THREAD_NUMBER is
'�߳���';

comment on column MI_SCHEDULE_TASK.SCHEDULE_FLAG is
'�Ƿ�����ʱ���� 0��ʾ������ 1��ʾ���� ';

comment on column MI_SCHEDULE_TASK.CRON_TAB is
'cornTab���ʽ';

/*==============================================================*/
/* Table: MI_SECURITIES_EXPRESS                                 */
/*==============================================================*/
create table MI_SECURITIES_EXPRESS  (
   BULLETIN_ID          NUMBER(20)                      not null,
   BULLETIN_TYPE        NUMBER(1),
   BULLETIN_TITLE       VARCHAR2(100),
   constraint PK_MI_SECURITIES_EXPRESS primary key (BULLETIN_ID)
);

comment on table MI_SECURITIES_EXPRESS is
'֤ȯ��Ѷ';

comment on column MI_SECURITIES_EXPRESS.BULLETIN_ID is
'����id';

comment on column MI_SECURITIES_EXPRESS.BULLETIN_TYPE is
'��Ѷ����  3Ϊ��Ϣ��1Ϊ��ʾ';

comment on column MI_SECURITIES_EXPRESS.BULLETIN_TITLE is
'��Ѷ����';

CREATE TABLE qrtz_job_details
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  JOB_NAME  VARCHAR2(200) NOT NULL,
  JOB_GROUP VARCHAR2(200) NOT NULL,
  DESCRIPTION VARCHAR2(250) NULL,
  JOB_CLASS_NAME   VARCHAR2(250) NOT NULL, 
  IS_DURABLE VARCHAR2(1) NOT NULL,
  IS_NONCONCURRENT VARCHAR2(1) NOT NULL,
  IS_UPDATE_DATA VARCHAR2(1) NOT NULL,
  REQUESTS_RECOVERY VARCHAR2(1) NOT NULL,
  JOB_DATA BLOB NULL,
  CONSTRAINT QRTZ_JOB_DETAILS_PK PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);
CREATE TABLE qrtz_triggers
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  TRIGGER_NAME VARCHAR2(200) NOT NULL,
  TRIGGER_GROUP VARCHAR2(200) NOT NULL,
  JOB_NAME  VARCHAR2(200) NOT NULL, 
  JOB_GROUP VARCHAR2(200) NOT NULL,
  DESCRIPTION VARCHAR2(250) NULL,
  NEXT_FIRE_TIME NUMBER(13) NULL,
  PREV_FIRE_TIME NUMBER(13) NULL,
  PRIORITY NUMBER(13) NULL,
  TRIGGER_STATE VARCHAR2(16) NOT NULL,
  TRIGGER_TYPE VARCHAR2(8) NOT NULL,
  START_TIME NUMBER(13) NOT NULL,
  END_TIME NUMBER(13) NULL,
  CALENDAR_NAME VARCHAR2(200) NULL,
  MISFIRE_INSTR NUMBER(2) NULL,
  JOB_DATA BLOB NULL,
  CONSTRAINT QRTZ_TRIGGERS_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  CONSTRAINT QRTZ_TRIGGER_TO_JOBS_FK FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP) 
    REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP) 
);
CREATE TABLE qrtz_simple_triggers
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  TRIGGER_NAME VARCHAR2(200) NOT NULL,
  TRIGGER_GROUP VARCHAR2(200) NOT NULL,
  REPEAT_COUNT NUMBER(7) NOT NULL,
  REPEAT_INTERVAL NUMBER(12) NOT NULL,
  TIMES_TRIGGERED NUMBER(10) NOT NULL,
  CONSTRAINT QRTZ_SIMPLE_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  CONSTRAINT QRTZ_SIMPLE_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
  REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_cron_triggers
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  TRIGGER_NAME VARCHAR2(200) NOT NULL,
  TRIGGER_GROUP VARCHAR2(200) NOT NULL,
  CRON_EXPRESSION VARCHAR2(120) NOT NULL,
  TIME_ZONE_ID VARCHAR2(80),
  CONSTRAINT QRTZ_CRON_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  CONSTRAINT QRTZ_CRON_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
    REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_simprop_triggers
(          
  SCHED_NAME VARCHAR2(120) NOT NULL,
  TRIGGER_NAME VARCHAR2(200) NOT NULL,
  TRIGGER_GROUP VARCHAR2(200) NOT NULL,
  STR_PROP_1 VARCHAR2(512) NULL,
  STR_PROP_2 VARCHAR2(512) NULL,
  STR_PROP_3 VARCHAR2(512) NULL,
  INT_PROP_1 NUMBER(10) NULL,
  INT_PROP_2 NUMBER(10) NULL,
  LONG_PROP_1 NUMBER(13) NULL,
  LONG_PROP_2 NUMBER(13) NULL,
  DEC_PROP_1 NUMERIC(13,4) NULL,
  DEC_PROP_2 NUMERIC(13,4) NULL,
  BOOL_PROP_1 VARCHAR2(1) NULL,
  BOOL_PROP_2 VARCHAR2(1) NULL,
  CONSTRAINT QRTZ_SIMPROP_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  CONSTRAINT QRTZ_SIMPROP_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
    REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_blob_triggers
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  TRIGGER_NAME VARCHAR2(200) NOT NULL,
  TRIGGER_GROUP VARCHAR2(200) NOT NULL,
  BLOB_DATA BLOB NULL,
  CONSTRAINT QRTZ_BLOB_TRIG_PK PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
  CONSTRAINT QRTZ_BLOB_TRIG_TO_TRIG_FK FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
      REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_calendars
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  CALENDAR_NAME  VARCHAR2(200) NOT NULL, 
  CALENDAR BLOB NOT NULL,
  CONSTRAINT QRTZ_CALENDARS_PK PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);
CREATE TABLE qrtz_paused_trigger_grps
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  TRIGGER_GROUP  VARCHAR2(200) NOT NULL, 
  CONSTRAINT QRTZ_PAUSED_TRIG_GRPS_PK PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);
CREATE TABLE qrtz_fired_triggers 
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  ENTRY_ID VARCHAR2(95) NOT NULL,
  TRIGGER_NAME VARCHAR2(200) NOT NULL,
  TRIGGER_GROUP VARCHAR2(200) NOT NULL,
  INSTANCE_NAME VARCHAR2(200) NOT NULL,
  FIRED_TIME NUMBER(13) NOT NULL,
  SCHED_TIME NUMBER(13) NOT NULL,
  PRIORITY NUMBER(13) NOT NULL,
  STATE VARCHAR2(16) NOT NULL,
  JOB_NAME VARCHAR2(200) NULL,
  JOB_GROUP VARCHAR2(200) NULL,
  IS_NONCONCURRENT VARCHAR2(1) NULL,
  REQUESTS_RECOVERY VARCHAR2(1) NULL,
  CONSTRAINT QRTZ_FIRED_TRIGGER_PK PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE qrtz_scheduler_state 
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  INSTANCE_NAME VARCHAR2(200) NOT NULL,
  LAST_CHECKIN_TIME NUMBER(13) NOT NULL,
  CHECKIN_INTERVAL NUMBER(13) NOT NULL,
  CONSTRAINT QRTZ_SCHEDULER_STATE_PK PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);
CREATE TABLE qrtz_locks
(
  SCHED_NAME VARCHAR2(120) NOT NULL,
  LOCK_NAME  VARCHAR2(40) NOT NULL, 
  CONSTRAINT QRTZ_LOCKS_PK PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);

create index idx_qrtz_j_req_recovery on qrtz_job_details(SCHED_NAME,REQUESTS_RECOVERY);
create index idx_qrtz_j_grp on qrtz_job_details(SCHED_NAME,JOB_GROUP);

create index idx_qrtz_t_j on qrtz_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_qrtz_t_jg on qrtz_triggers(SCHED_NAME,JOB_GROUP);
create index idx_qrtz_t_c on qrtz_triggers(SCHED_NAME,CALENDAR_NAME);
create index idx_qrtz_t_g on qrtz_triggers(SCHED_NAME,TRIGGER_GROUP);
create index idx_qrtz_t_state on qrtz_triggers(SCHED_NAME,TRIGGER_STATE);
create index idx_qrtz_t_n_state on qrtz_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_qrtz_t_n_g_state on qrtz_triggers(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
create index idx_qrtz_t_next_fire_time on qrtz_triggers(SCHED_NAME,NEXT_FIRE_TIME);
create index idx_qrtz_t_nft_st on qrtz_triggers(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
create index idx_qrtz_t_nft_misfire on qrtz_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
create index idx_qrtz_t_nft_st_misfire on qrtz_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
create index idx_qrtz_t_nft_st_misfire_grp on qrtz_triggers(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

create index idx_qrtz_ft_trig_inst_name on qrtz_fired_triggers(SCHED_NAME,INSTANCE_NAME);
create index idx_qrtz_ft_inst_job_req_rcvry on qrtz_fired_triggers(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
create index idx_qrtz_ft_j_g on qrtz_fired_triggers(SCHED_NAME,JOB_NAME,JOB_GROUP);
create index idx_qrtz_ft_jg on qrtz_fired_triggers(SCHED_NAME,JOB_GROUP);
create index idx_qrtz_ft_t_g on qrtz_fired_triggers(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
create index idx_qrtz_ft_tg on qrtz_fired_triggers(SCHED_NAME,TRIGGER_GROUP);

