<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>

<%
     String organTypeSearch = (String)request.getAttribute("organTypeSearch");
     if(organTypeSearch==null){
     	organTypeSearch="";
     } 
      String struTypeSearch = (String)request.getAttribute("struTypeSearch");
     if(struTypeSearch==null){
     	struTypeSearch="";
     } 
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
<html:form name="form1" action="">

<widgets:containbutton onclick="clickOk()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="清除"></widgets:containbutton>
<table id="tblSearch">
<tr>
<td>组织结构类型：</td>
		<td>
			<html:select name="struTypeSearch" value="<%=struTypeSearch%>">
				<html:options collection="struTypeList" labelProperty="typeName" property="struType" />
			</html:select>
		</td> 
<td>组织类型：</td>
		<td>
			<html:select name="organTypeSearch" value="<%=organTypeSearch%>">
		        <html:option value="select">全部</html:option>
				<html:options collection="organTypeList" labelProperty="typeName" property="organType" />
			</html:select>
		</td> 
<td><flex:searchNoPageImg name="chaxun" action="javascript:search()" image="search.gif"/></td>
</tr>
</tr>
</table>
<support:flexgrid name="grid" height="250"  action="" isSubmit="true">
   <flex:checkboxCol caption="选择" width="40" property="struId"  name="primaryKey" sortName="stru.struId"></flex:checkboxCol>
   <flex:flexCol caption='组织名称' width="200" property="organName" style="text-align:left" sortName="stru.organName"></flex:flexCol>                          
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_ID")%>' width="40" property="organId" style="text-align:left" sortName="stru.organId" style="display:none"></flex:flexCol> 
    
</support:flexgrid>


</html:form>
</widgets:container>
<script language="javascript">
grid.show();
grid.doCheckAllLine(true)
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
document.onkeydown = keyDown;
function keyDown(){
  if(event.keyCode==13) {
    search();
  }
}
function search(){
  var organTypeSearch = document.all("organTypeSearch").value;  
  document.forms[0].action="stru.cmd?method=getSelectRootByOrganType";
  document.forms[0].submit();
} 

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
  var arrOut="";
  var arrOut1="";
  var arrOut2="";
  var ob=myall.split("|");
  for(var i=0;i<ob.length;i++)
  {
  var arr=ob[i].split(",");
  if(i<ob.length-1){
  arrOut+=arr[0]+",";
  arrOut1+=arr[1]+",";
  arrOut2+=arr[2]+",";
  }
  else{
  arrOut+=arr[0];
  arrOut1+=arr[1];
  arrOut2+=arr[2]; 
  
  }
  }
 return new Array(arrOut,arrOut1,arrOut2); 
 
}

</script>