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
<TITLE>项目帮助</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<% 
    String customer_name = request.getParameter("customer_nameSearch");
	if (customer_name==null){
	  customer_name="";
	}
	
%>

<widgets:container title="员工信息" >
<html:form name="frmList" action="customerhelpradio.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<td>员工名称:</td>
    <td><flex:searchText name="customer_nameSearch" labeltitle="合同编号："  size="12" searchName="CRM_CUSTOMER.CUSTOMER_NAME" dataType="java.lang.String" operSymbol="=" value="<%=customer_name%>">
	</flex:searchText>
	</td>
	<td><flex:searchImg name="chaxun" action="customerhelpradio.cmd" image="search.gif"/></td>
	</tr>
</flex:search>

<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                        <flex:radioCol caption="选择" width="100" property="CUSTOMER_ID" name="primaryKey" sortName="CRM_CUSTOMER.CUSTOMER_ID"></flex:radioCol>
                        <flex:flexCol caption='客户编号' width="100" property="CUSTOMER_ID" sortName="CRM_CUSTOMER.CUSTOMER_ID" style="display:none"></flex:flexCol>                          
                          <flex:flexCol caption='客户名称' width="100" property="CUSTOMER_NAME" sortName="CRM_CUSTOMER.CUSTOMER_NAME"></flex:flexCol>                          
        </support:flexgrid>
<flex:pagePolit action="customerhelpradio.cmd" pageSize="10">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td></tr></table></div>
</html:form>	
</widgets:container>
<script language="javascript">
grid.show();
function getSelect(){
if(grid.getCurrentLine()==null){
	alert("请选择一条记录！");
	return false;
}
  return true;
}
function doConfirm(){
	if(!getSelect()) return;
         var row=grid.getCurrentLine();
	 var result=new Array();
	 var val=new Array();
//	 val[0]=grid.getCellValue(row,2);
//	 val[1]=grid.getCellValue(row,3);
//	 val[2]='<%=MatrixHref.getUrl("0000")%>';
	 val["primary-value"]=grid.getCellValue(row,2);
	 val["display-str"]=grid.getCellValue(row,3);
	 val["display-url"]='<%=MatrixHref.getUrl("Employee")%>';
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