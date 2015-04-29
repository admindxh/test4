/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2012/9/2 19:09:03                            */
/*==============================================================*/


/*==============================================================*/
/* Table: SEC_LOG                                               */
/*==============================================================*/
CREATE TABLE SEC_LOG
(
   ID                   VARCHAR(38) NOT NULL COMMENT '��־��ʶ',
   USER_ID              VARCHAR(38) NOT NULL COMMENT '�û���ʶ',
   LOG_TYPE             VARCHAR(10) NOT NULL DEFAULT 'login' COMMENT '��־���ͣ�login��operation��auth��',
   USER_NAME            VARCHAR(50) NOT NULL COMMENT '�û�����',
   OPERATION_NAME       VARCHAR(50) NOT NULL COMMENT '��������',
   OPERATION_TIME       DATETIME NOT NULL COMMENT '����ʱ��',
   DESCRIPTION          VARCHAR(3000) COMMENT '��־����',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_LOG COMMENT '��ȫ��־(������¼��־��������־����Ȩ��־)';

/*==============================================================*/
/* Index: IDX_SEC_LOG_TYPE                                      */
/*==============================================================*/
CREATE INDEX IDX_SEC_LOG_TYPE ON SEC_LOG
(
   LOG_TYPE
);

/*==============================================================*/
/* Index: IDX_SEC_LOG_USERID                                    */
/*==============================================================*/
CREATE INDEX IDX_SEC_LOG_USERID ON SEC_LOG
(
   USER_ID
);

/*==============================================================*/
/* Index: IDX_SEC_LOG_USERNAME                                  */
/*==============================================================*/
CREATE INDEX IDX_SEC_LOG_USERNAME ON SEC_LOG
(
   USER_NAME
);

/*==============================================================*/
/* Index: IDX_SEC_LOG_OPERATIONNAME                             */
/*==============================================================*/
CREATE INDEX IDX_SEC_LOG_OPERATIONNAME ON SEC_LOG
(
   OPERATION_NAME
);

/*==============================================================*/
/* Index: IDX_SEC_LOG_OPERATIONTIME                             */
/*==============================================================*/
CREATE INDEX IDX_SEC_LOG_OPERATIONTIME ON SEC_LOG
(
   OPERATION_TIME
);

/*==============================================================*/
/* Table: SEC_ORG_ROLE                                          */
/*==============================================================*/
CREATE TABLE SEC_ORG_ROLE
(
   ORG_ID               VARCHAR(38) NOT NULL COMMENT '��֯��ʶ',
   ROLE_ID              VARCHAR(38) NOT NULL COMMENT '�߱��Ľ�ɫ��ֻ���ǹ������ɫ�ͻ�����ɫ��',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ORG_ID, ROLE_ID)
);

ALTER TABLE SEC_ORG_ROLE COMMENT '��֯��ɫ���洢��֯����֯�ϳ䵱�Ľ�ɫ��';

/*==============================================================*/
/* Index: INX_ORGROLE_ORG                                       */
/*==============================================================*/
CREATE INDEX INX_ORGROLE_ORG ON SEC_ORG_ROLE
(
   ORG_ID
);

/*==============================================================*/
/* Index: INX_ORGROLE_ROLE                                      */
/*==============================================================*/
CREATE INDEX INX_ORGROLE_ROLE ON SEC_ORG_ROLE
(
   ROLE_ID
);

/*==============================================================*/
/* Table: SEC_ORGANIZATION                                      */
/*==============================================================*/
CREATE TABLE SEC_ORGANIZATION
(
   ID                   VARCHAR(38) NOT NULL COMMENT '��֯��ʶ',
   PATH                 VARCHAR(300) NOT NULL,
   PARENT               VARCHAR(38) COMMENT '����֯��ʶ',
   NAME                 VARCHAR(150) COMMENT '����',
   CODE                 VARCHAR(1000) COMMENT '����',
   LEVEL                INT COMMENT '�㼶',
   `ORDER`              INT COMMENT '˳��',
   TYPE                 INT COMMENT '���ͣ���˾���ӹ�˾�����š����ҵȣ�',
   STATUS               VARCHAR(10) NOT NULL DEFAULT 'enabled' COMMENT '״̬',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_ORGANIZATION COMMENT 'ϵͳ��֯��';

/*==============================================================*/
/* Index: INX_SEC_INDEX_STATUS                                  */
/*==============================================================*/
CREATE INDEX INX_SEC_INDEX_STATUS ON SEC_ORGANIZATION
(
   STATUS
);

/*==============================================================*/
/* Table: SEC_PERMISSION_RESOURCE                               */
/*==============================================================*/
CREATE TABLE SEC_PERMISSION_RESOURCE
(
   ID                   VARCHAR(38) NOT NULL COMMENT '������Դ��ʶ',
   PERMISSION_ID        VARCHAR(38) NOT NULL COMMENT '������ʶ',
   TYPE                 VARCHAR(30) NOT NULL DEFAULT 'URL' COMMENT '��Դ���ͣ�Ĭ����Url��������������������',
   RESOURCE             VARCHAR(300) NOT NULL COMMENT '��Դ',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_PERMISSION_RESOURCE COMMENT 'Ȩ����Դ��';

/*==============================================================*/
/* Index: IDX_PERMISSION_RESOURCE_01                            */
/*==============================================================*/
CREATE INDEX IDX_PERMISSION_RESOURCE_01 ON SEC_PERMISSION_RESOURCE
(
   RESOURCE
);

/*==============================================================*/
/* Table: SEC_PERMISSION                                        */
/*==============================================================*/
CREATE TABLE SEC_PERMISSION
(
   ID                   VARCHAR(38) NOT NULL COMMENT '������ʶ',
   PATH                 VARCHAR(300) NOT NULL,
   PARENT               VARCHAR(38) COMMENT '��������ʶ',
   CODE                 VARCHAR(50) NOT NULL COMMENT '��������',
   NAME                 VARCHAR(150) NOT NULL COMMENT '����',
   CONTEXT              VARCHAR(300),
   URL                  VARCHAR(300) COMMENT 'Page��Ӧ��URL������ҳ��Ԫ�����ڵ�URL',
   TYPE                 VARCHAR(10) NOT NULL DEFAULT 'Page' COMMENT 'ģ�顢ҳ�����Ԫ��',
   ELEMENT_ID           VARCHAR(50) COMMENT '�ܿ�ҳ��Ԫ�ص�ID',
   ELEMENT_BEHAVIOUR    VARCHAR(30) COMMENT 'ҳ��Ԫ��Ĭ����Ϊ',
   `ORDER`              INT DEFAULT 1000 COMMENT '˳��',
   DESCRIPTION          VARCHAR(1000) COMMENT '����',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_PERMISSION COMMENT '����Ȩ�ޱ�';

/*==============================================================*/
/* Index: IDX_PERMISSIONS_URL                                   */
/*==============================================================*/
CREATE INDEX IDX_PERMISSIONS_URL ON SEC_PERMISSION
(
   URL
);

/*==============================================================*/
/* Index: LDX_PERMISSIONS_TYPE                                  */
/*==============================================================*/
CREATE INDEX LDX_PERMISSIONS_TYPE ON SEC_PERMISSION
(
   TYPE
);

/*==============================================================*/
/* Index: IDX_PERMISSIONS_CODE                                  */
/*==============================================================*/
CREATE UNIQUE INDEX IDX_PERMISSIONS_CODE ON SEC_PERMISSION
(
   CODE
);

/*==============================================================*/
/* Table: SEC_PERMISSION_RULE                                   */
/*==============================================================*/
CREATE TABLE SEC_PERMISSION_RULE
(
   ID                   VARCHAR(38) NOT NULL COMMENT '�����ʶ',
   OPERATION_ID         VARCHAR(38) NOT NULL COMMENT '������ʶ',
   NAME                 VARCHAR(150) NOT NULL COMMENT '����',
   PRIORITY             INT NOT NULL DEFAULT 100 COMMENT '���ȼ�',
   RULE                 VARCHAR(1000) NOT NULL COMMENT '����',
   BEHAVIOUR            VARCHAR(30) COMMENT '��Ϊ',
   DESCRIPTION          VARCHAR(1000) COMMENT '����',
   IS_DEFAULT           INT NOT NULL DEFAULT 0 COMMENT '�Ƿ�ȱʡ����',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_PERMISSION_RULE COMMENT 'Ȩ�޹����';

/*==============================================================*/
/* Table: SEC_ROLE                                              */
/*==============================================================*/
CREATE TABLE SEC_ROLE
(
   ID                   VARCHAR(38) NOT NULL COMMENT '��ɫ��ʶ',
   CODE                 VARCHAR(50) COMMENT '��ɫ����',
   NAME                 VARCHAR(150) NOT NULL COMMENT '��ɫ��',
   DESCRIPTION          VARCHAR(1000) COMMENT '����',
   TYPE                 SMALLINT NOT NULL DEFAULT 0 COMMENT '��ɫ���ͣ������ࡢ��ת�ࡢ����ࣩ',
   PARTICIPANT_TYPE     SMALLINT DEFAULT NULL COMMENT '���������ͣ��û������ţ�',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_ROLE COMMENT 'ϵͳ��ɫ���Թ����������ǽ�ɫ����';

/*==============================================================*/
/* Index: INX_ROLES_TYPE                                        */
/*==============================================================*/
CREATE INDEX INX_ROLES_TYPE ON SEC_ROLE
(
   TYPE
);

/*==============================================================*/
/* Table: SEC_ROLE_INHERITANCE                                  */
/*==============================================================*/
CREATE TABLE SEC_ROLE_INHERITANCE
(
   PARENT_ROLE_ID       VARCHAR(38) NOT NULL COMMENT '����ɫ��ʶ',
   CHILD_ROLE_ID        VARCHAR(38) NOT NULL COMMENT '�ӽ�ɫ��ʶ',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (PARENT_ROLE_ID, CHILD_ROLE_ID)
);

ALTER TABLE SEC_ROLE_INHERITANCE COMMENT '��ɫ�̳б���¼��ɫ�ĸ��ӹ�ϵ';

/*==============================================================*/
/* Table: SEC_ROLE_PERMISSION                                   */
/*==============================================================*/
CREATE TABLE SEC_ROLE_PERMISSION
(
   ROLE_ID              VARCHAR(38) NOT NULL COMMENT '��ɫ��ʶ',
   OPERATION_ID         VARCHAR(38) NOT NULL COMMENT '������ʶ',
   RULE_ID              VARCHAR(38) COMMENT '�����ʶ',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ROLE_ID, OPERATION_ID)
);

ALTER TABLE SEC_ROLE_PERMISSION COMMENT '��ɫȨ�ޱ�';

/*==============================================================*/
/* Table: SEC_USER                                              */
/*==============================================================*/
CREATE TABLE SEC_USER
(
   ID                   VARCHAR(38) NOT NULL COMMENT '�û���ʶ',
   NAME                 VARCHAR(50) NOT NULL COMMENT '����',
   TYPE                 VARCHAR(10) NOT NULL DEFAULT 'local' COMMENT '����',
   LOGIN_ID             VARCHAR(30) NOT NULL COMMENT '�˻�',
   PASSWORD             VARCHAR(50) COMMENT '����',
   EMAIL                VARCHAR(50) COMMENT '�ʼ�',
   MOBILE_PHONE         VARCHAR(15) COMMENT '�ֻ�',
   IM                   VARCHAR(50) COMMENT '��ʱͨѶ��',
   TELEPHONE            VARCHAR(15) COMMENT '�칫�绰',
   SEX                  CHAR(1) NOT NULL DEFAULT 'U' COMMENT '�Ա�',
   BIRTHDAY             DATETIME COMMENT '����',
   STATUS               VARCHAR(10) NOT NULL DEFAULT 'enabled' COMMENT '״̬',
   ORG_ID               VARCHAR(38) NOT NULL COMMENT '������֯',
   RANK                 VARCHAR(50) COMMENT 'ְλ',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_USER COMMENT 'ϵͳ�û���';

/*==============================================================*/
/* Table: SEC_USER_ROLE                                         */
/*==============================================================*/
CREATE TABLE SEC_USER_ROLE
(
   USER_ID              VARCHAR(38) NOT NULL COMMENT '�û���ʶ',
   ROLE_ID              VARCHAR(38) NOT NULL COMMENT '��ɫ��ʶ��ֻ���ǹ������ɫ�ͻ�����ɫ��',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '������',
   CREATED_DATE         DATETIME NOT NULL COMMENT '����ʱ��',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '����޸���',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '����޸�ʱ��',
   PRIMARY KEY (USER_ID, ROLE_ID)
);

ALTER TABLE SEC_USER_ROLE COMMENT '�û���ɫ���洢�û�����֯�ϳ䵱�Ľ�ɫ��';

/*==============================================================*/
/* Index: INX_USERROLE_USER                                     */
/*==============================================================*/
CREATE INDEX INX_USERROLE_USER ON SEC_USER_ROLE
(
   USER_ID
);

/*==============================================================*/
/* Index: INX_USERROLE_ROLE                                     */
/*==============================================================*/
CREATE INDEX INX_USERROLE_ROLE ON SEC_USER_ROLE
(
   ROLE_ID
);

/*==============================================================*/
/* View: V_SEC_MANAGE_ROLE                                      */
/*==============================================================*/
CREATE   VIEW      V_SEC_MANAGE_ROLE 
   AS 
   SELECT * 
   FROM SEC_ROLE
   WHERE TYPE IN (0,2);

/*==============================================================*/
/* View: V_SEC_VALID_ORG                                        */
/*==============================================================*/
CREATE   VIEW      V_SEC_VALID_ORG 
   AS 
   SELECT *
   FROM
      SEC_ORGANIZATION
   WHERE
      STATUS = 'enabled';

/*==============================================================*/
/* View: V_SEC_WORKFLOW_ROLE                                    */
/*==============================================================*/
CREATE   VIEW      V_SEC_WORKFLOW_ROLE 
   AS 
   SELECT * 
   FROM SEC_ROLE
   WHERE TYPE IN (1,2);

ALTER TABLE SEC_LOG ADD CONSTRAINT FK_REFERENCE_24 FOREIGN KEY (USER_ID)
      REFERENCES SEC_USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SEC_ORG_ROLE ADD CONSTRAINT FK_SEC_ORGR_REFERENCE_SEC_ORG2 FOREIGN KEY (ORG_ID)
      REFERENCES SEC_ORGANIZATION (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SEC_ORG_ROLE ADD CONSTRAINT FK_REFERENCE_14 FOREIGN KEY (ROLE_ID)
      REFERENCES SEC_ROLE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SEC_ORGANIZATION ADD CONSTRAINT FK_REFERENCE_11 FOREIGN KEY (PARENT)
      REFERENCES SEC_ORGANIZATION (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_PERMISSION_RESOURCE ADD CONSTRAINT FK_REFERENCE_34 FOREIGN KEY (PERMISSION_ID)
      REFERENCES SEC_PERMISSION (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SEC_PERMISSION ADD CONSTRAINT FK_SEC_PERM_PARENTPER_SEC_PERM FOREIGN KEY (PARENT)
      REFERENCES SEC_PERMISSION (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_PERMISSION_RULE ADD CONSTRAINT FK_SEC_SECU_BELONGTOO_SEC_PERM FOREIGN KEY (OPERATION_ID)
      REFERENCES SEC_PERMISSION (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_ROLE_INHERITANCE ADD CONSTRAINT FK_SEC_ROLE_INHERI_ROLE FOREIGN KEY (PARENT_ROLE_ID)
      REFERENCES SEC_ROLE (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_ROLE_INHERITANCE ADD CONSTRAINT FK_SEC_ROLE_INHERI_CHILD_ROLE FOREIGN KEY (CHILD_ROLE_ID)
      REFERENCES SEC_ROLE (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_ROLE_PERMISSION ADD CONSTRAINT FK_ASSIGNTOROLE FOREIGN KEY (ROLE_ID)
      REFERENCES SEC_ROLE (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_ROLE_PERMISSION ADD CONSTRAINT FK_SEC_ROLE_BELONGTOP_SEC_PERM FOREIGN KEY (OPERATION_ID)
      REFERENCES SEC_PERMISSION (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_ROLE_PERMISSION ADD CONSTRAINT FK_SEC_ROLE_PERMISSIO_SEC_SECU FOREIGN KEY (RULE_ID)
      REFERENCES SEC_PERMISSION_RULE (ID) ON UPDATE RESTRICT;

ALTER TABLE SEC_USER ADD CONSTRAINT FK_SEC_USER_REFERENCE_SEC_ORG1 FOREIGN KEY (ORG_ID)
      REFERENCES SEC_ORGANIZATION (ID) ON DELETE CASCADE ON UPDATE RESTRICT;

ALTER TABLE SEC_USER_ROLE ADD CONSTRAINT FK_ROLEROLE FOREIGN KEY (ROLE_ID)
      REFERENCES SEC_ROLE (ID) ON DELETE CASCADE;

ALTER TABLE SEC_USER_ROLE ADD CONSTRAINT FK_USERROLE FOREIGN KEY (USER_ID)
      REFERENCES SEC_USER (ID) ON DELETE CASCADE;

