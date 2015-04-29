package bingo.modules.securityConsole.webController;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bingo.modules.securityConsole.redpackge.RedpackageService;
import bingo.modules.securityConsole.symx.ExchangehbbService;
import bingo.modules.securityConsole.yhdl.HBDXuser;

@Controller
@RequestMapping(value = "${contextPath}/web/red/")
public class PoralController {
	
	private RedpackageService redpackageService;
	
	private ExchangehbbService exchangehbbService;
	
	public RedpackageService getRedpackageService() {
		return redpackageService;
	}
	public void setRedpackageService(RedpackageService redpackageService) {
		this.redpackageService = redpackageService;
	}
	/**
	 * 随机生成单个红包金额
	 * @return
	 */
	public float doTotal(){
		
		float id2 = 0;
			//  int number=dao.queryForInt("list.hbc.total", redPool);
			    float number=redpackageService.selectReedPool();
			//    int count=redpackageService.getNummber();
					if(number>0);
					 id2=(int)(Math.random()*(number-1)+1);
					 System.out.println(id2);
	   return id2;
	   // String sqlString2="select sum(aggreatmount) from hbdx_hbc where 1=1";//统计金额
	   
	}

	/**
	 * 派红包
	 * @param yhdxdh
	 */
	@RequestMapping(value="doQianghb")
      public void doQianghb(String yhdxdh){
		
		Result.setAttribute("hbdXuser", redpackageService.getQueryById(yhdxdh));
		float y=this.doTotal();//抢到单个红包金额
		Result.setAttribute("hbze", y);
	    Result.forward("/web/red/toPacket.jsp");
	}
      
      /**
       * 抢红包
       * @param yhdxdh
       */
      @RequestMapping(value="doqunfa")
      public void doqunfa(String yhdxdh){
  		
  		Result.setAttribute("title", "抢红包");
  		Result.setAttribute("hbdXuser", redpackageService.getQueryById(yhdxdh));
  		Result.forward("/web/red/packet1.jsp");
  		
  	}

      /**
       * 下线用户注册
       * @param yhdxdh
       */
      @RequestMapping(value="create")
      public void createuser(String yhdxdh){
  		
  		Result.setAttribute("title", "创建下线用户");
  		Result.setAttribute("hbdxuser",exchangehbbService.getYhdlById(yhdxdh));
  		Result.forward("/web/red/index.html");
  	}
  	
      /**
  	 * 验证有没有介绍人
  	 * @param yhdxdh
  	 */
  	public void createusers(String yhdxdh){
        HBDXuser users=new HBDXuser();
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
