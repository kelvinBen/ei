<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>ҵ�����Ͳ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>

<html:messages></html:messages>
<html:form name="frmList" action="wfYwHelpInitquery.cmd">
<fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">

</table>
</fieldset>
<flex:flexgrid name="grid" height="200" action="" isSubmit="true">
                <flex:radioCol caption="ѡ��" width="100" property="proctype" name="primaryKey" sortName="WF_YW_PROTYPE.PROCESSTYPEID"></flex:radioCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("WF_YW_PROTYPE.ywId")%>' width="100" property="id" sortName="WF_YW_PROTYPE.YWID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("WF_YW_PROTYPE.ywName")%>' width="100" property="name" sortName="WF_YW_PROTYPE.YWNAME"></flex:flexCol>
        </flex:flexgrid>
<flex:pagePolit action="wfYwHelpInitquery.cmd" pageSize="15">
</flex:pagePolit>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">ȷ ��</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">�� ��</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">�� ��</button></td></tr></table></div>
</html:form>
<script language="javascript">
setTitleInTreeBar('�ӹ���ģ���ѯ');
//setGridHeight("grid",0.466);
grid.show();
function getSelect(){
  var row=grid.getCheckAll();
if ((row==null) ||(row=="")){
	alert("��ѡ��һ����¼��");
	return false;
}
  return true;
}

function doConfirm(){
	if(!getSelect()) return;
	var result = new Array();
    var allrow=grid.getCurrentLine();
    result[0]=grid.getCellValue(allrow,1);
    result[1]=grid.getCellValue(allrow,2);
    result[2]=grid.getCellValue(allrow,3);
  
    parent.returnValue = result;
    parent.close();

}
//ȡ�����ؿ�ֵ����
function doCancel(){
 var result=new Array();
	 result[0]="";
	 result[1]="";
	 result[2]="";
	 result[3]="";
	 result[4]="";
	 result[5]="";
	 result[6]="";
	parent.returnValue = result;
	parent.close();
}
//�رմ��ں���
function doClose(){
	parent.close();
    return true;
}
</script>