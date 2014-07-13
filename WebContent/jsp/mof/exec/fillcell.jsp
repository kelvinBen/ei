<%@ page contentType="text/html;charset=GBK" %>
<script language="javascript">
<%
  String isInit = (String)request.getParameter("isinit");
  if("true".equals(isInit)) {
	String[] names=request.getParameterValues("fieldName");
    java.util.List list = (java.util.List)request.getAttribute("cellhtml");
    Object[] htmls = list.toArray();
    for(int i=0; i<htmls.length; i++){%>
      parent.fillCell("<%=(String)htmls[i]%>",<%=i+1%>,"<%=names[i]%>");
    <%}
  }else{
	  String name = request.getParameter("fieldName");
	  String cellHtml = (String)request.getAttribute("cellhtml");
	  int row = Integer.parseInt(request.getParameter("row"));%>
    parent.fillCell("<%=cellHtml%>",<%=row%>,"<%=name%>");
    <%}
%>
</script>