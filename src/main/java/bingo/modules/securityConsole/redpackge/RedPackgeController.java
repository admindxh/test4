package bingo.modules.securityConsole.redpackge;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;
import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.yhdl.HBDXuser;



/**
 * 红包对象控制类
 * @author Administrator
 *
 */
@Controller
public class RedPackgeController {
	
	private RedpackageService redpackageService;
	
	
	public RedpackageService getRedpackageService() {
		return redpackageService;
	}

	public void setRedpackageService(RedpackageService redpackageService) {
		this.redpackageService = redpackageService;
	}

	/**
	 * 实现原理：Math.round(Math.random()*(Max-Min)+Min
	 * long Temp; //不能设定为int,必须设定为long
	 * 随机生成的红包个数
	 * @return 
	 * @return
	 */
	public  long dousercheck(){
		//RedPool redPool=new RedPool();
		long id;
	//	String sqlString="select sum(hbnumber) from hbdx_hbc where 1=1";//统计红包个数
		//long summer=dao.queryForLong("list.hbc.hbgs", redPool);
		long summer=10;
		boolean user=true;
		do{
			//随机生成红包个数
			 id=(long) Math.round(Math.random()*(summer-1)+1);
			//long id=(long)Math.floor(Math.random() * 11);
			System.out.println(id);	
			user=false;
		}while(user);
		return id ;
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
	public void doQianghb(String yhdxdh){
		
		Result.setAttribute("hbdXuser", redpackageService.getQueryById(yhdxdh));
		//RedPackgeController redpackage=new RedPackgeController();
		String x="1";
		//RedPool redPool = null;
		float y=this.doTotal();//抢到单个红包金额
		//float m=x*y;
		String titleString="恭喜发财,大吉大利";
		Result.setAttribute("title", "获取抢红包随机数");
		
		Result.setAttribute("hbgs", x);
		Result.setAttribute("everyone", y);
		Result.setAttribute("hbze", y);
		Result.setAttribute("title", titleString);
	    Result.forward("/modules/hongbao/edit_sec_qianghongbao.jsp");
	}
	
	public void doqunfa(String yhdxdh){
		
		Result.setAttribute("title", "群红包");
		Result.setAttribute("hbdXuser", redpackageService.getQueryById(yhdxdh));
		Result.forward("/modules/hongbao/edit_sec_qunfa.jsp");
		
	}

	public static void main(String[] args){
		RedPackgeController redpackageService=new RedPackgeController();
		HBDXuser hbdXuser=new HBDXuser();
		String yhdxdh=hbdXuser.getYhdxdh();
		redpackageService.doqunfa(yhdxdh);
	}
}
