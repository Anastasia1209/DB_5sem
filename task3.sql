select * from dba_pdbs;

select * from V$INSTANCE;
select * from v$option;

select * from dba_pdbs; 

alter session set container = NAO_PDB;

-- Tablespaces
create tablespace NAO_PDB_SYS_TS
  datafile 'NAO_PDB_SYS_TS.dbf' 
  size 10M
  autoextend on next 5M
  maxsize 50M;
  
create temporary tablespace NAO_PDB_SYS_TS_TEMP
  tempfile 'NAO_PDB_SYS_TS_TEMP.dbf'
  size 5M
  autoextend on next 2M
  maxsize 40M;

select * from dba_tablespaces where TABLESPACE_NAME like '%NAO%';


-- Role
create role NAO_PDB_SYS_RL;

grant connect, create session, create any table, drop any table, create any view, 
drop any view, create any procedure, drop any procedure to NAO_PDB_SYS_RL;

select * from dba_roles where ROLE like '%RL%';


-- Profile
create profile NAO_PDB_SYS_PROFILE limit
  password_life_time 365
  sessions_per_user 10
  failed_login_attempts 5
  password_lock_time 1
  password_reuse_time 10
  password_grace_time default;


-- User
create user U1_NAO_PDB identified by 0923
  default tablespace NAO_PDB_SYS_TS 
  quota unlimited on NAO_PDB_SYS_TS
  temporary tablespace NAO_PDB_SYS_TS_TEMP
  profile NAO_PDB_SYS_PROFILE;

grant connect, create session, alter session, create any table, drop any table, create any view, 
drop any view, create any procedure, drop any procedure to U1_NAO_PDB; 
grant SYSDBA to U1_NAO_PDB;

select * from dba_users where USERNAME like '%NAO%';

drop user NAO_PDB_SYS_USER;

create table NAO_PDB_GROUP
(
    NAME varchar(25),
    SURNAME varchar(25),
    AGE number
);

insert into NAO_PDB_GROUP values('Artsiom', 'Nekhayonak', 20);
insert into NAO_PDB_GROUP values('Nastya', 'Golodok', 20);
insert into NAO_PDB_GROUP values('Polina', 'Glushenya', 19);
insert into NAO_PDB_GROUP values('Ira', 'Victor', 19);
insert into NAO_PDB_GROUP values('Nikita', 'Karebo', 20);

select * from NAO_PDB_GROUP;

select * from dba_tablespaces where TABLESPACE_NAME like 'NAO%';
select * from dba_data_files;
select * from dba_roles where ROLE like 'NAO%';
select * from dba_sys_privs where GRANTEE like 'NAO%';
select * from dba_profiles where PROFILE like 'NAO%';
select * from dba_users where USERNAME like 'NAO%';

drop table NAO_PDB_GROUP;

alter session set container = CDB$ROOT;
create user C##NAO identified by 0923
grant connect, create session, alter session, create any table,
drop any table to C##NAO container = all;

create table NAO_PDB_T (num number, str varchar(40));

create table NAO_CDB_T (num number, str varchar(40));