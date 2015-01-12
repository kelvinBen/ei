<%@ taglib uri="/WEB-INF/tlds/web-seltree.tld" prefix="tree"%>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="java.util.*"%>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"mastfunction.js")%>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"bsp.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">

<html>
<head>
<title></title>
</head>
<%
    String organId = (String)request.getAttribute("organId");
%>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<table width=100%  height=100%>
   <tr>
   <td width=20%>
	<tree:selTree treeName="seltree" containId="SrcDiv"  isShowElseBranch="false"  type="href" hasRoot="false" rootText="工作日历列表" isDataAsync="false" rootId="0" style="width:180;height:100%;overflow:auto;white-space:nowrap;">
	  	<tree:selNode title="OBJECTNAME" nodeId="OBJECTID" nodeValue="OBJECTNAME" collection="calendar_tree" nodeXmlSrc="isLeaf"  caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
	<td width=40%>
	<span id="content"/>
	</td>
	</tr>
</table>
<iframe style="display:none"  id="hidframe"></iframe>
</BODY>
<SCRIPT LANGUAGE="JavaScript">

seltree.clickImg=function(node)
{  
   var objectId = node.NodeId;
   var organId = "<%=organId%>";
   if(objectId==organId){
      seltree.xmlsrc="workday.cmd?method=getNode&organId="+objectId;
   }
   else{
      getMainFrame().location.href = "workday.cmd?method=detail&year="+objectId; 
   }
}
seltree.clickText=function(node)
{ 
   var objectId = node.NodeId;
   var organId = "<%=organId%>";
   if(objectId==organId){
      seltree.xmlsrc="workday.cmd?method=getNode&organId="+objectId;
   }
   else{
      getMainFrame().location.href = "workday.cmd?method=detail&year="+objectId; 
   }
}

seltree.loadRightMouseMenu()
{
		seltree.insertLeafMenu(new Array("增加","修改","删除"),new Array("add();","update();","del();"),new Array("增加","修改","删除"));
		seltree.insertNodeMenu(new Array("增加"),new Array("addCalendar();"),new Array("增加"));
}

function addCalendar(){
    var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var url ="workday.cmd?method=forinsert_info&organId="+currentId;      
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:550px;dialogHeight:200px"); 
    var year;
    if (win == null) {  
  	      return;
    }else{
          
          year = win;
          getMainFrame().location.href ="workday.cmd?method=forinsert&year="+year;
    } 
}

function add()
{      
    var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
    var url ="workday.cmd?method=forinsert_info&organId="+parentId;      
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:550px;dialogHeight:200px"); 
    var year;
    if (win == null) {  
  	      return;
    }else{
          
          year = win;
          getMainFrame().location.href ="workday.cmd?method=forinsert&year="+year;
    } 
    
}
function update()
{  
   var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
   getMainFrame().location.href = "workday.cmd?method=forupdate&year="+currentId;    
}
function del()
{        
    if(!confirm("删除操作具有不可恢复性，您确定要删除当前年份的工作日历吗？")) return; 
    var currentId= seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
    //getTreeFrame().hidframe.location.href="workday.cmd?method=delete&year="+currentId+"&organId="+parentId;
    //getMainFrame().location.href="jsp/content.jsp"; 
    //getTreeFrame().seltree.refreshNodeById(parentId);   
    
    //调用新的方式进行树的刷新
    getMainFrame().location.href="jsp/content.jsp";
	var rtnValue = startRequest("workday.cmd?method=delete&year="+currentId+"&organId="+parentId);  
	//增加异常提示 － zhb 20060324   
	     if(rtnValue.trim() == "OK"){
	        return;
	     }else{
	     	alert(rtnValue);
	     }  
            
}

var xmlHttp;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
}   
function startRequest(url) {
    createXMLHttpRequest();
    xmlHttp.onreadystatechange = handleStateChange;
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    return xmlHttp.responseText;
}    
function handleStateChange() {
	if(xmlHttp.readyState == 4) {
        if(xmlHttp.status == 200) {
           // alert("The server replied with: " + xmlHttp.responseText);
           var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
           self.seltree.refreshNodeById(parentId);
        }
    }
}




function init(){
//徐正礼  2006-02-08  树出现时展开到第二层
  var organId = "<%=organId%>";
  seltree.refreshNodeByIdOnce(organId);
  getMainFrame().location.href = "jsp/content.jsp";
}
init();

</SCRIPT>
</html>