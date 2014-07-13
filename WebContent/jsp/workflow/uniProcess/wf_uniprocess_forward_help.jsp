<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>通用流程</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/wfoption.js"></script>
<%
	String processId=request.getParameter("processId");
	if(processId==null) processId="";
	String processName=request.getParameter("processName");
	if(processName==null) processName="";
	String formId=request.getParameter("formId");
	if(formId==null) formId="";
	String dataId=request.getParameter("dataId");
	if(dataId==null) dataId="";
	String imgHelp = SkinUtils.getImage(request,"liulan.gif");
	
%>

</HEAD>
<BODY topmargin="10px">
<base target="_self">
<html:form  name="frmList"  action="">
<br>
<div align="center">
<table width="100%" cellpadding="0" class="tblContent">
<tr>
<td class="tdTitle">接收人：</td>
<td class="tdRight">
<img src="<%=imgHelp%>" onclick="selectNewUsers()" style="cursor:hand;" border="0">
<html:hidden name="newUserIds" value=""  />
<html:text name="newUserNames" value="" readonly="true" size="20" />
<span id="newUsersDiv2" class="xinghaoCss">*</span>
</td>
</tr>  
<tr>
<td class="tdTitle">转发时</td>
<td class="tdRight">
<html:select name="withOpn" value="3">
<html:option value="2" >附带个人意见</html:option>
<html:option value="0" >不附带意见</html:option>
</html:select>
</td>
</tr>  
<tr>
<td class="tdTitle" width="100%" colspan="2" ><%=ResourcesFactory.getString("WF_UNIPROCESS.OPINION")%>：
</td></tr>
<tr><td class="tdRight" colspan="2" align="center">
<html:textarea name="opinion" value="" rows="10" cols="62" ></html:textarea>
</td></tr>         
</table>
<div align="center">
<br>
<html:button name="btn_forFW" value="确定" onclick="forForward()" ></html:button>
<html:button name="btn_forReturn" value="取消" onclick="forReturn()" ></html:button>
</div>
<html:hidden name="processid" value="<%=processId%>"  />
<html:hidden name="processname" value="<%=processName%>"  />
<html:hidden name="formid" value="<%=formId%>"  />
<html:hidden name="dataid" value="<%=dataId%>"  />

<html:hidden name="fromProcess" value="true"> </html:hidden>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function checkWfUniprocess(){
	var newUserNames=document.forms[0].newUserNames;
	if (trim(newUserNames.value)=="")
	{
	  alert("请选择接收人！");    
	  return false;
	}
    newUserNames.value = trim(newUserNames.value) ;
    
 	var opinion = document.forms[0].opinion;
	if (trim(opinion.value)=="")
	{
	  alert("请输入个人意见！");    
	  return false;
	}
    opinion.value = trim(opinion.value) ;
 	return true
}
function forForward(){
	if(!checkWfUniprocess()) return;
		
 	document.forms[0].action="<%=ClientUtils.getRootUrl(request) %>wfuniprocess.cmd?method=forward";
 	document.forms[0].submit();
}
function forReturn(){
  window.parent.close();	
}
function selectNewUsers(){
	var url ="<%=ClientUtils.getRootUrl(request) %>struhelp.cmd?method=getSelectRoot&isTree=1&isCheckBox=1&isIncludeSelf=0&organType=8&rootId=1&mustSelect=true";    
 	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
 	//取消
 	if (win==null) return;
 	//清除
	if(typeof(win)=="string"){
		document.forms[0].newUserIds.value="";
 		document.forms[0].newUserNames.value="";
	}
 	//确定 organId#organName,organId#organName
 	var organIdNames=win[4];
 	var ids="";
 	var names="";
 	var idNamesArr=organIdNames.split(",");
 	for(var i=0;i<idNamesArr.length;i++){
 		if(ids==""){
 			ids=idNamesArr[i].split("#")[0];
 			names=idNamesArr[i].split("#")[1];
 		}else{
 			ids+=","+idNamesArr[i].split("#")[0];
 			names+=","+idNamesArr[i].split("#")[1];
 		}
 	}
 	document.forms[0].newUserIds.value=ids;
 	document.forms[0].newUserNames.value=names;
}
</script>