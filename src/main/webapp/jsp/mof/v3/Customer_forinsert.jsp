<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/WEB-INF/tlds/metadata.tld" prefix="metadata"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE>客户信息增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"calendar.js")%>"></script>
</HEAD>
<BODY topmargin="10px">
<script language="javascript">
function checkForSave(){
    <metadata:validation/>
    return true;
}
</script>
<html:form  name="frmList"  action="">
<widgets:container title="客户信息增加" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent"> 
  	<tr>
	      <td class="tdTitle"><metadata:title name="no" window="Customer" ></metadata:title></td>
	      <td class="tdRight"><metadata:input name="no" window="Customer" property="no"></metadata:input></td>	
	<tr>
	      <td class="tdTitle"><metadata:title name="name"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="name" property="name"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="address"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="address" property="address"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="createdate"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="createdate" property="createdate" style="divname=date1"></metadata:input><input style="visibility:hidden"></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="quantity"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="quantity" property="quantity"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="state"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="state" property="state" collection="CUSTOMER_STATE" style="labelKey=key,labelProperty=value"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="language"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="language" property="language">
		      <html:option value=""></html:option>
		      <html:options collection="CUSTOMER_LANGUAGE" property="key" labelProperty="value"/>
	      </metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="age"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="age" property="age"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="licence"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="licence" property="licence"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="supperTime"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="supperTime" property="supperTime"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="description"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="description" property="description"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="favor"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="favor" property="favor" collection="CUSTOMER_FAVOR" style="labelKey=key,labelProperty=value"></metadata:input></td>
	</tr>
  </table>
  <table width="100%" cellpadding="0" class="tblContent"> 
  	<tr>
	      <td class="tdTitle" colspan="2">label标签测试</td>
	<tr> 
  	<tr>
  	      <td class="tdTitle">日期的label:</td>
	      <td class="tdRight"><metadata:label table="Customer" column="CreateDate"/></td>
	<tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
	var input_form = checkForSave();
  	if( input_form == true ){
  		alert("提交操作");
  	}else if( input_form == false ){
  		return;
  	}else{
		input_form.select();
		input_form.focus();  		
  	}
}
</script>