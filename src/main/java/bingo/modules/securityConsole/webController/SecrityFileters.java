package bingo.modules.securityConsole.webController;

import bingo.common.core.ApplicationFactory;
import bingo.common.core.utils.StringUtils;
import bingo.environment.EnvironmentFilter;
import bingo.security.ISecurityProvider;
import bingo.security.utils.Util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SecrityFileters implements Filter{

	 private static final Logger log = LoggerFactory.getLogger(SecrityFileters.class);
	  public static final String AJAX_REQUEST_HEADER = "x-requested-with";
	  public static final String AJAX_REQUEST_VALUE = "XMLHttpRequest";
	  public static final String IGNORE_PATTERN_PARAM = "ignore-pattern";
	  public static final String INCLUDE_PATTERN_PARAM = "include-pattern";
	  public static final String LOGIN_URL_PARAM = "login-url";
	  public static final String PROVIDER_BAEN_NAME = "provider-bean";
	  public static final String LOAD_ENV_PARAM = "load-env";
	  private String webredPatternString;
	  protected Pattern ignorePattern;
	  private String includePatternString;
	  protected Pattern includePattern;
	  protected String loginUrl;
	  protected String encoding;
	  protected ISecurityProvider provider;
	  protected Filter environmentFilter;
	  private String providerName;

	  
	  public String getWebredPatternString() {
		return webredPatternString;
		}
	
		public void setWebredPatternString(String webredPatternString) {
			this.webredPatternString = webredPatternString;
			setIgnorePattern(webredPatternString);
		}
	
		public SecrityFileters()
	  {
	    this.encoding = "UTF-8";
	  }

	  public void init(FilterConfig config)
	    throws ServletException
	  {
	    this.webredPatternString = config.getInitParameter("ignore-pattern");
	    if (StringUtils.isNotEmpty(this.webredPatternString)) {
	      setIgnorePattern(this.webredPatternString);
	    }

	    this.includePatternString = config.getInitParameter("ignore-pattern");
	    if (StringUtils.isNotEmpty(this.includePatternString)) {
	      setIncludePattern(this.includePatternString);
	    }

	    String loginUrl = config.getInitParameter("login-url");
	    if (StringUtils.isNotEmpty(loginUrl)) {
	    	setLoginUrl(loginUrl);
	    }

	    this.providerName = config.getInitParameter("provider-bean");

	    if (!"false".equalsIgnoreCase(config.getInitParameter("load-env"))) {
	      initEnvironmentFilter(config);
	    }
	    if (null != this.environmentFilter)
	      this.environmentFilter.init(config);
	  }

	  private void setIgnorePattern(String pattern)
	  {
	    if (!Util.isNullOrEmpty(pattern)) {
	      pattern = pattern.replaceAll("\\.", "\\\\.");
	      pattern = pattern.replaceAll("\\*", ".*");

	      log.debug("ignore-pattern regex : {}", pattern);

	      this.ignorePattern = Pattern.compile(pattern);
	    }
	  }

	  private void setIncludePattern(String pattern) {
	    if (!Util.isNullOrEmpty(pattern)) {
	      pattern = pattern.replaceAll("\\.", "\\\\.");
	      pattern = pattern.replaceAll("\\*", ".*");

	      log.debug("ignore-pattern regex : {}", pattern);

	      this.includePattern = Pattern.compile(pattern);
	    }
	  }

	  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException
	  {
	    if (null != this.environmentFilter)
	      this.environmentFilter.doFilter(servletRequest, servletResponse, new EnvironmentFilterChain(chain));
	    else
	      doSecurityFilter(servletRequest, servletResponse, chain);
	  }

	  private void initSecurityProvider()
	  {
	    if (null == this.provider)
	      synchronized (ISecurityProvider.class) {
	        if (null == this.provider) {
	          if (Util.isNullOrEmpty(this.providerName)) {
	            this.providerName = "securityProvider";
	          }
	          if (ApplicationFactory.containsBean(this.providerName))
	            this.provider = ((ISecurityProvider)ApplicationFactory.getBeanForName(ISecurityProvider.class, this.providerName));
	          else {
	            this.provider = ((ISecurityProvider)ApplicationFactory.getFirstBeanOfType(ISecurityProvider.class));
	          }
	          log.info("Security Framework Inited, Provider : {}", this.provider.getClass().getName());
	        }
	      }
	  }

	  /**
	   * 响应请求
	   * @param servletRequest
	   * @param servletResponse
	   * @param chain
	   * @throws IOException
	   * @throws ServletException
	   */
	  protected void doSecurityFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
	    throws IOException, ServletException
	  {
	    initSecurityProvider();

	    HttpServletRequest request = (HttpServletRequest)servletRequest;
	    HttpServletResponse response = (HttpServletResponse)servletResponse;

	    SecurityContext context = new SecurityContext(request, this.provider);
	    SecurityContext.context.set(context);
	    try
	    {
	      String path = Util.getRequestPath(request);

	      if (!this.provider.authenticate(request))
	      {
	        if ((ignores(path))||(isLoginPath(path))) {
	          chain.doFilter(servletRequest, response);
	          return;
	        }
	        handleNotAuthenticated(request, response);
	      }
	      else {
	        context.user = this.provider.getCurrentUser(request);

	        if (!this.provider.authorize(request)) {
	          handleNotAuthorized(request, response);
	        }
	        else
	          chain.doFilter(servletRequest, servletResponse);
	      }
	    }
	    finally {
	      SecurityContext.context.set(null);
	    }
	  }

	  protected void handleNotAuthenticated(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    if (isAjax(request)) {
	      response.setStatus(401);
	    } else {
	      String requestUrl = request.getRequestURL().toString();
	      String queryString = request.getQueryString();
	      if (null != queryString) {
	        requestUrl = requestUrl + "?" + queryString;
	      }
	      requestUrl = URLEncoder.encode(requestUrl, this.encoding);
	     // String redirectUrl = Util.appendQueryParam(request.getContextPath()+getLoginUrl(), "returnUrl", requestUrl);
	      response.sendRedirect(requestUrl);
	    }
	  }
	  
	  public static String sendUrlRequest(String urlStr,String param1,String param2)throws Exception{
		  HttpURLConnection url_con=null;
		  String tempStr=null;
		  try{
		  URL url=new URL(urlStr);
		  StringBuffer bankXmlBuffer=new StringBuffer();
		  //创建URL连接，提交到数据，获取返回结果
		  HttpURLConnection connection=(HttpURLConnection)url.openConnection();
		  connection.setRequestMethod("POST");
		  connection.setDoOutput(true);
		  connection.setRequestProperty("User-Agent","directclient");
		  PrintWriter out=new PrintWriter(new OutputStreamWriter(connection.getOutputStream(),"GBK"));
		  out.println(connection);
		  out.close();
		  BufferedReader in=new BufferedReader(new InputStreamReader(connection.getInputStream(),"GBK"));
		  String inputLine;
		  while((inputLine=in.readLine())!=null){
		  bankXmlBuffer.append(inputLine);
		  }
		  	in.close();
		  	tempStr=bankXmlBuffer.toString();
		  }
		  catch(Exception e)
		  {
		  System.out.println("发送GET请求出现异常！"+e);
		  e.printStackTrace();
		  }finally{
		  if(url_con!=null)
		  url_con.disconnect();
		  }
		return tempStr;
		  
		  }
	  
	  protected void handleNotAuthorized(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    response.setStatus(403);
	  }

	  protected boolean isAjax(HttpServletRequest request)
	  {
	    return "XMLHttpRequest".equals(request.getHeader("x-requested-with"));
	  }

	  protected boolean ignores(String path)
	  {
	    if (this.includePattern != null) {
	      return !this.includePattern.matcher(path).matches();
	    }
	    if (this.ignorePattern != null) {
	      return this.ignorePattern.matcher(path).matches();
	    }
	    return true;
	  }

	  protected boolean isLoginPath(String path) {
	    return path.equals(getLoginUrl());
	  }

	  protected Object getBean(ServletContext context, String name) throws ServletException {
	    ApplicationContext spring = WebApplicationContextUtils.getRequiredWebApplicationContext(context);

	    if (null == spring) {
	      throw new ServletException("spring not found");
	    }

	    return spring.getBean(name);
	  }

	  protected void initEnvironmentFilter(FilterConfig filterConfig) {
	    boolean found = false;

	    ClassLoader loader = Thread.currentThread().getContextClassLoader();

	    if (null != loader)
	      try {
	        loader.loadClass("bingo.environment.EnvironmentFilter");
	        found = true;
	      }
	      catch (ClassNotFoundException e)
	      {
	      }
	      catch (NoClassDefFoundError e)
	      {
	      }
	    if (!found)
	      try {
	    	  SecrityFileters.class.getClassLoader().loadClass("bingo.environment.EnvironmentFilter");
	        found = true;
	      }
	      catch (ClassNotFoundException e)
	      {
	      }
	      catch (NoClassDefFoundError e)
	      {
	      }
	    if (found) {
	      log.debug("found environment filter,load it");
	      this.environmentFilter = new EnvironmentFilter();
	    }
	  }

	  public void setProvider(ISecurityProvider securityProvider) {
	    this.provider = securityProvider;
	  }


	  public void setLoginUrl(String loginUrl) {
	    if (!Util.isNullOrEmpty(loginUrl))
	      this.loginUrl = loginUrl.trim();
	  }

	  public String getLoginUrl()
	  {
	    if (StringUtils.isEmpty(this.loginUrl)) {
	      this.loginUrl = "login.jsp";
	    }
	    return "/" + this.loginUrl;
	  }

	  public void setEncoding(String encoding) {
	    this.encoding = encoding;
	  }

	  public void setEnvironmentFilter(Filter environmentFilter) {
	    this.environmentFilter = environmentFilter;
	  }

	  public String getIncludePatternString()
	  {
	    return this.includePatternString;
	  }

	  public void setIncludePatternString(String includePatternString)
	  {
	    this.includePatternString = includePatternString;
	    setIncludePattern(includePatternString);
	  }

	  public void destroy()
	  {
	  }

	  protected class EnvironmentFilterChain implements FilterChain
	  {
	    private final FilterChain chain;

	    public EnvironmentFilterChain(FilterChain chain) {
	      this.chain = chain;
	    }

	    public void doFilter(ServletRequest request, ServletResponse response) throws IOException, ServletException {
	    	SecrityFileters.this.doSecurityFilter(request, response, this.chain);
	    }
	  }
}
