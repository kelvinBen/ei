<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE>机构参数表查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String organId = (String)request.getAttribute("organId");
%>
<bsp:container title="机构参数表查询" >
<bsp:containbutton onclick="forInsert()" text="增加" action="organparms.cmd?method=forinsert"></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()" text="修改" action="organparms.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()" text="明细" action="organparms.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()" text="删除" action="organparms.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="">

<table id="tblSearch">
<flex:search>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="false">
<flex:checkboxCol caption="选择" width="40" property="parmsName"  name="primaryKey" style="text-align:left" sortName="PUB_ORGAN_PARMS.PARMS_NAME"></flex:checkboxCol>
     <flex:flexCol caption='参数名称' width="150"  property="parmsName" style="text-align:left" sortName="PUB_ORGAN_PARMS.PARMS_NAME"></flex:flexCol>
     <flex:flexCol caption='参数值' width="150" property="parmsValue" style="text-align:left" sortName="PUB_ORGAN_PARMS.PARMS_VALUE"></flex:flexCol>
     <flex:flexCol caption='描述' width="222" property="note" style="text-align:left" sortName="PUB_ORGAN_PARMS.NOTE"></flex:flexCol>
</flex:flexgrid>

</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="organparms.cmd?method=detail&organId="+"<%=organId%>"+"&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
function forInsert(){
  document.forms[0].action ="organparms.cmd?method=forinsert&organId="+"<%=organId%>";    
  document.forms[0].submit();	
}

function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="organparms.cmd?method=detail&organId="+"<%=organId%>"; 
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="organparms.cmd?method=forupdate&organId="+"<%=organId%>"; 
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="organparms.cmd?method=delete&organId="+"<%=organId%>"; 
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  //var myall=grid.getCheckAll('α','β');
 // var ob=myall.split('β');
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