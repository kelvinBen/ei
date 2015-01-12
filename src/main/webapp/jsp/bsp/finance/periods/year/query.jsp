<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>会计年度查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<bsp:container title="会计年度查询" >
<bsp:containbutton onclick="forInsert()"  text="增加" action="financialyear.cmd?method=forinsert" ></bsp:containbutton>
<bsp:containbutton onclick="forUpdate()"   text="修改" action="financialyear.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton onclick="forDetail()"   text="明细" action="financialyear.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forDelete()"   text="删除" action="financialyear.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="financialyearquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
          		  <flex:radioCol caption="选择" width="40" property="id"  name="primaryKey" sortName="year.id"></flex:radioCol>                 
                  <flex:flexCol caption='会计年度' width="100" property="finYear" style="text-align:left" sortName="year.finYear"></flex:flexCol>
                  <flex:flexCol caption='起始日' width="100" property="beginDate" style="text-align:left" sortName="year.beginDate"></flex:flexCol>
                  <flex:flexCol caption='终止日' width="100" property="endDate" style="text-align:left" sortName="year.endDate"></flex:flexCol>
                  <flex:flexCol caption='记帐期间个数' width="100" property="periodNum" style="text-align:right" sortName="year.periodNum"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="financialyearquery.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="financialyear.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
function forInsert(){
  document.forms[0].action ="financialyear.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="financialyear.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="financialyear.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="financialyear.cmd?method=delete";    
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