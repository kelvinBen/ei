<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE>����������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<% 
    String processtype = request.getParameter("processtype");
	if (processtype==null){
	  processtype="";
	}	
    String organId = (String)request.getAttribute("organId");
	if (organId==null){
	  organId="";
	}	
	
	String processname = request.getParameter("processname");
	if (processname==null){
	  processname="";
	}
%>

<table width="100%" class="TabTitleCss" cellspacing=0 cellpadding=0>
	<TR>
		<TD>ѡ������</td>
	</tr>
</table>
<html:form name="frmList" action="processhelpquery.cmd">
<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">

<flex:search>
	<tr>
	<td nowrap>����������:</td>
    <td><flex:searchSelect name="processtype" searchName="processtype.type" dataType="java.lang.String" operSymbol="=" value="<%=processtype%>">
		<option></option>
		<%--<html:options collection="ProcessTypeList" labelProperty="name" property="physicalname"/>
	--%></flex:searchSelect>
	</td>
	<td nowrap>����:</td><td><input type="text" name="processname" value="<%=processname%>" size="15"></td>
	<td><flex:searchImg name="chaxun" action="processhelpquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<table border=0 width=100%>
<input type="hidden" name="organId" value="<%=organId%>"/>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                        <flex:radioCol caption="ѡ��" width="50" property="procDefId" name="procDefId" sortName="process.procDefId"></flex:radioCol>
                        <flex:flexCol caption='����' width="200" property="procDefName" sortName="process.procDefName"></flex:flexCol>   
						<flex:flexCol caption='������' width="100" property="formId" sortName="process.formName" style="display:none"></flex:flexCol>                    
                         <flex:flexCol caption='��' width="200" property="formName" sortName="process.formName"></flex:flexCol>   
						  
        </support:flexgrid>
<flex:pagePolit action="processhelpquery.cmd">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center>
<table width=170><tr>
<td><html:button name="btnClose" value="ȷ��" onclick="doConfirm()"></html:button>&nbsp;&nbsp;<html:button name="btnClose" value="�ر�" onclick="doClose()"></html:button>&nbsp;&nbsp;<html:button name="btnCancel" onclick="doCancel()" value="���" ></html:button></tr></table></div>
</html:form>	
<script language="javascript">
grid.show();
function getSelect(){
if(grid.getCurrentLine()==null){
	alert("��ѡ��һ����¼��");
	return false;
}
  return true;
}
//����ֵ:����id���������ƣ���id��������
function doConfirm(){
	if(!getSelect()) return;
         var row=grid.getCurrentLine();
	 var result=new Array();
	 var val=new Array();
	 val[0]=grid.getCellValue(row,1);
	 val[1]=grid.getCellValue(row,2);
	 val[2]=grid.getCellValue(row,3);
	 val[3]=grid.getCellValue(row,4);
	 result[0]=val;
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function doClose(){
	parent.close();
}
</script>