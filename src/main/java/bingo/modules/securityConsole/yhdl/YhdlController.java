package bingo.modules.securityConsole.yhdl;

import java.util.HashMap;
import java.util.Map;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

import bingo.common.core.utils.StringUtils;
import bingo.dao.Dao;

@Controller
public class YhdlController {
	
	private YHDLservice yhdLservice;

	public YHDLservice getYhdLservice() {
		return yhdLservice;
	}

	public void setYhdLservice(YHDLservice yhdLservice) {
		this.yhdLservice = yhdLservice;
	}
	
	public void createUser(){
		
		Result.setAttribute("title", "新增参数表信息");
	    //Result.setAttribute("hbuser", yhdLservice.getDljhmByID(yhdxdh));
		Result.forward("/modules/userjhm/edit_sec_userjhm.jsp");
	}
	
	
	

}
