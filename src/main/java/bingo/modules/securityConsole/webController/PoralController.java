package bingo.modules.securityConsole.webController;

/**
 * 前台页面调用controller类
 */
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.util.StringUtil;
import org.lightframework.mvc.HTTP.Request;
import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.redpackge.RedpackageService;
import bingo.modules.securityConsole.symx.ExchangehbbService;
import bingo.modules.securityConsole.yhdl.HBDXuser;

@Controller
@RequestMapping(value = "${contextPath}/web/red/poral")
public class PoralController {
	
	private RedpackageService redpackageService;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public RedpackageService getRedpackageService() {
		return redpackageService;
	}
	public void setRedpackageService(RedpackageService redpackageService) {
		this.redpackageService = redpackageService;
	}
	/**
	 * 随机生成单个红包金额
	 * 随机生成红包金额不超过50元
	 * @return
	 */
	public float doTotal(){
		int max=50;
        int min=0;
		float id2 = 0;
			//  int number=dao.queryForInt("list.hbc.total", redPool);
			    float number=redpackageService.selectReedPool();
			//    int count=redpackageService.getNummber();
					if(number>0&&number<=50){
						id2=(int)(Math.random()*(number-1)+1);
						return id2;
					}else {
						 Random random = new Random();
						 id2= random.nextInt(max)%(max-min+1) + min;
					}
	   return id2;
	   // String sqlString2="select sum(aggreatmount) from hbdx_hbc where 1=1";//统计金额  
	}
    /*public static void main(String[] args){
    	int number=1000;
    	int max=50;
        int min=0;
        Random random = new Random();
    	int s = random.nextInt(max)%(max-min+1) + min;
    	//int id=(int)(Math.random()*(number-1)+1);
    	System.out.println(s);
    }*/
	/**
	 * 登陆用户登陆成功，跳转到派红包页面否则跳转到注册页面
	 * 派红包
	 * @param yhdxdh
	 */
	@RequestMapping(value = "/doQianghb")
      public void doQianghb(String userphnoe,String password,String id){
		HBDXuser hbdXuser=new HBDXuser();
		hbdXuser.setUserphnoe(userphnoe);
		hbdXuser.setPassword(password);
		if(StringUtils.isNotEmpty(userphnoe)){
			boolean flag=redpackageService.dosave(hbdXuser);
			if(flag==true){
				String yhdxdh=redpackageService.validateid(userphnoe);//根据用户电话号码查询用户id
				if(StringUtils.isNotEmpty(yhdxdh)){
					Result.setAttribute("hbdXuser", redpackageService.getQueryById(yhdxdh));	
					if(id.equals("btnphb")){
						float y=this.doTotal();//抢到单个红包金额
						Result.setAttribute("hbze", y);
					    Result.forward("/web/red/toPacket.jsp");//派红包
					}else if(id.equals("2")){
						 Result.forward("/web/red/getPacket.jsp");//领红包
					}else{
						//判断用户是否充值
						boolean money=redpackageService.getusermoney(yhdxdh);
						if(money==true){
							Result.forward("/web/red/center.jsp");//财务中心
						}else {
							Result.forward("/web/red/index.jsp");//财务中心
						}	
					}   
				}
				
			}else {
				Result.forward("/web/red/register.jsp");//注册
			}
			
		}else {
			Result.forward("/web/red/register.jsp");//注册
		}
		
	}
      
	/**
	 * 用户注册（注册成功跳转到首页）
	 * @param userphnoe
	 * @param password
	 */
	  public void doregister(String userphnoe,String password){
		  HBDXuser hbdXuser=new HBDXuser();
		  hbdXuser.setUserphnoe(userphnoe);
		  hbdXuser.setPassword(password);
		  boolean flag=redpackageService.savereduser(hbdXuser);
		  if(flag==true){
			  Result.forward("/web/red/login.jsp");
		  }else {
			Result.forward("/web/red/register.jsp");
		}
		  
	  }
      /**
       * 抢红包,群红包
       * @param yhdxdh
       */
      @RequestMapping(value="doqunfa")
      public void doqunfa(String yhdxdh){
  		
  		Result.setAttribute("title", "抢红包");
  		Result.setAttribute("hbdXuser", redpackageService.getQueryById(yhdxdh));
  		Result.forward("/web/red/packet1.jsp");
  		
  	}

      /**
       * 区分用户从首页选择是派红包还是抢红包
       * @param id
       */
      public void getValue1(String id){
    	  if(StringUtils.isNotEmpty(id)){
    		  Result.setAttribute("id", id);
    		  Result.forward("/web/red/login.jsp");
    	  }
      }
      /**
       * 区分用户从首页选择是派红包还是抢红包
       * @param id
       */
      public void getValue2(String id){
    	  if(StringUtils.isNotEmpty(id)){
    		  Result.setAttribute("id", id);
    		  Result.forward("/web/red/login.jsp");
    	  }
      }
    
      public void dosendPacket(String yhdxdh){
    	  	Result.setAttribute("title", "我也要发红包");
    		Result.setAttribute("hbdXuser", redpackageService.getQueryById(yhdxdh));
    		Result.forward("/web/red/makePacket.jsp");
      }
}
