<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>系统变量增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkCommonParms(){
	  var parmsCode = document.forms[0].parmsCode;
	  if ( __isQuoteIn(parmsCode.value) )
	  {
	    alert("内码不能含有引号或单引号");
	    parmsCode.select();
	    parmsCode.focus();
	    return false;
	  }
	if (trim(parmsCode.value)=="")
	{
	  alert("请输入内码！");    
	  return false;
	}
    parmsCode.value = trim(parmsCode.value) ;
	  var parmsName = document.forms[0].parmsName;
	if (trim(parmsName.value)=="")
	{
	  alert("请输入参数名称！");    
	  return false;
	}
    parmsName.value = trim(parmsName.value) ;
/*	  var parmsValue = document.forms[0].parmsValue;
	if (trim(parmsValue.value)=="")
	{
	  alert("请输入参数值！");    
	  return false;
	}
  */
	parmsValue.value = trim(parmsValue.value) ;
	  var note = document.forms[0].note;
	if (trim(note.value)=="")
	{
	  alert("请输入描述！");    
	  return false;
	}
    note.value = trim(note.value) ;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="系统变量增加">	
<bsp:containbutton onclick="forSave()" text="保存" action=""></bsp:containbutton>
<bsp:containbutton onclick="forSaveContinue()" text="保存并继续" action=""></bsp:containbutton>
<bsp:containbutton onclick="forReset()" text="恢复" action=""></bsp:containbutton>
<bsp:containbutton onclick="forReturn()" text="返回" action=""></bsp:containbutton>
<html:form  name="frmList"  action="">
 
<html:messages></html:messages> 
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_CODE")%>：</td>
                    <td class="TdRight"><html:text name="parmsCode" property="parmsCode" size="30" maxlength="30" onchange="checkinputNullInDcWork ('parmsCode','parmsCode_span')"/><span id="parmsCode_span" class="xinghaoCss">*</span></td>
                    </tr>                    
					<tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_NAME")%>：</td>
                    <td class="TdRight"><html:text name="parmsName" property="parmsName" size="30" maxlength="30" onchange="checkinputNullInDcWork ('parmsName','parmsName_span')"/><span id="parmsName_span" class="xinghaoCss">*</span></td>
                    </tr>                    
					<tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.PARMS_VALUE")%>：</td>
                    <td class="TdRight"><html:text name="parmsValue" property="parmsValue" size="250" maxlength="250"/></td>
                    </tr>                    
					<tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("COMMON_PARMS.NOTE")%>：</td>
                    <td class="TdRight"><html:text name="note" property="note" size="250" maxlength="250" /></td>
                    </tr>                    
  </table> 
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
//setTitleInTreeBar('设置中心-系统变量设置-系统变量增加');
function forSave(){
  if(!checkCommonParms()) return;	
  document.forms[0].action ="commonparms.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkCommonParms()) return;
  document.forms[0].action ="commonparms.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="commonparmsquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>