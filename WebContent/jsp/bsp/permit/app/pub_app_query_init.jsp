<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>主机和应用映射表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
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
<bsp:container title="主机和应用映射表查询" >
<bsp:containbutton action="pubapp.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="pubapp.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="pubapp.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="pubapp.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="pubappquery_page_init.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>应用名称：<flex:searchText name="app_nameSearch" searchName="PUB_APP.APP_NAME" dataType="java.lang.String" operSymbol="=" value="<%=app_name%>" size="12">
	</flex:searchText></td>
    <td style="display:none">法人内码：<flex:searchText name="corporation_idSearch" searchName="PUB_APP.CORPORATION_ID" dataType="java.lang.String" operSymbol="=" value="<%=corporation_id%>" size="12">
	</flex:searchText></td>
	<td>法人内码：<html:text name="corporationName" value="<%=corporationName%>" size="12" readonly="true"/><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectCorpIdTree()">
	</td>
    <td>服务器主机IP：<flex:searchText name="ipSearch" searchName="PUB_APP.IP" dataType="java.lang.String" operSymbol="=" value="<%=ip%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="pubappquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption="选择" width="100" property="appId" name="primaryKey" sortName="PUB_APP.APP_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.APP_NAME")%>' width="100" property="appName" sortName="PUB_APP.APP_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.CORPORATION_ID")%>' width="100" property="corporationId" sortName="PUB_APP.CORPORATION_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.CORPORATION_ID")%>' width="100" property="corporationName" sortName="PUB_APP.CORPORATION_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.TP")%>' width="100" property="tp" sortName="PUB_APP.TP"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.IP")%>' width="100" property="ip" sortName="PUB_APP.IP"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.PORT")%>' width="100" property="port" sortName="PUB_APP.PORT"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.CONTEXT")%>' width="100" property="context" sortName="PUB_APP.CONTEXT" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.DOMAINNAME")%>' width="150" property="domainname" sortName="PUB_APP.DOMAINNAME"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_APP.NOTE")%>' width="100" property="note" sortName="PUB_APP.NOTE" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="pubappquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
function forInsert(){
  document.forms[0].action ="pubapp.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="pubapp.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="pubapp.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="pubapp.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
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
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
//用于获取所法人的通用帮助.
function selectCorpIdTree(){
  var url ="stru.cmd?method=getSelectRoot&organType=1&struType=00&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=1&showOrganType=1";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
	 document.all("corporation_idSearch").value=win[0];
	 document.all("corporationName").value=win[1];
  }
}
</script>