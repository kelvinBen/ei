<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<jsp:useBean id="FormDetail" type="java.util.Map" scope="request"/>
<HTML>
<HEAD>
<TITLE>表单定制修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/formanager.js"></script>
</HEAD>
<BODY topmargin="10px" onLoad="setTitleInTreeBar('工作流程－流程管理－修改表单');initFormEditor(1)">
<div class="btnareaCss">
<html:button onclick="forSave('formmanager.cmd?method=update')" name="btn_update" value="保存"></html:button>&nbsp;<html:button onclick="forSaveOther('formmanager.cmd?method=insert')" name="btn_saveother" value="另存为"></html:button>&nbsp;<html:button onclick="forCreateTable('formmanager.cmd?method=update')" name="btn_createTable" value="建表"></html:button>&nbsp;<html:button onclick="forReturn()" name="btn_delete"  value="返回"></html:button>
</div>
<html:form  name="frmList"  action="">
<INPUT type="hidden" name="processtype" value="<%=FormDetail.get("process-type")%>">
<% 
   String processtype_search = request.getParameter("processtype_search");
   if(processtype_search==null)
	  {processtype_search ="";}
%>
<INPUT type="hidden" name="processtype_search" value="<%=processtype_search%>">
<INPUT type="hidden" name="form-id" value="<%=FormDetail.get("form-id")%>">
<TEXTAREA style="display: none" name="Ins_formXml"><%=FormDetail.get("formXml")%></TEXTAREA>
<TEXTAREA style="display: none" name="Ins_template"><%=FormDetail.get("template")%></TEXTAREA>
<TEXTAREA style="display: none" name="Ins_html-code"><%=FormDetail.get("html-code")%></TEXTAREA>								
<TEXTAREA style="display: none" name="print-template"><%=FormDetail.get("print-template")%></TEXTAREA>
<TEXTAREA style="display: none" name="text-template"><%=FormDetail.get("text-template")%></TEXTAREA>									
<textarea style="display: none" name="FormConfigUrls"><%=(String)request.getAttribute("WorkForm.FormConfigUrls")%></textarea>
			
<table width="100%" height="95%" cellpadding="0" class="tblContent" cellspacing="0">  
<tr>
	<td class="tdLeft">所属组织机构：</td>
	<td class="TdRight"><INPUT TYPE="hidden" name="Ins_organize-id" property="Ins_organize-id" value="<%=FormDetail.get("organize-id")%>"/><INPUT TYPE="text" name="Ins_organize-name" property="Ins_organize-name" size="30" maxlength="30" readonly="true" value="<%=FormDetail.get("organize-name")%>" onchange="checkinputNullInDcWork ('Ins_organize-id','organize_span')"/><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selectNewDeptIdTree('<%=GetBspInfo.getBspInfo().getAccessRootId()%>')"> <span id="organize_span" class="xinghaoCss">*</span>
	</td>
</tr>
<tr>
	<td colspan="2">
	<iframe name="formEditor" frameborder="1" marginheight="0" marginwidth="0" scrolling="no"  width="100%" height="100%" src="<%=request.getContextPath()%>/jsp/workflow/resource/formeditor_traditional/Mbtool.html">
	</td>
</tr>
</table>
				
</html:form>
</BODY>
</HTML>
