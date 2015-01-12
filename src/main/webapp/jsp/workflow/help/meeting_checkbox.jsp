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
<TITLE>选择会议</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>


<html:form name="frmList" action="">
<fieldset class="FieldsetCss" ><legend>查询条件</legend>
<table id="tblSearch">
			<tr>
				<td ><%=ResourcesFactory.getString("M.ACTION_MAIN.WORK_TYPE_CODE")%>：</td>
				<td >
					<html:select name="meetingTypeId"  property="meetingTypeId">
						<html:option value="">所有</html:option>
						<html:options collection="meetingtypelist" property="typeId" labelProperty="typeName"/>
					</html:select>
				</td>				
				
				<td ><%=ResourcesFactory.getString("M.ACTION_MAIN.STATUS_CODE")%>：</td>				
				<td >
					<html:select name="statusCode"  property="statusCode">
						<html:option value="">所有</html:option>
						<html:options collection="statuscodelist" property="value" labelProperty="label"/>
					</html:select>				
				</td>	
				<td><input name="chaxun" type="image" src="<mast:ui img='search.gif'/>"></td>
			</tr>
</table>
</fieldset>

<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                        
                          <flex:checkboxCol caption='选择' width="50" property="ACTION_ID"  name="primaryKey" sortName="ACTION_MAIN.ACTION_ID"></flex:checkboxCol>
                          <flex:flexCol caption='<%=ResourcesFactory.getString("M.ACTION_MAIN.ACTION_ID")%>' width="150" property="ACTION_ID" name="actionId" sortName="ACTION_MAIN.ACTION_ID" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='<%=ResourcesFactory.getString("M.ACTION_MAIN.ACTION_NAME")%>' width="250" property="ACTION_NAME" name="actionName" sortName="ACTION_MAIN.ACTION_NAME"></flex:flexCol>                          
                          
</support:flexgrid>
<flex:pagePolit action="wfmeetinghelp.cmd">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">取 消</button></td>
</html:form>	

<script language="javascript">
grid.show();
function doConfirm(){
	var r=getResult();
    window.returnValue=r;
    parent.close();	
}
function getResult(){
	var returnV=new Array();
	var result = new Array();
	var sss=grid.getCheckAll();
    if(sss==null||sss==""){
    	returnV["primary-value"]="";
    	returnV["display-str"]="";
    	returnV["display-url"]="";
		result[0]=returnV;
    	return result;
    }
    var rows=sss.split("|");
    if(typeof(rows.length)=="undefined"){
		var cells=rows.split(",");
		returnV["primary-value"]=cells[0];
		returnV["display-str"]=cells[2];
		returnV["display-url"]='<%=MatrixHref.getUrl("Meeting")%>'+cells[0];
		result[0]=returnV;
    	return result;
    }
    var r0="";
    var r1="";
    var r2="";
    for(var i=0;i<rows.length;i++){
    	var cells=rows[i].split(",");
		var rv=new Array();
		rv["primary-value"]=cells[0];
		rv["display-str"]=cells[2];
		rv["display-url"]='<%=MatrixHref.getUrl("Meeting")%>'+cells[0];
		result[i]=rv;
	}
	return result;
}
function doCancel(){
	parent.close();
}

</script>