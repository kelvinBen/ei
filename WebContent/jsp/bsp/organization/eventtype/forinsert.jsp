<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>人事事件类型增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<%
String organTypeParent=(String)request.getAttribute("organTypeParent");
%>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubHrEventType(){
	  var eventType = document.forms[0].eventType;
	  var organType = document.forms[0].organType.value;
	  if ( __isQuoteIn(eventType.value) )
	  {
	    alert("人事事件类型不能含有特殊字符！");
	    eventType.value=organType;
	    eventType.select();
	    eventType.focus();
	    return false;
	  }
	if (trim(eventType.value)=="")
	{
	   alert("请输入人事事件类型！");  
	   eventType.select();
	   eventType.focus(); 
	   return false;
	}
	if(!__isNum(trim(eventType.value))){
	    alert("人事事件类型必须是数字!");
	    eventType.value=organType;
	    eventType.select();
	    eventType.focus();
	    return false;
	}
    eventType.value = trim(eventType.value) ;
   // var organType = document.forms[0].organType.value;
    if(!(eventType.value.indexOf(organType)==0&&eventType.value!=organType)){
        alert("人事事件类型必须以其所属组织类型开头，并且不能等于其所属组织类型！");
        eventType.value=organType;
	    eventType.select();
	    eventType.focus();
        return false;
    }
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
<html:form  name="frmList"  action="">
<bsp:container title="人事事件类型增加" >
<bsp:containbutton text="保存" onclick="forSave()" action="hreventtype.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="hrEventTypeQuery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.EVENT_TYPE")%>：</td>
                    <td class="tdRight"><html:text name="eventType" property="eventType" size="10" maxlength="10" /><FONT COLOR=#ff0000>(该代码必须以其所属组织类型为开头)*</FONT></td>
                    </tr>                   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.TYPE_NAME")%>：</td>
                    <td class="tdRight"><html:text name="typeName" property="typeName" size="60" maxlength="60" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>  
                    <tr>
                     <td class="tdTitle">组织类型代码：</td>
      				 <td class="tdRight"><html:hidden name="organType" property="organType" write="true"/></td>
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
  document.forms[0].action ="hreventtype.cmd?method=insert&organTypeParent=<%=organTypeParent%>";
  document.forms[0].submit();	
}
function forReturn(){
   document.forms[0].action ="hrEventTypeQuery.cmd?organType="+document.all("organType").value;
  document.forms[0].submit();	
}

</script>