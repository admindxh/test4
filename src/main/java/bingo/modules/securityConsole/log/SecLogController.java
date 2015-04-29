/**
 * This file created at 2011-1-6.
 *
 * Copyright (c) 2002-2011 Bingosoft, Inc. All rights reserved.
 */
package bingo.modules.securityConsole.log;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

/**
 * <code>{@link SecLogController}</code>
 *
 * @author Administrator
 */
@Controller
public class SecLogController {
	private SecLogService secLogService;

	/**
	 * @return the secLogService
	 */
	public SecLogService getSecLogService() {
		return secLogService;
	}

	/**
	 * @param secLogService the secLogService to set
	 */
	public void setSecLogService(SecLogService secLogService) {
		this.secLogService = secLogService;
	}

	//查看日志明细
	public void viewSecLog(String logId) {
		SecLog secLog = secLogService.selectLogInfo(logId);
		Result.setAttribute("log", secLog);
		Result.forward("/modules/log/view_sec_log.jsp");
	}
}