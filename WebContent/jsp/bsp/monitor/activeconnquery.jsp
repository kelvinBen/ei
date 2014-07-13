<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/mast-support" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"css-xp4.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"flexgird.css")%>">

<BODY topmargin="10px">
<widgets:supportcontainer>
<widgets:container title="活动数据连接查询" >
<widgets:containbutton text="查询" onclick="forQuery()"></widgets:containbutton>
<widgets:containbutton text="关闭连接" onclick="forDelete()"></widgets:containbutton>
<%
String actionUrl=SkinUtils.getRootUrl(request)+"activeconnquery.cmd";
%>
<html:form action="<%=actionUrl%>">
<table>
<flex:search>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" isSubmit="true" export="false">
        <flex:checkboxCol caption="选择" width="50" name="primaryKey" property="id" sortName="s.s"></flex:checkboxCol>
		<flex:flexCol caption="用户帐号" width="100" property="userId" sortName="d.d" ></flex:flexCol>
		<flex:flexCol caption="用户名称" width="100" property="employeeName" sortName="d.d" ></flex:flexCol>
		<flex:flexCol caption="操作业务含义" width="100" property="resourceAlias" sortName="d.d" ></flex:flexCol>

		<flex:flexCol caption="连接URL" width="100" property="url" sortName="d.d" style="display:none"></flex:flexCol>
		<flex:flexCol caption="CMD名称" width="100" property="commandName" sortName="f.f"></flex:flexCol>
		<flex:flexCol caption="开始时间" width="100" property="startTime" sortName="g.g"></flex:flexCol>
		<flex:flexCol caption="截止时间" width="100" property="currentTime" sortName="h.h"></flex:flexCol>
		<flex:flexCol caption="存活时间(毫秒)" width="100" property="aliveTime" sortName="b.b"></flex:flexCol>
</flex:flexgrid>
</html:form>
</widgets:container>
</widgets:supportcontainer>
<script language="javascript">
grid.show();
grid.setSumText("");
function forQuery(){
    document.forms[0].action ="activeconnquery.cmd";    
    document.forms[0].submit();	
  }

function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="activeconnkill.cmd?method=delete";    
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
    alert("请选择要关闭的数据库连接!");
    return false;
  }
  if (!confirm("真的要关闭选中的数据库连接吗？")) {
   	     return false;
   	     }  
  return true;
}
</script>
</BODY>
</HTML>