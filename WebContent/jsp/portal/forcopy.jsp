<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>
<HTML>
<HEAD>
<TITLE>���ƹ���̨</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:messages></html:messages>
<bsp:container title="���ƹ���̨" >
<bsp:containbutton text="����" onclick="forCopy()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">��</font>
    <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">�û��ʺţ�</td>
                       <td class="tdRight" align="center">
                       �ʺţ�<html:text name="fromuserId" value=""/>
                       �û�����<html:text name="fromuserName" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
		               </td>
                    </tr>   
    </table>
    
     <font size="5pt">���Ƶ�</font>
        <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">ĳ��ɫ�µ��û���</td>
                       <td class="tdRight" align="center"><html:hidden name="roleId" value=""/>
                      ѡ���ɫ�� 
                <html:text name="roleName" value="" size="20" readonly="true" onclick="selectRole()"/>
		         
		         ѡ��ý�ɫ�µ��û���<html:text name="userroleId" value="" size="20" readonly="true" onclick="selectroleUser()" />
		         <html:text name="userroleName" value="" size="20" readonly="true" onclick="selectroleUser()" />
		               
		               </td>
                    </tr>   
                    <tr>
                       <td class="tdTitle">ĳ�������µ��û���</td>
                       <td class="tdRight" align="center">
                       ѡ���ˣ�
                   <html:text name="CORPORATION" value="" size="20" readonly="true" onclick="selectCor()"/>
        ѡ��÷����µ��û���<html:text name="deptUserId" value="" size="20" readonly="true" onclick="foruser_dialog()"/>
                       <html:text name="deptUserName" value="" size="20" readonly="true" onclick="foruser_dialog()"/>
                       <div style="display: none;">
       				   <help:helpsearch name="foruser" size="40" helpid="helpUser" value="" param="CORPORATION_ID=1" ismulti="true" changefield="deptUserId#1,deptUserName#2"/>
       				   </div>
                       </td>
                    </tr>   
                    <tr>
                      <td class="tdTitle">�Ƿ񸲸�ԭ���û�����̨��</td>
                       <td class="tdRight" align="center">
                       <select name='isfugai'>
                         <option value='1'>��</option>
                         <option value='0'>��</option>
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
		alert("��ѡ�и��ƵĹ���̨���ݵ���Դ");
		$('fromuserId').focus();
		return ;
	}
	
	if($('userroleId').value==""&&$('deptUserId').value==""){
		alert("��ѡ��Ҫ���Ƶ���Щ�û�");
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