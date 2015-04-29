package bingo.modules.securityConsole.lilvCanshu;

import org.springframework.stereotype.Controller;

import org.lightframework.mvc.Result;

@Controller
public class CanShuLLController {
	
	private CanShuLLService canShuLLService;

	public CanShuLLService getCanShuLLService() {
		return canShuLLService;
	}

	public void setCanShuLLService(CanShuLLService canShuLLService) {
		this.canShuLLService = canShuLLService;
	}
	
	public void createCanShuLL(){
		Result.setAttribute("title", "新增参数表信息");
		Result.forward("/modules/csb_ll/edite_sec_canShuLL_add.jsp");
	}

	public void editCanShuLL(String llbh) {
		Result.setAttribute("title", "修改参数信息");

		Result.setAttribute("canShuLL",canShuLLService.getCanShuLLByID(llbh));
		Result.forward("/modules/csb_ll/edite_sec_canShuLL_add.jsp");
	}
}
