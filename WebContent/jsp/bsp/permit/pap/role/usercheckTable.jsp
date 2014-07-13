<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">

<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<%
  String roleId=(String)request.getAttribute("roleId");
  if(roleId==null)
	  roleId="";
	  
  String isCheckBox = (String)request.getParameter("isCheckBox");
%>

<widgets:container title="选择用户" >
<html:form action="">
<html:hidden name="primaryKey" value=""/>

<widgets:containbutton onclick="clickOk()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="清除"></widgets:containbutton>

<table width="100%" height="80%">
    <tr>
      <td>
	  <%
     	if(isCheckBox!=null&&isCheckBox.equals("1")){
     %>
<support:flexgrid name="grid" height="250"  action="" isSubmit="true">
   <flex:checkboxCol caption="选择" width="40" property="userId"  name="primaryKey" sortName="PUB_USER.USER_ID"></flex:checkboxCol>
   <flex:flexCol caption='用户名称' width="100" property="userName" style="text-align:left" sortName="PUB_USER.USER_NAME"></flex:flexCol>  
   <flex:flexCol caption='用户ID' width="200" property="userId" style="text-align:left" sortName="PUB_USER.USER_ID"></flex:flexCol>                          
   
</support:flexgrid>

<%}else{%>
<support:flexgrid name="grid" height="250"  action="" isSubmit="true">
   <flex:radioCol caption="选择" width="40" property="userId"  name="primaryKey" sortName="PUB_USER.USER_ID"></flex:radioCol>
   <flex:flexCol caption='用户名称' width="100" property="userName" style="text-align:left" sortName="PUB_USER.USER_NAME"></flex:flexCol>  
   <flex:flexCol caption='用户ID' width="200" property="userId" style="text-align:left" sortName="PUB_USER.USER_ID"></flex:flexCol>                          
 </support:flexgrid>
 <%}%>
	  </td>
    </tr>
 
 
</table>
</html:form>
</widgets:container>

</BODY>
</HTML>
<script language="javascript">
grid.dblclickEvent=function()
{
	grid.getCell(grid.getCurrentLine(),1).children[0].checked=true;
	clickOk();
}
grid.show();
grid.setSumText("");

function clickOk(){
	if(getSelect()==null) return;
	var returnV=getSelect();
	window.returnValue=returnV;
	parent.close();
}

function clickCancel(){
    var returnV=new Array(3);
    returnV[0]="";
    returnV[1]=""; 
    returnV[2]="";
 
    
    window.returnValue=returnV;
	parent.close();
}
function forClose(){
 parent.close();
}
function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  if(sel==""){
  alert("请选择至少一条记录!");
  return;
  }
  var arrOut="";
  var arrOut1="";
  
  var ob=myall.split("|");
  for(var i=0;i<ob.length;i++)
  {
  var arr=ob[i].split(",");
  if(i<ob.length-1){
  arrOut+=arr[0]+",";
  arrOut1+=arr[1]+","; 
  }
  else{
  arrOut+=arr[0];
  arrOut1+=arr[1];
  }
  } 
   return new Array(arrOut,arrOut1);
 
}

</script>