<%@ page contentType="text/html;charset=GBK" %>
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


</HEAD>
<%
String isSave=request.getParameter("isSave");
if(isSave==null || isSave.equals(""))isSave="0";
String saveUrl=request.getParameter("SAVE_RETURN_URL");
String extReturlUrl=(String)request.getAttribute("EXT_RETURN_URL");
String reqUrl=(String)request.getAttribute("SAVE_RETURN_URL");
String forwardUrl="";
if(isSave.equals("1")){
	//˵���Ǳ������
	if(reqUrl!=null && !"".equals(reqUrl))
	{forwardUrl=reqUrl;}//˵���ǵ�һ�����ڴ�������
	else 
	{forwardUrl=saveUrl;}//˵���Ǳ������
    }else{
    //���Ǳ����������ת������ҳ��
	forwardUrl=extReturlUrl;
}
%>
<BODY topmargin="10px">
<div class="btnareaCss">
<html:button name="ȷ��" value="ȷ��" onclick="forReturn();"></html:button>
</div>
<html:form  name="frmList"  action="">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturlUrl%>">
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0">
		<tr>
			<td align="center">
				<font color=red size=4><html:messages/></font>
	          </td>
		</tr> 				                  
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn(){
  var action = '<%=forwardUrl%>';
  document.forms[0].action = action;
  document.forms[0].submit();
}
setTitleInTreeBar("�������̣����������������");
</script>