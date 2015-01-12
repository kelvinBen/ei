<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.mof.model.*"%>
<HTML>
<HEAD> 
<TITLE></TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"flexgrid.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">

<BODY topmargin="5px">
<widgets:container title="客户查询" >
<%
String no = request.getParameter("NO");
if (no==null){
  no="";
}
String actionUrl=SkinUtils.getRootUrl(request)+"customerquery.cmd";

MofField noF = MofWindowManager.getField("Customer","no");
MofField nameF = MofWindowManager.getField("Customer","name");
MofField addressF = MofWindowManager.getField("Customer","address");
MofField quantityF = MofWindowManager.getField("Customer","quantity");
MofField createdateF = MofWindowManager.getField("Customer","createdate");
MofField languageF = MofWindowManager.getField("Customer","language");
//MofColumn mof_col = MofWindowManager.getColumn("table_name","column_name");
//mof_col.getDescription();
%>
<html:form action="<%=actionUrl%>">
<table>
<flex:search>
	<tr>
	<td>客户序号:<flex:searchText name="NO" searchName="P_CUSTOMER.NO" dataType="java.lang.String" operSymbol="=" value="<%=no%>">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="<%=actionUrl%>" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="200" isSubmit="true">
        <flex:checkboxCol caption="选择" width="50" name="primaryKey" property="no" style="<%=noF.isQuery()?\"\":\"display:none\"%>" sortName="P_CUSTOMER.NO"></flex:checkboxCol>
        <flex:flexCol caption="<%=nameF.getDescription()%>" width="100" property="name" style="<%=nameF.isQuery()?\"\":\"display:none\"%>" sortName="P_CUSTOMER.NAME"></flex:flexCol>
	<flex:flexCol caption="<%=addressF.getDescription()%>" width="100" property="address" style="<%=addressF.isQuery()?\"\":\"display:none\"%>" sortName="P_CUSTOMER.ADDRESS"></flex:flexCol>
	<flex:flexCol caption="<%=quantityF.getDescription()%>" width="100" property="quantity" style="<%=quantityF.isQuery()?\"\":\"display:none\"%>" sortName="P_CUSTOMER.SALES_QUANTITY"></flex:flexCol>
	<flex:flexCol caption="<%=createdateF.getDescription()%>" width="100" property="createdate" style="<%=createdateF.isQuery()?\"\":\"display:none\"%>" sortName="P_CUSTOMER.CREATE_DATE"></flex:flexCol>
	<flex:flexCol caption="<%=languageF.getDescription()%>" width="100" property="language" style="<%=languageF.isQuery()?\"\":\"display:none\"%>" type="enum" enumCollection="CUSTOMER_LANGUAGE" enumKey="key" enumValue="value" sortName="P_CUSTOMER.LANGUAGE"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="<%=actionUrl%>" pageSize="3">
</flex:pagePolit>
</html:form>
</widgets:container>
</BODY>
</HTML>