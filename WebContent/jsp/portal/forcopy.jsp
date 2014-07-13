<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>
<HTML>
<HEAD>
<TITLE>复制工作台</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:messages></html:messages>
<bsp:container title="复制工作台" >
<bsp:containbutton text="复制" onclick="forCopy()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">从</font>
    <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">用户帐号：</td>
                       <td class="tdRight" align="center">
                       帐号：<html:text name="fromuserId" value=""/>
                       用户名：<html:text name="fromuserName" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
		               </td>
                    </tr>   
    </table>
    
     <font size="5pt">复制到</font>
        <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">某角色下的用户：</td>
                       <td class="tdRight" align="center"><html:hidden name="roleId" value=""/>
                      选择角色： 
                <html:text name="roleName" value="" size="20" readonly="true" onclick="selectRole()"/>
		         
		         选择该角色下的用户：<html:text name="userroleId" value="" size="20" readonly="true" onclick="selectroleUser()" />
		         <html:text name="userroleName" value="" size="20" readonly="true" onclick="selectroleUser()" />
		               
		               </td>
                    </tr>   
                    <tr>
                       <td class="tdTitle">某个法人下的用户：</td>
                       <td class="tdRight" align="center">
                       选择法人：
                   <html:text name="CORPORATION" value="" size="20" readonly="true" onclick="selectCor()"/>
        选择该法人下的用户：<html:text name="deptUserId" value="" size="20" readonly="true" onclick="foruser_dialog()"/>
                       <html:text name="deptUserName" value="" size="20" readonly="true" onclick="foruser_dialog()"/>
                       <div style="display: none;">
       				   <help:helpsearch name="foruser" size="40" helpid="helpUser" value="" param="CORPORATION_ID=1" ismulti="true" changefield="deptUserId#1,deptUserName#2"/>
       				   </div>
                       </td>
                    </tr>   
                    <tr>
                      <td class="tdTitle">是否覆盖原有用户工作台：</td>
                       <td class="tdRight" align="center">
                       <select name='isfugai'>
                         <option value='1'>是</option>
                         <option value='0'>否</option>
                       </select>
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
function forCopy(){
	if($('fromuserId').value==""){
		alert("请选中复制的工作台数据的来源");
		$('fromuserId').focus();
		return ;
	}
	
	if($('userroleId').value==""&&$('deptUserId').value==""){
		alert("请选则要复制到哪些用户");
		return ;
	}  

  document.forms[0].action ="commonsingleparms.cmd?method=copy";     
  document.forms[0].submit();
}

function selectUser(){
  var cmdUrl="user.cmd&method=getchoiceroot&rootId=1&isIncludeSubCorporation=1";
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	return;
  }else{
	document.all("fromuserId").value=win[0];
	document.all("fromuserName").value=win[1];
  }
}


function selectRole(){
  var cmdUrl="role.cmd&method=selectroot";
  
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	return;
  }else{
	document.all("roleId").value=win[0];
	document.all("roleName").value=win[1];
  }
}

function selectroleUser(){
  var roleId=$("roleId").value;
  var cmdUrl="role.cmd&method=doHelpTable&isCheckBox=1&roleId="+roleId;
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	return;
  }else{
	document.all("userroleId").value=win[0];
	document.all("userroleName").value=win[1];
  }
}

function selectCor(){
    var cmdUrl="stru.cmd&method=getSelectRoot&rootId=1&organType=1&isCheckBox=0&isIncludeSelf=1&isTree=0&isIncludeStruPath=0&isExact=0";

  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	return;
  }else{
	document.all("foruser_param").value="CORPORATION_ID="+win[2];
	document.all("CORPORATION").value=win[1];
  }
}




</script>