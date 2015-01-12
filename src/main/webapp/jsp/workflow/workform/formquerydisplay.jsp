<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>	
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>	
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/extendString.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/formVerify.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/formverify/runFormVerify.js"></script>
<script language="javascript" src="jsp/workflow/resource/js/wfoption.js"></script>
<!--特殊处理域方法-->
<script language="javascript" src="jsp/workflow/resource/js/specialField.js"></script>
<SCRIPT language="JavaScript" src="jsp/workflow/resource/js/object.js"></SCRIPT>
<!--正文处理-->
<SCRIPT language="JavaScript" src="jsp/workflow/resource/js/office.js"></SCRIPT>
<!--表单的处理-->
<SCRIPT language="JavaScript" src="jsp/workflow/resource/formeditor/DefFormFunction.js"></SCRIPT>
<script language="javascript">
function selectCreator(){
	var url ="struhelp.cmd?method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=1&isTree=1";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	if(win==null){
		return;
	}else if(typeof(win)=="string"&&win==""){
		document.all('process_creator').value="";
		document.all('process_creator_name').value="";	
		document.getElementById("process_creator_dis").innerHTML="";
	}else{
		//var ret = parseMatrix(win);
		document.all('process_creator').value=win[0];
		document.all('process_creator_name').value=win[1];	
		document.getElementById("process_creator_dis").innerHTML=win[1];//getHref('<%=MatrixHref.getUrl("Employee")%>',ret[2]);
	}
}
function forQuery(){
	var startTime=document.all("process_startTime").value;
	var endTime=document.all("process_endTime").value;
	if(startTime!="" && endTime!=""){
		if(startTime>endTime){
			alert("结束日期不能小于开始日期！");
			return;
		}
	}
  document.forms[0].action ="formdataquery.cmd?method=query";    
  document.forms[0].submit();	
}
function forReturn(){
  window.location.href ="workformforquery.cmd";    
}
</script>
</HEAD>


<BODY topmargin="10px">
<html:form name="frmList" action="">
<input type="hidden" name="formId" value="<%=request.getParameter("formId")%>">
<input type="hidden" name="processType" value="<%=request.getParameter("processType")%>">
<div align="right">
<html:button onclick="forQuery()" name="btn_forquery" value="查询"></html:button>
<html:button onclick="forReturn()" name="btn_forreturn" value="返回"></html:button>
</div>
  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent"> 
		<tr>
			<td class="tdLeft">类型：</td>
			<td class="TdRight">
				<select  name="process_kind">
					<option value="daiBan" selected>待办</option>
					<option value="yiBan">已办</option>
					<option value="wanCheng">完成</option>
				</select>	
			</td>
		</tr> 
			
		<tr>
			<td class="tdLeft">时间范围：</td>
			<td class="TdRight">
						<date:date name="process_startTime" zindex="20" divname="process_startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"> - <date:date name="process_endTime" zindex="20" divname="process_endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden">		
			</td>
		</tr>
		<tr>
			<td class="tdLeft">创建人：</td>
			<td class="TdRight">
			<img src="skins/default/images/liulan.gif" onclick="selectCreator()" style="cursor:hand;" border="0">
            <html:hidden name="process_creator" value="" write="false"/>
			<html:hidden name="process_creator_name" value="" write="false"/>
            <span id="process_creator_dis" ></span>						
			</td>
		</tr>
							
<tr><td colspan="2">
<fieldset class="FieldsetCss"><legend>表单查询条件</legend>
<%
 String html=(String)request.getAttribute("FormData.QueryForm");
 out.println(html);
%>
</fieldset>
</td></tr>
</table>
</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程－查询管理－表单查询");
</script>