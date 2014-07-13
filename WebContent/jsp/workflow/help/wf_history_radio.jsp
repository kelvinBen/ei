<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<HTML>
<HEAD>
<TITLE>����������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<widgets:container title="��ʷ������Ϣ" >
<html:form name="frmList" action="">
<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                        <flex:radioCol caption="ѡ��" width="100" property="actDefId" name="actDefId" sortName="process.procDefId"></flex:radioCol>
						<flex:flexCol caption='��ʷ��������' width="100" property="actDisName" sortName="process.procDefName"></flex:flexCol>      
                        <flex:flexCol caption='������' width="100" property="actDefId" sortName="process.procDefId" style="display:none"></flex:flexCol>
						<flex:flexCol caption='������' width="100" property="activityId" sortName="process.procDefId" style="display:none"></flex:flexCol>
						<flex:flexCol caption='������' width="100" property="processDefId" sortName="process.procDefId" style="display:none"></flex:flexCol>
	        </support:flexgrid>
<flex:pagePolit action="" pageSize="15">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">ȷ ��</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">�� ��</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">�� ��</button></td></tr></table></div>
</html:form>	
</widgets:container>
<script language="javascript">
function init(){
	grid.show();
}

function getSelect(){
if(grid.getCurrentLine()==null){
	alert("��ѡ��һ����¼��");
	return false;
}
  return true;
}
//��ҳ������������з��뻷�ڶ���id���ͻ���ʵ��id�����̶���id�����ڶ���id�ͻ���ʵ��id�м��ã��ŷָ���Ϊprimary-value
//����ҳ�����ʾ�ַ�Ϊ��������
//�����̶���id����ҳ��ת���url��
function doConfirm(){
	if(!getSelect()) return;
     var row=grid.getCurrentLine();
	 var result=new Array();
	 var val=new Array();
	 var actDefId=grid.getCellValue(row,3);
	 var activityId=grid.getCellValue(row,4);
	 var processDefId=grid.getCellValue(row,5);
	 val["primary-value"]=actDefId+'#'+activityId;
	 val["display-str"]=grid.getCellValue(row,2);
	 val["display-url"]='<%=MatrixHref.getUrl("Process")%>'+processDefId;
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