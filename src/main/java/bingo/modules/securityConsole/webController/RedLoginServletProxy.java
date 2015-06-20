package bingo.modules.securityConsole.webController;
import bingo.common.core.ApplicationFactory;
import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
public class RedLoginServletProxy extends HttpServlet{

	private Servlet proxy;

	  public void destroy()
	  {
	    this.proxy.destroy();
	  }

	  public ServletConfig getServletConfig()
	  {
	    return this.proxy.getServletConfig();
	  }

	  public String getServletInfo()
	  {
	    return this.proxy.getServletInfo();
	  }

	  public void init(ServletConfig config)
	    throws ServletException
	  {
	    String beanName = config.getInitParameter("redloginBeanName");
	    this.proxy = ((Servlet)ApplicationFactory.getBeanForName(Servlet.class, beanName));
	    this.proxy.init(config);
	  }

	  public void service(ServletRequest req, ServletResponse res)
	    throws ServletException, IOException
	  {
	    this.proxy.service(req, res);
	  }
}
