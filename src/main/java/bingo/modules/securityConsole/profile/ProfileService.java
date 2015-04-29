/**
 * This file created at 2011-12-8.
 *
 * Copyright (c) 2002-2011 Bingosoft, Inc. All rights reserved.
 */
package bingo.modules.securityConsole.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.dao.Dao;

/**
 * <code>{@link ProfileService}</code>
 *
 * 系统配置服务类
 *
 * @author zhongtao
 */
@Service
public class ProfileService extends BaseService {
	/**
	 * 新增或修改系统配置
	 */
	public void saveOrUpdateProfile(SysProfile sysProfile) {
		if (StringUtils.isEmpty(sysProfile.getId())) {
			dao.insert(sysProfile);
		} else {
			dao.update(sysProfile);
		}
	}
	
	/**
	 * 新增或修改系统配置参数
	 */
	public void saveOrUpdateProfileParameter(SysProfileParameter profileParameter) {
		if (StringUtils.isEmpty(profileParameter.getId())) {
			dao.insert(profileParameter);
		} else {
			dao.update(profileParameter);
		}
	}
	
	/**
	 * 激活配置
	 */
	public void activateProfile(String profileId) {
		// 非全局配置需要失效掉其他非全局配置
		SysProfile profile = dao.select(SysProfile.class, profileId);
		if (profile.getGlobal() == 0) {
			dao.getJdbcDao().update("profile.inactivateProfile", profileId);
		}
		profile.setActivate(1);
		dao.updateFields(profile, "activate");
	}
	
	/**
	 * 失效配置 
	 */
	public void inactivateGlobalProfile(String profileId) {
		SysProfile profile = dao.select(SysProfile.class, profileId);
		profile.setActivate(0);
		dao.updateFields(profile, "activate");
	}
	
	/**
	 * 删除配置，或利用数据库级联删除功能删除掉对应的参数
	 */
	public void deleteProfile(String profileId) {
		dao.delete(SysProfile.class, profileId);
	}
	
	/**
	 * 删除特定参数
	 */
	public void deleteProfileParameter(String profileParameterId) {
		dao.delete(SysProfileParameter.class, profileParameterId);
	}
	
	/**
	 * 获取特定环境
	 */
	public SysProfile getProfile(String profileId) {
		return dao.select(SysProfile.class, profileId);
	}
	
	/**
	 * 获取特定参数
	 */
	public SysProfileParameter getProfileParameter(String profileParameterId) {
		return dao.select(SysProfileParameter.class, profileParameterId);
	}
	
	/**
	 * 检查环境名称的唯一性
	 */
	public boolean checkUniqueProfileName(String profileName, String profileId) {
		if (StringUtils.isEmpty(profileId)) {
			return dao.getJdbcDao().exists("profile.existProfileByName", profileName);
		} else {
			return dao.getJdbcDao().exists("profile.existProfileByNameForEdit", profileName, profileId);
		}
	}
	
	/**
	 * 检查参数名称在环境内的唯一性
	 */
	public boolean checkUniqueProfileParameterName(String profileParameterName, String profileParameterId, String profileId) {
		if (StringUtils.isEmpty(profileId)) {
			return dao.getJdbcDao().exists("profile.existParameterByName", profileParameterName, profileId);
		} else {
			return dao.getJdbcDao().exists("profile.existParameterByNameForEdit", profileParameterName, profileParameterId ,profileId);
		}
	}
	
	/**
	 * 复制配置所有参数
	 */
	public void copyProfile(String sourceProfileId, String destinationProfileId) {
		dao.getJdbcDao().delete("profile.cleanDestinationProfile", destinationProfileId, sourceProfileId);
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("profileId", sourceProfileId);
		List<SysProfileParameter> sourceParams = dao.queryForList(SysProfileParameter.class, "profile.getProfileParams", queryParams);
		for (SysProfileParameter param: sourceParams) {
			param.setId(Dao.getUUID());
			param.setProfileId(destinationProfileId);
			dao.insert(param);
		}
	}
}