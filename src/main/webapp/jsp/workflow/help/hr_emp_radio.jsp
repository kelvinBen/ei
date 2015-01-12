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
<TITLE>员工信息</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>


<% 
    String searchOptions = request.getParameter("SEARCH_OPTIONS");
	if (searchOptions==null){
	  searchOptions="";
	}
    String searchValue = request.getParameter("SEARCH_VALUE");
	if (searchValue==null){
	  searchValue="";
	}	
	String employee_status=request.getParameter("EMPLOYEE_STATUS");
	if (employee_status==null){
	  employee_status="";
	}
	String s_organId=(String)request.getParameter("organId");
	if(s_organId==null)s_organId="";
	String s_organName=(String)request.getParameter("organName");
	if(s_organName==null)s_organName="";
	String s_struId=(String)request.getParameter("struId");
	if(s_struId==null)s_struId="";		
%>
<widgets:container title="员工信息" >
<html:form name="frmList" action="hrempforhelpradio.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
	<td>	
	<flex:searchSelect name="SEARCH_OPTIONS" labeltitle="查询项：" size="1" searchName="HR_EMPLOYEE.EMPLOYEE_STATUS" dataType="java.lang.String" operSymbol="=" value="<%=searchOptions%>">
	<html:option value="ORGAN_NAME">员工</html:option>
	<html:option value="POST_NAME">岗位</html:option>
	</flex:searchSelect>
	</td>
    <td><flex:searchText name="SEARCH_VALUE" labeltitle="查询项值："  size="10" searchName="PUB_ORGAN.ORGAN_NAME" dataType="java.lang.String" operSymbol="=" value="<%=searchValue%>">
	</flex:searchText>
	</td>
	<td><flex:searchSelect name="EMPLOYEE_STATUS" labeltitle="员工状态：" size="1" searchName="HR_EMPLOYEE.EMPLOYEE_STATUS" dataType="java.lang.String" operSymbol="=" value="<%=employee_status%>">
	<html:option value="">状态</html:option>
	<html:options collection="HREMPLOYEE_STATUS_COLLECTION" labelProperty="value" property="key"/>
	</flex:searchSelect>
    </td>
    <td nowrap>部门：</td>
    <td><input type="hidden" name="organId" size="12" value="<%=s_organId%>"  readonly><input type="text" name="organName" size="10" value="<%=s_organName%>"  readonly><input type="hidden" name="struId" size="12" value="<%=s_struId%>"  readonly><img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectDeptId()"></td>
	<td><flex:searchImg name="chaxun" action="hrempforhelpradio.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                          <flex:flexCol caption="员工编号隐藏列" width="100" property="organId"  name="organId" sortName="PUB_ORGAN.ORGAN_ID" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='姓名' width="100" property="organName" sortName="PUB_ORGAN.ORGAN_NAME"></flex:flexCol>
                          <flex:flexCol caption='岗位编号隐藏列' width="100" property="parentOrganId" sortName="PUB_ORGAN.PARENT_ORGAN_ID" style="display:none"></flex:flexCol>  
                          <flex:flexCol caption='岗位' width="100" property="parentOrganName" sortName="PUB_ORGAN.PARENT_ORGAN_NAME"></flex:flexCol>    
                         <flex:flexCol caption='职级隐藏列' width="100" property="polityLevel" sortName="HR_EMPLOYEE.POLITY_LEVEL" style="display:none"></flex:flexCol>  
                         <flex:flexCol caption='STRU隐藏列' width="100" property="struId" sortName="PUB_STRU.STRU_ID" style="display:none"></flex:flexCol> 
                         <flex:flexCol caption='状态隐藏列' width="100" property="employeeStatus" sortName="HR_EMPLOYEE.EMPLOYEE_STATUS" style="display:none"></flex:flexCol>   
        </support:flexgrid>
<flex:pagePolit action="hrempforhelpradio.cmd" pageSize="10">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center><table width=150>
<tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td>
</tr></table></div>
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
 
	 var result = new Array();
	 /*旧程序
	 for(var i=0;i<7;i++){
	 	result[i]=grid.getCellValue(row,i+1);
	 }
	 */
	 var val=new Array();
	 val["primary-value"]=grid.getCellValue(row,1);
	 val["display-str"]=grid.getCellValue(row,2);
	 val["display-url"]='<%=MatrixHref.getUrl("Employee")%>'+grid.getCellValue(row,1);
	 result[0]=val;	 

	parent.returnValue = result;
	parent.close();
}
function doClose(){
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function selectDeptId(){
  var url ="stru.cmd?method=getDeptRoot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) { 
  document.all("organId").value="";
  document.all("organName").value="";  
  document.all("struId").value=""; 
  	return;
  }else{
  document.all("organId").value=win[0];
  document.all("organName").value=win[1];
  document.all("struId").value=win[2];
  }
}
</script>