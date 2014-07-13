<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>机构参数类型查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script> 
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>

<% 
	String parms_name = request.getParameter("parms_nameSearch");
	if (parms_name==null){
	  parms_name="";
	}else{
	  if(parms_name.indexOf("%")!=-1){
	   parms_name=parms_name.replaceAll("%"," ");
	  }
	}
	parms_name=parms_name.trim();
%>
<bsp:container title="机构参数类型查询" >
<html:form name="frmList" action="organparmstquery.cmd" onsubmit="check();">
<bsp:containbutton action="organparmst.cmd?method=forinsert" onclick="forInsert()" text="增加"></bsp:containbutton>
<bsp:containbutton action="organparmst.cmd?method=forupdate" onclick="forUpdate()" text="修改"></bsp:containbutton>
<bsp:containbutton action="organparmst.cmd?method=detail" onclick="forDetail()" text="明细"></bsp:containbutton>
<bsp:containbutton action="organparmst.cmd?method=delete" onclick="forDelete()" text="删除"></bsp:containbutton>
<html:messages></html:messages>
 
<table id="tblSearch">

<flex:search>
	<tr>
    <td>参数名称：<flex:searchHidden name="parms_nameSearch" searchName="PUB_ORGAN_PARMS_T.PARMS_NAME" dataType="java.lang.String" operSymbol=" like " value="<%=parms_name%>">
	</flex:searchHidden><input type="text" size="12" name="temp"></td>
	<td><flex:searchImg name="chaxun" action="organparmstquery.cmd" image="search.gif" imgClick=""/></td>
	</tr>
</flex:search>
</table>
<support:flexgrid name="grid" height="340"  action="" isSubmit="true">
	<flex:checkboxCol caption="选择" width="40" property="PARMS_NAME"  name="primaryKey" style="text-align:left" sortName="PUB_ORGAN_PARMS_T.PARMS_NAME"></flex:checkboxCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_NAME")%>' width="100" property="PARMS_NAME" sortName="PUB_ORGAN_PARMS_T.PARMS_NAME" style="text-align:left"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.PARMS_VALUE")%>' width="100" property="PARMS_VALUE" sortName="PUB_ORGAN_PARMS_T.PARMS_VALUE"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NOTE")%>' width="300" property="NOTE" sortName="PUB_ORGAN_PARMS_T.NOTE"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="organparmstquery.cmd" pageSize="10">
</flex:pagePolit>

</html:form>
</bsp:container>

<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="organparmst.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
function forInsert(){
  document.forms[0].action ="organparmst.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="organparmst.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="organparmst.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="organparmst.cmd?method=delete";    
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
function check(){
   var parms_nameSearch=document.all("temp").value;
   parms_nameSearch=trim(parms_nameSearch);
   if(parms_nameSearch.indexOf("%")==-1){
     parms_nameSearch="%"+parms_nameSearch+"%";
     document.all("parms_nameSearch").value=parms_nameSearch;
  } 
  return true
}
</script>