<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>

<%
     String refreshId = (String)request.getAttribute("refreshId");
	 String flag = request.getParameter("method").equals("forupdate")?"1":"0";
%>
<HTML>
<HEAD>
<TITLE>��Ȩģ���ɫ�����޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>

<script language="javascript">
function checkPubTroles(){

	  var roleName = document.forms[0].roleName;
	if (trim(roleName.value)=="")
	{
	    alert("�������ɫ����");
	    tab1.doCardShow("card0");
	    roleName.select();
	    roleName.focus();
	    return false;
	}
	if ( __isQuoteIn(roleName.value))
	{
		    alert("��ɫ���Ʋ��ܺ��������ַ���");
		    roleName.select();
		    roleName.focus();
		    return false;
	}
    roleName.value = trim(roleName.value) ;
	  var roleAlias = document.forms[0].roleAlias;
	if (trim(roleAlias.value)=="")
	{
	   alert("�������ɫҵ���壡"); 
	   tab1.doCardShow("card0");
	   roleAlias.select();
	   roleAlias.focus();
	   return false;
	}
    roleAlias.value = trim(roleAlias.value) ;
	  var isSys = document.forms[0].isSys;
	if (trim(isSys.value)=="")
	{
	   alert("�������Ƿ����Ա��");   
	   tab1.doCardShow("card0");
	   isSys.select();
	   isSys.focus();   
	   return false;
	}
    isSys.value = trim(isSys.value) ;
	  var usersLimit = document.forms[0].usersLimit;
	if (trim(usersLimit.value)=="")
	{
	  alert("������ͬʱӵ�иý�ɫ������û�����");    
	  tab1.doCardShow("card0");
	  usersLimit.select();
	  usersLimit.focus();
	  return false;
	}
    usersLimit.value = trim(usersLimit.value) ;
        var rs=/^\-?[0-9]+$/;
    if(!rs.test(usersLimit.value)){
       alert("ͬʱӵ�иý�ɫ������û��������ǺϷ�������!");
       tab1.doCardShow("card0");
       userslimit.value="";
       userslimit.select();
       usersLimit.focus();
       return false;
    }
    if(usersLimit.value.indexOf("0")==0&&usersLimit.value.length!=1){
       alert("ͬʱӵ�иý�ɫ������û��������ǺϷ�������!");
       tab1.doCardShow("card0");
       userslimit.value="";
       userslimit.select();
       usersLimit.focus();
       return false;
    }
    if(parseInt(usersLimit.value)<-1){
       alert("ͬʱӵ�иý�ɫ������û��������Ǵ��ڻ����-1��������");
       tab1.doCardShow("card0");
       userslimit.value="";
       userslimit.select();
       usersLimit.focus();
       return false;
    }
  if(!stringLengthCheck(roleName,30,"��ɫ�����ܳ���30���ַ�!")){
        tab1.doCardShow("card0");
        roleName.value="";
	    roleName.select();
	    roleName.focus();  
        return false;
  } 
  if(!stringLengthCheck(roleAlias,30,"��ɫҵ���岻�ܳ���30���ַ�!")){
     tab1.doCardShow("card0");
     roleAlias.value="";
	 roleAlias.select();
	 roleAlias.focus();
     return false;
  } 
  if(!stringLengthCheck(usersLimit,8,"ͬʱӵ�иý�ɫ������û������ܳ���30���ַ�!")){
     tab1.doCardShow("card0");
     usersLimit.value="";
	 usersLimit.select();
	 usersLimit.focus();
     return false;
  } 
	
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<% 

 String templateId = request.getParameter("tempId");
	if (templateId==null){
	    templateId="";
	}
	String templateName =  request.getParameter("tempName");
	if (templateName==null){
	    templateName="";
	}
	StringBuffer sb = new StringBuffer();
    sb.append("��ɫģ��:"+templateName+"	 �Ľ�ɫ�޸�"); 
    
    String title = sb.toString();
%>
<html:form  name="frmList"  action="">
<bsp:container  title="<%=title%>" >
<bsp:containbutton text="ȷ��" onclick="forSave()" ></bsp:containbutton>
  <html:hidden name="tempName"  write="false" value='<%=templateName%>'/>
  <html:hidden name="tempId"  write="false" value='<%=templateId%>'/>
<html:messages></html:messages>


<tab:tab  id="tab1" type="table">
<tab:card id="card0" text="������Ϣ">
  <table width="100%" cellpadding="0" class="tblContent">  
			<tr style="display:none">
            <td class="tdTitle">��ɫ���룺</td>
            <td class="tdRight"><html:text name="roleId" property="roleId" size="20" readonly="true" /></td>
            </tr>		      
			<tr>
            <td class="tdTitle">��ɫ���ƣ�</td>
            <td class="tdRight"><html:text name="roleName" property="roleName" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
            </tr>   
					<tr>
                    <td class="tdTitle">��ɫҵ���壺</td>
                    <td class="tdRight"><html:text name="roleAlias" property="roleAlias" size="20" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>     
					<tr>
                    <td class="tdTitle">�Ƿ�ϵͳ����Ա��</td>
                    <td class="tdRight"><html:checkbox name="isSys" property="isSys" value="1"/></td>
	                </tr>
					<tr style="display:none">
                    <td class="tdTitle">ͬʱӵ�иý�ɫ������û�����</td>
                    <td class="tdRight"><html:text name="usersLimit" property="usersLimit" size="8" maxlength="8" value="-1"/><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>
	               <tr>
                   <td class="tdTitle">������ɫģ�壺</td>
                   <td class="tdRight"><%=templateName%></td>
                   </tr>
				  	<tr>
				      <td><html:hidden name="templateId" property="templateId" write="false" value='<%=templateId%>'/></td>
				    </tr>
  </table>
</tab:card>  

<tab:card id="card1" text="����">
				<table width="100%" cellpadding="0" class="tblContent">
					<input type="hidden" name="net.mast.web.taglib.util.GRIDLENGTH"
						id="net.mast.web.taglib.util.GRIDLENGTH" value="0">
					<tr>
						<td><iframe style="display:block" id="dataFrame0"
							width="100%" height="410px" frameborder="0"></iframe></td>
					</tr>
				</table>
			</tab:card>
	<tab:card id="card2" text="���β���">
        <table width="100%" cellpadding="0" class="tblContent">
	 <tr><td align="right">
	   <iframe style="display:block" id="dataFrame1" width="100%" height="410px" frameborder="0"></iframe>
	 </td></tr>
      </table>  
</tab:card>
</tab:tab>

</bsp:container>

</html:form>
</BODY>
</HTML>
<script language="javascript">
var isFirst=true;
tab1.doCardClick=function(card){
   	if (card.id=="card1"){
   		if(isFirst){
		  document.frames["dataFrame0"].function1.show();
		  document.frames["dataFrame0"].function1.setSumText("");
		  isFirst=false;
		}
	  } 
	if (card.id=="card2"){
	var f = document.getElementById("dataFrame1");
	f.src = "tRoleopts.cmd?method=getRoot&roleId="+document.all("roleId").value+"&update=true";
   	} 
}

var tempName=document.all("tempName").value;
var tempId=document.all("tempId").value;

function forSave(){
  if(!checkPubTroles()) return;	
  //tab1.doCardShow("card1");
  //document.frames["dataFrame0"].document.forms[0].action="tRoleopts.cmd?method=updateTRoleResource";
  //document.frames["dataFrame0"].document.forms[0].submit();
  document.forms[0].action ="troles.cmd?method=update&templateName="+tempName+"&templateId="+tempId+"&refreshId=<%=refreshId%>";    
  document.forms[0].submit();	
}

function init(){
	var f = document.getElementById("dataFrame0");
	f.src = "function.cmd?method=queryTRoles&roleId="+document.all("roleId").value+"&update=true";
	if ("<%=flag%>"=="0"){
		tab1.doCardShow("card1");
		var f = document.getElementById("dataFrame0");
	    f.src = "function.cmd?method=queryTRoles&roleId="+document.all("roleId").value+"&update=true";
	    tab1.doCardShow("card2");
		var refreshId = "<%=refreshId%>";
		getTreeFrame().seltree.refreshNodeById(refreshId);
	}
}
	init();
</script>