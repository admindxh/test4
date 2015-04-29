package bingo.modules.securityConsole.yonghuCanshu;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;

@Service
public class UserCanShuService extends BaseService{
	
	/**
	 * 根据ID进行保存参数信息
	 * @param userCanShu
	 */
	public void saveUserCanShu(UserCanShu userCanShu){
		
		if(StringUtils.isEmpty(userCanShu.getYhbh())){
			dao.insert(userCanShu);
		}else {
			dao.update(userCanShu);
		}
	}

	/**
	 * 根据ID进行查询参数表信息
	 * @param yhbh
	 * @return
	 */
	public UserCanShu getUserCanShuById(String yhbh){
		UserCanShu userCanShu=dao.select(UserCanShu.class,yhbh);
		return userCanShu;	
	}
	
	/**
	 * 添加
	 * @param userCanShu
	 */
	public void addUserCanShu(UserCanShu userCanShu){
		dao.insert(userCanShu);
	}
	/**
	 * 修改
	 * @param userCanShu
	 */
	public void updateUserCanShu(UserCanShu userCanShu){
		dao.update(userCanShu);
	}
	
	public void deleteUserCanShu(String yhbh){
		dao.delete(UserCanShu.class,yhbh);
	}
	
	public void deleteAllUserCanShu(String[] yhbhs){
		for(String yhbh:yhbhs){
			deleteUserCanShu(yhbh);
		}
	}
}
