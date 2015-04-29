/**
 * This file created at 2010-12-17.
 *
 * Copyright (c) 2002-2010 Bingosoft, Inc. All rights reserved.
 */
package bingo.modules.securityConsole.log;

import java.util.Date;

import bingo.dao.orm.annotations.UUID;

/**
 * <code>{@link SecLog}</code>
 *
 * 安全日志实体类
 *
 * @author Administrator
 */
public class SecLog {
	public static String LOGIN_LOG = "login";
	public static String AUTH_LOG = "auth";
	public static String OPERATION_LOG = "operation";
	
	@UUID
	private String Id;
	private String UserId;
	private String LogType;
	private String UserName;
	private String OperationName;
	private Date OperationTime;
	private String Description;
	/**
	 * @return the id
	 */
	public String getId() {
		return Id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		Id = id;
	}
	/**
	 * @return the userId
	 */
	public String getUserId() {
		return UserId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		UserId = userId;
	}
	/**
	 * @return the logType
	 */
	public String getLogType() {
		return LogType;
	}
	/**
	 * @param logType the logType to set
	 */
	public void setLogType(String logType) {
		LogType = logType;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return UserName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		UserName = userName;
	}
	/**
	 * @return the operationName
	 */
	public String getOperationName() {
		return OperationName;
	}
	/**
	 * @param operationName the operationName to set
	 */
	public void setOperationName(String operationName) {
		OperationName = operationName;
	}
	/**
	 * @return the operationTime
	 */
	public Date getOperationTime() {
		return OperationTime;
	}
	/**
	 * @param operationTime the operationTime to set
	 */
	public void setOperationTime(Date operationTime) {
		OperationTime = operationTime;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return Description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		Description = description;
	}
}
