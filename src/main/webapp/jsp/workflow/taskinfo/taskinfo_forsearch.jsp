<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

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
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>

<script language="javascript">

function search(){
var process_startTime=document.all("process_startTime").value;
var process_endTime=document.all("process_endTime").value;
if(process_startTime!="" && process_endTime!=""){
	if(process_endTime<process_startTime){
		alert("时间范围设置错误：开始时间不能大于结束时间！");
		return;
	}
}
document.forms[0].action="taskinfosearch.cmd?method=search";
document.forms[0].submit();	
}
function doSelectEdocType(){
	var url ="jsp/help.jsp?url=edoctypehelp.cmd&&method=getTreeRadioHelpWin";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	//alert(win);
	if(win==null)return;	
	var ret = parseTree(win);
	document.forms[0].EDOC_TYPE.value = ret[0];
	document.getElementById("edocTypeName").innerHTML=getHref('<%=MatrixHref.getUrl("EdocType")%>',ret[2]);

}
function selectCreator(){
	var url ="jsp/help.jsp?url=hrempforhelpcheckbox.cmd&EMPLOYEE_STATUS=1";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:580px;dialogHeight:450px");
	if(win==null)return;
	var ret = parseMatrix(win);
	document.all('process_creator').value=ret[0];
	document.all('process_creator_name').value=ret[1];	
	document.getElementById("process_creator_dis").innerHTML=getHref('<%=MatrixHref.getUrl("Employee")%>',ret[2]);
}
function selectEmpPart(){
var isEdocAdmin=document.all("IS_EDOC_ADMIN").value;
if("0"==isEdocAdmin){
	alert("您不是公文管理员，不能选择！");
	return;
}
	var url ="jsp/help.jsp?url=struhelp.cmd&method=getCheckEmpRoot&parentId="+document.all("ADMIN_STRU_ID").value;      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  var curobj=window.event.srcElement; 
  var result=parseTree(win);
  if(win==null)return;
  document.forms[0].user_id.value=result[0];
  document.forms[0].user_name.value=result[1];
  document.getElementById("user_dis").innerHTML=getHref("hrPerson.cmd?method=detail&primaryKey=",result[2]);
   }
function selectEmpCheckBox(){
	var url ="jsp/help.jsp?url=struhelp.cmd&method=getCheckEmpRoot";      
  	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	 var curobj=window.event.srcElement;
 	 if(win==null)return;
  	 var result=parseTree(win);
  	document.forms[0].process_creator.value=result[0];
  	document.forms[0].process_creator_name.value=result[1];
 	document.getElementById("process_creator_dis").innerHTML=getHref("hrPerson.cmd?method=detail&primaryKey=",result[2]);
	}   
</script>

</HEAD>
<div class="btnareaCss">
<html:button name="查询" value="查询" onclick="search()"></html:button>&nbsp;
</div>
<%
String adminStruId=(String)request.getAttribute("ADMIN_STRU_ID");
String adminStruPath=(String)request.getAttribute("ADMIN_STRU_PATH");
String isEdocAdmin=(String)request.getAttribute("IS_EDOC_ADMIN");
String currentOrganId=(String)request.getAttribute("CURRENT_ORGAN_ID");
String currentOrganName=(String)request.getAttribute("CURRENT_ORGAN_NAME");
String currentStruId=(String)request.getAttribute("CURRENT_STRU_ID");
%>
<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<input type="hidden" name="ADMIN_STRU_ID" value="<%=adminStruId%>">
<input type="hidden" name="ADMIN_STRU_PATH" value="<%=adminStruPath%>">
<input type="hidden" name="IS_EDOC_ADMIN" value="<%=isEdocAdmin%>">
<input type="hidden" name="CURRENT_ORGAN_ID" value="<%=currentOrganId%>">
<input type="hidden" name="CURRENT_ORGAN_NAME" value="<%=currentOrganName%>">
<input type="hidden" name="CURRENT_STRU_ID" value="<%=currentStruId%>">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent" cellspacing="0">
		<tr>
			<td class="tdLeft">
				选择类型：
	        </td>
			<td class="TdRight">
				<html:select  name="statusType" property="statusType">
				<html:option value="daiBan">待办</html:option>
	            <html:option value="yiBan">已办</html:option>
	            <html:option value="wanCheng">完成</html:option>
	          </html:select>
	        </td>
		</tr>	
		<tr>
			<td class="tdLeft">选择员工：</td>
			<td class="TdRight">
				<html:hidden name="user_id" value="<%=currentOrganId%>" write="false"/>
				<html:hidden name="user_name" value="<%=currentOrganName%>" write="false"/>
				<img src="skins/default/images/liulan.gif" onclick="selectEmpPart()" style="cursor:hand;" border="0">
            	<span id="user_dis" ></span>
			</td>
		</tr>
		<tr>
				<td class="tdLeft">创建人：</td>
		<td class="TdRight">
			<html:hidden name="process_creator" value="" write="false"/>
			<html:hidden name="process_creator_name" value="" write="false"/>
			<img src="skins/default/images/liulan.gif" onclick="selectEmpCheckBox()" style="cursor:hand;" border="0">
            <span id="process_creator_dis" ></span>
            
		</td>
		
	</tr>
	<tr>
		<td class="tdLeft">时间范围：</td>
		<td class="TdRight">
		
		
		     
			<date:date name="process_startTime"  readonly="true"  zindex="20" divname="beginDatedd" value="" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd" style="width:85">
			</date:date>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		-&nbsp;&nbsp;&nbsp;&nbsp;
		<date:date name="process_endTime"  readonly="true"  zindex="10" divname="endDatedd" value="" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd" style="width:85">
			</date:date><input style="visibility:hidden">
			
			
		</td>
	</tr>
		
		<html:hidden name="processType" property="processType" write="false"/>
		<html:hidden name="reserveStr" property="reserveStr" write="false"/>
		<%
		Map m=(Map)request.getAttribute("reserveMap");
		%>
		
		<tr>
			<td class="tdLeft"><%=(String)m.get("SUBJECT")%>：</td>
			<td class="TdRight"><html:text name="SUBJECT" property="SUBJECT" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("EDOC_TYPE")%>：</td>
			<td class="TdRight"><html:hidden name="EDOC_TYPE" property="EDOC_TYPE" write="false"/><img src="skins/default/images/liulan.gif" onclick="doSelectEdocType()" style="cursor:hand;" border="0"><span id="edocTypeName"></span></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("SECRET_LEVEL")%>：</td>
			<td class="TdRight"><html:text name="SECRET_LEVEL" property="SECRET_LEVEL" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("KEEP_SECRET_TIME")%>：</td>
			<td class="TdRight">
			<date:date name="KEEP_SECRET_TIME"  readonly="true" zindex="18"  divname="keepSecretTimedd" value="" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
			</date:date><input style="visibility:hidden">			
			
			</td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("INSTANT_LEVEL")%>：</td>
			<td class="TdRight"><html:text name="INSTANT_LEVEL" property="INSTANT_LEVEL" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("CREATE_ORGAN")%>：</td>
			<td class="TdRight"><html:text name="CREATE_ORGAN" property="CREATE_ORGAN" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("WORD_NUMBER")%>：</td>
			<td class="TdRight"><html:text name="WORD_NUMBER" property="WORD_NUMBER" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("MAIN_SEND_ORGAN")%>：</td>
			<td class="TdRight"><html:text name="MAIN_SEND_ORGAN" property="MAIN_SEND_ORGAN" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("APPROVE_DATE")%>：</td>
			<td class="TdRight">
			<date:date name="APPROVE_DATE"  readonly="true" zindex="17"  divname="approveDatedd" value="" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
			</date:date><input style="visibility:hidden">			
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("KEYWORD")%>：</td>
			<td class="TdRight"><html:text name="KEYWORD" property="KEYWORD" size="50"/><font color=red>[多个<%=(String)m.get("KEYWORD")%>之间请用空格分隔]</font></td>
		</tr>																		
		<tr>
			<td class="tdLeft"><%=(String)m.get("COPY_SEND_ORGAN")%>：</td>
			<td class="TdRight"><html:text name="COPY_SEND_ORGAN" property="COPY_SEND_ORGAN" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("OUTER_SEND_ORGAN")%>：</td>
			<td class="TdRight"><html:text name="OUTER_SEND_ORGAN" property="OUTER_SEND_ORGAN" size="50"/></td>
		</tr>
		<tr>
			<td class="tdLeft"><%=(String)m.get("CREATE_DATE")%>：</td>
			<td class="TdRight">
						<date:date name="CREATE_DATE"  readonly="true" zindex="16"  divname="createDatedd" value="" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
			</date:date><input style="visibility:hidden">
			</td>
		</tr>	
		<tr>
			<td class="tdLeft"><%=(String)m.get("APPROVE_USER_ID")%>：</td>
			<td class="TdRight"><html:text name="APPROVE_USER_ID" property="APPROVE_USER_ID" size="50"/></td>
		</tr>							
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("专业公文－查询管理－公文查询");
var tmpwin= new Array();
tmpwin[0]=document.all("CURRENT_ORGAN_ID").value;
tmpwin[1]=document.all("CURRENT_ORGAN_NAME").value;
tmpwin[2]=document.all("CURRENT_STRU_ID").value;
var twin=parseTree(tmpwin);
document.getElementById("user_dis").innerHTML=getHref("hrPerson.cmd?method=detail&primaryKey=",twin[2]);
</script>