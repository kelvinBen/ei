
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import = "net.mast.bsp.permit.context.GetBspInfo" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
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
<%
	String accessRootId=GetBspInfo.getBspInfo().getAccessRootId();
	String person_search=request.getParameter("person_search");
	if(person_search==null){
		person_search="";
	}
	String person_id_search=request.getParameter("person_id_search");
	if(person_id_search==null){
		person_id_search="";
	}
%>
</HEAD>

<BODY topmargin="10px" onload="init();">

<div class="btnareaCss">
<html:button name="forAdd" value='增加' onclick="forAdd()"></html:button>
<html:button name="forDetail" value='明细' onclick="forDetail()"></html:button>
<html:button name="forDelete" value='删除' onclick="forDelete()"></html:button>
</div>

<html:messages/>

<html:form  name="frmList" method="post"  action="">
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
	<td nowrap>人员：<input type="text" name="person_search" value="<%=person_search%>" size="10" readOnly="true">
	<input type="hidden" name="person_id_search" value="<%=person_id_search%>" size="10">
	<img src="skins/default/images/liulan.gif" style="cursor:hand"  border="0" onclick="selectPerson()"></td>
	<td><flex:searchImg name="chaxun" action="signpic.cmd?method=query" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>

<fieldset class="FieldsetCss" ><legend>签名图片列表</legend>

<support:flexgrid name="grid" height="360" action="" isSubmit="true">
    <flex:checkboxCol caption="选择" width="50" property="organId"  name="primaryKey" sortName="organId.id" canSort="false"></flex:checkboxCol>
    <flex:flexCol caption='人员名称' width="150" property="organName" sortName="organName.organName" canSort="true"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="signpic.cmd?method=query">
</flex:pagePolit>



</fieldset>

</html:form>
</body>
</html>
<script type="text/javascript">
function init(){
//setGridHeight("grid",0.4)
grid.show();
grid.setSumText("");
setTitleInTreeBar("签名图片-查询");
}

function forAdd(){
	document.forms[0].action = "signpic.cmd?method=forInsert";
	document.forms[0].submit();
}
function forDetail(){
	if(!checkSelect())
		return;
	var line=grid.getCheckLineNo();
	var person_id=grid.getCellValue(line,1);
	var person_name=grid.getCellValue(line,2);
	document.forms[0].action="signpic.cmd?method=detail&person_id="+person_id+"&person_name="+person_name;
	document.forms[0].submit();
}
function forDelete(){
	if(!checkSelect())
		return;
	if(!confirm("确定要删除此签名图片吗？")){
		return;
	}
	
	var line=grid.getCheckLineNo();
	var lines=line.split(",");
	var person_id="";
	
	var person_name="";
	for(var i=0;i<lines.length;i++){
		if(i!=0){
			person_id+=",";
			person_name+=",";
		}
		person_id+=	grid.getCellValue(lines[i],1);
		person_name+=grid.getCellValue(lines[i],2);
	}
	grid.getCellValue(line,2);
	document.forms[0].action="signpic.cmd?method=delete&person_id="+person_id+"&person_name="+person_name;
	document.forms[0].submit();
}

function selectPerson(){
  var url ="struhelp.cmd?method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId=<%=accessRootId%>";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else if(typeof(win)=="string"&&win==""){
	  document.all("person_search").value="";
	  document.all("person_id_search").value="";
  }else{
	  document.all("person_search").value=win[1];
	  document.all("person_id_search").value=win[0];
  }
}
function checkSelect(){
	var value=grid.getCheckLine();
	if(value==""){
		alert("请选择一条记录！");
		return false;
	}
	return true;
}
</script>
</body>

	
	