<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>ϵͳ�˵����޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubMenuSysItem(){
	if(document.forms[0].text.value==""){
		alert("������<%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TEXT")%>!");
		document.forms[0].text.focus();
		return;
	}  
	var text = document.forms[0].text;
	 if(byteLength(trim(text.value))>"30")
  {
  	alert("�˵��������������");
    text.focus();
    return false;
  }
  if ( __isQuoteIn(text.value) )
	  {
	    alert("�˵������Ʋ��ܺ��������ַ���");
	    text.select();
	    text.focus();
	    return false;
	  }

	var title = document.forms[0].title;
	if(byteLength(trim(title.value))>"30")
  {
  	alert("��ʾ��Ϣ�������");
    title.focus();
    return false;
  }
	
	var value = document.forms[0].value;
  if(byteLength(trim(value.value))>"250")
  {
  	alert("ֵ�������");
    value.focus();
    return false;
  }

	var target = document.forms[0].target;
  if(byteLength(trim(target.value))>"30")
  {
  	alert("Ŀ���������");
    target.focus();
    return false;
  }
  
  var options = document.forms[0].options;
  if(byteLength(trim(options.value))>"250")
  {
  	alert("ѡ���������");
    options.focus();
    return false;
  }
	return true;
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="ϵͳ�˵����޸�" >
<bsp:containbutton action="menusysitem.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="menusysitemquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  					<html:hidden name="menuId" property="menuId" write="false"/>
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TEXT")%>��</td>
                    <td class="tdRight"><html:text name="text" property="text" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TITLE")%>��</td>
                    <td class="tdRight"><html:text name="title" property="title" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TYPE")%>��</td>
                    <td class="tdRight">
	                    <html:select name="type" property="type" >
		                        <html:options collection="PUB_MENU_SYS_ITEM_COLLECTION" labelProperty="value" property="key"/>
		                </html:select>
	                </td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.VALUE")%>��</td>
                    <td class="tdRight"><html:text name="value" property="value" size="30" maxlength="250" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TARGET")%>��</td>
                    <td class="tdRight"><html:text name="target" property="target" size="30" maxlength="30" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.OPTIONS")%>��</td>
                    <td class="tdRight"><html:text name="options" property="options" size="30" maxlength="250" /></td>
                    </tr>                     
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.FUNCTION_ID")%>��</td>
				      <td class="tdRight"> 	
					      <html:text name="functionId" property="functionId" readonly="readonly"/>
					      <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectFunctionId()">
				      </td>
				    </tr>
				    <!--  gaochuanji��ӣ�����ʵ��Ӧ�����Ƶ���ʾ  -->
				    <tr>      
					  <td class="tdTitle"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.APP_ID")%>��</td>
					  <td class="tdRight"> 
				      	<html:hidden name="appId" property="appId"/>
				      	<html:text name="appName" property="appName" readonly="readonly"/>
					    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectAppId()">
					  </td> 
				    </tr>
				    <!--over-->
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function selectFunctionId(){
  var url ="jsp/help.jsp?url=function.cmd&method=getFunctionRootHelp";     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	  return;
  }else{
  		document.forms[0].functionId.value =win[0]; 
  }
}
function forSave(){
  if(!checkPubMenuSysItem()) return;	
  document.forms[0].action ="menusysitem.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="menusysitemquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}

//gaochuanji��ӣ�����Ӧ�õ�ͨ�ð�����
function selectAppId(){
  var url ="jsp/help.jsp?url=pubapp.cmd&method=query";     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	  return;
  }else{
  		document.forms[0].appId.value =win[0]; 
  		document.forms[0].appName.value =win[1];
  }
}
</script>