<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<% 
%>
<HTML>
<HEAD>
<TITLE>��������Ȩ�޲�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��������Ȩ�޲�ѯ" >
<bsp:containbutton text="��ѯ" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">��������Ȩ�޲�ѯ��</font>
    <table cellpadding="0" class="tblContent">      
                   <tr>
                       <td class="tdTitle">�û��ʺţ�</td>
                       <td class="tdRight" align="center">
                       <html:hidden name="userId" value=""/>
                       <html:text name="userName" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
		               </td>
                    </tr> 
                    
                    <tr>
                       <td class="tdTitle">������Դ��Χ��</td>
                       <td class="tdRight" align="center">
                       <html:hidden name="moduleId" value=""/>
                       <html:text name="moduleName" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectModule()">
		               </td>
                    </tr> 
                                                 
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].userId.value="";
	document.forms[0].userName.value="";
}
function selectUser(){
  var cmdUrl="user.cmd&method=getchoiceroot";
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	return;
  }else{
	document.all("userId").value=win[0];
	document.all("userName").value=win[1];
  }
}
function selectModule(){
  var cmdUrl="module.cmd&method=getModuleRoot";
  var url ="jsp/help.jsp?url="+cmdUrl; 
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {
	return;
  }else{
	document.all("moduleId").value=win[0];
	document.all("moduleName").value=win[1];
	
  }
}
function forQuery(){

  var userId = document.all("userId").value;
  if(userId == ""){
	  alert("��Ҫ��ѯ���û�����Ϊ�գ�");
      return false;
  }

  var moduleId = document.all("moduleId").value;
  if(moduleId == ""){
	  alert("������Դ��Χ����Ϊ�գ�");
      return false;
  }
      
   document.forms[0].action ="funcAndDatarestype.cmd?method=query";     
   document.forms[0].submit();
}

</script>