<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/WEB-INF/tlds/metadata.tld" prefix="metadata"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE>客户信息明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"calendar.js")%>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="客户信息明细" >
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  	<tr>
	      <td class="tdTitle"><metadata:title name="no"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="no" property="no" style="write=true"></metadata:value></td>
	</tr>	
	<tr>
	      <td class="tdTitle"><metadata:title name="name"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="name" property="name" style="write=true"></metadata:value></td>
	</tr>	
	<tr>
	      <td class="tdTitle"><metadata:title name="address"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="address" property="address" style="write=true"></metadata:value></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="quantity"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="quantity" property="quantity" style="write=true"></metadata:value></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="createdate"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="createdate" property="createdate" style="write=true"></metadata:value></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="state"></metadata:title></td>
	      <td class="tdRight">
	      <metadata:value name="state" property="state" collection="CUSTOMER_STATE" style="labelKey=key,labelProperty=value" ></metadata:value>
	      </td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="language"></metadata:title></td>
	      <td class="tdRight">
	      <metadata:value name="language" property="language" collection="CUSTOMER_LANGUAGE" style="labelProperty=value,labelKey=key" ></metadata:value>
	      </td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="age"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="age" property="age" style="write=true"></metadata:value></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="licence"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="licence" property="licence"></metadata:value></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="supperTime"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="supperTime" property="supperTime" style="write=true"></metadata:value></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="description"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="description" property="description"></metadata:value></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="favor"></metadata:title></td>
	      <td class="tdRight"><metadata:value name="favor" property="favor" collection="CUSTOMER_FAVOR" style="labelKey=key,labelProperty=value,write=true"></metadata:value></td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>