<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="java.util.*"%>

<%
	String window=(String)request.getAttribute("window_name");
%>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
</head>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<html:form name="form1" action="">
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  		<tree:selNode title="text" nodeId="id" collection="tree" nodeXmlSrc="isLeaf" />
    </tree:selTree>
	</td>
    </tr>
</table>
</html:form>
 <iframe style="display:"  width="0" id="hidframe"></iframe>
</body>
</html>

<script lanuage="javascript">
	//点击"+"/"-"
	seltree.clickImg=function(node){
		//alert(node.NodeId);
		seltree.xmlsrc="moftree.cmd?method=getchild&window_name=<%=window%>&parentid="+node.NodeId;
	}
	
	//点击文本
	seltree.clickText=function(node){
		//alert(node.NodeId);
		//event.srcElement.parentElement.previousSibling.checked=true;
		seltree.xmlsrc="moftree.cmd?method=getchild&window_name=<%=window%>&parentid="+node.NodeId;

		if(node.NodeId=="-1" || node.NodeId==""){			
	        getMainFrame().location.href = "jsp/content.jsp";
	        return;
		}
		getMainFrame().location.href="mofexec.cmd?method=detail&window_name=<%=window%>&primaryKey="+node.NodeId;
	}
	//加载右键菜单
	seltree.loadRightMouseMenu=function(){
		seltree.insertNodeMenu(new Array("增加下级","修改","删除","调整父节点"),new Array("doNew();","doUpdate();","doDelete();","doMove();"),new Array("增加下级","修改","删除","移动"));
		//seltree.insertNodeMenu(new Array("增加下级","查看下级","修改","删除","调整父节点"),new Array("doNew();","doQuery()","doUpdate();","doDelete();","doMove();"),new Array("增加下级","修改","删除","移动"));
		seltree.insertLeafMenu(new Array("修改","删除","调整父节点"),new Array("doUpdate();","doDelete();","doMove();"),new Array(""));
	}	
	seltree.loadRightMouseMenu();
	
	//新增
	function doNew(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		var curr_node = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode);
	/*	var parentId="-1";
		if( curr_node != null ) 
            parentId = curr_node.children[2].NodeId;
	*/
		getMainFrame().location.href="moftree.cmd?method=forinsertchild&window_name=<%=window%>&primaryKey="+id;		
        self.seltree.refreshNodeById(curr_node);        
		
	}
	//查看子结点
	function doQuery(){
		var id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		getMainFrame().location.href="mofquerychild.cmd?child_window=<%=window%>&parent_window=haha&primaryKey="+id;
	}
	//修改
	function doUpdate(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=<%=window%>&primaryKey="+id;		
	}
	//删除
	function doDelete(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId; 
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
		if(!confirm("删除操作具有不可恢复性，您确定要删除当前对象吗？")) return; 
        self.hidframe.location.href="moftree.cmd?method=deletenode&window_name=<%=window%>&primaryKey="+id;		
        getMainFrame().location.href = "jsp/content.jsp";
        //self.seltree.refreshNodeById(parentId);        
	}
	//移动
	function doMove(){
		//alert("doMove");
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId; 
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
        var url="moftree.cmd?method=roothelp&window_name=<%=window%>&parentid=-1&selectid="+id;
        var new_parent = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:500px;dialogHeight:450px");
        if(new_parent==null) return;
        if(new_parent==id) {alert("父节点不能设置为当前节点自己!");return};
        
        var url="moftree.cmd?method=move&window_name=<%=window%>";
        url=url+"&primaryKey="+id;
        url=url+"&newParent="+new_parent;
        url=url+"&oldParent="+parentId;
        
        
		getMainFrame().location.href=url;
        self.seltree.refreshNodeById("-1"); 
        //self.seltree.refreshNodeById(""); 
        
	}
	
	function refreshTree()
	{
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        getTreeFrame().seltree.refreshNodeById(parentId);
	}
	
	function alertMessage(msg)
	{
		alert("您要删除的结点还有下级结点，删除操作不能进行！");
	}
</script>