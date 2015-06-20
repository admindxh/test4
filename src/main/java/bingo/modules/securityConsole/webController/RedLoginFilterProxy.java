package bingo.modules.securityConsole.webController;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.GenericFilterBean;

public class RedLoginFilterProxy extends GenericFilterBean{
	private String contextAttribute;
	  private String redloginBeanName;
	  private boolean targetFilterLifecycle = false;
	  private Filter delegate;
	  private final Object delegateMonitor = new Object();

	  public void setContextAttribute(String contextAttribute)
	  {
	    this.contextAttribute = contextAttribute;
	  }

	  public String getContextAttribute()
	  {
	    return this.contextAttribute;
	  }

	  public String getRedloginBeanName() {
		return redloginBeanName;
	}

	public void setRedloginBeanName(String redloginBeanName) {
		this.redloginBeanName = redloginBeanName;
	}

	public void setTargetFilterLifecycle(boolean targetFilterLifecycle)
	  {
	    this.targetFilterLifecycle = targetFilterLifecycle;
	  }

	  protected boolean isTargetFilterLifecycle()
	  {
	    return this.targetFilterLifecycle;
	  }

	  protected void initFilterBean()
	    throws ServletException
	  {
	    if (this.redloginBeanName == null) {
	      this.redloginBeanName = getFilterName();
	    }

	    synchronized (this.delegateMonitor) {
	      WebApplicationContext wac = findWebApplicationContext();
	      if (wac != null)
	        this.delegate = initDelegate(wac);
	    }
	  }

	  public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
	    throws ServletException, IOException
	  {
	    Filter delegateToUse = null;
	    synchronized (this.delegateMonitor) {
	      if (this.delegate == null) {
	        WebApplicationContext wac = findWebApplicationContext();
	        if (wac == null) {
	          throw new IllegalStateException("No WebApplicationContext found: no ContextLoaderListener registered?");
	        }
	        this.delegate = initDelegate(wac);
	      }
	      delegateToUse = this.delegate;
	    }

	    invokeDelegate(delegateToUse, request, response, filterChain);
	  }

	  public void destroy()
	  {
	    Filter delegateToUse = null;
	    synchronized (this.delegateMonitor) {
	      delegateToUse = this.delegate;
	    }
	    if (delegateToUse != null)
	      destroyDelegate(delegateToUse);
	  }

	  protected WebApplicationContext findWebApplicationContext()
	  {
	    String attrName = getContextAttribute();
	    if (attrName != null) {
	      return WebApplicationContextUtils.getWebApplicationContext(getServletContext(), attrName);
	    }

	    return WebApplicationContextUtils.getWebApplicationContext(getServletContext());
	  }

	  protected Filter initDelegate(WebApplicationContext wac)
	    throws ServletException
	  {
	    Filter delegate = (Filter)wac.getBean(getRedloginBeanName(), Filter.class);
	    if (isTargetFilterLifecycle()) {
	      delegate.init(getFilterConfig());
	    }
	    return delegate;
	  }

	  protected void invokeDelegate(Filter delegate, ServletRequest request, ServletResponse response, FilterChain filterChain)
	    throws ServletException, IOException
	  {
	    delegate.doFilter(request, response, filterChain);
	  }

	  protected void destroyDelegate(Filter delegate)
	  {
	    if (isTargetFilterLifecycle())
	      delegate.destroy();
	  }
}
