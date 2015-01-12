<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>系统变量修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkCommonParms(){
	var parmsValue = document.forms[0].parmsValue;
	if (trim(parmsValue.value)=="")
	{
		if(confirm("确定要将该参数值设置为空么？")){
			return true;
		}else{
			parmsValue.focus();
			return false;
		}
	}
	parmsValue.value = trim(parmsValue.value);
	if(byteLength(parmsValue.value)>250){
		alert('参数值不能超过250个字符！');
		parmsValue.focus();
		return false;
	}
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="系统变量修改">	
<bsp:containbutton onclick="forSave()" text="保存" action=""></bsp:containbutton> 
<bsp:containbutton onclick="forReturn()" text="返回" action=""></bsp:containbutton>
<html:form  name="frmList"  action="">
 
<html:messages></html:messages> 
  <table width="100%" cellpadding="0" class="tblContent">
	<tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_CODE")%>：</td>
      <td class="TdRight"><html:hidden name="parmsCode" property="parmsCode" write="true"/></td>
	</tr>
	<tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_NAME")%>：</td>
      <td class="TdRight"><html:hidden name="parmsName" property="parmsName" write="true"/></td>
	</tr>                    
	<tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_VALUE")%>：</td>
      <td class="TdRight"><html:text name="parmsValue" property="parmsValue" size="50" maxlength="250"/></td>
	</tr>                    
	<tr>
      <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.NOTE")%>：</td>
      <td class="TdRight"><html:hidden name="note" property="note" write="true"/></td>
    </tr>                    
  </table> 
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
//setTitleInTreeBar('设置中心-系统变量设置-系统变量修改');
function forSave(){
  if(!checkCommonParms()) return;	
  document.forms[0].action ="commonparms.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="commonparmsquery.cmd";
  document.forms[0].submit();	
}
</script>