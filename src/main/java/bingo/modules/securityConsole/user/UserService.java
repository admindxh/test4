package bingo.modules.securityConsole.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.common.Constants;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.security.SecurityContext;

@Service
public class UserService extends BaseService {
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

	/**
	 * 批量启用帐号
	 * @param userIds 用户Id集合
	 */
	public void enableAccount(String[] userIds) {
		SecUser user = new SecUser();
		for (String userId : userIds) {
			user.setId(userId);
			user.setStatus(Constants.USER_STATUS_ENABLED);
			dao.updateFields(SecUser.class, user, "status");
			//写操作日志
			secLogService.logOperation("启用帐号", "帐号（ID=" + userId + ")启用成功!");
		}
	}

	/**
	 * 批量停用帐号
	 * @param userIds 用户Id集合
	 */
	public void disableAccount(String[] userIds) {
		SecUser user = new SecUser();
		for (String userId : userIds) {
			user.setId(userId);
			user.setStatus(Constants.USER_STATUS_DISABLED);
			dao.updateFields(SecUser.class, user, "status");
			//写操作日志
			secLogService.logOperation("停用帐号", "帐号（ID=" + userId + ")停用成功!");
		}
	}

	/**
	 * 批量删除用户
	 * @param userIds 用户Id集合
	 */
	public void deleteUsers(String[] userIds) {
		for (String userId : userIds) {
			dao.delete(SecUser.class, userId);
			secLogService.logOperation("删除用户", "删除用户（ID=" + userId + ";" + ")成功!");
		}
	}

	/**
	 * 功能：批量删除用户角色
	 * 功能实现步骤：
	 * 1.接收页面传递过来的角色id字符串数组；
	 * 2.循环取出id，并执行删除操作；
	 * @param idStrings 角色id字符串数组，角色id字符串由MEMBER_TYPE，ROLE_ID，MEMBER_ID三个组成，以“;”做分隔符
	 */
	public void deleteUserRoles(String userId, String[] roleIds) {
		if (roleIds != null && StringUtils.isNotEmpty(userId)) {
			SecUserRole userRole = new SecUserRole();
			for (String roleId : roleIds) {
				userRole.setUserId(userId);
				userRole.setRoleId(roleId);
				dao.delete(userRole);
				//授权审计
				secLogService.logAuth("角色撤销", "撤销用户(" + userId + ")的(" + roleId + ")角色");
			}
		}
	}

	/**
	 * 功能：用户角色分配
	 * 功能实现步骤：
	 * 1.删除用户所有角色
	 * 2.添加新的角色
	 * @param userId 用户ID
	 * @param roleIds 角色ID字符串数组
	 */
	public void assignRoles(String userId, List<String> roleIds) {
		if (null != roleIds && StringUtils.isNotEmpty(userId)) {
			SecUserRole userRole = new SecUserRole();
			for (String roleId : roleIds) {
				if (!StringUtils.isEmpty(roleId)) {
					userRole.setUserId(userId);
					userRole.setRoleId(roleId);
					dao.insert(userRole);
					//授权审计
					secLogService.logAuth("角色分配", "给用户(" + userId + ")分配(" + roleId + ")角色");
				}
			}
		}
	}

	/**
	 * 功能：删除某个用户的所有角色
	 * 功能实现步骤：
	 * @param userId 用户ID
	 */
	/*public void deleteRolesByUserId(String userId) {
		dao.getJdbcDao().delete("user.delete.user.role", userId);
		secLogService.logAuth("清空用户角色", "移除用户（ID=" + userId + ")的所有角色成功!");
	}*/

	/**
	 * 功能：为用户批量添加角色
	 * 功能实现步骤：
	 * @param userId 用户ID
	 * @param roleIds 角色ID字符串数组
	 */
	/*public void addNewRolesByUserId(String userId, String[] roleIds) {
		for (String roleId : roleIds) {
			if (!StringUtils.isEmpty(roleId)) {
				dao.getJdbcDao().insert("user.addNewRolesByUserId", roleId, userId);
				secLogService.logAuth("批量分配角色", "给用户(" + userId + ")分配(" + roleId + ")角色");
			}
		}
	}*/

	/**
	 * 创建或更新secUser 对象
	 * @param secUser
	 * @throws Exception 
	 */
	public void saveOrUpdate(SecUser secUser) {
		String userId = secUser.getId();
		if (StringUtils.isEmpty(userId)) {
			secUser.setPassword(SecurityContext.getProvider().encryptPassword(secUser.getPassword()));
			dao.insert(secUser);
			secLogService.logOperation("添加用户信息", "添加用户（ID=" + userId + ";Name=" + secUser.getName() + ")成功!");
		} else {
			dao.updateFieldsExcluded(secUser, "password");
			secLogService.logOperation("更新用户信息", "更新用户信息（ID=" + userId + ";Name=" + secUser.getName() + ")成功!");
		}
	}

	/**
	 * 管理员重设密码
	 */
	public void updatePassword(String userId, String newPassword) {
		String newMD5Password = SecurityContext.getProvider().encryptPassword(newPassword);
		Map<String, String> data = new HashMap<String, String>();
		data.put("id", userId);
		data.put("password", newMD5Password);
		dao.updateFields(SecUser.class, data);
		secLogService.logOperation("更新帐号密码", "更新用户（ID=" + userId + ")的密码!");
	}

	/**
	 * 个人修改密码
	 */
	public String updatePersonPassword(String userId, String oldPassword, String newPassword) {
		if (!SecurityContext.getProvider().encryptPassword(oldPassword).equals(getUserById(userId).getPassword())) {
			return "旧密码不正确，密码修改不成功";
		}
		updatePassword(userId, newPassword);
		return "密码修改成功，请您记住新密码";
	}

	//根据UserId获取用户对象
	public SecUser getUserById(String userId) {
		return dao.select(SecUser.class, userId);
	}

	// 根据UserId获取用户信息
	public Map<String, Object> getUserInfoById(String userId) {
		return dao.getJdbcDao().queryForMap("user.get.userinfo", userId);
	}

	// 检查登录帐号的唯一性
	public boolean checkUniqueAccount(String userId, String loginId) {
		if (StringUtils.isEmpty(userId)) {
			return dao.getJdbcDao().exists("user.checkAccount", loginId);
		} else {
			return dao.getJdbcDao().exists("user.checkAccountForUpdate", loginId, userId);
		}
	}
}
