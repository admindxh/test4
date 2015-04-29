package bingo.modules.securityConsole.yhdl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import bingo.common.BaseService;
import bingo.common.core.utils.StringUtils;
import bingo.dao.Dao;
import bingo.modules.securityConsole.common.Constants;
import bingo.modules.securityConsole.log.SecLogService;
import bingo.modules.securityConsole.symx.Redpackagemx;
import bingo.modules.securityConsole.symx.Redpackgehbb;
import bingo.modules.securityConsole.user.SecUser;
import bingo.security.SecurityContext;

@Service
public class YHDLservice extends BaseService{
	
	private SecLogService secLogService;
	
	
	public SecLogService getSecLogService() {
		return secLogService;
	}

	public void setSecLogService(SecLogService secLogService) {
		this.secLogService = secLogService;
	}

	// 检查登陆激活码的唯一性
	public boolean checkJHM(String userjhm,String dljhm){
		if(StringUtils.isNotEmpty(userjhm)){
			return dao.getJdbcDao().exists("user.checkJHM", userjhm);
		}else {
			return dao.getJdbcDao().exists("user.updateCheckJHM", userjhm,dljhm);
		}
		
	}
	
	//验证登录用户名的唯一性
	public boolean checkuser(String username){
		
		if(StringUtils.isNotEmpty(username)){
			return dao.getJdbcDao().exists("user.username.check", username);
		}else {
			return dao.getJdbcDao().exists("user.updateCheckUsername", username);
		}
	}
	
	//根据ID取值
	public HBDXuser getDljhmByID(String yhdxdh){
		return dao.select(HBDXuser.class, yhdxdh);
	}
	
	
	/**
	 * 删除用户
	 * @param 
	 */
	public void deleteUsers(String yhdxdh) {
		
			dao.delete(HBDXuser.class, yhdxdh);
			secLogService.logOperation("删除用户", "删除用户（ID=" + yhdxdh + ";" + ")成功!");
		
	}
	
	/**
	 * 创建或更新secUser 对象
	 * @param secUser
	 * @throws Exception 
	 */
	public void saveOrUpdate(HBDXuser hbdXuser) {
		Double crje=hbdXuser.getCrje();
		String yhdxdh = hbdXuser.getYhdxdh();
		if (StringUtils.isEmpty(hbdXuser.getYhdxdh())) {
			//以md5的方式保存密码
			hbdXuser.setPassword(SecurityContext.getProvider().encryptPassword(hbdXuser.getPassword()));
			dao.insert(hbdXuser);
			String userjhm=hbdXuser.getUserjhm();//获取用户激活码
			HashMap<String, Object> userMap=new HashMap<String, Object>();
			//userMap.put("yhdxdh", id);
			userMap.put("userjhm", userjhm);
			yhdxdh=dao.queryForString("select_yhdxdh", hbdXuser);
	        userMap.put("yhdxdh", yhdxdh);
			userMap.put("usernum", "0");
			dao.update("update_usernum",userMap);
			
		
			//2.用户ID跟红包关联
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");//设置日期格式
			String czrq=df.format(new Date());// new Date()为获取当前系统时间
		//	Date date=java.sql.Date.valueOf(czrq);
			    userMap.put("yhdhfk", yhdxdh);
				/*Double hbjj=dao.queryForDouble("select.hbjj",hbdXuser);
				userMap.put("hbjj", hbjj);*/
				userMap.put("crje", crje);
				userMap.put("czrq", czrq);
				userMap.put("qxrq", czrq);
				userMap.put("dqrq", czrq);
				/*String status=dao.queryForString("select.user.statues", hbdXuser);
				userMap.put("zhstatus", status);*/
				dao.insert(Redpackgehbb.class,userMap);
			//更新利率ID
			int usernum=dao.queryForInt("select_usernum", userMap);
			userMap.put("usernum", usernum);
			String lvid=dao.queryForString("select_usernum_lvID", userMap);
			userMap.put("hbllfk", lvid);
		    dao.update("update.prentID",userMap);
		    
		    //用户表关联到收益明细表和利率表
		    SimpleDateFormat dfc = new SimpleDateFormat("yyyyMMdd");//设置日期格式
			String mxrq=dfc.format(new Date());// new Date()为获取当前系统时间
			userMap.put("qsrq", mxrq);
			userMap.put("jsrq", mxrq);
			
			userMap.put("syje", "0");
			String llbh=dao.queryForString("select_usernum_lvID", userMap);
			
			userMap.put("llbh", llbh);
			Double llbl=dao.queryForDouble("select.llbl", userMap);
			userMap.put("syll", llbl);
			
			userMap.put("llbhfk", llbh);
			userMap.put("yhdxdhfk", yhdxdh);
			dao.insert(Redpackagemx.class,userMap);
			
			userMap.put("dljhm", userjhm);
			String dlID=dao.queryForString("list.dldxbh", userMap);//查询代理用户ID
			userMap.put("dldxbhfk", dlID);//把代理用户的ID传给红包用户
			String tgslj=dao.queryForString("select.tgslj", userMap);
			userMap.put("tgslj", tgslj);
			dao.update("list.dldxfk", userMap);
			
			//更新代理激活码状态
			HashMap<String, Object> yhdxDL=new HashMap<String, Object>();
			//yhdxDL.put("DLDXBH", "09d6f2f4a1174a128611742ca4b945a2");
			yhdxDL.put("statues", "0");//更新代理激活码状态
			//yhdxDL.put("dljhm", "8F92CD26-6488-48DC");
			dao.update("user.savecheck",yhdxDL);
			//dao.queryForListMap("user.savecheck", yhdxDL);
			
			secLogService.logOperation("添加用户信息", "添加用户（ID=" + yhdxdh + ";Name=" + hbdXuser.getUsername() + ")成功!");
		} else {
			dao.update(hbdXuser);
			secLogService.logOperation("更新用户信息", "更新用户信息（ID=" + yhdxdh + ";Name=" + hbdXuser.getUsername() + ")成功!");
		}
		
	}

	

}
