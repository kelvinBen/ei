<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%
	List check_password_list =Global.getList("net.mast.bsp.permit.check_password");
	String pswd_check = ResourcesFactory.getString("PUB_USERS.PSWD_CHECK");
%>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
</HEAD>
<script language="javascript">
function check(){
	//2005��10��2�գ�ȥ��������֤�жԿո�Ĺ��ˣ������������пո����
	var adminPassword = document.forms[0].adminPassword;
	if (adminPassword.value =="")
	{
	  alert("�������������룡");    
	  document.forms[0].adminPassword.focus();
	  return false;
	}
    
	 var pswd1 = document.forms[0].pswd1;
	if (pswd1.value =="")
	{
	  alert("����������������û��������룡"); 
	  document.forms[0].pswd1.focus();   
	  return false;
	}

    var pswd2 = document.forms[0].pswd2;
	if (pswd2.value =="")
	{
	  alert("������ȷ�����룡");   
	  document.forms[0].pswd2.focus();   
	  return false;
	}
	
   if(document.forms[0].pswd1.value!=document.forms[0].pswd2.value) {
       alert("�������ȷ�����벻һ�������������룡");
       pswd1.value="";
       pswd2.value="";
       document.forms[0].pswd1.focus();
       return false;
  }
  
  	var check_password_arr = <%=check_password_list%>; 
	var pswd_check_text ="<%=pswd_check%>";
	for(var i=0;i<check_password_arr.length;i++){
	if(check_password_arr[i]!=null){
		if(!checkPassword(check_password_arr[i],pswd1.value)){
			alert(pswd_check_text);
			return false;
		}
	}  
	}
	
	return true
}
</script>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="���û����������û�����" >
<bsp:containbutton text="ȷ��" onclick="forSave()" action ="user.cmd?method=resetCorpPassword"></bsp:containbutton>
<html:messages/>

  <table width="100%" cellpadding="0" class="tblContent">

                <tr>
                <td class="tdTitle">�������룺</td>
                <td class="tdRight"><input type="password" name="adminPassword" maxlength="128" size="20" value=""><FONT COLOR=#ff0000>*</FONT></td>
                </tr> 
                      
                <tr>
                <td class="tdTitle">�����������û��������룺</td>
                <td class="tdRight"><input type="password" name="pswd1" maxlength="128" size="20" value=""><FONT COLOR=#ff0000>*</FONT></td>
                </tr>  
                 
                <tr>
                <td class="tdTitle">ȷ�����룺</td>
                <td class="tdRight"><input type="password" name="pswd2" maxlength="128" size="20" value=""><FONT COLOR=#ff0000>*</FONT></td>
                </tr>  
              
                
   </table>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
  
  function forSave(){
    if(!check()) return; 	
       document.forms[0].action ="user.cmd?method=resetCorpPassword";    
       document.forms[0].submit();	
  }
</script>