package bingo.modules.securityConsole.role;

import bingo.dao.ext.BaseObject;

@SuppressWarnings("serial")
public class SecMenuPermission extends BaseObject {
	public SecMenuPermission() {

	}

	public SecMenuPermission(String roleId, String operationId, String ruleId) {
		this.roleId = roleId;
		this.operationId = operationId;
		this.ruleId = ruleId;
	}

	/** 
	 * 角色标识 
	 */
	private String	roleId;
	/** 
	 * 操作标识 
	 */
	private String	operationId;

	/** 
	 * 规则标识 
	 */
	private String	ruleId;

	/**
	 * @return the roleId
	 */
	public String getRoleId() {
		return roleId;
	}

	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	/**
	 * @return the operationId
	 */
	public String getOperationId() {
		return operationId;
	}

	/**
	 * @param operationId the operationId to set
	 */
	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}

	/**
	 * @return the ruleId
	 */
	public String getRuleId() {
		return ruleId;
	}

	/**
	 * @param ruleId the ruleId to set
	 */
	public void setRuleId(String ruleId) {
		this.ruleId = ruleId;
	}
}