<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.mof.model.*"%>
<%
String fieldId = request.getParameter("fieldId");
String columnId=MofWindowManager.getFieldById(fieldId).getMofColumn().getId();
String tableId =MofWindowManager.getFieldById(fieldId).getMofColumn().getMofTable().getId();  
out.print(columnId+"@"+tableId); 
%>