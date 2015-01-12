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
	//���"+"/"-"
	seltree.clickImg=function(node){
		//alert(node.NodeId);
		seltree.xmlsrc="moftree.cmd?method=getchild&window_name=<%=window%>&parentid="+node.NodeId;
	}
	
	//����ı�
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
	//�����Ҽ��˵�
	seltree.loadRightMouseMenu=function(){
		seltree.insertNodeMenu(new Array("�����¼�","�޸�","ɾ��","�������ڵ�"),new Array("doNew();","doUpdate();","doDelete();","doMove();"),new Array("�����¼�","�޸�","ɾ��","�ƶ�"));
		//seltree.insertNodeMenu(new Array("�����¼�","�鿴�¼�","�޸�","ɾ��","�������ڵ�"),new Array("doNew();","doQuery()","doUpdate();","doDelete();","doMove();"),new Array("�����¼�","�޸�","ɾ��","�ƶ�"));
		seltree.insertLeafMenu(new Array("�޸�","ɾ��","�������ڵ�"),new Array("doUpdate();","doDelete();","doMove();"),new Array(""));
	}	
	seltree.loadRightMouseMenu();
	
	//����
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
	//�鿴�ӽ��
	function doQuery(){
		var id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		getMainFrame().location.href="mofquerychild.cmd?child_window=<%=window%>&parent_window=haha&primaryKey="+id;
	}
	//�޸�
	function doUpdate(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=<%=window%>&primaryKey="+id;		
	}
	//ɾ��
	function doDelete(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId; 
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
		if(!confirm("ɾ���������в��ɻָ��ԣ���ȷ��Ҫɾ����ǰ������")) return; 
        self.hidframe.location.href="moftree.cmd?method=deletenode&window_name=<%=window%>&primaryKey="+id;		
        getMainFrame().location.href = "jsp/content.jsp";
        //self.seltree.refreshNodeById(parentId);        
	}
	//�ƶ�
	function doMove(){
		//alert("doMove");
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId; 
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].NodeId;
        var url="moftree.cmd?method=roothelp&window_name=<%=window%>&parentid=-1&selectid="+id;
        var new_parent = showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:500px;dialogHeight:450px");
        if(new_parent==null) return;
        if(new_parent==id) {alert("���ڵ㲻������Ϊ��ǰ�ڵ��Լ�!");return};
        
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
		alert("��Ҫɾ���Ľ�㻹���¼���㣬ɾ���������ܽ��У�");
	}
</script>