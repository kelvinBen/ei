<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<HTML>
<HEAD>
<TITLE>工作流帮助</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<% 
    String processtype = request.getParameter("processtype");
	if (processtype==null){
	  processtype="";
	}
    String organId = (String)request.getAttribute("organId");
	if (organId==null){
	  organId="";
	}	

%>

<widgets:container title="工作流信息" >
<html:form name="frmList" action="processhelpurlquery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<td>工作流类型:</td>
    <td><flex:searchSelect name="processtype" searchName="CRM_CUSTOMER.CUSTOMER_NAME" dataType="java.lang.String" operSymbol="=" value="<%=processtype%>">
		<option></option>
		<html:options collection="ProcessTypeList" labelProperty="name" property="physicalname"/>
	</flex:searchSelect>
	</td>
	<td><flex:searchImg name="chaxun" action="processhelpurlquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<input type="hidden" name="organId" value="<%=organId%>"/>
<table border=0 width=100%>

<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                        <flex:radioCol caption="选择" width="100" property="procDefId" name="procDefId" sortName="process.procDefId"></flex:radioCol>
                        <flex:flexCol caption='隐藏列' width="100" property="procDefId" sortName="process.procDefId" style="display:none"></flex:flexCol>
						<flex:flexCol caption='名称' width="100" property="procDefName" sortName="process.procDefName"></flex:flexCol>      <flex:flexCol caption='隐藏列' width="100" property="formid" sortName="process.formid" style="display:none"></flex:flexCol>                    
                          <flex:flexCol caption='描述' width="100" property="description" sortName="process.description"></flex:flexCol> 
						  
        </support:flexgrid>
<flex:pagePolit action="processhelpurlquery.cmd" pageSize="15">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td></tr></table></div>
</html:form>	
</widgets:container>
<script language="javascript">
function init(){
	grid.show();
}

function getSelect(){
if(grid.getCurrentLine()==null){
	alert("请选择一条记录！");
	return false;
}
  return true;
}
//返回值:流程id，流程名称name
function doConfirm(){
	if(!getSelect()) return;
         var row=grid.getCurrentLine();
	 var result=new Array();
	 var val=new Array();
	 val["primary-value"]=grid.getCellValue(row,2);
	 val["display-str"]=grid.getCellValue(row,3);
	 val["display-url"]='<%=MatrixHref.getUrl("Process")%>'+grid.getCellValue(row,2);
	 result[0]=val;
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function doClose(){
	parent.close();
}
</script>