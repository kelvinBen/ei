<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>通用流程查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String id = request.getParameter("idSearch");
	if (id==null){
	  id="";
	}
    String processid = request.getParameter("processidSearch");
	if (processid==null){
	  processid="";
	}
    String processname = request.getParameter("processnameSearch");
	if (processname==null){
	  processname="";
	}
    String subject = request.getParameter("subjectSearch");
	if (subject==null){
	  subject="";
	}
    String formid = request.getParameter("formidSearch");
	if (formid==null){
	  formid="";
	}
    String dataid = request.getParameter("dataidSearch");
	if (dataid==null){
	  dataid="";
	}
    String userid = request.getParameter("useridSearch");
	if (userid==null){
	  userid="";
	}
    String username = request.getParameter("usernameSearch");
	if (username==null){
	  username="";
	}
    String olduserid = request.getParameter("olduseridSearch");
	if (olduserid==null){
	  olduserid="";
	}
    String oldusername = request.getParameter("oldusernameSearch");
	if (oldusername==null){
	  oldusername="";
	}
    String opndate = request.getParameter("opndateSearch");
	if (opndate==null){
	  opndate="";
	}
    String fwdate = request.getParameter("fwdateSearch");
	if (fwdate==null){
	  fwdate="";
	}
	String status = request.getParameter("statusSearch");
	if (status==null){
		status="";
	}
%>
<div class="btnareaCss" >
<html:button name="btn_forDeal" value="处理" onclick="forDeal()" ></html:button>
<html:button name="btn_forDelete" value="删除" onclick="forDelete()" ></html:button>
</div>
<html:messages></html:messages>
<html:form name="frmList" action="wfuniprocessquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>流程名称：<flex:searchText name="processnameSearch" searchName="WF_UNIPROCESS.PROCESSNAME" dataType="java.lang.String" operSymbol="=" value="<%=processname%>" size="12">
	</flex:searchText></td>
    <td>流程标题：<flex:searchText name="subjectSearch" searchName="WF_UNIPROCESS.SUBJECT" dataType="java.lang.String" operSymbol="=" value="<%=subject%>" size="12">
	</flex:searchText></td>
    <td>转发人名称：<flex:searchText name="oldusernameSearch" searchName="WF_UNIPROCESS.OLDUSERNAME" dataType="java.lang.String" operSymbol="=" value="<%=oldusername%>" size="12">
	</flex:searchText></td>
	<td>状态：
	<flex:searchSelect name="statusSearch" searchName="WF_UNIPROCESS.STATUS" dataType="java.lang.String" operSymbol="=" value="<%=status%>" >
		<html:option value=""></html:option>
		<html:option value="0">未处理</html:option>
		<html:option value="1">已处理</html:option>
	</flex:searchSelect></td>
    
	<td><flex:searchImg name="chaxun" action="wfuniprocessquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<fieldset class="FieldsetCss"><legend>通用流程任务列表</legend>
<flex:flexgrid name="grid" height="200" action="" isSubmit="false">
	<flex:checkboxCol caption="选择" width="50" property="id" name="primaryKey" sortName="WF_UNIPROCESS.ID"></flex:checkboxCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.PROCESSID")%>' width="100" property="processid" sortName="WF_UNIPROCESS.PROCESSID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.PROCESSNAME")%>' width="100" property="processname" sortName="WF_UNIPROCESS.PROCESSNAME"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.SUBJECT")%>' width="100" property="subject" sortName="WF_UNIPROCESS.SUBJECT"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.FORMID")%>' width="100" property="formid" sortName="WF_UNIPROCESS.FORMID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.DATAID")%>' width="100" property="dataid" sortName="WF_UNIPROCESS.DATAID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.USERID")%>' width="100" property="userid" sortName="WF_UNIPROCESS.USERID" style="display:none" ></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.USERNAME")%>' width="100" property="username" sortName="WF_UNIPROCESS.USERNAME" style="display:none" ></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.OLDUSERID")%>' width="100" property="olduserid" sortName="WF_UNIPROCESS.OLDUSERID" style="display:none" ></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.OLDUSERNAME")%>' width="100" property="oldusername" sortName="WF_UNIPROCESS.OLDUSERNAME"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.OPNDATE")%>' width="120" property="opndate" sortName="WF_UNIPROCESS.OPNDATE"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.FWDATE")%>' width="120" property="fwdate" sortName="WF_UNIPROCESS.FWDATE"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.STATUS")%>' width="60" property="status" sortName="WF_UNIPROCESS.STATUS" type="enum" enumCollection="uniProcessStatusCollection" enumKey="key" enumValue="value" ></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="wfuniprocessquery_page_init.cmd" pageSize="15">
</flex:pagePolit>
</fieldset>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
grid.show();
grid.setSumText("");
}
for(var i=1;i<grid.returnRowCount()+1;i++){
	var id=grid.getCellValue(i, 1);
	var processId=grid.getCellValue(i,2);
	var processName=grid.getCellValue(i, 3);
	var subject=grid.getCellValue(i, 4);
	 
	grid.getCell(i, 3).innerHTML ="<span nowrap='true' title='"+processName+"'><a href=\"javascript:forDeal2('"+id+"','"+processId+"')\">"+processName+"</a></span>";
	grid.getCell(i, 4).innerHTML ="<span nowrap='true' title='"+subject+"' ><a href=\"javascript:forDeal2('"+id+"','"+processId+"')\">"+subject+"</a></span>";
}
function forInsert(){
  document.forms[0].action ="wfuniprocess.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="wfuniprocess.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="wfuniprocess.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="wfuniprocess.cmd?method=delete";    
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
function forDeal(){
	if(!getSelect()) return;
	var row=grid.getCheckLineNo();
	var id=grid.getCellValue(row,1);
	var processId=grid.getCellValue(row,2);
  	forDeal2(id,processId);
}
function forDeal2(id,processId){
	document.forms[0].action ="wfuniprocess.cmd?method=forDeal&id="+id+"&processId="+processId;    
  	document.forms[0].submit();
}
</script>