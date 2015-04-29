package bingo.modules.securityConsole.role;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.log.SecLogService;

@Service
public class RoleMenuService extends BaseService {
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

	public List<Map<String, Object>> getSelectedOperationDataRulePrivilegeList(String roleId,String entity) {
		if( null != entity &&"menu".equals(entity.trim())){
			return dao.getJdbcDao().queryForListMap("role.function.selectedRoleRuleList.menu", roleId);
		}
		return dao.getJdbcDao().queryForListMap("role.function.selectedRoleRuleList.operation", roleId);
	}

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
						updateRoleMenuPermission(roleId, operation, null);
					}
				} else {
					if (StringUtils.isNotEmpty(operationRule)) {
						if (!ruleId.equals(operationRule)) {
							//更新RULEID-》由已有值更新为最新值
							updateRoleMenuPermission(roleId, operation, ruleId);
						}
					} else {
						//更新RULEID -》清空
						updateRoleMenuPermission(roleId, operation, ruleId);
					}
				}
			} else {
				insertRoleMenuPermission(roleId, operation, ruleId);
			}
		}

		//找出需要删除的权限
		for (Map<String, Object> item : selectedOperationRuleList) {
			String operation = String.valueOf(item.get("Operation"));
			if (!operationRuleDictionary.containsKey(operation)) {
				//删除操作
				deleteRoleMenuPermission(roleId, operation);
			}
		}
	}

	/**
	 * @param roleId 角色Id
	 * @param operation 操作Id
	 */
	private void deleteRoleMenuPermission(String roleId, String operation) {
		SecMenuPermission rolePermission = new SecMenuPermission(roleId, operation, null);
		dao.delete(rolePermission);
	}

	/**
	 * @param roleId 角色Id
	 * @param operation 操作Id
	 * @param ruleId 规则Id
	 */
	private void insertRoleMenuPermission(String roleId, String operation, String ruleId) {
		SecMenuPermission rolePermission = new SecMenuPermission(roleId, operation, ruleId);
		dao.insert(rolePermission);
	}

	/**
	 * @param roleId 角色Id
	 * @param operation 操作Id
	 * @param ruleId 规则Id
	 */
	private void updateRoleMenuPermission(String roleId, String operation, String ruleId) {
		SecMenuPermission rolePermission = new SecMenuPermission(roleId, operation, ruleId);
		dao.update(rolePermission);
	}
}