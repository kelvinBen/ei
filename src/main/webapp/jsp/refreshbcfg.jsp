<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.*"%>
<%
		if (ComponentFactory.isInitialized()) {
			try {
				ServletContext context = pageContext.getServletContext();
				ContextLoader.closeContext(context);
				ComponentFactory.destroy();
				BeanDefinitionsHolder.setBeanDefinitions(context.getServletContextName(),null);
				ComponentFactory.initApplicationContextInWebContext(context);
				context.getRequestDispatcher("/logout.cmd?method=logout").forward(request,response);
			} catch (Throwable t) {
				out.println("刷新出错"+t.getMessage());
				t.printStackTrace();
			}
		}else{
			out.println("刷新中......");
		}
%>