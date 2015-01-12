<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>人事事件类型修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<%
String organTypeParent=(String)request.getAttribute("organTypeParent");
%>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubHrEventType(){
	var eventType = document.forms[0].eventType;
    if ( __isQuoteIn(eventType.value) )
    {
      alert("人事事件类型不能含有特殊字符！");      
      return false;
    }
	if (trim(eventType.value)=="")
	{
	  alert("请输入人事事件类型！");    
	  return false;
	}
    eventType.value = trim(eventType.value) ;
	var organType = document.forms[0].organType;
    if ( __isQuoteIn(organType.value) )
    {
       alert("组织类型代码不能含有特殊字符！"); 
       organType.value="";
       organType.select();
	   organType.focus();    
       return false;
    }
	if (trim(organType.value)=="")
	{
	   alert("请输入组织类型代码！"); 
	   organType.select();
	   organType.focus();  
	   return false;
	}
    organType.value = trim(organType.value) ;
	var typeName = document.forms[0].typeName;
	if (trim(typeName.value)=="")
	{
	  alert("请输入人事事件类型名称！");  
	  typeName.select();
	  typeName.focus();   
	  return false;
	}
    typeName.value = trim(typeName.value) ;
	var isSys = document.forms[0].isSys;
	if (trim(isSys.value)=="")
	{
	  alert("请输入是否系统预制事件类型！");    
	  return false;
	}
    isSys.value = trim(isSys.value) ;
    
  if(!stringLengthCheck(eventType,10,"人事事件类型长度不能超过10个字符！")){
  	  eventType.value="";
	  eventType.select();
	  eventType.focus();
      return false;
  }
  if(!stringLengthCheck(typeName,60,"人事事件类型名称长度不能超过60个字符！")){
      typeName.value="";
  	  typeName.select();
	  typeName.focus(); 
      return false;
  }
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="hreventtype.cmd?method=update">
<bsp:container title="人事事件类型修改" >
<bsp:containbutton text="保存" onclick="forSave()" action="hreventtype.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="history.go(-1)" action="hrEventTypeQuery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
			      <tr>
			      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.EVENT_TYPE")%>：</td>
			      <td class="tdRight"><html:hidden name="eventType" property="eventType" write="true"/></td>
			   	 </tr>  
			   	               
			  		<tr>
      					<html:hidden name="organType" property="organType" write="false"/>
    				</tr>
    				
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.TYPE_NAME")%>：</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="60" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>   
                    
                    <tr>
      					<html:hidden name="isSys" property="isSys" write="false"/>
    				</tr>                                  
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubHrEventType()) return;	
    document.forms[0].action ="hreventtype.cmd?method=update&organTypeParent=<%=organTypeParent%>";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="hrEventTypeQuery.cmd?organType="+document.all("organType").value.substring(0,2);
  document.forms[0].submit();	
}

</script>