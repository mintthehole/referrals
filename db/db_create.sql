--ORACLE SCRIPT TO CREATE DB

DROP USER REFERRALS CASCADE;
CREATE USER REFERRALS IDENTIFIED BY REFERRALS DEFAULT TABLESPACE USERS;
GRANT DBA, RESOURCE, CONNECT TO REFERRALS;