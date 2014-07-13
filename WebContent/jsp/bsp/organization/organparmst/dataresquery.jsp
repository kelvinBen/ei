<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>机构参数类型表</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script> 
<% 
    String parms_name =(String)request.getAttribute("parms_name");
	if (parms_name==null){
	  parms_name="";
	}
    String name_colSearch = request.getParameter("name_colSearch");
	if (name_colSearch==null){
	  name_colSearch="";
	}	
	String actionUrl = "dataresquery.cmd?method=query&parmsName="+parms_name;
%>
<bsp:container title="机构参数类型表" >
<html:form name="frmList" action="<%=actionUrl%>">
<bsp:containbutton  onclick="clickOk()" text="确定"></bsp:containbutton>
<bsp:containbutton  onclick="forClose()" text="关闭"></bsp:containbutton>
<bsp:containbutton  onclick="clickCancel()" text="清除"></bsp:containbutton>
<html:messages></html:messages>
<table id="tblSearch">
<flex:search>
	<tr>
	<td>参数名称：<flex:searchText name="name_colSearch" searchName="PUB_ORGAN_PARMS_T.NAME_COL" dataType="java.lang.String" operSymbol=" like " value="<%=name_colSearch%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="<%=actionUrl%>" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<support:flexgrid name="grid" height="340" action="" isSubmit="true">
		<flex:radioCol caption="选择" width="40" property="valueCol"  name="primaryKey" sortName="PUB_ORGAN_PARMS_T.VALUE_COL"></flex:radioCol>
		<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.VALUE_COL")%>' width="150" property="valueCol" style="text-align:left" sortName="PUB_ORGAN_PARMS_T.VALUE_COL"></flex:flexCol>
		<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN_PARMS_T.NAME_COL")%>' width="150" property="nameCol" style="text-align:left" sortName="PUB_ORGAN_PARMS_T.NAME_COL"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="<%=actionUrl%>" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>

<script language="javascript">
grid.show();
var key;
function clickOk(){
	if(!getSelect()) return;
	var returnV=new Array(2);
	returnV[0]=key[1];
	returnV[1]=key[2];
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
 parent.close();
}
function clickCancel(){
    var returnV=new Array(2);
	returnV[0]="";
	returnV[1]="";
	window.returnValue=returnV;
	parent.close();
}

function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  var ob=myall.split(",");
  key=ob;
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;  
}
function check(){
   var name_colSearch=document.all("temp").value;
   name_colSearch=trim(name_colSearch);
   if(name_colSearch.indexOf("%")==-1){
     name_colSearch="%"+name_colSearch+"%";
     document.all("name_colSearch").value=name_colSearch;
  } 
  return true
}
</script>