<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script> 
<script language="javascript">
function initTreeBar()
{
        setTitleInTreeBar("ѡ����֯����");
}
initTreeBar();  
</script> 

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<base target="_self">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String organ_type = request.getParameter("organ_type");
	if (organ_type==null){
	  organ_type="";
	}
%>


<html:form name="frmList" action="organtypequery.cmd">
<fieldset class="FieldsetCss" ><legend>��ѯ����</legend>      
<table id="tblSearch">
<flex:search>
	<tr>
    <td>��֯���ʹ��룺<flex:searchText name="organ_type" searchName="PUB_ORGAN_TYPE.ORGAN_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=organ_type%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="wforgantypequery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<support:flexgrid name="grid" height="240" action="" isSubmit="true">
      <flex:radioCol caption="ѡ��" width="40" property="ORGAN_TYPE"  name="primaryKey" sortName="PUB_ORGAN_TYPE.ORGAN_TYPE"></flex:radioCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_TYPE.ORGAN_TYPE")%>' width="100" property="ORGAN_TYPE"  sortName="PUB_ORGAN_TYPE.ORGAN_TYPE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_TYPE.TYPE_NAME")%>' width="150" property="TYPE_NAME" style="text-align:left" sortName="PUB_ORGAN_TYPE.TYPE_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_TYPE.PARENT_TYPE")%>' width="100" property="PARENT_TYPE"  sortName="PUB_ORGAN_TYPE.PARENT_TYPE"></flex:flexCol>
</support:flexgrid>

<flex:pagePolit action="wforgantypequery.cmd">
</flex:pagePolit>
<div align="center">
<button name="btnConfirm" onclick="showcheckdata()"  class="advbutton">ȷ ��</button>
<button name="btnClose" onclick="forClose()"  class="advbutton">�� ��</button>

</div>
</html:form>

</BODY>
</HTML>
<script language="javascript">
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
var key;
function check(){
  var organ_type=document.all("organ_type");
  organ_type.value=trim(organ_type.value);
  return true
}
function forClose(){
parent.close();
}

function showcheckdata(){
 var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var row=grid.getCurrentLine();
  
  
var val = new Array();
	val[0]=grid.getCellValue(row,2);	
	val[1]=grid.getCellValue(row,3);	
		window.returnValue=val;
        parent.close();
}
</script>