
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
String parentId=(String)request.getAttribute("parentId");
%>
<HTML>
<HEAD>
<SCRIPT LANGUAGE = JavaScript>
 
function moveUp(){

  var area = document.frm.area;
  var selIndex = area.selectedIndex;
  var len = area.length;

  if(selIndex==-1){
  	alert("��ѡ��Ҫ����ļ�¼!");
 	return;
  }
  if(selIndex==0){
  alert("��ǰ��¼���б�ĵ�һ����¼,���ܼ�������!");
 	return;
  }
  //����
  var tmpOption = document.createElement("OPTION");
  tmpOption.text=area.options(selIndex).text;
  tmpOption.value=area.options(selIndex).value;

  area.options(selIndex).text = area.options(selIndex-1).text;
  area.options(selIndex).value = area.options(selIndex-1).value;
  
  area.options(selIndex-1).text = tmpOption.text;
  area.options(selIndex-1).value =  tmpOption.value
  
  area.options(selIndex-1).selected = true;
}
function moveTop(){

  var area = document.frm.area;
  var selIndex = area.selectedIndex;
  var len = area.length;
  if(selIndex==-1){
  	alert("��ѡ��Ҫ����ļ�¼!");
 	return;
  }
  //-1��ûѡ�м�¼�����
  if(selIndex==0){
  	alert("��ǰ��¼���б�ĵ�һ����¼,�Ѿ���������!");
  	return;
  }

  //����
  var tmpOption = document.createElement("OPTION");
  tmpOption.text=area.options(selIndex).text;
  tmpOption.value=area.options(selIndex).value;

  for(var i=selIndex-1;i>=0;i--){
  	area.options(i+1).text = area.options(i).text;
  	area.options(i+1).value = area.options(i).value;
  }
  
  area.options(0).text = tmpOption.text;
  area.options(0).value =  tmpOption.value
  
  area.options(0).selected = true;
}
function moveDown(){
  var area = document.frm.area;
  var selIndex = area.selectedIndex;
  var len = area.length;  
  if(selIndex==-1){
  	alert("��ѡ��Ҫ����ļ�¼!");
 	return;
  }
   if( (selIndex+1)==len){
   alert("��ǰ��¼���б�����һ����¼,���ܼ�������!");
 	return;
  }
  //����
  var tmpOption = document.createElement("OPTION");
  tmpOption.text=area.options(selIndex).text;
  tmpOption.value=area.options(selIndex).value;

  area.options(selIndex).text = area.options(selIndex+1).text;
  area.options(selIndex).value = area.options(selIndex+1).value;
  
  area.options(selIndex+1).text = tmpOption.text;
  area.options(selIndex+1).value =  tmpOption.value
  
  area.options(selIndex+1).selected = true;
}
function moveBottom(){

  var area = document.frm.area;
  var selIndex = area.selectedIndex;
  var len = area.length;
  if(selIndex==-1){
  	alert("��ѡ��Ҫ����ļ�¼!");
 	return;
  }
  //-1��ûѡ�м�¼�����
  if(selIndex==len-1){
  	alert("��ǰ��¼���б�����һ����¼,�Ѿ������׶�!");
  	return;
  }

  //����
  var tmpOption = document.createElement("OPTION");
  tmpOption.text=area.options(selIndex).text;
  tmpOption.value=area.options(selIndex).value;

  for(var i=selIndex+1;i<=len-1;i++){
  	area.options(i-1).text = area.options(i).text;
  	area.options(i-1).value = area.options(i).value;
  }
  
  area.options(len-1).text = tmpOption.text;
  area.options(len-1).value =  tmpOption.value
  
  area.options(len-1).selected = true;
}
function displayIndex(){
  var area = document.frm.area;
  var len = area.length;
  var list="";
  for(var i=0;i<len;i++){
  list=list+""+area.options(i).value+","  	
  }

var returnV=new Array(1);
returnV[0]="stru.cmd?method=changeStruOrder&parentId=<%=parentId%>&newOrderList="+list; 
window.returnValue=returnV;
parent.close();

//  document.forms[0].action="stru.cmd?method=changeStruOrder&parentId=<%=parentId%>&newOrderList="+list; 
  
 // document.forms[0].action="http://10.13.1.53:7001/bsp/stru.cmd?method=changeStruOrder&parentId=1"
//  alert(document.forms[0].action)
// document.forms[0].submit();
  
}
function forCancel(){
	parent.close();
}
</SCRIPT>
<TITLE>
</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<widgets:container title="��Ա����" >
<widgets:containbutton  text="ȷ��" onclick="displayIndex()"></widgets:containbutton> 
<widgets:containbutton  text="�ر�" onclick="forCancel()"></widgets:containbutton> 
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<FORM name="frm" method=post>
<input type="hidden" name="parentId" value="<%=parentId%>" >
<input type="hidden" name="newOrderList" value="" >
<SELECT NAME="area" SIZE="25">
<%
List tempList=(List)request.getAttribute("functree");
int tempSize=tempList.size();
for(int i=0;i<tempSize;i++){
	HashMap map=(HashMap)tempList.get(i);
	String struId=(String) map.get("struId");		
	String organName=(String) map.get("organName");
%>	
<OPTION VALUE="<%=struId%>" ><%=organName%>


<%
 }
%>
</SELECT>
<br>
<html:button  name="moveup" value="����" onclick="moveUp()"></html:button> 
<html:button  name="movedown" value="����" onclick="moveDown()"></html:button> 
<html:button  name="movetop" value="����" onclick="moveTop()"></html:button> 
<html:button  name="movebottom" value="�׶�" onclick="moveBottom()"></html:button> 
</FORM> 
</widgets:container>
</BODY>
</HTML>
