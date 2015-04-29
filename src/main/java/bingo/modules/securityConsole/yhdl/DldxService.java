package bingo.modules.securityConsole.yhdl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.yonghuCanshu.UserCanShu;

@Service
public class DldxService extends BaseService{
	
	

	/**
	 * 根据ID进行保存参数信息
	 * @param userCanShu
	 */
	public void saveDldx(YhdxDL yhdxDL){
		
		if(StringUtils.isEmpty(yhdxDL.getDldxbh())){
			dao.insert(yhdxDL);
		}else {
			dao.update(yhdxDL);
		}
	}
	/**
	 * 根据ID进行保存参数信息
	 * @param dldxbh
	 * @return
	 */
	public HBDXuser getYhdlById(String yhdxdh){
		HBDXuser hbuserHbdXuser=dao.select(HBDXuser.class, yhdxdh);
		return hbuserHbdXuser;
		
	}
	
	/**
	 * 添加
	 * @param userCanShu
	 */
	public void addYhdxDL(YhdxDL yhdxDL){
		dao.insert(yhdxDL);
	}
	public void deleteUserCanShu(String yhdxDL){
		dao.delete(YhdxDL.class,yhdxDL);
	}


	public YhdxDL getYhdxDLById(String dldxbh) {
		// TODO Auto-generated method stub
		return dao.select(YhdxDL.class, dldxbh);
	}
	
	
}
