<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%String app=request.getContextPath(); %>
<html>
<head>
<title>�˵�ά��</title>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"XMLSelTree.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>

</head>
<body topmargin="10px" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" >
 <form>
<widgets:container title="�˵�ά��" >

<widgets:containbutton onclick="doOK()" text="��Ч�˵�"/>

<table width="100%" height="400">
    <tr>
      <td width="50%">
		<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" hasRoot="false" style="width:300;height:100%;overflow:no;white-space:nowrap;" isDataAsync="false">
	  		<tree:selNode title="text" nodeId="id" collection="tree" nodeXmlSrc="isTreeLeaf" perImgSrc="perImgSrc" />
        </tree:selTree>
      </td>
      <td>
     
	  <div id="MENU_DETAIL" style="width:100%;height:100%">
      
      </div>
     
      </td>
   </tr>
</table>
</widgets:container>
</form>
</body>
</html>

<script lanuage="javascript">
	//���"+"/"-"
	seltree.clickImg=function(node){
		//alert(node.NodeId);
		seltree.xmlsrc="newmenu.cmd?method=children&ID="+node.NodeId;
	}
	
	//����ı�
	seltree.clickText=function(node){
		//alert(node.NodeId);
		//event.srcElement.parentElement.previousSibling.checked=true;
		seltree.xmlsrc="newmenu.cmd?method=children&ID="+node.NodeId;
		document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("newmenu.cmd?method=detail&ID="+node.NodeId);
	}
	
	//�����Ҽ��˵�
	seltree.loadRightMouseMenu=function(){
		seltree.insertNodeMenu(new Array("����","ɾ��","����","����","�Ƶ�"),new Array("doNew();","doDelete();","doUp();","doDown();","doMoveTo();"),new Array("","","","",""));
		seltree.insertLeafMenu(new Array("����","ɾ��","����","����","�Ƶ�"),new Array("doNew();","doDelete();","doUp();","doDown();","doMoveTo();"),new Array("","","","",""));//Ҷ�ڵ���кͷ�Ҷ�ڵ�һ���Ĳ˵�
	}	
	seltree.loadRightMouseMenu();
	
	//����
	function doUp(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		if(id=="0"){//���ڵ�
			return;
		}
		var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
		sendxmlhttp("newmenu.cmd?method=moveUp&ID="+id);
		seltree.refreshNodeById(pid);
	}

	//����
	function doDown(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		if(id=="0"){//���ڵ�
			return;
		}
		var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
		sendxmlhttp("newmenu.cmd?method=moveDown&ID="+id);
		seltree.refreshNodeById(pid);
	}
	//�Ƶ�
	function doMoveTo(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		if(id=="0"){//���ڵ�
			return;
		}
		var oPid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
		var url ="jsp/help.jsp?url=menuhelp.cmd&method=root&except="+id;
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
		if(win==null){
			return;
		}
		sendxmlhttp("newmenu.cmd?method=moveTo&ID="+id+"&PARENT_ID="+win[0]);
		seltree.refreshNodeById(win[0]);
		seltree.refreshNodeById(oPid);
	}	
	//ɾ��
	function doDelete(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		if(id=="0"){//���ڵ�
			return;
		}
		var pid=(seltree.GetParentElement(seltree.GetNodeById(id)).children[0].NodeId);
		sendxmlhttp("newmenu.cmd?method=delete&ID="+id);
		//ˢ���ϼ��ڵ�
		seltree.refreshNodeById(pid);
		
		document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("newmenu.cmd?method=newmenu&ID="+pid);
	}
	
	//���浽���ݿ�
	function doOK(){
		var r=sendxmlhttp("refreshmenu.cmd");
		if(r.length>50){
			r="ˢ�²˵�����";
		}
		alert(r);
		top.location.reload();
	}
	
	//����
	function doNew(){
		var	id=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
		document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("newmenu.cmd?method=newmenu&ID="+id);
	}
	
	function doSave(){
		if(document.forms[0].text.value==""){
			alert("������<%=ResourcesFactory.getString("PUB_MENU.TEXT")%>");
			document.forms[0].text.focus();
			return;
		}
		var url="menusave.cmd";
		var names=new Array("id","title","text","type","function","target","parent","options","functionId");
		
		var re=/&/g;
	    var str=document.forms[0].function1.value.replace(re,"&amp;");
		var values=new Array(document.forms[0].id.value,document.forms[0].title.value,document.forms[0].text.value,document.forms[0].type.value,str,document.forms[0].target.value,document.forms[0].parent.value,document.forms[0].options.value,document.forms[0].functionId.value);
		var r=sendxmlhttp2(url,names,values);
		if(r.length>50){
			r="����˵�����";
		}
		alert(r);
		/*
		url=url+"&id="+document.forms[0].id.value;
		url=url+"&title="+document.forms[0].title.value;
		url=url+"&text="+document.forms[0].text.value;
		url=url+"&type="+document.forms[0].type.value;
		url=url+"&function="+escape(document.forms[0].function1.value);
		url=url+"&target="+document.forms[0].target.value;
		url=url+"&parent="+document.forms[0].parent.value;	
		url=url+"&options="+document.forms[0].options.value;													
		//alert(url);
		sendxmlhttp(url);	
		*/
		
		if(document.forms[0].id.value=="-1"){//�����������ˢ���ϼ��ڵ�
			seltree.refreshNodeById(document.forms[0].parent.value);
		}
		
		if(document.forms[0].id.value=="-1"){//����
			document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("newmenu.cmd?method=newmenu&ID="+document.forms[0].parent.value);
		}else{//�༭
			document.getElementById("MENU_DETAIL").innerHTML=sendxmlhttp("newmenu.cmd?method=detail&ID="+document.forms[0].id.value);
		}
		
		
	}
	

	function sendxmlhttp(url){
		
		var conn = new ActiveXObject("Microsoft.XMLHTTP");
		conn.open("POST", url, false);
		conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
	        conn.send();
	        return conn.responseText;
	}
	function sendxmlhttp2(url,names,values){
		if(names.length!=values.length){
			return "�������ƺͲ���ֵ��������һ��!";
		}
		var params="";
		var declare="<?xml version='1.0\' encoding='UTF-8'?>";
		var start="<xmlhttp>"
		var end="</xmlhttp>";
		for(var i=0;i<names.length;i++){
			params+="<param name='"+names[i]+"' value='"+values[i]+"'/>";
		}
		var data=declare+start+params+end;
		//alert(data);
		var conn = new ActiveXObject("Microsoft.XMLHTTP");
		conn.open("POST", url, false);
		conn.setRequestHeader("Content-Type","text/xml;charset=GBK");
	        conn.send(data);
	        return conn.responseText;
	}
function doTest(){
	var url ="jsp/help.jsp?url=menuhelp.cmd&method=root";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
	if(win==null)return;	
	alert(win[0]);
	alert(win[1]);
}	
function selectFunctionId(){
  var url ="jsp/help.jsp?url=function.cmd&method=getFunctionRootHelp";     
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
  if (win == null) {  
  	  return;
  }else{
  		document.forms[0].functionId.value =win[0]; 
  }
}
</script>
