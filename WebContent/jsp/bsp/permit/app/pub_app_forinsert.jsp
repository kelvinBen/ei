<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>主机和应用映射表增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubApp(){
  	  var appName = document.forms[0].appName;
      if (trim(appName.value)=="")
	{
	  alert("请输入应用名称！");    
	  appName.focus();
	  return false;
	}
    appName.value = trim(appName.value) ;
  	  var corporationId = document.forms[0].corporationId;
      if (trim(corporationId.value)=="")
	{
	  alert("请输入所属法人！");    
	  corporationId.focus();
	  return false;
	}
    corporationId.value = trim(corporationId.value) ;
    var tp = document.forms[0].tp;
      if (trim(tp.value)=="")
	{
	  alert("请输入传送协议！");    
	  tp.focus();
	  return false;
	}
	if(trim(tp.value)!="http"&&trim(tp.value)!="https"&&trim(tp.value)!="ftp"){
		alert("输入的传送协议现在不支持或不存在！");    
	  	tp.focus();
	  	return false;
	}
	 tp.value = trim(tp.value) ;
	 var domainname = document.forms[0].domainname;
  	  var ip = document.forms[0].ip;
      if (trim(ip.value)==""&&trim(domainname.value)=="")
	{
	  alert("请输入服务器主机IP！");    
	  ip.focus();
	  return false;
	}
	if(trim(ip.value)!=""&&!__checkIp(ip.value)){
		alert("请检查服务器主机IP格式是否正确。");
		ip.focus();
	  	return false;
	}
    ip.value = trim(ip.value) ;
  	  var port = document.forms[0].port;
      if (trim(port.value)==""&&trim(domainname.value)=="")
	{
	  alert("请输入端口号！");    
	  port.focus();
	  return false;
	}
	if (trim(port.value)!=""&&!isInteger(port,"positive"))
	{
	  alert("端口号必须是正整数。");    
	  port.focus();
	  return false;
	}
    port.value = trim(port.value) ;
  	  var context = document.forms[0].context;
      if (trim(context.value)==""&&trim(domainname.value)=="")
	{
	  alert("请输入上下文根！");    
	  context.focus();
	  return false;
	}
    context.value = trim(context.value) ;
  	  var note = document.forms[0].note;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="主机和应用映射表增加" >
<bsp:containbutton action="pubapp.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton action="pubapp.cmd?method=insertContinue" text="保存并继续" onclick="forSaveContinue()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action ="pubappquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<tr style="display:none">
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.APP_ID")%>：</td>
                    <td class="tdRight"><html:text name="appId" property="appId" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.APP_NAME")%>：</td>
                    <td class="tdRight"><html:text name="appName" property="appName" size="30" maxlength="100" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
					<tr>
                    	<td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.CORPORATION_ID")%>：</td>
	                    <td class="tdRight"><html:hidden name="corporationId" property="corporationId"/>
	                    	<html:text name="corporationName" property="corporationName" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT>
	                    	<img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectCorpIdTree()">
	                    </td>
                    </tr> 
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.TP")%>：</td>
                    <td class="tdRight"><html:text name="tp" property="tp" size="15" maxlength="30" value="http"/><FONT COLOR=#ff0000>* 例如：http、https等</FONT></td>
                    </tr>                     
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.IP")%>：</td>
                    <td class="tdRight"><html:text name="ip" property="ip" size="15" maxlength="15" />&nbsp;&nbsp;<FONT COLOR=#ff0000>说明：IP、端口号和上下文根为一组，域名为一组，用户可以选择填写任何一组。</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.PORT")%>：</td>
                    <td class="tdRight"><html:text name="port" property="port" size="6" maxlength="6" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.CONTEXT")%>：</td>
                    <td class="tdRight"><html:text name="context" property="context" size="30" maxlength="50" /></td>
                    </tr> 
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.DOMAINNAME")%>：</td>
                    <td class="tdRight"><html:text name="domainname" property="domainname" size="30" maxlength="100" /></td>
                    </tr>                     
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_APP.NOTE")%>：</td>
                    <td class="tdRight"><html:textarea name="note" property="note" cols="30" maxlength="100" /></td>
                    </tr>                    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubApp()) return;	
  document.forms[0].action ="pubapp.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkPubApp()) return;
  document.forms[0].action ="pubapp.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubappquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
//用于获取所法人的通用帮助.
function selectCorpIdTree(){
  var url ="stru.cmd?method=getSelectRoot&organType=1&struType=00&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=1&showOrganType=1";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	 document.all("corporationId").value=win[0];
	 document.all("corporationName").value=win[1];
  }
}
</script>