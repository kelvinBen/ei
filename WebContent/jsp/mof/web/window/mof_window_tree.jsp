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
	  	<tree:selNode title="categoryName" nodeId="categoryId" toolTip="toolTip"  nodeValue="isLeaf" collection="category_tree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc"  caption="caption">
	    </tree:selNode>
	</tree:selTree>
	</td>
    </tr>
    </table>
    </html:form>
 <iframe style="display:"  width="0" id="hidframe"></iframe>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
seltree.clickImg=function(node)
{ 
  //var arr = split(node.NodeId);
  seltree.xmlsrc="mofcategory.cmd?method=getWindowNode&categoryId="+node.NodeId; 
  //if(node.parentElement.type=="leaf")
  //getMainFrame().location.href="mofcategory.cmd?method=detail&categoryId="+arr[0];
      
}
seltree.clickText=function(node)
{
    var currentId = node.NodeId;
    var currentName = node.title;
    seltree.xmlsrc="mofcategory.cmd?method=getWindowNode&categoryId="+node.NodeId; 
    var arr =split(currentId);
    if(arr[1]=="-1") {
        getMainFrame().location.href="jsp/content.jsp";
        return;
    }
    else{
        var parentName = seltree.GetParentElement(node.parentElement).children[2].title;
        var parentId = seltree.GetParentElement(node.parentElement).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr[1]=="W"){
            //getMainFrame().location.href="mofwindow.cmd?method=detail&mofWindowId="+arr[0]+"&parent="+parentId;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_window&primaryKey="+arr[0]+"&parent_window=mof_category&main_primaryKey="+parentId;
         }
        else if(arr[1]=="T"){
            //getMainFrame().location.href="moftab.cmd?method=detail&mofTabId="+arr[0]+"&mofWindowId="+arr2[0]+"&mofWindowName="+parentName;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_tab&primaryKey="+arr[0]+"&parent_window=mof_window&main_primaryKey="+arr2[0];
        }else if (arr[1]=="F"){
            //getMainFrame().location.href="moffield.cmd?method=detail&mofFieldId="+arr[0]+"&mofTabId="+arr2[0]+"&mofTabName="+parentName;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_field&primaryKey="+arr[0]+"&parent_window=mof_tab&main_primaryKey="+arr2[0];
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
   seltree.insertLeafMenu(new Array("��ϸ","�޸�","ɾ��","��ά��"),new Array("detailM();","updateM();","delM();","getColumn();"),new Array("�鿴����Ϣ","�޸�����Ϣ","ɾ����","�޸����Ӧ�Ķ�������"));
   seltree.insertNodeMenu(new Array("��ϸ","�޸�","ɾ��","���ƴ���","�ı����","�鿴����","����Ԫ��","ģ��ͬ��","��������","����ģ��","����SQL","����汾"),new Array("detailM();","updateM();","delM();","designWindow();","moveM();","queryM();","addE();","generate();","codeMachineGenerator()","exportM();","exportSql();","saveVersion();"),new Array("�鿴���ڻ���Tab��Ϣ","�޸Ĵ��ڻ���Tab��Ϣ","ɾ�����ڻ���Tab","���ƴ���","�ı䴰�����","�鿴��Ӧ����Ԫ�ؼ���","�����µ���Ԫ��","ͬ��ָ�������д���ģ��","����ָ�������д���ģ��Ϊmof�ļ�","����ָ�������д���ģ��ΪSQL�ļ�","����һ��ָ�������д���ģ�͵İ汾"));
   
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
        if(arr[1]=="W"){
            //getMainFrame().location.href="mofwindow.cmd?method=detail&mofWindowId="+arr[0]+"&parent="+parentId;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_window&primaryKey="+arr[0]+"&parent_window=mof_category&main_primaryKey="+parentId;
         }
        else if(arr[1]=="T"){
            //getMainFrame().location.href="moftab.cmd?method=detail&mofTabId="+arr[0]+"&mofWindowId="+arr2[0]+"&mofWindowName="+parentName;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_tab&primaryKey="+arr[0]+"&parent_window=mof_window&main_primaryKey="+arr2[0];
        }else if (arr[1]=="F"){
            //getMainFrame().location.href="moffield.cmd?method=detail&mofFieldId="+arr[0]+"&mofTabId="+arr2[0]+"&mofTabName="+parentName;
            getMainFrame().location.href="mofexec.cmd?method=detail&window_name=mof_field&primaryKey="+arr[0]+"&parent_window=mof_tab&main_primaryKey="+arr2[0];
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
        //getMainFrame().location.href="mofwindowquery.cmd?categoryId="+currentId;
    	if(currentId=="-1")
    		getMainFrame().location.href="mofexecquery.cmd?window_name=mof_window&parent_window=mof_category";
    	else
    		getMainFrame().location.href="mofexecquery.cmd?window_name=mof_window&parent_window=mof_category&main_primaryKey="+currentId;
      }
    else{
        var parentName = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[2].title;
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr[1]=="W"){
            //getMainFrame().location.href="moftabquery.cmd?mofWindowId="+arr[0]+"&mofWindowName="+currentName;
        	getMainFrame().location.href="mofexecquery.cmd?window_name=mof_tab&parent_window=mof_window&main_primaryKey="+arr[0];
         }else if(arr[1]=="T"){
            //getMainFrame().location.href="moffieldquery.cmd?mofTabId="+arr[0]+"&mofTabName="+currentName; 
        	getMainFrame().location.href="mofexecquery.cmd?window_name=mof_field&parent_window=mof_tab&main_primaryKey="+arr[0];
         }
        else if(arr2[1]=="F"){
            alert("������ܲ鿴�����б�");
            return ;
        }
    }
}

function addM()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var isLeaf = seltree.TreeConfig.TreeCurrentNode.children[2].NodeValue;
           var arr =split(currentId);
           if(arr[1]=="-1") {
               getMainFrame().location.href="mofcategory.cmd?method=forinsert&parent="+currentId;
           }
           else if(arr[1]=="W"){
               alert("���ڶ����������¼����࣬���Ե��������Ԫ�ء�����TabԪ�أ�");
               return ;
           }
          else if(arr[1]=="T"){
              alert("Tab�����������¼����࣬���Ե��������Ԫ�ء�������Ԫ�أ�");
              return ;
          }else if (arr[1]=="F"){
              alert("������������¼����࣡");
              return ;
          }
 }  

function addE()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var isLeaf = seltree.TreeConfig.TreeCurrentNode.children[2].NodeValue;
           var arr =split(currentId);
           if(arr[1]=="-1") {
               //getMainFrame().location.href="mofwindow.cmd?method=forinsert&categoryId="+currentId;
               getMainFrame().location.href="mofexec.cmd?method=forinsert&window_name=mof_window&parent_window=mof_category&main_primaryKey="+currentId;
           }
           else if (arr[1]=="W"){
               //getMainFrame().location.href="moftab.cmd?method=forinsert&mofWindowId="+arr[0]+"&mofWindowName="+currentName;
               getMainFrame().location.href="mofexec.cmd?method=forinsert&window_name=mof_tab&parent_window=mof_window&main_primaryKey="+arr[0];
	       }
           else if(arr[1]=="T"){
               //getMainFrame().location.href="moffield.cmd?method=forinsert&mofTabId="+arr[0]+"&mofTabName="+currentName;
               getMainFrame().location.href="mofexec.cmd?method=forinsert&window_name=mof_field&parent_window=mof_tab&main_primaryKey="+arr[0];
           }else if (arr[1]=="F"){
               alert("������������¼�Ԫ�أ�");
               return ;
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
             if(arr[1]=="W"){
                 //getMainFrame().location.href="mofwindow.cmd?method=forupdate&mofWindowId="+arr[0]+"&parent="+parentId;
           	 	getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=mof_window&primaryKey="+arr[0]+"&parent_window=mof_category&main_primaryKey="+parentId;
              }
             else if(arr[1]=="T"){
                 //getMainFrame().location.href="moftab.cmd?method=forupdate&mofTabId="+arr[0]+"&mofWindowId="+arr2[0]+"&mofWindowName="+parentName;;
            	getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=mof_tab&primaryKey="+arr[0]+"&parent_window=mof_window&main_primaryKey="+arr2[0];
             }
             else if(arr[1]=="F"){
                 //getMainFrame().location.href="moffield.cmd?method=forupdate&mofFieldId="+arr[0]+"&mofTabId="+arr2[0]+"&mofTabName="+parentName;;
            	getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=mof_field&primaryKey="+arr[0]+"&parent_window=mof_tab&main_primaryKey="+arr2[0];
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
        if(arr[1]=="W"){
            //self.hidframe.location.href="mofwindow.cmd?method=delete&mofWindowId="+arr[0];
            //self.hidframe.location.href="mofexec.cmd?method=delete&window_name=mof_window&primaryKey="+arr[0]; 
            getMainFrame().location.href="jsp/content.jsp";
            var returnStr = startRequest("mofexec.cmd?method=delete&window_name=mof_window&primaryKey="+arr[0]);
            if(returnStr.replace(/^\s+|\s+$/g,"").substring(0,5)=="ERROR")
            {
            	alert("ɾ��ʧ��!��ɾ�������ݿ����ѱ�������������");
            }
            else{
                alert("ɾ�����ڶ���"+currentName+"���ɹ���");
               }
            self.seltree.refreshNodeById(parentId);
        }
        else if(arr[1]=="T"){
            //self.hidframe.location.href="moftab.cmd?method=delete&mofTabId="+arr[0];
            self.hidframe.location.href="mofexec.cmd?method=delete&window_name=mof_tab&primaryKey="+arr[0]; 
            getMainFrame().location.href="jsp/content.jsp";
            alert("ɾ����ǩ����"+currentName+"���ɹ���");
            self.seltree.refreshNodeById(parentId);
        }
        else if(arr[1]=="F"){
            //self.hidframe.location.href="moffield.cmd?method=delete&mofFieldId="+arr[0];
            self.hidframe.location.href="mofexec.cmd?method=delete&window_name=mof_field&primaryKey="+arr[0]; 
            getMainFrame().location.href="jsp/content.jsp";
            alert("ɾ�������"+currentName+"���ɹ���");
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
        var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
        var arr2 = split(parentId);
        if(arr[1]=="W"){
            if(!confirm("��ȷ��Ҫ�ı䵱ǰ���ڵ������")) return;
            var cmdUrl="mofcategorymovequery.cmd&clear=true";
            var url ="jsp/help.jsp?url="+cmdUrl;
            var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:530px;dialogHeight:450px"); 
            if (win == null) {  
          	      return;
            }else{
                  tempId=win[0]
                  tempName = win[1];
                  var parentId = seltree.GetParentElement(seltree.TreeConfig.TreeCurrentNode).children[0].NodeId;
                  self.hidframe.location.href="mofcategory.cmd?method=changeWindowCategory&mofWindowId="+arr[0]+"&categoryId="+tempId;
                  getMainFrame().location.href="jsp/content.jsp"; 
                  self.seltree.refreshNodeById(tempId); 
                  self.seltree.refreshNodeById(parentId); 
            } 
         }else{
            alert("ֻ�д��ڶ������ִ�С��ı���𡻲�����");
            return ;
        }
    }
}
function exportM()
{             
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr = split(currentId);
    if(arr[1]=="-1") {
        if (currentId=="<%=MofConstants.ROOT_ID%>"){
            self.hidframe.location.href="mofTransferCmd.cmd?method=windowExport&exportAll=true";    
        }else{
            self.hidframe.location.href="mofTransferCmd.cmd?method=windowExport&categoryId="+currentId;    
        }
       
    }
    else{
        if(arr[1]=="W"){
            getMainFrame().location.href ="mofTransferCmd.cmd?method=windowExport&mofWindowId="+arr[0];    
         }else{
            alert("ֻ�д��ڶ�����Ե���������");
            return ;
        }
    }
}
function saveVersion()
{             
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr = split(currentId);
    if(arr[1]=="-1") {
        if (currentId=="<%=MofConstants.ROOT_ID%>"){
        	getMainFrame().location.href="mofversion.cmd?method=forinsertall";    
        }else{
            getMainFrame().location.href="mofversion.cmd?method=forinsertcategory&categoryId="+currentId;    
        }
       
    }
    else{
        if(arr[1]=="W"){
            getMainFrame().location.href ="mofversion.cmd?method=forinsertwindow&mofWindowId="+arr[0];    
         }else{
            alert("ֻ�д��ڶ�����Ա���汾��");
            return ;
        }
    }
}
function exportSql()
{       
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr = split(currentId);
    if(arr[1]=="-1") {
        if (currentId=="<%=MofConstants.ROOT_ID%>"){
            self.hidframe.location.href="mofTransferCmd.cmd?method=windowExport&exportAll=true&isExportSql=true";    
        }else{
            self.hidframe.location.href="mofTransferCmd.cmd?method=windowExport&isExportSql=true&categoryId="+currentId;    
        }
       
    }
    else{
        if(arr[1]=="W"){
            getMainFrame().location.href ="mofTransferCmd.cmd?method=windowExport&isExportSql=true&mofWindowId="+arr[0];    
         }else{
            alert("ֻ�д��ڶ�����Ե���������");
            return ;
        }
    }
}
function generate()
{             
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr = split(currentId);
    if(arr[1]=="-1") {
	   	var needCheck = confirm("ģ��ͬ��ʱ�Ƿ����ģ�ͼ�飿");
   		var checkpara = needCheck?"&needcheck=true":"";
        if (currentId=="<%=MofConstants.ROOT_ID%>"){
            getMainFrame().location.href ="generator.cmd?method=synchronModel"+checkpara;    
        }else{
            getMainFrame().location.href ="generator.cmd?method=generatorJsp&categoryId="+currentId+checkpara;    
        }
       
    }
    else{
        if(arr[1]=="W"){
        	var needCheck = confirm("ģ��ͬ��ʱ�Ƿ����ģ�ͼ�飿");
	    	var checkpara = needCheck?"&needcheck=true":"";
            getMainFrame().location.href ="generator.cmd?method=generatorJsp&mofWindowId="+arr[0]+checkpara;    
         }else{
            alert("ֻ�д��ڶ������ͬ��������");
            return ;
        }
    }
}
function getColumn()
{          // alert(seltree.TreeConfig.TreeCurrentNode.innerHTML);
           var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
           var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
           var arr =split(currentId);
           var returnString=getValueByXmlhttp("jsp/mof/web/window/getColumn.jsp?fieldId="+arr[0]);
           //alert(returnString);
           var arr2 =split(returnString);
           getMainFrame().location.href="mofexec.cmd?method=forupdate&window_name=mof_column&primaryKey="+arr2[0]+"&parent_window=mof_table&main_primaryKey="+arr2[1];
 } 
function getValueByXmlhttp(url)
{
  if(url==null)
   {
    alert("���ݵ�URL����Ϊ�գ�");
    return;
   }
  try
    {
    var xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    if(xmlhttp==null)
    {
    alert("����XMLHTTP����ʧ��!"+ex.description);
    return ;
    }
    xmlhttp.open("POST",url,false);
    xmlhttp.send();
    return xmlhttp.responseText;
    }catch(ex)
    {
    alert("XMLHTTP���󴫵�����ʧ��!"+ex.description);
    return "";
    }
}
//��ƴ���
function designWindow(){
	var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId; 
    var arr =split(currentId);

    if(arr[1]!="W"){
  
            alert("ֻ�д��ڶ������ִ�С����ƴ��ڡ�������");
            return ;
    }

	getMainFrame().location.href = "mofXml.cmd?method=design&mofWindowId=" + arr[0];
 
}
//�������ɻ����ɴ���
function codeMachineGenerator()
{             
    var currentId = seltree.TreeConfig.TreeCurrentNode.children[0].NodeId;
    var currentName = seltree.TreeConfig.TreeCurrentNode.children[2].title;
    var arr = split(currentId);
    if(arr[1]=="-1") {
	   	var needCheck = confirm("��������ʱ�Ƿ����ģ�ͼ�飿");
   		var checkpara = needCheck?"&needcheck=true":"";
        if (currentId=="<%=MofConstants.ROOT_ID%>"){
            getMainFrame().location.href ="generator.cmd?method=synchronModel"+checkpara;    
        }else{
            getMainFrame().location.href ="generator.cmd?method=generatorJsp&isCodeMachine=true&categoryId="+currentId+checkpara;    
        }
       
    }
    else{
        if(arr[1]=="W"){
        	var needCheck = confirm("��������ʱ�Ƿ����ģ�ͼ�飿");
	    	var checkpara = needCheck?"&needcheck=true":"";
            getMainFrame().location.href ="generator.cmd?method=generatorJsp&isCodeMachine=true&mofWindowId="+arr[0]+checkpara;    
         }else{
            alert("ֻ�д��ڶ������ͬ��������");
            return ;
        }
    }
}
</SCRIPT>
