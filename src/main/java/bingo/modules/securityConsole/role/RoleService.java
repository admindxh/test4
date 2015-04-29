package bingo.modules.securityConsole.role;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.modules.securityConsole.user.SecUserRole;

@Service
public class RoleService extends BaseService {
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
	 * 功能：根据角色标识获取角色对象
	 */
	public SecRole getRoleById(String roleId) {
		return dao.select(SecRole.class, roleId);
	}

	public void saveOrUpdate(SecRole secRole) {
		if(secRole.getType()==null){
			secRole.setType(0);
		}
		if (StringUtils.isEmpty(secRole.getId())) {
			dao.insert(secRole);
			secLogService.logAuth("添加角色信息", "添加角色（ID=" + secRole.getId() + ";Name=" + secRole.getName() + ")信息成功!");
		} else {
			dao.update(secRole);
			secLogService.logAuth("更新角色信息", "更新角色（ID=" + secRole.getId() + ";Name=" + secRole.getName() + ")信息成功!");
		}
	}

	public boolean checkUniqueRoleName(String roleName, String roleId) {
		if (StringUtils.isEmpty(roleId)) {
			return dao.getJdbcDao().exists("role.existRoleByRoleName", roleName);
		} else {
			return dao.getJdbcDao().exists("role.existRoleByRoleNameForEdit", roleName, roleId);
		}
	}

	public void deleteRole(String roleId) {
		dao.delete(SecRole.class, roleId);
	}

	public void deleteRoles(String[] roleIds) {
		for (String roleId : roleIds) {
			deleteRole(roleId);
		}
	}

	/**
	 * 给特定角色添加用户
	 * @param roleId 角色ID
	 * @param userIds 逗号分隔的用户ID
	 */
	public void addRoleUser(String roleId, List<String> userIds) {
		SecUserRole userRole = new SecUserRole();
		
		for (String userId : userIds) {
			userRole.setUserId(userId);
			userRole.setRoleId(roleId);
			dao.insert(userRole);
			secLogService.logAuth("添加角色成员", "给角色(" + roleId + ")添加的用户(" + userId + ")");
		}
	}

	public void deleteRoleUsers(String roleId, String userIds) {
		String[] userIdList = userIds.split(",");
		for (String userId : userIdList) {
			deleteRoleUser(roleId, userId);
		}
	}

	public void deleteRoleUser(String roleId, String userId) {
		SecUserRole userRole = new SecUserRole(userId, roleId);
		dao.delete(userRole);
		secLogService.logAuth("删除角色成员", "删除角色(" + roleId + ")的用户(" + userId + ")");
	}

	/**
	 * 给角色添加要继承的角色
	 * @param parentId 角色ID
	 * @param childIds 包含的角色ID集合
	 */
	public void addInheritanceRoles(String parentId, List<String> childIds) {
		SecRoleInheritance roleInheritance = new SecRoleInheritance();
		for (String childId : childIds) {
			if (StringUtils.isNotEmpty(childId)) {
				roleInheritance.setParentRoleId(parentId);
				roleInheritance.setChildRoleId(childId);
				dao.insert(roleInheritance);
				//授权审计
				secLogService.logAuth("角色继承", "给角色(" + parentId + ")添加子角色(" + childId + ")");
			}
		}
	}

	public void deleteInheritanceRole(String parentRoleId, String childRoleId) {
		SecRoleInheritance roleInheritance = new SecRoleInheritance(parentRoleId, childRoleId);
		dao.delete(roleInheritance);
		secLogService.logAuth("角色继承", "删除角色(" + parentRoleId + ")的子角色(" + childRoleId + ")");
	}

	public void deleteInheritanceRoles(String parentRoleId, String[] childRoleIds) {
		for (String childRoleId : childRoleIds) {
			deleteInheritanceRole(parentRoleId, childRoleId);
		}
	}

	public List<Map<String, Object>> getSelectedOperationDataRulePrivilegeList(String roleId,String entity) {
		if( null != entity &&"menu".equals(entity.trim())){
			return dao.getJdbcDao().queryForListMap("role.function.selectedRoleRuleList.menu", roleId);
		}
		return dao.getJdbcDao().queryForListMap("role.function.selectedRoleRuleList.operation", roleId);
	}

	public List<Map<String, Object>> getOperationDataRulePrivilegeList(String operation) {
		return dao.getJdbcDao().queryForListMap("role.function.selectedOperationRuleList", operation);
	}
	

	/**
	 * 保存对角色的授权信息
	 * @param privilegeList 
	 * @param roleId 角色ID
	 */
	public void savePrivilege(String[] privilegeList, String roleId,String entity) {
		List<Map<String, Object>> selectedOperationRuleList = getSelectedOperationDataRulePrivilegeList(roleId,entity) ;
		Map<String, Object> selectedOperationRuleDictionary = new HashMap<String, Object>();

		//将用户原先具备的操作和规则放入Map进行缓存以便后面查询
		for (Map<String, Object> item : selectedOperationRuleList) {
			selectedOperationRuleDictionary.put((String) item.get("Operation"), item.get("RuleId"));
		}

		//将前台选择的项整理成Map方式以便后面查询
		Map<String, Object> operationRuleDictionary = new HashMap<String, Object>();
		for (String item : privilegeList) {
			if (StringUtils.isNotEmpty(item)) {
				String[] privilegeArray = item.split(":");
				String operation = privilegeArray[0];
				String ruleId = privilegeArray.length != 2 ? null : privilegeArray[1];
				operationRuleDictionary.put(operation, ruleId);
			}
		}

		//找出需要新增和更新的权限
		for (String item : privilegeList) {
			if (StringUtils.isEmpty(item))
				continue;

			String[] privilegeArray = item.split(":");
			String operation = privilegeArray[0];
			String ruleId = privilegeArray.length != 2 ? null : privilegeArray[1];

			if (selectedOperationRuleDictionary.containsKey(operation)) {
				String operationRule = String.valueOf(selectedOperationRuleDictionary.get(operation));

				if (StringUtils.isEmpty(ruleId)) {
					if (null != operationRule && StringUtils.isNotEmpty((String) operationRule)) {
						//更新RULEID -》由空白变成最新的值
						updateRolePermission(roleId, operation, null);
					}
				} else {
					if (StringUtils.isNotEmpty(operationRule)) {
						if (!ruleId.equals(operationRule)) {
							//更新RULEID-》由已有值更新为最新值
							updateRolePermission(roleId, operation, ruleId);
						}
					} else {
						//更新RULEID -》清空
						updateRolePermission(roleId, operation, ruleId);
					}
				}
			} else {
				insertRolePermission(roleId, operation, ruleId);
			}
		}

		//找出需要删除的权限
		for (Map<String, Object> item : selectedOperationRuleList) {
			String operation = String.valueOf(item.get("Operation"));
			if (!operationRuleDictionary.containsKey(operation)) {
				//删除操作
				deleteRolePermission(roleId, operation);
			}
		}
	}

	/**
	 * @param roleId 角色Id
	 * @param operation 操作Id
	 */
	private void deleteRolePermission(String roleId, String operation) {
		SecRolePermission rolePermission = new SecRolePermission(roleId, operation, null);
		dao.delete(rolePermission);
	}

	/**
	 * @param roleId 角色Id
	 * @param operation 操作Id
	 * @param ruleId 规则Id
	 */
	private void insertRolePermission(String roleId, String operation, String ruleId) {
		SecRolePermission rolePermission = new SecRolePermission(roleId, operation, ruleId);
		dao.insert(rolePermission);
	}

	/**
	 * @param roleId 角色Id
	 * @param operation 操作Id
	 * @param ruleId 规则Id
	 */
	private void updateRolePermission(String roleId, String operation, String ruleId) {
		SecRolePermission rolePermission = new SecRolePermission(roleId, operation, ruleId);
		dao.update(rolePermission);
	}
}