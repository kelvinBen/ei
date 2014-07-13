<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%
String organType=(String)request.getAttribute("organType");
%>
<HTML>
<HEAD>
<TITLE>人事事件类型查询</TITLE>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<bsp:container title="人事事件类型查询" >
	<bsp:containbutton onclick="forInsert()" text="增加" action="hreventtype.cmd?method=forinsert"></bsp:containbutton>
	<bsp:containbutton onclick="forUpdate()" text="修改" action="hreventtype.cmd?method=forupdate"></bsp:containbutton>
	<bsp:containbutton onclick="forDetail()" text="明细" action="hreventtype.cmd?method=detail"></bsp:containbutton>
	<bsp:containbutton onclick="forDelete()" text="删除" action="hreventtype.cmd?method=delete"></bsp:containbutton>
	<bsp:containbutton text="返回" onclick="forReturn()" action="organtypequery.cmd"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="">
<support:flexgrid name="grid" height="340" action="" isSubmit="false">
				<flex:checkboxCol caption="选择" width="40" property="eventType"  name="primaryKey" sortName="PUB_HR_EVENT_TYPE.EVENT_TYPE"></flex:checkboxCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.EVENT_TYPE")%>' width="100" property="eventType" style="text-align:left" sortName="PUB_HR_EVENT_TYPE.EVENT_TYPE" ></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.TYPE_NAME")%>' width="250" property="typeName" style="text-align:left" sortName="PUB_HR_EVENT_TYPE.TYPE_NAME" ></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_HR_EVENT_TYPE.IS_SYS")%>' width="150" property="sys" style="text-align:left" sortName="PUB_HR_EVENT_TYPE.IS_SYS" ></flex:flexCol>
</support:flexgrid>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="hreventtype.cmd?method=detail&primaryKey="+id+"&organTypeParent=<%=organType%>";
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
function forInsert(){
  document.forms[0].action ="hreventtype.cmd?method=forinsert&organType=<%=organType%>";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="hreventtype.cmd?method=forupdate&organTypeParent=<%=organType%>";   
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="hreventtype.cmd?method=detail&organTypeParent=<%=organType%>"; 
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
 document.forms[0].action ="hreventtype.cmd?method=delete&organType=<%=organType%>";  
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
function forReturn(){
  self.location.href ="organtypequery.cmd";
}
</script>