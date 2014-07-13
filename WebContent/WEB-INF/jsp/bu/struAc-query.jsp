<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ request.getContextPath() + "/";
%>
<HTML>
<HEAD>
<base href="<%=basePath %>">
<TITLE>最大号表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<% 
    String organAlias = request.getParameter("flt.p.and.likeS.organAlias");
	if (organAlias==null){
		organAlias="";
	}
%>
<bsp:container title="最大号表查询" >
<html:form name="frmList" action="bu/struAc/query.do">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>参与方：<flex:searchText name="flt.p.and.likeS.organAlias" searchName="flt.p.and.likeS.organAlias" dataType="java.lang.String" operSymbol="=" value="<%=organAlias%>" size="12">
	</flex:searchText>
	</td>
	<td><flex:searchImg name="chaxun" action="bu/struAc/query.do" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="bu/struAc/query.do" isSubmit="true">
      <flex:radioCol caption="选择" width="40" property="id"  name="id" sortName="s.id"></flex:radioCol>
      <flex:flexCol caption='类型' width="150" property="actionType" style="text-align:left" sortName="s.actionType.description"></flex:flexCol>
	  	  <flex:flexCol caption='参与方' width="150" property="partyOrganAlias" style="text-align:left" sortName="p.organAlias" ></flex:flexCol>
	  <flex:flexCol caption='参与类型' width="150" property="type" style="text-align:left" sortName="s.type" canSort="false"></flex:flexCol>
	  <flex:flexCol caption='创建时间' width="150" property="createTime" style="text-align:left" sortName="s.createTime" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="bu/struAc/query.do" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
function forInsert(){
  document.forms[0].action ="pubidtable.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  var row = grid.getCurrentLine();
  var otr=grid.getCell(row,6);
  var organId=otr.children[0].innerText;
  document.forms[0].action ="pubidtable.cmd?method=forupdate&organId="+organId;    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  var row = grid.getCurrentLine();
  var otr=grid.getCell(row,6);
  var organId=otr.children[0].innerText;
  document.forms[0].action ="pubidtable.cmd?method=detail&organId="+organId;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  var row = grid.getCurrentLine();
  var otr=grid.getCell(row,6);
  var organId=otr.children[0].innerText;
  document.forms[0].action ="pubidtable.cmd?method=delete&organId="+organId;    
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
  if (!confirm("真的要删除选中的记录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}
</script>