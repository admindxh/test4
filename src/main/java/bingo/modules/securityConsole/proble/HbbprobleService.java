package bingo.modules.securityConsole.proble;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.modules.securityConsole.user.SecUser;

@Service
public class HbbprobleService extends BaseService{

private SecLogService secLogService;
	
	
	public SecLogService getSecLogService() {
		return secLogService;
	}

	public void setSecLogService(SecLogService secLogService) {
		this.secLogService = secLogService;
	}
	
	public void dosave(Hbproble proble){
		String jbjString=proble.getJbjs();
		String lxfString=proble.getLxfs();
		String id=proble.getId();
		if(StringUtils.isEmpty(proble.getId())){
			dao.insert(proble);
		}else {
			dao.update(proble);
		}
	}

	//根据UserId获取用户对象
	public Hbproble getHbprobleId(String id) {
		return dao.select(Hbproble.class, id);
	}
	
	/**
	 * 查询操作方法内容
	 * @param id
	 * @return
	 */
	public String getczff(String id){
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("id", id);
		String czff=dao.getJdbcDao().queryForString("select.czff.do", params);
		return czff;
	}
}
