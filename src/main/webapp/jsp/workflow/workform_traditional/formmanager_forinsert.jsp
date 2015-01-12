<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>表单定制增加</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/formanager.js"></script>

</HEAD>
<%
String rootId=(String)request.getAttribute("rootStruId");
String organId=(String)request.getAttribute("rootOrganId");
String organName=(String)request.getAttribute("rootOrganName");
%>
<body topmargin="10px" onload="setTitleInTreeBar('工作流程－流程管理－增加表单');initFormEditor(0)">
<div class="btnareaCss">
<html:button onclick="forSave('formmanager.cmd?method=insert')" name="btn_insert" value="保存"></html:button>&nbsp;<html:button onclick="forReturn()" name="btn_delete"  value="返回"></html:button>
</div>
<html:form  name="frmlist"  action="">

<INPUT TYPE="hidden" name="Ins_formXml">	 				                  
<INPUT TYPE="hidden" name="Ins_template">
<INPUT TYPE="hidden" name="Ins_html-code">
<INPUT TYPE="hidden" name="print-template">
<INPUT TYPE="hidden" name="text-template">
<% 
   String processtype_search = request.getParameter("processtype_search");
   if(request.getParameter("processtype_search")==null)
	  {processtype_search ="";}
%>
<input type="hidden" name="processtype_search" value="<%=processtype_search%>">
	<input type="hidden" name="processtype" value='<%=request.getParameter("processtype")%>'>
	<textarea style="display: none" name="FormConfigUrls">
			<%=(String)request.getAttribute("WorkForm.FormConfigUrls")%>
	</textarea>	

<table width="100%" height="95%" cellpadding="0" class="tblContent" cellspacing="0">  
<tr>
	<td class="tdLeft">所属组织机构：</td>
	<td class="tdRight"><INPUT TYPE="hidden" name="Ins_organize-id" value="<%=organId%>"/><INPUT TYPE="text" name="Ins_organize-name" value="<%=organName%>" size="30" maxlength="30" readonly="true" onchange="checkinputNullInDcWork ('Ins_organize-id','organize_span')"/><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectNewDeptIdTree('<%=rootId%>')"><span id="organize_span" class="xinghaoCss">*</span></td>
</tr>                                 								
<tr>
	<td colspan="2"><iframe name="formEditor" frameborder="1" 
			marginheight="0" marginwidth="0" scrolling="no"  width="100%" height="100%" src="<%=request.getContextPath()%>/jsp/workflow/resource/formeditor_traditional/Mbtool.html">
	</td>
</tr>
</table>
</html:form>
</BODY>
</HTML>