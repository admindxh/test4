package bingo.modules.securityConsole.webController;

/**
 * 前台方法调用Controller
 */
import org.apache.poi.util.StringUtil;
import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.symx.ExchangehbbService;
import bingo.modules.securityConsole.yhdl.HBDXuser;
import bingo.security.SecurityContext;

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
	public void createusers(String yhdxdh){
      HBDXuser users=new HBDXuser();
      String phone=users.getUserphnoe();
		String id=users.getYhdxdh();
		System.out.println(id);
		String name=exchangehbbService.getUserphone(yhdxdh);
		System.out.println(name);
		if(name.equals("0")){
			name="暂无介绍人";
		}
		Result.setAttribute("title", "创建下线用户");
		Result.setAttribute("name",name );
		Result.setAttribute("hbdxuser",exchangehbbService.getYhdlById(yhdxdh));
		Result.forward("/web/red/index.jsp");
	}

	

	
}
