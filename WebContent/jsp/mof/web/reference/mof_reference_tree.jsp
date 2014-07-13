<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.mof.util.MofConstants"%>



<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<html:form name="form1" action="">
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="href" hasRoot="false"  style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="categoryName" nodeId="categoryId" nodeValue="isLeaf" collection="category_tree" nodeXmlSrc="isLeaf"  perImgSrc="perImgSrc" caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
    </html:form>
 <iframe style="display:"  width="0" length="0" id="hidframe"></iframe>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{     
  if(node.NodeValue!=null){
      seltree.xmlsrc="mofcategory.cmd?method=getReferenceNode&categoryId="+node.NodeId; 
  }
}

seltree.clickText=function(node)
{
   
    var currentId = node.NodeId;
    var currentName = node.innerText;
    seltree.xmlsrc="mofcategory.cmd?method=getReferenceNode&categoryId="+node.NodeId; 
    var arr =split(currentId);
      if(arr[1]=="-1") {
          getMainFrame().location.href="jsp/content.jsp";
          return;
     }
    else{
        var parentName = seltree.GetParentElement(node.parentElement).children[2].innerText;
        var parentId = seltree.GetParentElement(node.parentElement).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr[1]=="L"){
            getMainFrame().location.href="mofreflist.cmd?method=detail&mofReflistId="+arr[0]+"&mofReferenceId="+arr2[0]+"&mofReferenceName="+parentName;
         }
        else if(arr[1]=="E"||arr[1]=="D"||arr[1]=="T"||arr[1]=="S"){
            getMainFrame().location.href="mofreference.cmd?method=detail&mofReferenceId="+arr[0];
        }else{
            getMainFrame().location.href="jsp/content.jsp";
            return;
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
   seltree.insertLeafMenu(new Array("明细","修改","删除"),new Array("detailM();","updateM();","delM();"),new Array("查看枚举值信息","修改枚举值信息","删除枚举值"));
   seltree.insertNodeMenu(new Array("明细","修改","删除","改变类别","查看属性","增加元素"),new Array("detailM();","updateM();","delM();","moveM();","queryM();","addE();"),new Array("查看参考类型具体信息","修改参考类型具体信息","删除参考类型","改变参考类型类别","查看子元素集合","增加子元素"));
   
}

function detailM()
{   
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
    var arr =split(currentId);
    if(arr[1]=="-1") {
        alert("该节点不能查看『明细』！");
        return ;
    }
    else{
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].innerText;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr[1]=="L"){
            getMainFrame().location.href="mofreflist.cmd?method=detail&mofReflistId="+arr[0]+"&mofReferenceId="+arr2[0]+"&mofReferenceName="+parentName;
         }
        else if(arr[1]=="E"||arr[1]=="D"||arr[1]=="T"||arr[1]=="S"){
            getMainFrame().location.href="mofreference.cmd?method=detail&mofReferenceId="+arr[0];
        }
        else{
            alert("类别不能查看『明细』，请到『类别管理』查看！");
            return;
        }
    }
}

function queryM()
{   
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
    var arr =split(currentId);
    //根节点查询全部
    if(currentId=="<%=MofConstants.ROOT_ID%>") {
        //var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].innerText;
        //var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getMainFrame().location.href="mofreferencequery.cmd?category="+currentId;
      }
    //三种基本类型查询该类型全部
    else if (currentId=="__DataValue"){
        getMainFrame().location.href="mofreferencequery.cmd?validationtype=DataValue";
    }
    else if (currentId=="__TableValue"){
        getMainFrame().location.href="mofreferencequery.cmd?validationtype=Table";
    }
    else if (currentId=="__EnumValue"){
        getMainFrame().location.href="mofreferencequery.cmd?validationtype=Enumeration";
    }
    //系统按钮类型的为屏蔽子分类需做特殊处理
    else if (currentId=="__SysBtnValue"){
        getMainFrame().location.href="mofreferencequery.cmd?category=8a228b4406145a600106147e566b0000&validationtype=SysButton";
    }
    //Enum和Table2种查询该类别下的元素
    else if(arr[1]=="C_E"){
        getMainFrame().location.href="mofreferencequery.cmd?category="+arr[0]+"&validationtype=Enumeration";
    }
    else if(arr[1]=="C_T"){
        getMainFrame().location.href="mofreferencequery.cmd?category="+arr[0]+"&validationtype=Table";
    }
    //如果是枚举值，查询下面的枚举集合
    else if (arr[1]=="E"){
        getMainFrame().location.href="mofreflistquery.cmd?mofReferenceId="+arr[0]+"&mofReferenceName="+currentName;
    }else{
        alert("该节点不能查询属性列表！");
        return ;
    }
    
}

function addM()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
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
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
           var arr =split(currentId);
           if(currentId=="<%=MofConstants.ROOT_ID%>") {
               //var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].innerText;
               //var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
               alert("参考类型定义根节点不能增加新类别！");
               return;
             }
           //三种基本类型查询该类型全部
           else if (currentId=="__DataValue"){
               getMainFrame().location.href="mofreference.cmd?method=forinsert&categoryId=<%=MofConstants.ROOT_ID%>&validationtype=DataValue";
           }
           else if (currentId=="__TableValue"){
               getMainFrame().location.href="mofreference.cmd?method=forinsert&categoryId=<%=MofConstants.ROOT_ID%>&validationtype=Table";
           }
           else if (currentId=="__EnumValue"){
               getMainFrame().location.href="mofreference.cmd?method=forinsert&categoryId=<%=MofConstants.ROOT_ID%>&validationtype=Enumeration";
           }
           //系统按钮类型做特殊处理
           else if (currentId=="__SysBtnValue"){
               getMainFrame().location.href="mofreference.cmd?method=forinsert&categoryId=8a228b4406145a600106147e566b0000&validationtype=SysButton";
           }
           //Enum和Table2种查询该类别下的元素
           else if(arr[1]=="C_E"){
               getMainFrame().location.href="mofreference.cmd?method=forinsert&categoryId="+arr[0]+"&validationtype=Enumeration";
           }
           else if(arr[1]=="C_T"){
               getMainFrame().location.href="mofreference.cmd?method=forinsert&categoryId="+arr[0]+"&validationtype=Table";
           }
           //如果是枚举值，查询下面的枚举集合
           else if (arr[1]=="E"){
               getMainFrame().location.href="mofreflist.cmd?method=forinsert&mofReferenceId="+arr[0]+"&mofReferenceName="+currentName;
           }else{
               alert("该节点不能增加子元素！");
               return ;
           }
}  

function updateM()
{     
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
         var arr = split(currentId);
         if(arr[1]=="-1") {
             alert("该节点不能『修改』！");
             return ;
         }
         else{
             var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].innerText;
             var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
             var arr2 = split(parentId);
             if(arr[1]=="L"){
                 getMainFrame().location.href="mofreflist.cmd?method=forupdate&mofReflistId="+arr[0]+"&mofReferenceId="+arr2[0]+"&mofReferenceName="+parentName;
              }
             else if(arr[1]=="E"||arr[1]=="D"||arr[1]=="T"||arr[1]=="S"){
                 getMainFrame().location.href="mofreference.cmd?method=forupdate&mofReferenceId="+arr[0];
             }
             else{
                 alert("类别不能执行『修改』，请到『类别管理』修改！");
                 return;
             }
         }
}
function delM()
{ 
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
    var arr = split(currentId);
    if(arr[1]=="-1") {
        alert("该节点不能『删除』！");
        return ;
    }
    else{
        if(!confirm("您确定要删除当前元素吗？")) return;
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].innerText;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr[1]=="L"){
           // self.hidframe.location.href="mofreflist.cmd?method=delete&mofReflistId="+arr[0];
            getMainFrame().location.href="jsp/content.jsp";
            var returnStr = startRequest("mofreflist.cmd?method=delete&mofReflistId="+arr[0]); 
            if(returnStr.replace(/^\s+|\s+$/g,"").substring(0,5)=="ERROR")
            {
            	alert("删除失败!被删除的数据可能已被其它数据引用");
            }
            else{
            	alert("删除枚举值『"+currentName+"』成功！");
            }        
            self.seltree.refreshNodeById(parentId);
         }
        else if(arr[1]=="E"||arr[1]=="D"||arr[1]=="T"||arr[1]=="S"){
            //self.hidframe.location.href="mofreference.cmd?method=delete&mofReferenceId="+arr[0];
            getMainFrame().location.href="jsp/content.jsp";
            var returnStr = startRequest("mofreference.cmd?method=delete&mofReferenceId="+arr[0]); 
            if(returnStr.replace(/^\s+|\s+$/g,"").substring(0,5)=="ERROR")
            {
            	alert("删除失败!被删除的数据可能已被其它数据引用");
            }else{
            alert("删除参考类型『"+currentName+"』成功！");
          }
            self.seltree.refreshNodeById(parentId);
        }
        else{
            alert("类别不能执行『删除』，请到『类别管理』删除！");
            return;
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
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
    var arr = split(currentId);
    if(arr[1]=="-1"||arr[1]=="__DataValue"||arr[1]=="__TableValue"||arr[1]=="__EnumValue"||arr[1]=="__SysButton") {
        alert("该节点不能执行『改变类别』！");
        return ;
    }else if(arr[1]=="C_E"||arr[1]=="C_T"){
        alert("该处不能执行『改变类别』！,请到『类别管理』修改");
        return ;
    }
    //系统按钮类型做特殊处理
    else if(arr[1]=="S") {
    	alert("系统按钮类型节点不能执行『改变类别』！");
    }
    else if(arr[1]=="E"||arr[1]=="T"){
        if(!confirm("您确定要改变当前元素的类别吗？")) return;
        var cmdUrl="mofcategorymovequery.cmd&clear=true";
        var url ="jsp/help.jsp?url="+cmdUrl;
        var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:530px;dialogHeight:450px"); 
        if (win == null) {  
       	      return;
        }else{
              tempId=win[0]
              tempName = win[1];
              var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
              self.hidframe.location.href="mofcategory.cmd?method=changeReferenceCategory&mofReferenceId="+arr[0]+"&categoryId="+tempId;
              getMainFrame().location.href="jsp/content.jsp"; 
              if(arr[1]=="E")
                  self.seltree.refreshNodeById(tempId+"@C_E"); 
              else if (arr[1]=="T")
                  self.seltree.refreshNodeById(tempId+"@C_T"); 
              self.seltree.refreshNodeById(parentId); 
        }            
        }else{
            alert("该节点不能执行『改变类别』操作！");
            return ;
        }
    }
</SCRIPT>
