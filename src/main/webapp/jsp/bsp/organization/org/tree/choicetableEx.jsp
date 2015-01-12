<%@ page contentType="text/html;charset=GBK" %>
<%@page import="net.mast.util.RequestUtil"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%> 
<%@ page import="net.mast.waf.ResourcesFactory"%>

<%
     String rootId = RequestUtil.getAttr2String(request,"rootId");
	 String organType[] = (String[])request.getAttribute("organType");
     String isCheckBox = (String)request.getAttribute("isCheckBox");
     String isIncludeSelf = (String)request.getAttribute("isIncludeSelf");
     String isIncludeStruPath = (String)request.getAttribute("isIncludeStruPath");
 	 String organTypeStr="";
     if(organType!=null){
	 	for(int i=0;i<organType.length;i++){
	 		if(i==organType.length-1)
	 			organTypeStr=organType[i];
	 		else
	 			organTypeStr=organType[i]+",";
	 	}
	 }
	 String parentOrganType = request.getParameter("parentOrganType");
	 String underlingOrganType = request.getParameter("underlingOrganType");
     
%>

<HTML>
<HEAD>
<TITLE>选择组织结构</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
 
<widgets:container title="组织结构" >
<html:form name="frmList" action="">
<input type="hidden" name="rootId" value="<%=rootId%>">
<input type="hidden" name="organType" value="<%=organTypeStr%>">
<input type="hidden" name="isCheckBox" value="<%=isCheckBox%>">
<input type="hidden" name="isIncludeSelf" value="<%=isIncludeSelf%>">
<input type="hidden" name="isIncludeStruPath" value="<%=isIncludeStruPath%>">
<input type="hidden" name="parentOrganType" value="<%=parentOrganType%>">
<input type="hidden" name="underlingOrganType" value="<%=underlingOrganType%>">

<widgets:containbutton onclick="clickOk()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="清除"></widgets:containbutton>


<table id="tblSearch">
<tr>
<td>组织编码:</td>
<td><html:text name="organCode" value="" size="10" maxlength="30"/>&nbsp;&nbsp;&nbsp;</td>
<td>名称:</td>
<td><html:text name="organName" value="" size="10" maxlength="30"/>&nbsp;&nbsp;&nbsp;</td>
<td><flex:searchNoPageImg name="chaxun" action="javascript:search()" image="search.gif"/></td>
</tr>
 
</table>

<support:flexgrid name="grid" height="342"  action="" isSubmit="true">
   <flex:radioCol caption="选择" width="40" property="struId"  name="primaryKey" style="text-align:left" sortName="stru.struId"></flex:radioCol>
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>' width="100" property="organCode" style="text-align:left" sortName="stru.organCode"></flex:flexCol>  
    <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>' width="200" property="organName" style="text-align:left" sortName="stru.organName"></flex:flexCol>  
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_ID")%>' width="40" property="organId" style="text-align:left" sortName="stru.organId" style="display:none"></flex:flexCol>                          
5 所在部门和法人	   <flex:flexCol caption="所在部门和法人" width="200" property="corporationName"   sortName="stru.value" style="display:none"></flex:flexCol>                           
6 上级部门	   <flex:flexCol caption="上级" width="80" property="parentName"   sortName="stru.workplace" ></flex:flexCol>                           
7 workplace	   <flex:flexCol caption="所属地区" width="80" property="workplaceName"   sortName="stru.workplace" ></flex:flexCol>                           
	
</support:flexgrid>

<flex:pagePolit action="struEx.cmd?method=getSelectRootNoDupli" pageSize="15">
</flex:pagePolit>	
	
</html:form>
</widgets:container>
<script language="javascript">
grid.dblclickEvent=function()
{
	grid.getCell(grid.getCurrentLine(),1).children[0].checked=true;
	clickOk();
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
var key;
document.onkeydown = keyDown;
function keyDown(){
  if(event.keyCode==13) {
    search();
  }
}
function search(){
  var organCode = document.all("organCode").value;
  var organName = document.all("organName").value;
  document.forms[0].action="struEx.cmd?method=getSelectRootNoDupli&organCode="+organCode+"&organName="+organName;
  document.forms[0].submit();
}

function clickOk(){
	if(!getSelect()) return;
	var returnV=new Array(5);
	returnV[0]=key[3];
	returnV[1]=key[2];
	returnV[2]=key[0];
	returnV[3]=key[1];
	returnV[4]=key[4];
	window.returnValue=returnV;
	parent.close();
}

function clickCancel(){
    var returnV=new Array(5);
	returnV[0]="";
	returnV[1]="";
	returnV[2]="";
	returnV[3]="";
	returnV[4]="";
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
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

</script>