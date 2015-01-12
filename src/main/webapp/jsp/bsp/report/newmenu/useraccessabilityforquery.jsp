<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>用户访问能力表</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="用户访问能力表" >
<bsp:containbutton text="查询" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">用户访问能力表</font>
    <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">用户帐号：</td>
                       <td class="tdRight" align="center">
                       <html:hidden name="userId" value=""/>
                       <html:text name="userName" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
		               </td>
                    </tr>   
                    <tr>
                       <td class="tdTitle">系统菜单：</td>
                       <td class="tdRight" align="center">
                       <html:select name="typeId" value="">
                           <html:options collection="allMenuTypeList" labelProperty="typeName" property="typeId"/>
                       </html:select>
                       <html:hidden name="typeName" value=""/>
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
function forQuery(){
  var userId = document.forms[0].userId;
  if(userId.value=="")
  {
  	alert("请选择用户帐号后进行查询！");
      userId.value="";
      userId.select();
      return;
  }
  var select2 = document.getElementById("typeId");
  document.forms[0].typeName.value = select2.options[select2.selectedIndex].innerText;
  document.forms[0].action ="useraccessability.cmd?method=query";     
  document.forms[0].submit();
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
</script>