package bingo.modules.securityConsole.webController;

import bingo.common.core.utils.StringUtils;
import bingo.security.SecurityProvider;
import bingo.sso.client.openid.Authentication;
import bingo.sso.client.openid.servlets.SingleSignOnContext;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/login.do")
public class ReduserLogin extends SecrityFileters {
	public static final String LOCAL_LOGIN = "local";
	  public static final String SSO_LOGIN = "sso";
	  private static final String LOCAL_LOGIN_URL = "/web/red/login.jsp";
	  private static final String SSO_LOGIN_URL = "/web/red/login_sso.jsp";
	  private String loginMode = "local";

	  public String getLoginMode()
	  {
	    return this.loginMode;
	  }

	  public void setLoginMode(String loginMode)
	  {
	    if ((!"sso".equalsIgnoreCase(loginMode)) && (!"local".equalsIgnoreCase(loginMode))) {
	      throw new IllegalArgumentException(String.format("you set login mode is not correct-->%s", new Object[] { loginMode }));
	    }
	    this.loginMode = loginMode;
	  }

	  protected void doSecurityFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
	    throws IOException, ServletException
	  {
	    if ("sso".equalsIgnoreCase(this.loginMode)) {
	      HttpServletRequest request = (HttpServletRequest)servletRequest;
	      if (SingleSignOnContext.isAuthenticated(request)) {
	        Authentication authentication = SingleSignOnContext.getAuthentication(request);
	        request.setAttribute(SecurityProvider.TRUSTED_LOGIN_ID, authentication.getIdentity());
	      }
	    }
	    super.doSecurityFilter(servletRequest, servletResponse, chain);
	  }

	  public String getLoginUrl()
	  {
	    if (StringUtils.isEmpty(this.loginUrl)) {
	      return "local".equalsIgnoreCase(this.loginMode) ? "/web/red/login.jsp?" : "/web/red/login_sso.jsp";
	    }
	    return super.getLoginUrl();
	  }
}
