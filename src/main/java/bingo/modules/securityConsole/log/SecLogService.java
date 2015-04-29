package bingo.modules.securityConsole.log;

import java.util.Date;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.security.SecurityContext;

@Service
public class SecLogService extends BaseService {
	// 赋权日志
	public void logAuth(String operationName, String description) {
		saveSecurityLog(SecLog.AUTH_LOG, operationName, description);
	}
	
	// 操作日志
	public void logOperation(String operationName, String description) {
		saveSecurityLog(SecLog.OPERATION_LOG, operationName, description);
	}
	
	// 登录日志
	public void logLogin(String description) {
		saveSecurityLog(SecLog.LOGIN_LOG, "用户登录", description);
	}

	private void saveSecurityLog(String logType, String operationName, String description) {
		SecLog secLog = new SecLog();
		secLog.setUserId(SecurityContext.getCurrentUser().getId());
		secLog.setUserName(SecurityContext.getCurrentUser().getName());
		secLog.setOperationTime(new Date());
		secLog.setLogType(logType);
		secLog.setOperationName(operationName);
		secLog.setDescription(description);
		dao.insert(secLog);
	}
	
	public SecLog selectLogInfo(String logId) {
		return dao.select(SecLog.class, logId);
	}
}