INSERT INTO SYS_PROFILE
  (ID, NAME, DESCRIPTION, ACTIVATE, GLOBAL)
VALUES
  ('0FE18959-74EA-44F0-B63E-D4B3674E393F', '公共参数', '具体环境的参数覆盖公共参数', 1, 1);

INSERT INTO SYS_PROFILE
  (ID, NAME, DESCRIPTION, ACTIVATE, GLOBAL)
VALUES
  ('0FE18959-74EA-44F0-B63E-D4B3674E393A', '开发环境', '开发环境所需参数', 1, 0);

INSERT INTO SYS_PROFILE
  (ID, NAME, DESCRIPTION, ACTIVATE, GLOBAL)
VALUES
  ('0FE18959-74EA-44F0-B63E-D4B3674E393B', '内部测试环境', '内部环境所需参数', 0, 0);

INSERT INTO SYS_PROFILE
  (ID, NAME, DESCRIPTION, ACTIVATE, GLOBAL)
VALUES
  ('0FE18959-74EA-44F0-B63E-D4B3674E393C', '客户测试环境', '客户环境所需参数', 0, 0);

INSERT INTO SYS_PROFILE
  (ID, NAME, DESCRIPTION, ACTIVATE, GLOBAL)
VALUES
  ('0FE18959-74EA-44F0-B63E-D4B3674E393D', '生产环境', '演示环境所需参数', 0, 0);
  
 
INSERT INTO SYS_PROFILE_PARAMETER
  (ID, PROFILE_ID, NAME, VALUE, DESCRIPTION)
VALUES
  ('0FE18959-74EA-44F0-B63E-D4B3674E393D', '0FE18959-74EA-44F0-B63E-D4B3674E393F', 'Security.Login_Mode', 'local', '系统登录模式，local：本地登录 sso：单点登录');

INSERT INTO SYS_PROFILE_PARAMETER
  (ID, PROFILE_ID, NAME, VALUE, DESCRIPTION)
VALUES
  ('69dfb24b6de84c97b573d1ef6e273af5', '0FE18959-74EA-44F0-B63E-D4B3674E393F', 'Jso.Debug_Mode', 'false', 'Jso处理资源的模式，true：调试模式，false：生产模式');
  
INSERT INTO SYS_PROFILE_PARAMETER
  (ID, PROFILE_ID, NAME, VALUE, DESCRIPTION)
VALUES
  ('d392e8575a624f44a0e281d9288b15e9', '0FE18959-74EA-44F0-B63E-D4B3674E393F', 'DhtmlxGrid.Export_Excel_Path', 'c:\\', 'DhtmlxGrid导出Excel文件的临时目录');

INSERT INTO SYS_PROFILE_PARAMETER
  (ID, PROFILE_ID, NAME, VALUE, DESCRIPTION)
VALUES
  ('d392e8575a624f44a0e281d9288b15e7', '0FE18959-74EA-44F0-B63E-D4B3674E393F', 'SSO.Server_Url', 'http://localhost:8080/sso/openid', 'SSO服务器地址');

COMMIT;
