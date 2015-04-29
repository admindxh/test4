/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2012/9/2 19:09:03                            */
/*==============================================================*/


/*==============================================================*/
/* Table: SEC_LOG                                               */
/*==============================================================*/
CREATE TABLE SEC_LOG
(
   ID                   VARCHAR(38) NOT NULL COMMENT '日志标识',
   USER_ID              VARCHAR(38) NOT NULL COMMENT '用户标识',
   LOG_TYPE             VARCHAR(10) NOT NULL DEFAULT 'login' COMMENT '日志类型（login、operation、auth）',
   USER_NAME            VARCHAR(50) NOT NULL COMMENT '用户名称',
   OPERATION_NAME       VARCHAR(50) NOT NULL COMMENT '操作名称',
   OPERATION_TIME       DATETIME NOT NULL COMMENT '操作时间',
   DESCRIPTION          VARCHAR(3000) COMMENT '日志描述',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_LOG COMMENT '安全日志(包括登录日志、操作日志和授权日志)';

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
   ORG_ID               VARCHAR(38) NOT NULL COMMENT '组织标识',
   ROLE_ID              VARCHAR(38) NOT NULL COMMENT '具备的角色（只能是管理类角色和混合类角色）',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ORG_ID, ROLE_ID)
);

ALTER TABLE SEC_ORG_ROLE COMMENT '组织角色表，存储组织在组织上充当的角色。';

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
   ID                   VARCHAR(38) NOT NULL COMMENT '组织标识',
   PATH                 VARCHAR(300) NOT NULL,
   PARENT               VARCHAR(38) COMMENT '父组织标识',
   NAME                 VARCHAR(150) COMMENT '名称',
   CODE                 VARCHAR(1000) COMMENT '编码',
   LEVEL                INT COMMENT '层级',
   `ORDER`              INT COMMENT '顺序',
   TYPE                 INT COMMENT '类型（公司、子公司、部门、科室等）',
   STATUS               VARCHAR(10) NOT NULL DEFAULT 'enabled' COMMENT '状态',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_ORGANIZATION COMMENT '系统组织表';

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
   ID                   VARCHAR(38) NOT NULL COMMENT '操作资源标识',
   PERMISSION_ID        VARCHAR(38) NOT NULL COMMENT '操作标识',
   TYPE                 VARCHAR(30) NOT NULL DEFAULT 'URL' COMMENT '资源类型，默认是Url，将来可能有其他类型',
   RESOURCE             VARCHAR(300) NOT NULL COMMENT '资源',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_PERMISSION_RESOURCE COMMENT '权限资源表';

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
   ID                   VARCHAR(38) NOT NULL COMMENT '操作标识',
   PATH                 VARCHAR(300) NOT NULL,
   PARENT               VARCHAR(38) COMMENT '父操作标识',
   CODE                 VARCHAR(50) NOT NULL COMMENT '操作代码',
   NAME                 VARCHAR(150) NOT NULL COMMENT '名称',
   CONTEXT              VARCHAR(300),
   URL                  VARCHAR(300) COMMENT 'Page对应的URL，或者页面元素所在的URL',
   TYPE                 VARCHAR(10) NOT NULL DEFAULT 'Page' COMMENT '模块、页面或者元素',
   ELEMENT_ID           VARCHAR(50) COMMENT '受控页面元素的ID',
   ELEMENT_BEHAVIOUR    VARCHAR(30) COMMENT '页面元素默认行为',
   `ORDER`              INT DEFAULT 1000 COMMENT '顺序',
   DESCRIPTION          VARCHAR(1000) COMMENT '描述',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_PERMISSION COMMENT '操作权限表';

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
   ID                   VARCHAR(38) NOT NULL COMMENT '规则标识',
   OPERATION_ID         VARCHAR(38) NOT NULL COMMENT '操作标识',
   NAME                 VARCHAR(150) NOT NULL COMMENT '名称',
   PRIORITY             INT NOT NULL DEFAULT 100 COMMENT '优先级',
   RULE                 VARCHAR(1000) NOT NULL COMMENT '规则',
   BEHAVIOUR            VARCHAR(30) COMMENT '行为',
   DESCRIPTION          VARCHAR(1000) COMMENT '描述',
   IS_DEFAULT           INT NOT NULL DEFAULT 0 COMMENT '是否缺省规则',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_PERMISSION_RULE COMMENT '权限规则表';

/*==============================================================*/
/* Table: SEC_ROLE                                              */
/*==============================================================*/
CREATE TABLE SEC_ROLE
(
   ID                   VARCHAR(38) NOT NULL COMMENT '角色标识',
   CODE                 VARCHAR(50) COMMENT '角色编码',
   NAME                 VARCHAR(150) NOT NULL COMMENT '角色名',
   DESCRIPTION          VARCHAR(1000) COMMENT '描述',
   TYPE                 SMALLINT NOT NULL DEFAULT 0 COMMENT '角色类型（管理类、流转类、混合类）',
   PARTICIPANT_TYPE     SMALLINT DEFAULT NULL COMMENT '参与者类型（用户、部门）',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_ROLE COMMENT '系统角色表，对工作流而言是角色类型';

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
   PARENT_ROLE_ID       VARCHAR(38) NOT NULL COMMENT '父角色标识',
   CHILD_ROLE_ID        VARCHAR(38) NOT NULL COMMENT '子角色标识',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (PARENT_ROLE_ID, CHILD_ROLE_ID)
);

ALTER TABLE SEC_ROLE_INHERITANCE COMMENT '角色继承表，记录角色的父子关系';

/*==============================================================*/
/* Table: SEC_ROLE_PERMISSION                                   */
/*==============================================================*/
CREATE TABLE SEC_ROLE_PERMISSION
(
   ROLE_ID              VARCHAR(38) NOT NULL COMMENT '角色标识',
   OPERATION_ID         VARCHAR(38) NOT NULL COMMENT '操作标识',
   RULE_ID              VARCHAR(38) COMMENT '规则标识',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ROLE_ID, OPERATION_ID)
);

ALTER TABLE SEC_ROLE_PERMISSION COMMENT '角色权限表';

/*==============================================================*/
/* Table: SEC_USER                                              */
/*==============================================================*/
CREATE TABLE SEC_USER
(
   ID                   VARCHAR(38) NOT NULL COMMENT '用户标识',
   NAME                 VARCHAR(50) NOT NULL COMMENT '姓名',
   TYPE                 VARCHAR(10) NOT NULL DEFAULT 'local' COMMENT '类型',
   LOGIN_ID             VARCHAR(30) NOT NULL COMMENT '账户',
   PASSWORD             VARCHAR(50) COMMENT '密码',
   EMAIL                VARCHAR(50) COMMENT '邮件',
   MOBILE_PHONE         VARCHAR(15) COMMENT '手机',
   IM                   VARCHAR(50) COMMENT '即时通讯号',
   TELEPHONE            VARCHAR(15) COMMENT '办公电话',
   SEX                  CHAR(1) NOT NULL DEFAULT 'U' COMMENT '性别',
   BIRTHDAY             DATETIME COMMENT '生日',
   STATUS               VARCHAR(10) NOT NULL DEFAULT 'enabled' COMMENT '状态',
   ORG_ID               VARCHAR(38) NOT NULL COMMENT '所属组织',
   RANK                 VARCHAR(50) COMMENT '职位',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (ID)
);

ALTER TABLE SEC_USER COMMENT '系统用户表';

/*==============================================================*/
/* Table: SEC_USER_ROLE                                         */
/*==============================================================*/
CREATE TABLE SEC_USER_ROLE
(
   USER_ID              VARCHAR(38) NOT NULL COMMENT '用户标识',
   ROLE_ID              VARCHAR(38) NOT NULL COMMENT '角色标识（只能是管理类角色和混合类角色）',
   CREATED_BY           VARCHAR(38) NOT NULL COMMENT '创建人',
   CREATED_DATE         DATETIME NOT NULL COMMENT '创建时间',
   LAST_UPDATED_BY      VARCHAR(38) NOT NULL COMMENT '最后修改人',
   LAST_UPDATED_DATE    DATETIME NOT NULL COMMENT '最后修改时间',
   PRIMARY KEY (USER_ID, ROLE_ID)
);

ALTER TABLE SEC_USER_ROLE COMMENT '用户角色表，存储用户在组织上充当的角色。';

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

