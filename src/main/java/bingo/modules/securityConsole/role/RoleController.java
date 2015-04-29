/**
 * This file created at 2010-12-25.
 *
 * Copyright (c) 2002-2010 Bingosoft, Inc. All rights reserved.
 */
package bingo.modules.securityConsole.role;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

/**
 * <code>{@link RoleController}</code>
 *
 * 角色控制器
 *
 * @author Administrator
 */
@Controller
public class RoleController {
	private RoleService roleService;

	/**
	 * @return the roleService
	 */
	public RoleService getRoleService() {
		return roleService;
	}

	/**
	 * @param roleService the roleService to set
	 */
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public void editRole(String roleId) {
		Result.setAttribute("role", roleService.getRoleById(roleId));
		Result.forward("/modules/role/edit_sec_role.jsp");
	}
}