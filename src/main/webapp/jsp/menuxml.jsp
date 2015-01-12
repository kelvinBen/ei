<%@ page import="net.mast.web.model.menu.*"%>
<%@ page contentType="text/html;charset=gb2312" %>
<%
	StringBuffer sb=new StringBuffer();
	sb.append("<?xml version=\"1.0\" encoding=\"gb2312\"?>");
	sb.append("<xmlmenu>");
	Menu menu=(Menu)session.getAttribute("Menu.Key");
	if(menu!=null){
		for (int i = 0; i < menu.getChildren().size(); i++) {
            		Object object = menu.getChildren().get(i);
            		if (object instanceof Menu) {
                		sb.append(((Menu)object).toXML());
            		} else if (object instanceof Separator) {
                		sb.append(((Separator) object).toXML());
            		}
        	}
	}
	sb.append("</xmlmenu>");
	out.print(sb.toString());
%>