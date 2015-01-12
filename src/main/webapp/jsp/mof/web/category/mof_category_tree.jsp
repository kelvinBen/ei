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
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false"  style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="categoryName" nodeId="categoryId" nodeValue="isLeaf" collection="category_tree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc"  caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
    </html:form>
 <iframe style="display:" width="0" id="hidframe"></iframe>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{     

  //var arr = split(node.NodeId);
  seltree.xmlsrc="mofcategory.cmd?method=getCategoryNode&categoryId="+node.NodeId; 
  //if(node.parentElement.type=="leaf")
  //getMainFrame().location.href="mofcategory.cmd?method=detail&categoryId="+arr[0];
      
}
seltree.clickText=function(node)
{
  var currentId = node.NodeId;
  var currentName = node.title;
  seltree.xmlsrc="mofcategory.cmd?method=getCategoryNode&categoryId="+node.NodeId; 
  if(currentId=="<%=MofConstants.ROOT_ID%>") {
        getMainFrame().location.href="jsp/content.jsp";
        return;
   }
  else{
      var parentName = seltree.GetParentElement(node.parentElement).children[2].title;
      var parentId = seltree.GetParentElement(node.parentElement).children[0].NodeId;
      getMainFrame().location.href="mofcategory.cmd?method=detail&categoryId="+currentId+"&parent="+parentId;
   }
}

seltree.loadRightMouseMenu()
{
		seltree.insertNodeMenu(new Array("��ϸ","�޸�","ɾ��","�����¼�"),new Array("queryM();","updateM();","delM();","addM();"),new Array("�鿴�����Ϣ","�޸������Ϣ","ɾ�����","���������"));
}

function queryM()
{   
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    if(currentId=="<%=MofConstants.ROOT_ID%>"){
        alert("���ڵ㲻�ܲ鿴����ϸ�������ڵ�ֻ�С������¼���ģ�������");
        return;
    }
    else {
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getMainFrame().location.href="mofcategory.cmd?method=detail&categoryId="+currentId+"&parent="+parentId;
    }
}
function addM()
{         
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
 	       getMainFrame().location.href="mofcategory.cmd?method=forinsert&parent="+currentId;

}  

function updateM()
{     
         var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
         var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
         if(currentId=="<%=MofConstants.ROOT_ID%>"){ 
             alert("���ڵ㲻�ܡ��޸ġ������ڵ�ֻ�С������¼���ģ�������");
             return ;
         }   
         else{
             var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
             var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
             getMainFrame().location.href="mofcategory.cmd?method=forupdate&categoryId="+currentId+"&parent="+parentId;
	     
         }
}
function delM()
{ 
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].innerText;
    if(currentId=="<%=MofConstants.ROOT_ID%>"){ 
        alert("���ڵ㲻�ܡ�ɾ���������ڵ�ֻ�С������¼���ģ�������");
        return ;
    }   
    else{
        if(!confirm("ɾ���������в��ɻָ��ԣ���ȷ��Ҫɾ����ǰģ����")) return;
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getMainFrame().location.href="mofcategory.cmd?method=delete&categoryId="+currentId+"&categoryName="+currentName+"&refreshId="+parentId;
        //alert(parentId);
       // alert("ɾ�����"+currentName+"���ɹ���");
        self.seltree.refreshNodeById(parentId);
//        getMainFrame().location.href="jsp/content.jsp";
}
}

</SCRIPT>
