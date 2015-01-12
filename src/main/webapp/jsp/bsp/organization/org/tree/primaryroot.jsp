<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="net.mast.bsp.permit.pdp.vote.HasPermission, net.mast.bsp.permit.context.*"%> 
<%
	String path =  "http://" + request.getLocalAddr() + ":" + request.getLocalPort() +request.getContextPath();

     String struId=(String)request.getAttribute("struId");
     if(struId==null || struId==""){
	    struId="1";
     }

 	int num =0;
 	String showMenu="";
 	
 	String url_0 = "stru.cmd?method=detailProxy";
 	if(HasPermission.hasPermission(url_0)) {
 		num ++;
 		showMenu=showMenu+"0,"; 
 	}
 	
 	String url_1 = "stru.cmd?method=insert";
 	if(HasPermission.hasPermission(url_1)) {
 		num ++;
 		showMenu=showMenu+"1,"; 
 	}
 	
 	String url_2 = "stru.cmd?method=add";
 	if(HasPermission.hasPermission(url_2)) {
 		num ++;
 		showMenu=showMenu+"2,"; 
 	}
 	
 	String url_3 = "stru.cmd?method=changeStruOrder";
 	if(HasPermission.hasPermission(url_3)) {
 		num ++;
 		showMenu=showMenu+"3,"; 
 	}
 	
 	String url_4 = "stru.cmd?method=update";
 	if(HasPermission.hasPermission(url_4)) {
 		num ++;
 		showMenu=showMenu+"4,"; 
 	}			
 	
 	String url_5 = "stru.cmd?method=delete";
 	if(HasPermission.hasPermission(url_5)) {
 		num ++;
 		showMenu=showMenu+"5,"; 
 	}
 	
 	String url_6 = "stru.cmd?method=mergeTo";
 	if(HasPermission.hasPermission(url_6)) {
 		num ++;
 		showMenu=showMenu+"6,"; 
 	}
 	
 	String url_7 = "hreventquery.cmd";
 	if(HasPermission.hasPermission(url_7)) {
 		num ++;
 		showMenu=showMenu+"7,"; 
 	}
 	
 	String url_8 = "organparmst.cmd?method=enumValueQuery";
 	if(HasPermission.hasPermission(url_8)) {
 		num ++;
 		showMenu=showMenu+"8,"; 
 	}
 				
 	String url_9 = "struquery.cmd";
 	if(HasPermission.hasPermission(url_9)) {
 		num ++;
 		showMenu=showMenu+"9,"; 
 	}
 	String url_10 = "stru.cmd?method=forExport";
 	if(HasPermission.hasPermission(url_10)) {
 		num ++;
 		showMenu=showMenu+"10,"; 
 	}
 	String url_11 = "stru.cmd?method=forImport";
 	if(HasPermission.hasPermission(url_11)) {
 		num ++;
 		showMenu=showMenu+"11,"; 
 	}
 	String url_12 = "/bu/restructurStru.do";
 	if(HasPermission.hasPermission(url_12)) {
 		num ++;
 		showMenu=showMenu+"12,"; 
 	}
 	if(!showMenu.equals("")){
 		showMenu = showMenu.substring(0,showMenu.length()-1);
 	}
%>
<html>
<head>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<SCRIPT LANGUAGE="JavaScript">
var state=1;
function init()
{

        getMainFrame().location.href = "jsp/content.jsp";
}
init();  
// 
</SCRIPT>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script type="text/javascript" src="<%=path%>/jsp/include/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/jsp/include/jquery.pngFix.pack.js"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">

</head>
<%
BspInfo bspInfo = (BspInfo) session.getAttribute(BspInfoKey.BSPINFOKEY);
if(!bspInfo.isAdminUser()){
	response.sendRedirect(request.getContextPath()+"/jsp/nopermit.jsp"); 
}
%>
<BODY  topmargin="0" leftmargin="5" marginheight="0" marginwidth="0" bgcolor="#f2f8ff" text="#000000" onload="init();" >
<c:if test="${not empty actionMessages}"><script type="text/javascript">alert('${actionMessages}');</script></c:if>
<table width="100%">
    <tr><td>
	<tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false" style="width:100%;height:100%;overflow:auto;white-space:nowrap;" isDataAsync="true">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="struId" collection="functree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc"  caption="">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
</BODY>
<SCRIPT LANGUAGE="JavaScript">
seltree.loadRightMouseMenu()
{
	var num =<%=num%>;
	var isShowMenu ="<%=showMenu%>";
	var showMenu=isShowMenu.split(",");   //�ж��Ƿ���ʾ�Ҽ��˵�
	
	var menu_name = new Array(num);
	var menu_method = new Array(num);
	 
	var name = new Array ("��ʾ������Ϣ","�����¼�","ѡ���¼�","�¼�����","�޸�","����","���������ϵ","���������¼���¼","���û�������","�����¼�","����","����","�����û�");
	var method = new Array ("forDetail();","forInsert();","forSelect();","forOrder();","forUpdate();","forDelete();","forMergeTo();","forHrEvent();","setOrganParams();","forQuery();","forExport();","forImport();","forStru();");
	 
	for(var i=0;i<num;i++){
		var flag = showMenu[i];
		menu_name[i]=name[flag];
		menu_method[i]=method[flag];
	}   
		seltree.insertLeafMenu(menu_name,menu_method,menu_name);
		seltree.insertNodeMenu(menu_name,menu_method,menu_name);
}  
//����
function forExport(){
    if(!getExport()) return;
	var struId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
 
	getMainFrame().location.href = "stru.cmd?method=forExport&struId="+struId;
}
function getExport(){
  if (!confirm("ȷ�ϵ�����ѡ�ڵ��µ���֯�ṹ��?")) {
   	return false;
  }  
  return true;
}
//�����û�
function forStru(){
    if(!getStru()) return;
	var struId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
$.ajax({
			async:true,
			type:"post",
			url:"<%=path%>/bu/restructurStru.do?nodeId="+struId,
		    beforeSend:function(){
		    },
		    success:function(data){
				if(data=="1"){
		    		alert("����ɹ�");
		    		return true;
		    	}else if(data=="0"){
		    		alert("ϵͳæ����ʮ���Ӻ�����");
		    		return true;
		    	}else if(data=="2"){
		    		alert("�������û������������У���ʮ���Ӻ�����");
		    		return true;
		    	}
		    },
		    complete:function(data){		    	
		    },
		    error:function(){
			    alert("ϵͳæ����ʮ���Ӻ�����");
    			return true;
		    }
});

	return false;
}
function getStru(){
  if (!confirm("ȷ��������ѡ�ڵ��µ���֯�ṹ��?")) {
   	return false;
  }  
  alert("��ȴ���������ɹ���ʾ�ٽ�����һ������");
  return true;
}
//����
function forImport(){
	var struId=seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;

	getMainFrame().location.href = "stru.cmd?method=forImport&struId="+struId;
}

seltree.clickImg=function(node)
{
        seltree.xmlsrc="stru.cmd?method=getnode&parentId="+node.NodeId;        
}

seltree.clickText=function(node)
{
	getMainFrame().location.href = "jsp/content.jsp";
        seltree.xmlsrc="stru.cmd?method=getnode&parentId="+node.NodeId;  
        if(state==1)      {
        	getMainFrame().location.href="stru.cmd?method=detailProxy&primaryKey="+node.NodeId;
        }
}

function forSetState(){
 	 state=1;
}
function forUnSetState(){
	 state=0;
}



function forHrEvent(){
	var uri="hreventquery.cmd?struId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href =uri;  
}

function forQuery(){
	var uri="struquery.cmd?method=query&struId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href =uri;  
}

function forDetail(){
	//var uri="stru.cmd?method=detail&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var uri="stru.cmd?method=detailProxy&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	getMainFrame().location.href =uri;  
}


function forInsert(){
	//var uri="stru.cmd?method=forinsert&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	//getMainFrame().location.href =uri;  	
	var uri ="stru.cmd?method=forInsertOrganType&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;   
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:256px;dialogHeight:192px"); 
	  if (win == null) {  
	  	return;
	  }else{
	  getMainFrame().location.href=win[0];
	 }
}


function forSelect(){
	 var uri ="stru.cmd?method=getAddMemberRoot&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;   
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	  if (win == null) {  
	  	return;
	  }else{
	  getMainFrame().location.href=win[0];
	 }
}




function forMergeTo(){
	 var uri ="stru.cmd?method=getMergeRoot&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;       
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	 
	  if (win == null) {  
	  	return;
	  }else{
	  getMainFrame().location.href=win[0];
	 }
}



function forUpdate(){
	//var uri="stru.cmd?method=forupdate&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;  
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
	var parentId = "-1";
	if(seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode)!=null)
	   parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId; 
	var uri="stru.cmd?method=forUpdateProxy&primaryKey="+currentId+"&parentId="+ parentId;  
	getMainFrame().location.href=uri;
}
function setOrganParams(){
	var uri ="organparmsquery.cmd?method=query&struId="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;          
	getMainFrame().location.href=uri;

}



function forDelete(){
 	var uri ="stru.cmd?method=forDelete&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;       
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:300px"); 	 
	  if (win == null) {  
	  	return;
	  }else{
	  var hrEventType=win[0];
	  var hrEventMemo=win[1];	  
	   var uri="stru.cmd?method=delete&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId+"&hrEventType="+hrEventType+"&hrEventMemo="+hrEventMemo;    
	  getMainFrame().location.href=uri;
	 }
}


function forOrder(){
	var uri ="stru.cmd?method=getChangeOrderRoot&primaryKey="+seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;          
	 var win = showModalDialog(uri,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
	  if (win == null) {  
	  	return;
	  }else{
	   getMainFrame().location.href=win[0];
	 }
}
//������Դ���ڽ����ʱ���չ�����ڶ���
var struId="<%=struId%>";
seltree.refreshNodeByIdOnce(struId);
function openNode(id){
	seltree.openNodeById(id);
}



</SCRIPT>
</html>