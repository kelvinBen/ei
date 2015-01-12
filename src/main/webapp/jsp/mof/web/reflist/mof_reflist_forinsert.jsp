<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
    String mofReferenceId = request.getParameter("mofReferenceId");
    if (mofReferenceId==null){
	mofReferenceId="";
	}
    String mofReferenceName = request.getParameter("mofReferenceName");
    if (mofReferenceName==null){
	mofReferenceName="";
	}
    String refreshId=(String)request.getAttribute("refreshId");
    if (refreshId==null||refreshId.equals("")){
        refreshId="";
    }else{
        refreshId=refreshId+"@E";
    }
%>
<HTML>
<HEAD>
<TITLE>�ο���ϸ����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript">
function checkMofReflist(){
	var name = document.forms[0].name;
	if (trim(name.value)=="")
	{
	alert("������ֵ��");    
	return false;
	}
	name.value = trim(name.value) ;
	var value = document.forms[0].value;
	if (trim(value.value)=="")
	{
	alert("���������ƣ�");    
	return false;
	}
	value.value = trim(value.value) ;
	var description = document.forms[0].description;
	description.value = trim(description.value) ;
	return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="�ο���ϸ����" >
<widgets:containbutton text="����" onclick="forSave()"></widgets:containbutton>
<widgets:containbutton text="���沢����" onclick="forSaveContinue()"></widgets:containbutton>
<widgets:containbutton text="�ָ�" onclick="forReset()"></widgets:containbutton>
<widgets:containbutton text="����" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">           
	<html:hidden name="mofReferenceId" value="<%=mofReferenceId%>"></html:hidden>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.MOF_REFERENCE_ID")%>��</td>
	<td class="tdRight"><html:hidden name="mofReferenceName" value="<%=mofReferenceName%>" write="true"></html:hidden></td>
	</tr>      		
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.NAME")%>��</td>
	<td class="tdRight"><html:text name="value" property="value" size="60" maxlength="60" /></td>
	</tr>                       
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.DESCRIPTION")%>��</td>
	<td class="tdRight"><html:textarea name="description" property="description" rows="4" cols="80"/></td>
	</tr>                 
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_REFLIST.VALUE")%>��</td>
	<td class="tdRight"><html:text name="name" property="name" size="60" maxlength="60" /></td>
	</tr>                   
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkMofReflist()) return;	
  document.forms[0].action ="mofreflist.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkMofReflist()) return;
  document.forms[0].action ="mofreflist.cmd?method=insertContinue";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofreflistquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null||refreshId!=""||refreshId!=undefined){
        if(getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>