<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px" onload="init();">
<div class="btnareaCss">
<html:button onclick="forInsert()" name="btn_insert" value="增加"></html:button>
<html:button onclick="forUpdate()" name="btn_update"  value="修改"></html:button>
<html:button onclick="forDetail()" name="btn_detail"  value="明细"></html:button>
<html:button onclick="forDelete()" name="btn_delete"  value="删除"></html:button>
<html:button onclick="forFormList()" name="btn_formlist"  value="表单"></html:button>
<html:button onclick="forProcessList()" name="btn_processlist"  value="流程"></html:button>
<html:button onclick="forTaskList()" name="btn_tasklist"  value="任务列表定制"></html:button>
<!--

<html:button onclick="forTaskInfoList()" name="btn_taskinfolist"  value="任务列表"></html:button>
-->
</div>

<%
String typename_search=request.getParameter("typename_search");
if(typename_search==null)typename_search="";
String struid_search=request.getParameter("struid_search");
if(struid_search==null)struid_search="";
String organName=request.getParameter("organName");
if(organName==null)organName="";
%>
<html:form name="frmList" action="processtypequery.cmd?clear=true">
<html:messages/>
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    
    <td nowrap>名称：<input type="text" name="typename_search" value="<%=typename_search%>" size="15"></td>
    <td nowrap>部门：<input type="hidden" name="struid_search" value="<%=struid_search%>" size="10"><input type="text" name="organName" value="<%=organName%>" size="10" readonly="true"><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectNewDeptIdTree()"></td>
    <td><flex:searchImg name="chaxun" action="processtypequery.cmd?clear=true" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:checkboxCol caption="选择" width="50" property="typeId"  name="primaryKey" sortName="processtype.formId"  canSort="false"></flex:checkboxCol>
                          <flex:flexCol caption='类型名称' width="150" property="name"  sortName="processtype.name" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='类型描述' width="150" property="description" sortName="processtype.description" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='显示顺序' width="100" property="sortnum" sortName="processtype.order" canSort="false"></flex:flexCol>
                         
                          <flex:flexCol caption='是否下级可用' width="100" property="isallsub" sortName="processtype.isinternal" canSort="false"></flex:flexCol>
						  <flex:flexCol caption='组织机构' width="100" property="organName" sortName="processtype.organize" canSort="false"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="processtypequery.cmd?clear=true">
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
setTitleInTreeBar("工作流程－流程管理－流程类型列表");
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var type_ids=grid.getCellValue(i, 1);
		var type_names=grid.getCellValue(i, 2);
		grid.getCell(i, 2).innerHTML = getHref('<%=MatrixHref.getUrl("ProcessType")%>', transMatrix(type_ids,type_names));
								
	}
}
function selectNewDeptIdTree(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=1,2&isCheckBox=0&isIncludeSelf=1&isTree=1&rootId=<%=GetBspInfo.getBspInfo().getAccessRootId()%>&showOrganType=1,2";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("struid_search").value="";
	  document.all("organName").value="";
  }else{
	  document.all("struid_search").value=win[2];
	  document.all("organName").value=win[1];
  }
}
function forInsert(){
  document.forms[0].action ="processtype.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="processtype.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="processtype.cmd?method=detail";    
  document.forms[0].submit();	
}
function forProcessList(){
  if(!getSelect()) return;
  window.location.href ="processquery.cmd?clear=true&processtype_search="+grid.getCheckLine();    
  	
}
function forFormList(){
  if(!getSelect()) return;
  window.location.href  ="workformmanagerquery.cmd?clear=true&processtype_search="+grid.getCheckLine();    
  	
}
function forTaskList(){
  if(!getSelect()) return;
  window.location.href ="tasklistquery.cmd?processtype="+grid.getCheckLine();  
 	
}
function forTaskInfoList(){
  if(!getSelect()) return;
  document.forms[0].action ="taskinfoquery.cmd?processType="+grid.getCheckLine();       
  document.forms[0].submit();
}
function forDelete(){
  if(!getDelete()) return;
  var lines=grid.getCheckLineNo();
  var lineArray=lines.split(",");
  var typeName=grid.getCellValue(lineArray[0],2);
  
  for(var i=1;i<lineArray.length;i++){
  	typeName+=","+grid.getCellValue(lineArray[i],2);
  }
  document.forms[0].action ="processtype.cmd?method=delete&typeName="+typeName;    
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