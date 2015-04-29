package bingo.modules.securityConsole.lilvCanshu;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
@Service
public class CanShuLLService extends BaseService{
	
	/**
	 * 根据ID进行保存参数信息
	 * @param canShuLL
	 */
	public void saveCanShuLL(CanShuLL canShuLL){
		
		if(StringUtils.isEmpty(canShuLL.getLlbh())){
			dao.insert(canShuLL);
		}else {
			dao.update(canShuLL);
		}
		
	}

	/**
	 * 根据ID进行查询参数表信息
	 * @param llbh
	 * @return
	 */
	public CanShuLL getCanShuLLByID(String llbh){
		CanShuLL canShuLL=dao.select(CanShuLL.class, llbh);
		return canShuLL;
	}
	/**
	 * 添加
	 * @param canShuLL
	 */
	public void addCanShuLL(CanShuLL canShuLL){
		dao.insert(canShuLL);
	}
	/**
	 * 修改
	 * @param canShuLL
	 */
	public void updateCanShuLL(CanShuLL canShuLL){
		dao.update(canShuLL);
	}
	
	/**
	 * 删除
	 * @param canShuLL
	 */
	public void deleteCanShuLL(String llbh){
		dao.delete(CanShuLL.class,llbh);
	}
	
	public void deleteAllCanShuLL(String[] llbhs){
		for(String llbh:llbhs){
			deleteCanShuLL(llbh);
		}
	}
}
