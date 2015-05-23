package bingo.modules.securityConsole.webController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lightframework.mvc.Result;
import org.springframework.web.bind.annotation.RequestMapping;

import bingo.modules.securityConsole.symx.ExchangehbbService;
import bingo.security.SecurityContext;

@RequestMapping("/login.do")
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
			System.out.println("登陆异常");
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){
		//String yhdxdh = request.getParameter("yhdxdh");
		//String password = request.getParameter("password");
		  System.out.println("aaaaaaa");
	        response.setContentType("text/html;charset=utf-8");
	        try {
				PrintWriter out=response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        //接受用户提交的用户和密码
	        String userphnoe=request.getParameter("userphnoe");
	        String password=request.getParameter("password");
	        //这里看看接到没有？
	        System.out.println(userphnoe+" "+password);
	        HttpSession session = request.getSession();
		//session.setAttribute("userphnoe", request.getParameter("userphnoe"));
		//session.setAttribute("password", SecurityContext.getProvider().encryptPassword( request.getParameter("password")));
			if (null == userphnoe || "".equals(userphnoe.trim())) {
				request.setAttribute("errors", "请输入登录帐号");
			} else{
				
				if (exchangehbbService.validateUser(userphnoe, password)) {
					exchangehbbService.signIn(request, userphnoe);
					
				    Result.forward("/ReduserLogin");
					
				} else {
					request.setAttribute("errors", "电话号码或密码不正确");
				}
			
			}
		
		String errors = (String) request.getAttribute("errors");
		boolean isError = null != errors && !"".equals(errors.trim());
	}
}
