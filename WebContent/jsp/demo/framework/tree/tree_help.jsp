<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html" %>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<web:js src="bsp.js"/>
<web:js src="XMLSelTree.js"/>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<html>
<head>
<title></title>
</head>
<BODY bgcolor="#EAF4FD">
<widgets:container title='<%=ResourcesFactory.getString("ORGAN_STRU.SELECTTARGET")%>' >
<widgets:containbutton onclick="showcheckdata()" text='<%=ResourcesFactory.getString("COMMON.OK")%>'></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text='<%=ResourcesFactory.getString("ORGAN_STRU.CLOSE")%>'></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text='<%=ResourcesFactory.getString("COMMON.RESET")%>'></widgets:containbutton>
<table width="100%" height="100%">
    <table><td>
   <html:text name="organAlias1" value='<%=ResourcesFactory.getString("ORGAN_STRU.INPUTNAME")%>' size="10">
   </html:text><html:button name="submit" value='<%=ResourcesFactory.getString("COMMON.SEARCH")%>' onclick="queryNow()">
   </html:button>
   </td></table>
   <table width="100%" height="400">
   <td>
	<tree:selTree treeName="seltree" isShowElseBranch="true" containId="SrcDiv" type="radio" hasRoot="false" rootId="root"  leafImg="column_img.gif" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false"> 	<tree:selNode title="organAlias" nodeValue="organType" radioData="checknodeId"nodeId="organId" perImgSrc="nodeImgSrc" collection="treeCollection" toolTip="organAlias" nodeXmlSrc="isLeaf"  caption="organAlias">
	    </tree:selNode>
	</tree:selTree>
	</td>
	</table>
</table>
</widgets:container>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
function queryNow(){
    var organAlias=document.all('organAlias1').value;
    var struPath=getValueByXmlhttp("organstru.cmd?method=query&organAlias="+organAlias);
    if(struPath==""){
     alert('<%=ResourcesFactory.getString("ORGAN_STRU.NONAME")%>');
    }else{
    var struPaths=struPath.split(",");
    for(var i=0;i<struPaths.length;i++){
      var strupath=struPaths[i];
      alert(struPath);
      seltree.openNodeById(strupath,"\\");
      }
    }
}
seltree.clickImg=function(node){
    var nodeId=node.NodeId;
	seltree.xmlsrc="organstru.cmd?method=getHelpCh&nodeId="+nodeId;
} 
seltree.clickText=function(node){
	var nodeId=node.NodeId;
	seltree.xmlsrc="organstru.cmd?method=getHelpCh&nodeId="+nodeId;
}
function showcheckdata(){
        var returnV=new Array(3);
        returnV[0]=seltree.GetAllCheckData();
        returnV[1]=seltree.GetAllCheckText(); 
        returnV[2]=seltree.GetAllCheckNodeId();
        if(returnV[2]==""){
           alert('<%=ResourcesFactory.getString("COMMON.SELECT_A_RECORD")%>');
           return ;
        }
        window.returnValue=returnV;
        parent.close();
}
function forCancel(){
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
function getValueByXmlhttp(url)
{
	try
		{
		var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		xmlhttp.open("POST",url,false);
		xmlhttp.send();
		return xmlhttp.responseText;
		}catch(ex)
		{
		return "";
		}
}
</SCRIPT>
</html>
