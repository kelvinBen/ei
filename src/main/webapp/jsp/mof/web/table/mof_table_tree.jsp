<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>



<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link rel="stylesheet" type="text/css"
	href="<mast:ui css='XMLSelTree.css'/>">

</head>
<BODY topmargin="0" leftmargin="5" marginheight="0" marginwidth="0"
	bgcolor="#f2f8ff" text="#000000">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<html:form name="form1" action="">
	<table width="100%">
		<tr>
			<td><tree:selTree treeName="seltree" containId="SrcDiv"
				isShowElseBranch="true" type="href" hasRoot="false"
				style="width:100%;height:100%;overflow:auto;white-space:nowrap;"
				isDataAsync="false">
				<tree:selNode title="categoryName" nodeId="categoryId" toolTip="toolTip" 
					nodeValue="isLeaf" collection="category_tree" nodeXmlSrc="isLeaf"
					perImgSrc="perImgSrc" >
				</tree:selNode>
			</tree:selTree></td>
		</tr>
	</table>
</html:form>
<iframe style="display:" width="0" id="hidframe"></iframe>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{     
  if(node.NodeValue!=null){
      seltree.xmlsrc="mofcategory.cmd?method=getTableNode&categoryId="+node.NodeId; 
  }
}

seltree.clickText=function(node)
{
   
    var currentId = node.NodeId;
    var currentName = node.title;
    seltree.xmlsrc="mofcategory.cmd?method=getTableNode&categoryId="+node.NodeId; 
    var arr =split(currentId);
      if(arr[1]=="-1") {
          getMainFrame().location.href="jsp/content.jsp";
          return;
     }
    else{
        var parentName = seltree.GetParentElement(node.parentElement).children[2].title;
        var parentId = seltree.GetParentElement(node.parentElement).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr2[1]=="-1"){
            //getMainFrame().location.href="moftable.cmd?method=detail&mofTableId="+arr[0]+"&parent="+parentId;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_table&primaryKey="+arr[0]+"&parent_window=mof_category&main_primaryKey="+parentId;
         }
        else if(arr2[1]=="O"){
            //getMainFrame().location.href="mofcolumn.cmd?method=detail&mofColumnId="+arr[0]+"&mofTableId="+arr2[0]+"&mofTableName="+parentName;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_column&primaryKey="+arr[0]+"&parent_window=mof_table&main_primaryKey="+arr2[0];
        }
    }
}

function split(node){
  var nodeId=node;
  var arr = new Array(2);
  var i=nodeId.indexOf('@');
  var l=nodeId.length;
  if(i==-1) {
    arr[0]=nodeId;
    arr[1]="-1";
    return arr;
  }
  else{
    arr[0]=nodeId.substring(0,i);
    arr[1]=nodeId.substring(i+1,l);
    return arr;
  }
}

seltree.loadRightMouseMenu()
{
   seltree.insertLeafMenu(new Array("明细","修改","删除"),new Array("detailM();","updateM();","delM();"),new Array("查看属性具体信息","修改属性具体信息","删除指定的属性"));
   seltree.insertNodeMenu(new Array("明细","修改","删除","改变类别","查看属性","增加元素"),new Array("detailM();","updateM();","delM();","moveM();","queryM();","addE();"),new Array("查看对象具体信息","修改对象具体信息","删除指定对象","改变对象类别","查看所有子元素集合","增加子元素"));
   
}

function detailM()
{   
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr =split(currentId);
    if(arr[1]=="-1") {
        alert("不能查看『明细』，请到『类别管理』查看！");
        return ;
    }
    else{
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        var arr2 = split(parentId);        
        if(arr2[1]=="-1"){
            //getMainFrame().location.href="moftable.cmd?method=detail&mofTableId="+arr[0]+"&parent="+parentId;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_table&primaryKey="+arr[0]+"&parent_window=mof_category&main_primaryKey="+parentId;
         }
        else if(arr2[1]=="O"){
            //getMainFrame().location.href="mofcolumn.cmd?method=detail&mofColumnId="+arr[0]+"&mofTableId="+arr2[0]+"&mofTableName="+parentName;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_column&primaryKey="+arr[0]+"&parent_window=mof_table&main_primaryKey="+arr2[0];
        }
    }
}

function queryM()
{   
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr =split(currentId);
    if(arr[1]=="-1") {
        //var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
        //var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        //getMainFrame().location.href="moftablequery.cmd?categoryId="+currentId;
    	if(currentId=="-1")
    		getMainFrame().location.href="mofexecquery.cmd?window_name=mof_table&parent_window=mof_category";
    	else
    		getMainFrame().location.href="mofexecquery.cmd?window_name=mof_table&parent_window=mof_category&main_primaryKey="+currentId;
      }
    else{
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr2[1]=="-1"){
            //getMainFrame().location.href="mofcolumnquery.cmd?mofTableId="+arr[0]+"&mofTableName="+currentName;
            getMainFrame().location.href="mofexecquery.cmd?window_name=mof_column&parent_window=mof_table&main_primaryKey="+arr[0];
         }
        else if(arr2[1]=="O"){
            alert("列对象不能查看属性列表！");
            return ;
        }
    }
}

function addM()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var arr =split(currentId);
           if(arr[1]=="-1") {
               getMainFrame().location.href="mofcategory.cmd?method=forinsert&parent="+currentId;
           }
           else {
               alert("只有类别对象可以『添加类别』！");
               return ;
	       }
}  

function addE()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var arr =split(currentId);
           if(arr[1]=="C"){
	           alert("列对象不能给增加元素！");
	              return ;
	       }
           //if(arr[1]=="-1") {
           //    getMainFrame().location.href="moftable.cmd?method=forinsert&categoryId="+currentId;
           //}
          // else if (arr[1]=="O"){
          //     getMainFrame().location.href="mofcolumn.cmd?method=forinsert&mofTableId="+arr[0]+"&mofTableName="+currentName;
	       //}   
           if(arr[1]=="-1"){
               getMainFrame().location.href="mofexec.cmd?method=forinsert&window_name=mof_table&parent_window=mof_category&main_primaryKey="+currentId;
           }
           else if(arr[1]=="O"){
               getMainFrame().location.href="mofexec.cmd?method=forinsert&window_name=mof_column&parent_window=mof_table&main_primaryKey="+arr[0];
           }
}  

function updateM()
{     
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
         var arr = split(currentId);
         if(arr[1]=="-1") {
             alert("不能执行『修改』，请到『类别管理』修改类别！");
             return ;
         }
         else{
             var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
             var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
             var arr2 = split(parentId);
        	if(arr2[1]=="-1"){
            	//getMainFrame().location.href="moftable.cmd?method=detail&mofTableId="+arr[0]+"&parent="+parentId;
           	 	getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=mof_table&primaryKey="+arr[0]+"&parent_window=mof_category&main_primaryKey="+parentId;
         	}
        	else if(arr2[1]=="O"){
            	//getMainFrame().location.href="mofcolumn.cmd?method=detail&mofColumnId="+arr[0]+"&mofTableId="+arr2[0]+"&mofTableName="+parentName;
            	getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=mof_column&primaryKey="+arr[0]+"&parent_window=mof_table&main_primaryKey="+arr2[0];
        	}
         }
         
}
function delM()
{ 
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr = split(currentId);
    if(arr[1]=="-1") {
      alert("不能执行『删除』，请先删除类别下所有窗口和对象，然后到『类别管理』删除类别！");
      return ;
    }
    else{
        if(!confirm("删除操作具有不可恢复性，您确定要删除吗？")) return;
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr2[1]=="-1"){
            //self.hidframe.location.href="moftable.cmd?method=delete&mofTableId="+arr[0];
            //self.hidframe.location.href="mofexec.cmd?method=delete&window_name=mof_table&primaryKey="+arr[0];            
            getMainFrame().location.href="jsp/content.jsp";
            var returnStr = startRequest("mofexec.cmd?method=delete&window_name=mof_table&primaryKey="+arr[0]);
             
            if(returnStr.replace(/^\s+|\s+$/g,"").substring(0,5)=="ERROR")
            {
            	alert("删除失败!被删除的数据可能已被其它数据引用");
            }
            else{
            	alert("删除对象『"+currentName+"』成功！");
            }
            self.seltree.refreshNodeById(parentId);
        }
        else if(arr2[1]=="O"){
            //self.hidframe.location.href="mofcolumn.cmd?method=delete&mofColumnId="+arr[0];
           // self.hidframe.location.href="mofexec.cmd?method=delete&window_name=mof_column&primaryKey="+arr[0];   
            getMainFrame().location.href="jsp/content.jsp";
            
            var returnStr = startRequest("mofexec.cmd?method=delete&window_name=mof_column&primaryKey="+arr[0]);
            if(returnStr.replace(/^\s+|\s+$/g,"").substring(0,5)=="ERROR")
            {
            	alert("删除失败!被删除的数据可能已被其它数据引用");
            }
            else{
            	alert("删除对象属性『"+currentName+"』成功！");
            }
            
            self.seltree.refreshNodeById(parentId);
        }
    }
}
//下面的都是实现新的删除节点刷新方式的脚本方法，由web组件提供的
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





function moveM()
{             
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr = split(currentId);
    if(arr[1]=="-1") {
        alert("不能执行『改变类别』，请到『类别管理』管理类别！");
        return ;
    }
    else{
        if(arr[1]=="O"){
            if(!confirm("您确定要改变当前对象的类别吗？")) return;
            var cmdUrl="mofcategorymovequery.cmd&clear=true";
            var url ="jsp/help.jsp?url="+cmdUrl;
            var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:530px;dialogHeight:450px"); 
            if (win == null) {  
          	      return;
            }else{
                  tempId=win[0]
                  tempName = win[1];
                  var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
                  self.hidframe.location.href="mofcategory.cmd?method=changeTableCategory&mofTableId="+arr[0]+"&categoryId="+tempId;
                  getMainFrame().location.href="jsp/content.jsp"; 
                  self.seltree.refreshNodeById(tempId); 
                  self.seltree.refreshNodeById(parentId); 
            }            
        }else{
            alert("列对象不能执行『改变类别』操作！");
            return ;
        }
    }
}
</SCRIPT>
