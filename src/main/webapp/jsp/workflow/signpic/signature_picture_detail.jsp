
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ page import="net.mast.workflow.wfclient.utils.ClientUtils"%>
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
<%
	String person_name=request.getParameter("person_name");
	if(person_name==null){
		person_name="";
	}
	String person_id=request.getParameter("person_id");
	if(person_id==null){
		person_id="";
	}
%>
</HEAD>

<BODY topmargin="10px">

<div class="btnareaCss">
<html:button name="forDelete" value='ɾ��' onclick="forDelete()"></html:button>
<html:button name="forreturn" value='����' onclick="forReturn()"></html:button>
</div>

<html:messages/>

<html:form  name="frmList" method="post"  action="">
<fieldset class="FieldsetCss"><legend>ͼƬǩ��</legend>
<table id="tblSearch">
	<tr>
	<td nowrap>��Ա��<%=person_name%> 	<input type="hidden" name="person_id" value="<%=person_id%>" size="10">
	<input type="hidden" name="person_name" value="<%=person_name%>" size="10">
	</td>
	</tr>
	<tr>
	<td valign = "center"  > ǩ��ͼƬ��</td>
	<td><br><img src="<%=ClientUtils.getRootUrl(request) %>/pics/default/<%=person_id %>.jpg" />
	</td>
	</tr>
</table>
</fieldset>

</html:form>

<script type="text/javascript">
setTitleInTreeBar("ǩ��ͼƬ-��ϸ");
function forDelete(){
	if(!confirm("ȷ��Ҫɾ����ǩ��ͼƬ��")){
		return;
	}
	document.forms[0].action="signpic.cmd?method=delete";
	document.forms[0].submit();
}
function forReturn(){
	window.location.href="signpic.cmd?method=query";
}

</script>
</body>

	