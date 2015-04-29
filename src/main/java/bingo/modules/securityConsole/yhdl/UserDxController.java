package bingo.modules.securityConsole.yhdl;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.lightframework.mvc.Result;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Controller;


import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.common.Constants;
/**
 * 
 * @author Administrator
 *
 */
@Controller
public class UserDxController {
	
	private DldxService dldxService;
	
	
	public DldxService getDldxService() {
		return dldxService;
	}

	public void setDldxService(DldxService dldxService) {
		this.dldxService = dldxService;
	}
	

	public final static String doJHMA(){
		HBDXuser userHbdXuser=new HBDXuser();
   	    String uid=null;
   	    boolean f=true;
   	do{
        uid=UUID.randomUUID().toString();
      	String id=uid.replaceAll(" ", "-");
      	
      	String idString=id.substring(0,13).toUpperCase();
      	
      	if(StringUtils.isEmpty(userHbdXuser.getUserjhm())){
      		System.out.println(idString);
      	    f=false;
      	}else{
      		return idString;
      	}
      	 
		} while (f);
   		return uid;
   		
    }
	
	public void createJHM(String dldxbh){
		 
		UserDxController userDxController=new UserDxController();
		String jhmString=userDxController.doJHMA();
		String jhm=jhmString.substring(0, 18).toUpperCase();
		
		
		Result.setAttribute("title", "获取激活码");
		Result.setAttribute("yhdxdl",dldxService.getYhdxDLById(dldxbh));
		Result.setAttribute("yhdxDL",jhm);
		Result.forward("/modules/userjhm/edite_sec_userjhm_add.jsp");
	}
	
	public void editUsers(String yhdxdh) {
		Result.setAttribute("title", "修改参数信息");

		Result.setAttribute("hbuser",dldxService.getYhdlById(yhdxdh));
		Result.forward("/modules/userjhm/edit_sec_userjhm.jsp");
	}
	
	
	
}
