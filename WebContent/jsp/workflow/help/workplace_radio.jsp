<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>�ص����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<% 
    String workplace_name = request.getParameter("workplace_nameSearch");
	if (workplace_name==null){
	  workplace_name="";
	}
	
%>

<widgets:container title="�����ص�" >
<html:form name="frmList" action="workplacehelpradio.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<td>Ա������:</td>
    <td><flex:searchText name="workplace_nameSearch" labeltitle="�ص����ƣ�"  size="12" searchName="PUB_WORKPLACE.WORKPLACE_NAME" dataType="java.lang.String" operSymbol="=" value="<%=workplace_name%>">
	</flex:searchText>
	</td>
	<td><flex:searchImg name="chaxun" action="workplacehelpradio.cmd" image="search.gif"/></td>
	</tr>
</flex:search>

<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                        <flex:radioCol caption="ѡ��" width="100" property="WORKPLACE_ID" name="primaryKey" sortName="PUB_WORKPLACE.WORKPLACE_ID"></flex:radioCol>
                        <flex:flexCol caption="�ͻ����" width="100" property="WORKPLACE_ID" name="primaryKey" sortName="PUB_WORKPLACE.WORKPLACE_ID" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='�ͻ�����' width="100" property="WORKPLACE_NAME" sortName="PUB_WORKPLACE.WORKPLACE_NAME"></flex:flexCol>                          
        </support:flexgrid>
<flex:pagePolit action="workplacehelpradio.cmd" pageSize="10">
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
grid.show();
function getSelect(){
if(grid.getCurrentLine()==null){
	alert("��ѡ��һ����¼��");
	return false;
}
  return true;
}
function doConfirm(){
	if(!getSelect()) return;
         var row=grid.getCurrentLine();
         
	 var result=new Array();
	 var val=new Array();
	 val["primary-value"]=grid.getCellValue(row,2);
	 val["display-str"]=grid.getCellValue(row,3);
	 val["display-url"]='WorkplaceUrl';
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