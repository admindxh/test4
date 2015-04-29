package bingo.modules.securityConsole.user;

import bingo.dao.ext.BaseObject;

public class SecUserRole extends BaseObject {

	private static final long	serialVersionUID	= 1L;
	
	public SecUserRole() {
		
	}
	
	public SecUserRole(String userId, String roleId) {
		this.userId = userId;
		this.roleId = roleId;
	}
	
	/** 
	 * 用户标识 
	 */
	private String				userId;
	/** 
	 * 角色标识（只能是管理类角色和混合类角色） 
	 */
	private String				roleId;

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleId() {
		return this.roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
}