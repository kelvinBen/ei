<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
     String templateId = (String)request.getAttribute("templateId");
%>


<HTML>
<HEAD>
<TITLE>授权模板角色定义查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="应用模板" >
<bsp:containbutton onclick="applyRoles()" text="应用" action="troleoptsquery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="">
<html:hidden name="templateId" value="<%=templateId%>"/>
<table id="tblSearch">
  <tr>
       <td class="tdLeft">应用机构：</td>
       <td class="tdRight"><html:hidden name="corporationId" value=""/><html:text name="corporationName" value="" size="20" maxlength="30" readonly="true" ondblclick="clean()"/>
       <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectCorporation()"><FONT COLOR=#ff0000>*</td>
  </tr> 
</table>
<flex:flexgrid name="grid" height="200" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" name="primaryKey" width="40" property="roleId" sortName="PUB_TROLES.ROLE_ID"></flex:checkboxCol>  				
				<flex:flexCol caption="角色内码" width="100" property="roleId" sortName="PUB_TROLES.ROLE_ID" style="display:none"></flex:flexCol>
  				<flex:flexCol caption="角色名" width="40%" property="roleName" style="text-align:left" sortName="PUB_TROLES.ROLE_NAME" ></flex:flexCol>
  				<flex:flexCol caption="角色业务含义" width="40%" property="roleAlias" style="text-align:left" sortName="PUB_TROLES.ROLE_ALIAS"></flex:flexCol>
</flex:flexgrid>
</html:form>
</bsp:container>
<script language="javascript">
function clean(){
	document.forms[0].corporationId.value="";
	document.forms[0].corporationName.value="";
}
grid.show();
grid.setSumText("");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");

function selectCorporation(){
      var url ="stru.cmd?method=getSelectRoot&isIncludeSubCorporation=1"+"&organType=1&isCheckBox=1&isIncludeSelf=1&isTree=1";      
      var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
      if (win == null) {  
  	return;
      }else{
      if(win[0]=="") {
      document.all("corporationId").value="";
      document.all("corporationName").value="";
      return;
      }
      document.all("corporationId").value=win[2];
      document.all("corporationName").value=win[1];
      }
}

function applyRoles(){
    if(!getSelect()) return ;
    if(document.all("corporationId").value==""){
          alert("请选择应用机构！");
          return;
    }
    
    document.forms[0].action="templates.cmd?method=applyRoles";
    document.forms[0].submit();
}

function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  return true;
}
</script>