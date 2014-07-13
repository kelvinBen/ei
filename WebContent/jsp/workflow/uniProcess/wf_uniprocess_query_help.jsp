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
<base target="_self" >
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
	String status = request.getParameter("statusSearch");
	if (status==null){
		status="";
	}
	String hasSelf = request.getParameter("hasSelf");
	if (hasSelf==null){
		hasSelf="false";
	}
%>

<html:form name="frmList" action="wfuniprocessquery_page_init.cmd">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
<flex:searchHidden name="processidSearch" searchName="WF_UNIPROCESS.PROCESSID" dataType="java.lang.String" operSymbol="=" value="<%=processid%>" ></flex:searchHidden>
<flex:searchHidden name="helpQuery" searchName="WF_UNIPROCESS.helpQuery" dataType="java.lang.String" operSymbol="=" value="true" ></flex:searchHidden>
	<tr>
	<td>状态：
	<flex:searchSelect name="statusSearch" searchName="WF_UNIPROCESS.STATUS" dataType="java.lang.String" operSymbol="=" value="<%=status%>" >
		<html:option value=""></html:option>
		<html:option value="0">未处理</html:option>
		<html:option value="1">已处理</html:option>
	</flex:searchSelect></td>
	<td>&nbsp;包含自己的任务：<flex:searchSelect name="hasSelf" searchName="WF_UNIPROCESS.hasSelf" dataType="java.lang.String" operSymbol="=" value="<%=hasSelf%>" >
		<html:option value="true">是</html:option>
		<html:option value="false">否</html:option>
	</flex:searchSelect>
	</td>
	<td><flex:searchImg name="chaxun" action="wfuniprocessquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<fieldset class="FieldsetCss"><legend>通用流程任务列表</legend>
<flex:flexgrid name="grid" height="200" action="" isSubmit="false">
	<flex:flexCol caption="选择" width="50" property="id" name="primaryKey" sortName="WF_UNIPROCESS.ID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.PROCESSID")%>' width="100" property="processid" sortName="WF_UNIPROCESS.PROCESSID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.PROCESSNAME")%>' width="100" property="processname" sortName="WF_UNIPROCESS.PROCESSNAME" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.SUBJECT")%>' width="100" property="subject" sortName="WF_UNIPROCESS.SUBJECT" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.FORMID")%>' width="100" property="formid" sortName="WF_UNIPROCESS.FORMID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.DATAID")%>' width="100" property="dataid" sortName="WF_UNIPROCESS.DATAID" style="display:none"></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.USERID")%>' width="100" property="userid" sortName="WF_UNIPROCESS.USERID" style="display:none" ></flex:flexCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("WF_UNIPROCESS.USERNAME")%>' width="100" property="username" sortName="WF_UNIPROCESS.USERNAME"  ></flex:flexCol>
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
<script language="javascript">
function init(){
	grid.show();
	grid.setSumText("");
}

</script>