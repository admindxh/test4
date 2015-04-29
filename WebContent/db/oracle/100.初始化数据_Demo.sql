INSERT INTO SEC_Permission (Id, Path, Parent, Code, Name, Context, Url, Type, Element_Id, Element_Behaviour, Description, "ORDER", created_by, created_date, last_updated_by, last_updated_date) VALUES (N'9c1eee60d2ca4e5abd5efaab909addee', '9c1eee60d2ca4e5abd5efaab909addee', null, N'DEMO', N'Demo', '~', null, N'Module', NULL, NULL, N'',160,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);
INSERT INTO SEC_Permission (Id, Path, Parent, Code, Name, Url, Type, Element_Id, Element_Behaviour, Description, "ORDER", created_by, created_date, last_updated_by, last_updated_date) VALUES (N'e5cc20ebf4d0485ebdccabe3724072dc', '9c1eee60d2ca4e5abd5efaab909addee.e5cc20ebf4d0485ebdccabe3724072dc','9c1eee60d2ca4e5abd5efaab909addee', N'DEMO.PROFILE', N'配置管理', '/modules/demo/profile/list_sys_profile.jsp', N'Page', NULL, NULL, N'',161,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);
INSERT INTO SEC_Role_Permission (Role_Id, Operation_Id, Rule_Id, created_by, created_date, last_updated_by, last_updated_date) VALUES (N'AD6754E3-B4D8-412D-9CD9-DC19DC42EBEA', N'9c1eee60d2ca4e5abd5efaab909addee', NULL,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);
INSERT INTO SEC_Role_Permission (Role_Id, Operation_Id, Rule_Id, created_by, created_date, last_updated_by, last_updated_date) VALUES (N'AD6754E3-B4D8-412D-9CD9-DC19DC42EBEA', N'e5cc20ebf4d0485ebdccabe3724072dc', NULL,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);

INSERT INTO SYS_SITE_MAP(ID, PARENT_ID, PORTAL_CODE, PLUGIN_CODE, URL, TITLE, TARGET)
VALUES ('c1e498006b3f46ebbaa2963045651c4f', NULL, 'default', null, null, 'Demo', 'current');

INSERT INTO SYS_SITE_MAP(ID, PARENT_ID, PORTAL_CODE, PLUGIN_CODE, URL, TITLE, TARGET)
VALUES ('e06a432a439f46b280ab88c37723583e', 'c1e498006b3f46ebbaa2963045651c4f', 'default', 'url', '~/modules/demo/profile/list_sys_profile.jsp', '示例程序', 'current');

COMMIT;
