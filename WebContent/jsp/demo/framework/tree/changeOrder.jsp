<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-i18n" prefix="web"%>
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
  	alert('<%=ResourcesFactory.getString("ORGAN_STRU.SELECTRECORD")%>');
 	return;
  }
  if(selIndex==0){
  alert('<%=ResourcesFactory.getString("ORGAN_STRU.NODOWN1")%>');
 	return;
  }
  //generate
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
  	alert('<%=ResourcesFactory.getString("ORGAN_STRU.SELECTRECORD")%>');
 	return;
  }
  //-1not selected
  if(selIndex==0){
  	alert('<%=ResourcesFactory.getString("ORGAN_STRU.NODOWN2")%>');
  	return;
  }
  //generate
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
  	alert('<%=ResourcesFactory.getString("ORGAN_STRU.SELECTRECORD")%>');
 	return;
  }
   if( (selIndex+1)==len){
   alert('<%=ResourcesFactory.getString("ORGAN_STRU.NOUP1")%>');
 	return;
  }
  //generate
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
  	alert('<%=ResourcesFactory.getString("ORGAN_STRU.SELECTRECORD")%>');
 	return;
  }
  //-1 not selected
  if(selIndex==len-1){
  	alert('<%=ResourcesFactory.getString("ORGAN_STRU.NOUP2")%>');
  	return;
  }

  //generate
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
returnV[0]="organstru.cmd?method=changeStruOrder&parentId=<%=parentId%>&newOrderList="+list; 
window.returnValue=returnV;
parent.close();
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
<widgets:container title='<%=ResourcesFactory.getString("ORGAN_STRU.SORT")%>' >
<widgets:containbutton  text='<%=ResourcesFactory.getString("COMMON.OK")%>' onclick="displayIndex()"></widgets:containbutton> 
<widgets:containbutton  text='<%=ResourcesFactory.getString("ORGAN_STRU.CLOSE")%>' onclick="forCancel()"></widgets:containbutton> 
<web:js src="flexgrid.js"/>
<!--<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>-->
<FORM name="frm" method=post>
<html:hidden name="parentId" value="<%=parentId%>" ></html:hidden>
<html:hidden name="newOrderList" value="" ></html:hidden>
<SELECT NAME="area" SIZE="25">
<%
List tempList=(List)request.getAttribute("functree");
int tempSize=tempList.size();
for(int i=0;i<tempSize;i++){
	HashMap map=(HashMap)tempList.get(i);
	String organId=(String)map.get("organId");
	String organAlias=(String) map.get("organAlias");
%>	
<OPTION VALUE="<%=organId%>" ><%=organAlias%>
<%
 }
%>
</SELECT>
<br>
<html:button  name="moveup" value='<%=ResourcesFactory.getString("COMMON.UP")%>' onclick="moveUp()"></html:button> 
<html:button  name="movedown" value='<%=ResourcesFactory.getString("COMMON.DOWN")%>' onclick="moveDown()"></html:button> 
<html:button  name="movetop" value='<%=ResourcesFactory.getString("COMMON.TOP")%>' onclick="moveTop()"></html:button> 
<html:button  name="movebottom" value='<%=ResourcesFactory.getString("COMMON.BOTTOM")%>' onclick="moveBottom()"></html:button> 
</FORM> 
</widgets:container>
</BODY>
</HTML>
