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
   seltree.insertLeafMenu(new Array("��ϸ","�޸�","ɾ��"),new Array("detailM();","updateM();","delM();"),new Array("�鿴���Ծ�����Ϣ","�޸����Ծ�����Ϣ","ɾ��ָ��������"));
   seltree.insertNodeMenu(new Array("��ϸ","�޸�","ɾ��","�ı����","�鿴����","����Ԫ��"),new Array("detailM();","updateM();","delM();","moveM();","queryM();","addE();"),new Array("�鿴���������Ϣ","�޸Ķ��������Ϣ","ɾ��ָ������","�ı�������","�鿴������Ԫ�ؼ���","������Ԫ��"));
   
}

function detailM()
{   
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr =split(currentId);
    if(arr[1]=="-1") {
        alert("���ܲ鿴����ϸ�����뵽���������鿴��");
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
            alert("�ж����ܲ鿴�����б�");
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
               alert("ֻ����������ԡ������𡻣�");
               return ;
	       }
}  

function addE()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var arr =split(currentId);
           if(arr[1]=="C"){
	           alert("�ж����ܸ�����Ԫ�أ�");
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
             alert("����ִ�С��޸ġ����뵽���������޸����");
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
      alert("����ִ�С�ɾ����������ɾ����������д��ںͶ���Ȼ�󵽡�������ɾ�����");
      return ;
    }
    else{
        if(!confirm("ɾ���������в��ɻָ��ԣ���ȷ��Ҫɾ����")) return;
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
            	alert("ɾ��ʧ��!��ɾ�������ݿ����ѱ�������������");
            }
            else{
            	alert("ɾ������"+currentName+"���ɹ���");
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
            	alert("ɾ��ʧ��!��ɾ�������ݿ����ѱ�������������");
            }
            else{
            	alert("ɾ���������ԡ�"+currentName+"���ɹ���");
            }
            
            self.seltree.refreshNodeById(parentId);
        }
    }
}
//����Ķ���ʵ���µ�ɾ���ڵ�ˢ�·�ʽ�Ľű���������web����ṩ��
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
        alert("����ִ�С��ı���𡻣��뵽���������������");
        return ;
    }
    else{
        if(arr[1]=="O"){
            if(!confirm("��ȷ��Ҫ�ı䵱ǰ����������")) return;
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
            alert("�ж�����ִ�С��ı���𡻲�����");
            return ;
        }
    }
}
</SCRIPT>
