package bingo.modules.securityConsole.webController;

import org.lightframework.mvc.HTTP.Request;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.modules.securityConsole.yhdl.HBDXuser;
import bingo.security.SecurityContext;

@Service
public class RedbackService extends BaseService{

	private HBDXuser hbdXuser;
	//日志service
	private SecLogService secLogService;
	
	public SecLogService getSecLogService() {
		return secLogService;
	}

	public void setSecLogService(SecLogService secLogService) {
		this.secLogService = secLogService;
	}

	public RedbackService() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 前台用户注册方法
	 * @param hbdXuser
	 */
	@RequestMapping(value="/savereduser")
	public void savereduser(HBDXuser hbdXuser){
		String id=hbdXuser.getYhdxdh();
		String phone=hbdXuser.getUserphnoe();
		if(StringUtils.isEmpty(id)){
			hbdXuser.setPassword(SecurityContext.getProvider().encryptPassword(hbdXuser.getPassword()));
			dao.insert(hbdXuser);
			secLogService.logOperation("添加用户信息", "添加用户（ID=" + id + ";Name=" + hbdXuser.getUserphnoe() + ")成功!");
		}else {
			dao.updateFieldsExcluded(hbdXuser, "password");
			secLogService.logOperation("更新用户信息", "更新用户信息（ID=" + id + ";Name=" + hbdXuser.getUserphnoe() + ")成功!");
		}
	}
	
	//验证登录用户的唯一性
		public boolean checkphnoe(String userphnoe){
			
			if(StringUtils.isNotEmpty(userphnoe)){
				return dao.getJdbcDao().exists("check.user.phnoe", userphnoe);
			}else {
				return dao.getJdbcDao().exists("user.updateCheckphnoe", userphnoe);
			}
		}
}
