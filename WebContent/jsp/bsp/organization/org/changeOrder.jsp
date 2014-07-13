
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
  	alert("请选中要排序的记录!");
 	return;
  }
  if(selIndex==0){
  alert("当前记录是列表的第一条记录,不能继续上移!");
 	return;
  }
  //生成
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
  	alert("请选中要排序的记录!");
 	return;
  }
  //-1是没选中记录的情况
  if(selIndex==0){
  	alert("当前记录是列表的第一条记录,已经移至顶端!");
  	return;
  }

  //生成
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
  	alert("请选中要排序的记录!");
 	return;
  }
   if( (selIndex+1)==len){
   alert("当前记录是列表的最后一条记录,不能继续下移!");
 	return;
  }
  //生成
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
  	alert("请选中要排序的记录!");
 	return;
  }
  //-1是没选中记录的情况
  if(selIndex==len-1){
  	alert("当前记录是列表的最后一条记录,已经移至底端!");
  	return;
  }

  //生成
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
<widgets:container title="成员排序" >
<widgets:containbutton  text="确定" onclick="displayIndex()"></widgets:containbutton> 
<widgets:containbutton  text="关闭" onclick="forCancel()"></widgets:containbutton> 
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
<html:button  name="moveup" value="向上" onclick="moveUp()"></html:button> 
<html:button  name="movedown" value="向下" onclick="moveDown()"></html:button> 
<html:button  name="movetop" value="顶端" onclick="moveTop()"></html:button> 
<html:button  name="movebottom" value="底端" onclick="moveBottom()"></html:button> 
</FORM> 
</widgets:container>
</BODY>
</HTML>
