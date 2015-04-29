INSERT INTO SYS_PORTAL_LAYOUT
  (ID, NAME, THUMBNAIL, URL, DESCRIPTION)
VALUES
  ('default', '默认布局', 'portal/layouts/default/thumbnail.jpg', 'portal/layouts/default/index.jsp', null);
  
INSERT INTO SYS_PORTAL_LAYOUT
  (ID, NAME, THUMBNAIL, URL, DESCRIPTION)
VALUES
  ('mobile', '四川移动布局', 'portal/layouts/mobile/thumbnail.jpg', 'portal/layouts/mobile/index.jsp', null);
  
INSERT INTO SYS_PORTAL_LAYOUT
  (ID, NAME, THUMBNAIL, URL, DESCRIPTION)
VALUES
  ('webos', 'WebOs布局', 'portal/layouts/webos/thumbnail.jpg', 'portal/layouts/webos/index.jsp', null);
  
INSERT INTO SYS_PORTAL_LAYOUT
  (ID, NAME, THUMBNAIL, URL, DESCRIPTION)
VALUES
  ('iaas', 'Iaas布局', 'portal/layouts/iaas/thumbnail.jpg', 'portal/layouts/iaas/index.jsp', null);

INSERT INTO SYS_PORTAL
  (CODE, TITLE, FOOTER, LOGO_URL, LAYOUT_ID)
VALUES
  ('default', '', 'XXX公司', '', 'default');


INSERT INTO SYS_SHORTCUT_KEY
  (ID,
   PORTAL_CODE,
   NAME,
   THUMBNAIL,
   TARGET,
   URL,
   PERMISSION_CODE,
   DISPLAY_ORDER)
VALUES
  ('mnuBrowse',
   'default',
   '浏览',
   '~/portal/layouts/default/images/edit_portal.gif',
   null,
   '~/?',
   'PORTAL.DESIGN',
   90);
   
INSERT INTO SYS_SHORTCUT_KEY
  (ID,
   PORTAL_CODE,
   NAME,
   THUMBNAIL,
   TARGET,
   URL,
   PERMISSION_CODE,
   DISPLAY_ORDER)
VALUES
  ('mnuDesign',
   'default',
   '设计',
   '~/portal/layouts/default/images/btn_hd_support.gif',
   null,
   '~/?config=true',
   'PORTAL.DESIGN',
   80);
   
INSERT INTO SYS_SHORTCUT_KEY
  (ID,
   PORTAL_CODE,
   NAME,
   THUMBNAIL,
   TARGET,
   URL,
   PERMISSION_CODE,
   DISPLAY_ORDER)
VALUES
  ('mnuLogout',
   'default',
   '退出',
   '~/portal/layouts/default/images/btn_hd_exit.gif',
   null,
   '~/common/login/logout.jsp',
   '',
   100);
   
INSERT INTO SEC_Permission (Id, Path, Parent, Code, Name, Url, Type, Element_Id, Element_Behaviour, Description, "ORDER", created_by, created_date, last_updated_by, last_updated_date) VALUES (N'9c1eee60d2ca4e5abd5efaab909added', '9c1eee60d2ca4e5abd5efaab909added', null, N'PORTAL', N'门户管理', null, N'Module', NULL, NULL, N'',160,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);
INSERT INTO SEC_Permission (Id, Path, Parent, Code, Name, Url, Type, Element_Id, Element_Behaviour, Description, "ORDER", created_by, created_date, last_updated_by, last_updated_date) VALUES (N'e5cc20ebf4d0485ebdccabe3724072db', '9c1eee60d2ca4e5abd5efaab909added.e5cc20ebf4d0485ebdccabe3724072db', '9c1eee60d2ca4e5abd5efaab909added', N'PORTAL.DESIGN', N'门户菜单设计', '/portal/layouts/default/index.jsp?config=true', N'Page', NULL, NULL, N'',161,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);
INSERT INTO SEC_Role_Permission (Role_Id, Operation_Id, Rule_Id, created_by, created_date, last_updated_by, last_updated_date) VALUES (N'AD6754E3-B4D8-412D-9CD9-DC19DC42EBEA', N'9c1eee60d2ca4e5abd5efaab909added', NULL,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);
INSERT INTO SEC_Role_Permission (Role_Id, Operation_Id, Rule_Id, created_by, created_date, last_updated_by, last_updated_date) VALUES (N'AD6754E3-B4D8-412D-9CD9-DC19DC42EBEA', N'e5cc20ebf4d0485ebdccabe3724072db', NULL,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE,N'43FE6476-CD7B-493B-8044-C7E3149D0876',SYSDATE);

COMMIT;
