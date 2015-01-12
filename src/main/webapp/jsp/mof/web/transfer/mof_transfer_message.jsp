<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>

<HTML>
<HEAD>
<TITLE>导入模型明细</TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"flexgrid.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<BODY topmargin="10px">
<html:form method="post" action="">
<widgets:container title="导入结果">
<widgets:containbutton name="messBtn" onclick="doShow();" text="显示删除信息"></widgets:containbutton>
<widgets:containbutton name="generateBtn" onclick="doGenerate();" text="模型同步"></widgets:containbutton>
<widgets:containbutton onclick="javascript:window.history.go(-1)" text="返回"></widgets:containbutton>
<html:form action="">
<table name="a" cellspacing='0' class="tblContent" width="100%" >
	<tr>
	    <td class="tdTitle">导入成功的模型文件</td>
	    <td class="tdRight"><html:hidden name="successFiles" property="successFiles" write="true"/></td>
	</tr>
	<tr>
	    <td class="tdTitle">导入失败的模型文件</td>
	    <td class="tdRight"><html:hidden name="failFiles" property="failFiles" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle">是否覆盖</td>
	<td class="tdRight"><html:hidden name="override" property="override" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle">删除冗余模型:</td>
	<td class="tdRight"><html:hidden name="delete" property="delete" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"></td><td class="tdTitle"></td>
	</tr>
	<tr>
	<td class="tdRight" colspan="2">
	<div id="MESSAGE" name="MESSAGE" style="display:none;overflow:auto;height:250px">
	<%
	List propList= (List)request.getAttribute("propList");
	if(propList==null)propList = new ArrayList();
	List actvityList = (List)request.getAttribute("actvityList" );
	if(actvityList==null)actvityList = new ArrayList();
	List detailList= (List)request.getAttribute("detailList");
	if(detailList==null)detailList = new ArrayList();
	List conList= (List)request.getAttribute("conList");
	if(conList==null)conList = new ArrayList();
	List fieldList= (List)request.getAttribute("fieldList");
	if(fieldList==null)fieldList = new ArrayList();
	List tabList= (List)request.getAttribute("tabList");
	if(tabList==null)tabList = new ArrayList();
	List colList= (List)request.getAttribute("colList");
	if(colList==null)colList = new ArrayList();
	out.print("<br>删除流程属性:"+propList);
	out.print("<br><hr>删除流程环节:"+actvityList);
	out.print("<br><hr>删除对象关系明细:"+detailList);
	out.print("<br><hr>删除自定义查询条件:"+conList);
	out.print("<br><hr>删除窗口域:"+fieldList);
	out.print("<br><hr>删除窗口TAB:"+tabList);
	out.print("<br><hr>删除对象属性:"+colList);
	%>
	</div>
	</td>
	</tr>
</table>
<span><font color=red>请检查日志文件[mof.log]确认导入模型过程中操作是否正常执行！</red></span>
<hr>
<input type="hidden" name="isShow" value="0" />
</html:form>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
var isShow="0";
function doShow()
{    
	var isShow=document.forms[0].isShow.value;
	if(isShow=="0"){
		document.forms[0].messBtn.innerText="隐藏删除信息";
		document.getElementById("MESSAGE").style.display="block";
		document.forms[0].isShow.value="1";
	}
	else{
		document.forms[0].messBtn.innerText="显示删除信息";
		document.getElementById("MESSAGE").style.display="none";
		document.forms[0].isShow.value="0";
	}
}
function doGenerate(){
window.location.href="generator.cmd?method=synchronModel";
}
</script>