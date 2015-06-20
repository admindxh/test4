package bingo.modules.securityConsole.webController;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lightframework.mvc.Result;
import org.springframework.stereotype.Controller;

@Controller
public class AdminLoginController extends HttpServlet{

	public void dopost(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if ("login".equals(request.getParameter("action"))) {
			if (null == username || "".equals(username.trim())) {
				request.setAttribute("errors", "请输入登录帐号");
			} else {
				if (SecurityContext.getProvider().validateUser(username, password)) {
					SecurityContext.getProvider().signIn(request, username);

					String returnUrl = request.getParameter("returnUrl");
					if (null != returnUrl && !"".equals(returnUrl)) {
						response.sendRedirect(returnUrl);
					} else {
						response.sendRedirect("/" + request.getContextPath());
					}
					Result.forward("/portal/layouts/default/index.jsp");
				} else {
					request.setAttribute("errors", "用户名或密码不正确");
				}
			}
			
		}
		
		String errors = (String) request.getAttribute("errors");
		boolean isError = null != errors && !"".equals(errors.trim());
	}
	
	public void doget(HttpServletRequest request,HttpServletResponse response)throws Exception{
		dopost(request, response);
	}
	
	public static void main(String[] args){
		String str="http://localhost:8080/bingo-redpackage/poral/getValue2.do?id=btnphb";
		String tt="";
		String[] s=str.split("/");
		for (int i = 0; i < s.length; i++) {
			 tt=s[i];
			
		}
		 System.out.println(s[4]);
	}
}
