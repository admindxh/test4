package bingo.modules.securityConsole.webController;

/**
 * 前台方法调用Controller
 */
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.util.StringUtil;
import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.symx.ExchangehbbService;
import bingo.modules.securityConsole.yhdl.HBDXuser;
import bingo.security.SecurityContext;
import bingo.security.utils.RES;

@Controller
@RequestMapping(value = "${contextPath}/web/red/")
public class ExchageController {

	private static ExchangehbbService exchangehbbService;

	public ExchangehbbService getExchangehbbService() {
		return exchangehbbService;
	}

	public void setExchangehbbService(ExchangehbbService exchangehbbService) {
		this.exchangehbbService = exchangehbbService;
	}
	
	
	 /**
     * 普通红包控制方法
     * @param yhdxdh
     */
    @RequestMapping(value="doputong")
    public void doputong(String yhdxdh){
		
		Result.setAttribute("title", "普通红包");
	//	Result.setAttribute("hbdXuser", exchangehbbService.getUserById(ID));
		Result.setAttribute("hbdXuser", exchangehbbService.getYhdlById(yhdxdh));
		Result.forward("/web/red/packet2.jsp");	
	}
    
    /**
     * 下线用户注册
     * @param yhdxdh
     */
   
    public void register(String yhdxdh){
		
		Result.setAttribute("title", "创建下线用户");
		Result.setAttribute("hbdxuser",exchangehbbService.getYhdlById(yhdxdh));
		Result.forward("/web/red/register.jsp");
	}
	
    
    
    /**
	 * 验证有没有介绍人
	 * @param yhdxdh
	 */
    @RequestMapping(value="createusers")
	public void createusers(String userphnoe){
    	HBDXuser users=new HBDXuser();
		String id=exchangehbbService.getHBDXuserById(userphnoe);
		if(StringUtils.isNotEmpty(userphnoe)){
			
			String name=exchangehbbService.getUserphone(id);
			if(name.equals("0")||name==null){
				name="暂无介绍人";
			}
			Result.setAttribute("title", "创建下线用户");
			Result.setAttribute("name",name );
			Result.setAttribute("hbdxuser",exchangehbbService.getYhdlById(id));
			Result.forward("/web/red/login.jsp");
		}	
	}

    /**
     * 领红包
     * @param yhdxdh
     */
	public void doling(String yhdxdh){
		Result.setAttribute("title", "领取红包");
		Result.setAttribute("hbdXuser",exchangehbbService.getYhdlById(yhdxdh));
		Result.forward("/web/red/sendPacket.jsp");
	}

	/**
	 * 财务中心登陆
	 * @param id
	 */
	public void center(String id){
		if(StringUtils.isNotEmpty(id)){
  		  Result.setAttribute("id", id);
  		  Result.forward("/web/red/login.jsp");
  	  }
	}
	
	/**
	 * 团队收益
	 * @param id
	 */
	public void record(String id){
		SimpleDateFormat dfc = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//设置日期格式
		String nowtime=dfc.format(new Date());// new Date()为获取当前系统时间
		if(StringUtils.isNotEmpty(id)){
			Double tuanduisy=exchangehbbService.getdailisy(id);
			Result.setAttribute("title", "团队收入");
			Result.setAttribute("time", nowtime);
			Result.setAttribute("tuanduisy", tuanduisy);
			Result.forward("/web/red/record.jsp");
		}
		
	}
	
	public void buyB(String id){
		Result.setAttribute("title", "购买红包币");
		Result.setAttribute("hbdXuser",exchangehbbService.getYhdlById(id));
		Result.forward("/web/red/buyB.jsp");
	}
	
	public void excB(String id){
		Result.setAttribute("title", "红包币转账");
		Result.setAttribute("hbdXuser",exchangehbbService.getYhdlById(id));
		Result.forward("/web/red/excB.jsp");
	}
	
	public void excRMB(String id){
		Result.setAttribute("title", "红包基金转账");
		Result.setAttribute("hbdXuser",exchangehbbService.getYhdlById(id));
		Result.forward("/web/red/excRMB.jsp");
	}
	
	/**
	 * 红包基金转账
	 * @param money
	 */
	public void excRMBZH(double money) {
		
	}
}
