<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String organ_type = request.getParameter("organ_type");
	if (organ_type==null){
	  organ_type="";
	}
%>

<bsp:container title="组织结构类型查询" >
 <bsp:containbutton onclick="forInsert()" text="增加" action="organtype.cmd?method=forinsert"></bsp:containbutton>
        <bsp:containbutton onclick="forUpdate()" text="修改" action="organtype.cmd?method=forupdate"></bsp:containbutton>
        <bsp:containbutton onclick="forDetail()" text="明细" action="organtype.cmd?method=detail"></bsp:containbutton>
        <bsp:containbutton onclick="forDelete()" text="删除" action="organtype.cmd?method=delete"></bsp:containbutton>
        <bsp:containbutton onclick="forEventType()" text="定义人事事件类型" action ="hrEventTypeQuery.cmd"></bsp:containbutton>
<html:form name="frmList" action="organtypequery.cmd" onsubmit="check();">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>组织类型代码：<flex:searchHidden name="organ_type" searchName="PUB_ORGAN_TYPE.ORGAN_TYPE" dataType="java.lang.String" operSymbol=" like " value="<%=organ_type%>" >
	</flex:searchHidden><input type="text" size="12" name="temp"></td>
	<td><flex:searchImg name="chaxun" action="organtypequery.cmd" image="search.gif" imgClick="" /></td>
	</tr>
</flex:search>
</table>
<support:flexgrid name="grid" height="340" action="" isSubmit="true">
      <flex:checkboxCol caption="选择" width="40" property="ORGAN_TYPE"  name="primaryKey" sortName="PUB_ORGAN_TYPE.ORGAN_TYPE"></flex:checkboxCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_TYPE.ORGAN_TYPE")%>' width="100" property="ORGAN_TYPE" style="text-align:left" sortName="PUB_ORGAN_TYPE.ORGAN_TYPE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_TYPE.TYPE_NAME")%>' width="150" property="TYPE_NAME" style="text-align:left" sortName="PUB_ORGAN_TYPE.TYPE_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_TYPE.PARENT_TYPE")%>' width="100" property="PARENT_TYPE" style="text-align:left" sortName="PUB_ORGAN_TYPE.PARENT_TYPE"></flex:flexCol>
</support:flexgrid>

<flex:pagePolit action="organtypequery.cmd" nextPageClick="check()" previusPageClick="check()" turnPageClick="check()" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="organtype.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
var key;
function forInsert(){
  document.forms[0].action ="organtype.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="organtype.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="organtype.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="organtype.cmd?method=delete";    
  document.forms[0].submit();	
}
function forEventType(){
  if(!getSelect()) return;
  document.forms[0].action ="hrEventTypeQuery.cmd?organType="+key;    
  document.forms[0].submit();	
}
function getSelect(){

  var sel=grid.getCheckLine();
    key=sel;
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

function check(){
  var organ_type=document.all("temp").value;
  organ_type=trim(organ_type);
   if(organ_type.indexOf("%")==-1){
     organ_type="%"+organ_type+"%";
     document.all("organ_type").value=organ_type;
  } 
  return true
}
</script>