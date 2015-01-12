<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>选择应用</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<% 
    String app_name = request.getParameter("app_nameSearch");
	if (app_name==null){
	  app_name="";
	}
    String corporation_id = request.getParameter("corporation_idSearch");
	if (corporation_id==null){
	  corporation_id="";
	}
	String corporationName = request.getParameter("corporationName");
	if (corporationName==null){
	  corporationName="";
	}
    String ip = request.getParameter("ipSearch");
	if (ip==null){
	  ip="";
	}
%>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>"> 
<widgets:container title="应用" >
<html:form name="frmList" action="">

<widgets:containbutton onclick="clickOk()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="清除"></widgets:containbutton>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>应用名称：<flex:searchText name="app_nameSearch" searchName="PUB_APP.APP_NAME" dataType="java.lang.String" operSymbol="=" value="<%=app_name%>" size="12">
	</flex:searchText></td>
    <td style="display:none">法人内码：<flex:searchText name="corporation_idSearch" searchName="PUB_APP.CORPORATION_ID" dataType="java.lang.String" operSymbol="=" value="<%=corporation_id%>" size="12">
	</flex:searchText></td>
	<td style="display:none">法人内码：<html:text name="corporationName" value="<%=corporationName%>" size="12" readonly="true"/><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectCorpIdTree()">
	</td>
    <td>服务器主机IP：<flex:searchText name="ipSearch" searchName="PUB_APP.IP" dataType="java.lang.String" operSymbol="=" value="<%=ip%>" size="12">
	</flex:searchText></td>
	<td><flex:searchNoPageImg name="chaxun" action="javascript:search()" image="search.gif"/></td>
	</tr>
</flex:search>
</table>

	<support:flexgrid name="grid" height="240"  action="" isSubmit="true">
			<flex:checkboxCol caption="选择" width="100" property="appId" name="primaryKey" sortName="PUB_APP.APP_ID"></flex:checkboxCol>
			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.APP_NAME")%>' width="100" property="appName" sortName="PUB_APP.APP_NAME"></flex:flexCol>  
			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.CORPORATION_ID")%>' width="100" property="corporationId" sortName="PUB_APP.CORPORATION_ID" style="display:none"></flex:flexCol>
			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.CORPORATION_ID")%>' width="100" property="corporationName" sortName="PUB_APP.CORPORATION_ID" style="display:none"></flex:flexCol>
			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.TP")%>' width="100" property="tp" sortName="PUB_APP.TP"></flex:flexCol>
			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.IP")%>' width="100" property="ip" sortName="PUB_APP.IP"></flex:flexCol>
			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.PORT")%>' width="100" property="port" sortName="PUB_APP.PORT" style="display:none"></flex:flexCol>
			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.CONTEXT")%>' width="100" property="context" sortName="PUB_APP.CONTEXT" style="display:none"></flex:flexCol>
  			<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.NOTE")%>' width="100" property="note" sortName="PUB_APP.NOTE" style="display:none"></flex:flexCol>                    
	</support:flexgrid>


</html:form>
</widgets:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	grid.getCell(grid.getCurrentLine(),1).children[0].checked=true;
	clickOk();
}
grid.show();
grid.setSumText("");


function clickOk(){
	if(!getSelect()) return;
	var returnV=new Array(2);
	returnV[0]=key[0];
	returnV[1]=key[1];
	window.returnValue=returnV;
	parent.close();
}

function clickCancel(){
    var returnV=new Array(2);
	returnV[0]="";
	returnV[1]="";
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
   parent.close();
}
function search(){
	document.forms[0].action="pubapp.cmd?method=query";
	document.forms[0].submit();
}
function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  var ob=myall.split(",");
  key=ob;
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}

</script>