<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>����֤�����û�ӳ����޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkCertUser(){
	var dn = document.forms[0].dn;
	if (trim(dn.value)=="")
	{
	  alert("������֤�����⣡");   
	  dn.focus(); 
	  return false;
	}
    dn.value = trim(dn.value) ;
      	var userId = document.forms[0].userId;
  	if (trim(userId.value)=="")
	{
	  alert("�������û���½����");   
	  userId.focus(); 
	  return false;
	}
    userId.value = trim(userId.value) ;
      	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="����֤�����û�ӳ����޸�" >
<bsp:containbutton action="certuser.cmd?method=update" text="����" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="certuserquery_page_init.cmd" text="����" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("CERT_USER.DN")%>��</td>
                    <td class="tdRight"><html:hidden name="dn" property="dn" write="true" /></td>
                    </tr>                    
				  	<tr>
				      <td class="tdTitle"><%=ResourcesFactory.getString("CERT_USER.USER_ID")%>��</td>
				       <td class="tdRight">
				       <html:text name="userId" property="userId" size="20" maxlength="60"  readonly="true" ondblclick="clean()"/> <FONT COLOR=#ff0000>*</FONT>
				       <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectUser()">
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
}
function forSave(){
  if(!checkCertUser()) return;	
  if(!checkDn()) return;
  document.forms[0].action ="certuser.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="certuserquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}

function selectUser(){
  var cmdUrl="user.cmd&method=getchoiceroot";
  var url ="jsp/help.jsp?url="+cmdUrl;  
  var win = showModalDialog(url,window, "scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
	return;
  }else{
	document.all("userId").value=win[0];
	document.all("userName").value=win[1];
  }
}

function checkDn(){
//�������У��
   var dn = document.forms[0].dn; 
   var s, ss;
   var s = dn.value;  
   ss = s.split(",");
   var i;
   for(i=0;i<ss.length;i++){
      var sss=ss[i];
      var ssss=sss.split("=");
      var left=ssss[0];
      var right=ssss[1]; 
      //���Խ����ұ����ݲ�������ֺ��ֵȵ����У��
      var rs = /^([0-9]|[a-z]|[A-Z])+$/;
      if(!rs.test(right)){
      alert("����DN�б�����Ӣ���ַ��������Լ�����Ķ��ţ�");
      return false;
  }
       //����Ĵ�����У��Dn��ߵ����������������
       var all="CN OU O L S C cn ou o l s c Cn Ou cN oU";
       var r=all.search(left);       
       if(r==-1){
          alert("DN�ĸ�ʽ����ȷ�������ǰ�����ķ��Ų���ȷ��������޸�");
          return false; 
       }           
   }
   return true;
}
</script>