package bingo.modules.securityConsole.webController;

import bingo.security.ISecurityProvider;
import bingo.security.Messages;
import bingo.security.principal.IUser;

import javax.servlet.http.HttpServletRequest;

public class SecurityContext
{
  static ThreadLocal<SecurityContext> context = new ThreadLocal();
  HttpServletRequest request;
  ISecurityProvider provider;
  IUser user;

  SecurityContext(HttpServletRequest request, ISecurityProvider provider)
  {
    this.request = request;
    this.provider = provider;
  }

  SecurityContext(HttpServletRequest request, ISecurityProvider provider, IUser user) {
    this.request = request;
    this.provider = provider;
    this.user = user;
  }

  public static ISecurityProvider getProvider()
  {
    return getContext().provider;
  }

  public static HttpServletRequest getRequest()
  {
    return getContext().request;
  }

  public static IUser getCurrentUser()
  {
    SecurityContext context = getContext();
    IUser user = context.user;
    if (null == user) {
      user = context.provider.getCurrentUser(context.request);
      context.user = user;
    }
    return user;
  }

  public static void setCurrentUser(IUser user)
  {
    getContext().user = user;
  }

  public static boolean hasPermission(String operation)
  {
    return getProvider().hasPermission(operation);
  }

  private static SecurityContext getContext() {
    SecurityContext ctx = (SecurityContext)context.get();

    if (null == ctx) {
      throw new RuntimeException(Messages.getString("SecurityContextNotFoundMessage"));
    }

    return ctx;
  }
}