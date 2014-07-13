<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/WEB-INF/tlds/metadata.tld" prefix="metadata"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils,net.mast.bsp.permit.context.*"%>
<HTML>
<HEAD>
<TITLE>客户信息修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"calendar.js")%>"></script>
</HEAD>
<BODY topmargin="10px">
<%
String functionId = null;
try{
   BspInfo bspInfo = (BspInfo) request.getSession().getAttribute(BspInfoKey.BSPINFOKEY);
   
   if (bspInfo != null) {
      functionId = bspInfo.getFunctionId();
   }
}catch(Exception e){
	e.printStackTrace();
}
%>

功能编号：<%=functionId%>
<script language="javascript">
function checkForSave(){
  	<metadata:validation/>
  	return true;
}
</script>
<html:form  name="frmList"  action="">
<widgets:container title="客户信息修改" >
<widgets:containbutton text="保存" onclick="forSave()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent"> 
  	<tr>
	      <td class="tdTitle"><metadata:title name="No"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="No" property="no"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="No"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="No" property="no"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="Address"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="Address" property="address"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="CreateDate"></metadata:title></td>
	      <td class="tdRight" valign="top"><metadata:input name="CreateDate" property="createdate" style="divname=date1,sourceFormat=yyyyMMdd,targetFormat=yyyy-MM-dd"></metadata:input><input style="visibility:hidden"></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="SaleQuantity"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="SaleQuantity" property="quantity"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="State"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="State" property="state" collection="CUSTOMER_STATE" style="labelKey=key,labelProperty=value"></metadata:input></td>
	</tr>
              </td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="Language"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="Language" property="language">
		      <html:option value=""></html:option>
		      <html:options collection="CUSTOMER_LANGUAGE" property="key" labelProperty="value"/>
	      </metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="Age"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="Age" property="age"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="License"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="License" property="licence"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="SupperTime"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="SupperTime" property="supperTime"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="Description"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="Description" property="description"></metadata:input></td>
	</tr>
	<tr>
	      <td class="tdTitle"><metadata:title name="Favor"></metadata:title></td>
	      <td class="tdRight"><metadata:input name="Favor" property="favor" collection="CUSTOMER_FAVOR" style="labelKey=key,labelProperty=value"></metadata:input></td>
	</tr>
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