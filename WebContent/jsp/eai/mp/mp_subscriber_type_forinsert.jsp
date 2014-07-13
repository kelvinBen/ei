<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>订阅者类型增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkMpSubscriberType(){
	  var subscrTypeCode = document.forms[0].subscrTypeCode;
  	  if ( __isQuoteIn(subscrTypeCode.value) )
	  {
	    alert("订阅者类型编码不能含有引号或单引号!");
	    subscrTypeCode.select();
	    subscrTypeCode.focus();
	    return false;
	  }
      if (trim(subscrTypeCode.value)=="")
	{
	  alert("请输入订阅者类型编码！");    
	  subscrTypeCode.focus();
	  return false;
	}
    subscrTypeCode.value = trim(subscrTypeCode.value) ;
  	  var subscrTypeName = document.forms[0].subscrTypeName;
      if (trim(subscrTypeName.value)=="")
	{
	  alert("请输入订阅者类型名称！");    
	  subscrTypeName.focus();
	  return false;
	}
    subscrTypeName.value = trim(subscrTypeName.value) ;
  	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="订阅者类型增加" >
<bsp:containbutton action="mpsubscribertype.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="mpsubscribertype.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="mpsubscribertypequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_CODE")%>：</td>
                    <td class="tdRight"><html:text name="subscrTypeCode" property="subscrTypeCode" size="30" maxlength="30" /> <FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("MP_SUBSCRIBER_TYPE.SUBSCR_TYPE_NAME")%>：</td>
                    <td class="tdRight"><html:text name="subscrTypeName" property="subscrTypeName" size="30" maxlength="30" /> <FONT COLOR=#ff0000>&nbsp;*</FONT></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMpSubscriberType()) return;	
  document.forms[0].action ="mpsubscribertype.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMpSubscriberType()) return;
  document.forms[0].action ="mpsubscribertype.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mpsubscribertypequery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>