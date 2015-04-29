/*创建用户和表空间*/
create user runny identified by 123;  
create tablespace hb_test datafile 'd:\oracle\hb_data.dbf' size 200M;

/*给用户授权*/
grant connect,resource to runny;
grant create session to runny;
grant dba to runny;/*给用户授dba权限*/