<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<%@ page import="net.mast.bsp.util.Constants"%>
<%String button_position=Constants.buttonPosition;

     String struId=(String)request.getAttribute("struId");
     if(struId==null || struId==""){
	    struId="1";
     }
     String rootMenuStruId=(String)request.getAttribute("rootMenuStruId");
     if(rootMenuStruId==null || rootMenuStruId==""){
	    rootMenuStruId="0";
     }
     String except=(String)request.getAttribute("except");
     if(except==null || except==""){
	    except="0";
     }
%>
<html>
<head>
<title>个性化菜单帮助框</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</head>

<BODY scroll=no topmargin="0" leftmargin="0" style="padding:0px;" marginheight="0" marginwidth="0"  text="#000000" >
<html:form action="">
<widgets:container title="个性化菜单帮助框" >

<%
if("TopRight".equalsIgnoreCase(button_position)||button_position==null||"".equals(button_position)){
%>
<widgets:containbutton onclick="showcheckdata()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关 闭"></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text="清 除"></widgets:containbutton>

<%}%>

<table width="100%" height="400">
    <tr>
      <td width="65%">
			<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false" type="radio" style="width:300;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
			  	<tree:selNode title="menuAlias" radioData="menuStruId" nodeId="menuStruId" collection="functree" nodeXmlSrc="isLeaf"/>
			</tree:selTree>
      </td>
   </tr>
   	<tr>
<%
    if("BottomCenter".equalsIgnoreCase(button_position)){
%>
		<td>
		<p align="center">
			<jsp:include page="../../../help_button.jsp" flush="true"/>
        
		</p>
		</td>
<%}%>   
    </tr>
</table>
</widgets:container>
</html:form>
</body>

</html>

<script lanuage="javascript">

seltree.clickImg=function(node){ 
    seltree.xmlsrc="strumenudefine.cmd?method=getMenuStruNodeHelp&menuStruId="+node.NodeId+"&except="+"<%=except%>";  
}
	
function showcheckdata(){
	var result=new Array(2);
	result[0]=seltree.GetAllCheckData();
	if(result[0]==''){
		return;
	}
	parent.returnValue=result;
	parent.close();
}
function forClose(){
	parent.returnValue = null;
	parent.close();
}
function forCancel(){
	var result=new Array(2);
	result[0]="";
	result[1]="";
	parent.returnValue=result;
	parent.close();
}	
</script>
