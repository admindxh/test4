package bingo.modules.securityConsole.user;

import java.util.HashMap;
import java.util.Map;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

import bingo.common.core.utils.StringUtils;
import bingo.modules.securityConsole.common.Constants;

/**
 * 
 * 用户服务前端控制类
 */
@Controller
public class UserController {
	private UserService userService;

	/**
	 * @param userService the userService to set
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;

	}

	/**
	 * 进入用户基本信息页面
	 * 
	 * @param userid
	 */
	public void editUser(String userId, String orgId, String orgName) {
		Map<String, Object> secUser = new HashMap<String, Object>();
		if (StringUtils.isNotEmpty(userId)) {
			secUser = this.userService.getUserInfoById(userId);
		} else {
			secUser.put("org_Id", orgId);
			secUser.put("org_Name", orgName);
			secUser.put("type", Constants.ACCOUNT_TYPE_LOCAL);
			secUser.put("type_Name", "本地用户");
		}

		Result.setAttribute("user", secUser);
		Result.forward("/modules/user/edit_sec_user.jsp");
	}

	/**
	 * 进入密码设置页面
	 * 
	 * @param userid
	 */
	public void setUserPassword(String userId) {
		SecUser secUser = this.userService.getUserById(userId);
		Result.setAttribute("user", secUser);
		Result.forward("/modules/user/set_user_password.jsp");
	}
}
