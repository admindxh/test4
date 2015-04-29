package bingo.modules.securityConsole.organization;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.dao.Dao;

@Service
public class OrganizationService extends BaseService {
	/**
	 * 根据主键获取单条数据
	 */
	public SecOrganization findById(String orgId) {
		return dao.select(SecOrganization.class, orgId);
	}

	/**
	 * 通过主键删除UsfOrganization对象
	 * 1.同时删除该组织的子组织及组织下的用户
	 * @param orgId 主键
	 * @return
	 */
	public void deleteOrganization(String orgId) {
		dao.delete(SecOrganization.class, orgId);
	}

	/**
	 * 创建或更新UsfOrganization 对象
	 * @param usfOrganization
	 */
	public void saveOrUpdate(SecOrganization secOrganization) {
		if (StringUtils.isEmpty(secOrganization.getId())) {
			secOrganization.setId(Dao.getUUID());
			secOrganization.setPath(getOrganizationPath(secOrganization));
			dao.insert(secOrganization);
		} else {
			secOrganization.setPath(getOrganizationPath(secOrganization));
			dao.update(secOrganization);
		}
	}
	
	private String getOrganizationPath(SecOrganization secOrganization) {
		if (StringUtils.isEmpty(secOrganization.getParent())) {
			return secOrganization.getId();
		}
		
		SecOrganization parentOrganization = dao.select(SecOrganization.class, secOrganization.getParent());
		String parentPath = parentOrganization.getPath();
		if (StringUtils.isEmpty(parentPath)) {
			return secOrganization.getId();
		}
		return parentPath + "." + secOrganization.getId();
	}
	
	public void enabledOrganization(String orgId) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("id", orgId);
		data.put("status", "enabled");
		dao.updateFields(SecOrganization.class, data);
	}

	public void disabledOrganization(String orgId) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("id", orgId);
		data.put("status", "disabled");
		dao.updateFields(SecOrganization.class, data);
	}
}