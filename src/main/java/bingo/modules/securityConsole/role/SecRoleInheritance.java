package bingo.modules.securityConsole.role;

import bingo.dao.ext.BaseObject;

@SuppressWarnings("serial")
public class SecRoleInheritance extends BaseObject {
	
	public SecRoleInheritance() {
		
	}
	
	public SecRoleInheritance(String parentRoleId, String childRoleId) {
		this.parentRoleId = parentRoleId;
		this.childRoleId = childRoleId;
	}

	/** 
	 * 父角色标识 
	 */
	private String	parentRoleId;
	/** 
	 * 子角色标识 
	 */
	private String	childRoleId;

	public String getParentRoleId() {
		return this.parentRoleId;
	}

	public void setParentRoleId(String parentRoleId) {
		this.parentRoleId = parentRoleId;
	}

	public String getChildRoleId() {
		return this.childRoleId;
	}

	public void setChildRoleId(String childRoleId) {
		this.childRoleId = childRoleId;
	}
}