package bingo.modules.securityConsole.webController;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;

import bingo.modules.securityConsole.symx.ExchangehbbService;

@RequestMapping("/reduserlogin")
public class ReduserLogin extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ExchangehbbService exchangehbbService;
	public ReduserLogin() {
		// TODO Auto-generated constructor stub
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		try {
			doPost(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		String userphnoe = request.getParameter("userphnoe");
		String password = request.getParameter("password");
		if ("login".equals(request.getParameter("action"))) {
			if (null == userphnoe || "".equals(userphnoe.trim())) {
				request.setAttribute("errors", "请输入登录帐号");
			} else{
				
				if (exchangehbbService.validateUser(userphnoe, password)) {
					exchangehbbService.signIn(request, userphnoe);

					String returnUrl = request.getParameter("returnUrl");
					if (null != returnUrl && !"".equals(returnUrl)) {
						try {
							response.sendRedirect(returnUrl);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} else {
						try {
							response.sendRedirect("/" + request.getContextPath());
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				} else {
					request.setAttribute("errors", "电话号码或密码不正确");
				}
			
			}
		}
		String errors = (String) request.getAttribute("errors");
		boolean isError = null != errors && !"".equals(errors.trim());
	}
}
