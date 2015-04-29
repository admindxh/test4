package bingo.modules.securityConsole.yonghuCanshu;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

@Controller
public class UserCanShuController {
	
	private UserCanShuService userCanShuService;

	public UserCanShuService getUserCanShuService() {
		return userCanShuService;
	}

	public void setUserCanShuService(UserCanShuService userCanShuService) {
		this.userCanShuService = userCanShuService;
	}
	
	public void createUserCanShu(){
		Result.setAttribute("title", "新增参数表信息");
		Result.forward("/modules/csbuser/edite_sec_csuser_add.jsp");
	}

	public void editUserCanShu(String yhbh) {
		Result.setAttribute("title", "修改参数信息");

		Result.setAttribute("userCanShu",userCanShuService.getUserCanShuById(yhbh));
		Result.forward("/modules/csbuser/edite_sec_csuser_add.jsp");
	}

}
