<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<HTML>
<HEAD>
<TITLE>�������Ͱ���</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<%
String name=request.getParameter("NAME");
if(name==null)name="";
%>
<BODY topmargin="10px">
<table width="100%" class="TabTitleCss" cellspacing='0' cellpadding='0'>
	<TR>
		<TD>ѡ������</td>
	</tr>
</table>
<html:form name="frmList" action="processtypehelpquery.cmd">
<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    
    <td>
    �������ƣ�<flex:searchText name="NAME" searchName="WF_PROCESS_TYPE.NAME" dataType="java.lang.String" operSymbol="=" value="<%=name%>" size="12"/>
    </td>
    
    <td><flex:searchImg name="chaxun" action="processtypehelpquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<support:flexgrid name="grid" height="250" action="" isSubmit="true">

<!-- ���ͱ�� --><flex:radioCol caption="ѡ��" width="35" property="typeId" name="primaryKey" sortName="WF_PROCESS_TYPE.TYPE_ID"/>
<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.NAME")%>' width="100" property="name" sortName="WF_PROCESS_TYPE.NAME"/>
<!-- ���� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.DESCRIPTION")%>' width="100" property="description" sortName="WF_PROCESS_TYPE.DESCRIPTION"/>
<!-- ��ʾ˳�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.SORTNUM")%>' width="100" property="sortnum" sortName="WF_PROCESS_TYPE.SORTNUM" style="display:none"/>

<!-- �������� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_ID")%>' style="display:none;" width="100" property="organId" sortName="WF_PROCESS_TYPE.ORGAN_ID"/>
<!-- ���ͱ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.TYPE_ID")%>' width="100" property="typeId" sortName="WF_PROCESS_TYPE.NAME"/>

<!-- ������������ --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_NAME")%>' width="100" property="organName" sortName="WF_PROCESS_TYPE.ORGAN_NAME"/>
<!-- �Ƿ��������¼�������ʹ�� --><flex:flexCol caption='<%=ResourcesFactory.getString("WF_PROCESS_TYPE.ISALLSUB")%>' width="200" property="isallsub" type="enum" enumCollection="WFPROCESSTYPE_ISALLSUB_COLLECTION" enumKey ="key" enumValue="value" sortName="WF_PROCESS_TYPE.ISALLSUB"/>

</support:flexgrid>
<flex:pagePolit action="processtypehelpquery.cmd">
</flex:pagePolit>
<div align=center>
<table width='170'><tr>
<td><html:button name="btnClose" value="ȷ��" onclick="doConfirm()"></html:button>&nbsp;&nbsp;
<html:button name="btnClose" value="�ر�" onclick="doClose()"></html:button>&nbsp;&nbsp;
<html:button name="btnCancel" onclick="doCancel()" value="���" ></html:button></tr></table></div>
</html:form>
<script language="javascript">
grid.show();
grid.setSumText("");
function doConfirm(){
	if(!getSelect()) return;
         var row=grid.getCurrentLine();
	 var result=new Array();
	 
	 result[0]=grid.getCellValue(row,1);
	 result[1]=grid.getCellValue(row,2);
	 result[2]=grid.getCellValue(row,3);
	 result[3]=grid.getCellValue(row,4);
	 result[4]=grid.getCellValue(row,5);
	
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
	var result=new Array();
	 
	 result[0]="";
	 result[1]="";
	 result[2]="";
	 result[3]="";
	 result[4]="";
	parent.returnValue=result;
	parent.close();
}
function doClose(){
	parent.close();
}
function getSelect(){
if(grid.getCurrentLine()==null){
	alert("��ѡ��һ����¼��");
	return false;
}
  return true;
}
</script>