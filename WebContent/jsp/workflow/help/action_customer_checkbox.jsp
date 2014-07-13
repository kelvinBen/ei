<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>

<HTML>
<HEAD>
<TITLE>客户帮助</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<%
String customerId = request.getParameter("customerId");
String customerName = request.getParameter("customerName");

	String 	SEL_OPTS=request.getParameter("SEL_OPTS");
	if(SEL_OPTS==null)SEL_OPTS="";
%>
<% 
    String customer_name = request.getParameter("customer_nameSearch");
	if (customer_name==null){
	  customer_name="";
	}
%>
<widgets:container title="文档信息" >
<html:form name="frmList" action="customerhelpcheckbox.cmd">
<input type="hidden" name="RETURN_CELLS" value="1,2">
<input type="hidden" name="SHOW_CELLS" value="2">
<input type="hidden" name="SEL_OPTS" value="<%=SEL_OPTS%>">
<input type="hidden" name="RETURN_CONFIG" value="2">
<table id="tblSearch">
<flex:search>
	<tr>
    <td>名称：<flex:searchText name="customer_nameSearch" searchName="CRM_CUSTOMER.CUSTOMER_NAME" dataType="java.lang.String" operSymbol="=" value="<%=customer_name%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="customerhelpcheckbox.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=70%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                          <flex:flexCol caption="文档编号" width="100" property="CUSTOMER_ID"  name="primaryKey" sortName="CRM_CUSTOMER.CUSTOMER_ID"></flex:flexCol>
                          <flex:flexCol caption='文档名称' width="100" property="CUSTOMER_NAME" sortName="CRM_CUSTOMER.CUSTOMER_NAME"></flex:flexCol>
                             
        </support:flexgrid>
<flex:pagePolit action="customerhelpcheckbox.cmd" pageSize="10">
</flex:pagePolit>
</td>
<td width=10% align=center>

<button name="btnUp" onclick="moveUp()"  class="advbutton">∧</button>
<br><br>
<button name="btnRight" onclick="moveRight()"  class="advbutton">＞</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()"  class="advbutton">＜</button>
<br><br>
<button name="btnDown" onclick="moveDown()"  class="advbutton">∨</button>
</td>
<td width=20% align=center valign="top">
已选项<br>
<select name="SelOpts"  size="15"  style="width:80" multiple="multiple">
<%
		StringTokenizer sel= new StringTokenizer(SEL_OPTS,",");
		while(sel.hasMoreTokens())
		{
			String opt=sel.nextToken();
			StringTokenizer o = new StringTokenizer(opt,":");
			String optValue=o.nextToken();
			String optShowName=o.nextToken();
%>
			<option value="<%=optValue%>"><%=optShowName%></option>		
<%			
		}
%>
</select>
</td>
</tr>
</table>

<div align=center>
<table width=150><tr>
	<td><button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button></td>
	<td><button name="btnClose" onclick="doClose()"  class="advbutton">关 闭</button></td>
	<td><button name="btnCancel" onclick="doCancel()"  class="advbutton">清 除</button></td>
</tr></table></div>
</html:form>
</widgets:container>
<script language="javascript">
init();
function init(){
	var selOpts=document.all("SelOpts");
	var customerId = "<%=customerId%>";
	var customerName = "<%=customerName%>";
	var idArray = customerId.split(",");
	var nameArray = customerName.split(",");
	if (customerId==""){
		return;
	}	
	if (idArray.length!=nameArray.length){
		alert("error!");
		return;
	}
	if (idArray.length==0){
		return;
	}
	for(var i=0;i<idArray.length;i++){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);	 		
	 		opn.innerText=nameArray[i];
	 		opn.value=idArray[i]+"#"+nameArray[i];
	}
}



grid.show();
grid.setTabTiClick(moveRight);
function doConfirm(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	if(lens==0){
		alert("请选择记录!");
		return;
	}
	var result = new Array();
	var value = new Array();
	var value1 = new Array();
	for(var i=0;i<lens;i++){
		var val=selOpts.options[i].value;
//		result[i]=val.split("#");
//		result[i][2]='<%=MatrixHref.getUrl("0000")%>';
	 value = val.split("#");
	 value1["primary-value"]=value[0];
	 value1["display-str"]=value[1];
	 value1["display-url"]='<%=MatrixHref.getUrl("0000")%>';	
	 result[i]=value1;
	}	
		
	parent.returnValue = result;
	parent.close();
}
function doClose(){
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function getSelect(){
if(grid.getCurrentLine()==null){
	alert("请选择一条记录！");
	return false;
}
  return true;
}
function moveRight(){
if(!getSelect()) return false;
var row=grid.getCurrentLine();

	  var selOpts=document.all("SelOpts");
	
	 	//如果已选项中已经存在，则忽略
	 	var showCells=document.forms[0].SHOW_CELLS.value;//显示列序号列表
	 	var returnCells=document.forms[0].RETURN_CELLS.value;//返回列序号列表
	 	var showCellsArray=showCells.split(","); 
	 	var returnCellsArray=returnCells.split(","); 
	 	var selName="";//列表框中每一项的显示名称
	 	var selRet="";//列表框中每一项对应的返回值，多个返回列之间用"#"分隔
	 	for(var i=0;i<showCellsArray.length;i++)
	 	{
	 		selName=selName+grid.getCellValue(row,showCellsArray[i]);	
	 	}
	 	for(var i=0;i<returnCellsArray.length;i++)
	 	{
	 		if(i==0)
	 			selRet=grid.getCellValue(row,returnCellsArray[i]);
	 		else
	 			selRet=selRet+"#"+grid.getCellValue(row,returnCellsArray[i]);	
	 	}
	 	
	 	
	 	var exist=0;
	 	for(var j=selOpts.options.length-1;j>=0;j--)
	 	{
	 		var val=selOpts.options[j].value;
	 		if(val==selRet)exist=1;
	 			
	 	}
	 	if(exist==0){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);
	 		
	 		opn.innerText=selName;
	 		opn.value=selRet;
	 		
	 				
	 	}
	 setSel();	  	
}
function moveLeft(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	for(var i=lens-1;i>=0;i--)
	{
	
	 if(selOpts.options[i].selected)
	 {
	 	
	 	selOpts.options.remove(i);
	 	
	 }
	 
	}
	lens=selOpts.options.length;
	if(lens>0) selOpts.options[lens-1].selected=true;
	setSel();	
}
function moveUp(){
  var selOpts=document.all("SelOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  for(var i=1;i<len;i++){
  	if(selOpts.options[i].selected){
		  //生成
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		 
		  
		  selOpts.options(i).innerText = selOpts.options(i-1).innerText;
		  selOpts.options(i).value = selOpts.options(i-1).value;
		 
		  
		  selOpts.options(i-1).innerText = tmpOption.innerText;
		  selOpts.options(i-1).value =  tmpOption.value;
		 
		  selOpts.options(i-1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
  }	
setSel();
}
function moveDown(){
  var selOpts=document.all("SelOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  	
  if(selIndex==len-1)return;
  var len = selOpts.length;
  for(var i=len-2;i>=0;i--){
  	
  	if(selOpts.options[i].selected){
		  //生成
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		 
		  
		  selOpts.options(i).innerText = selOpts.options(i+1).innerText;
		  selOpts.options(i).value = selOpts.options(i+1).value;
		 
		  
		  selOpts.options(i+1).innerText = tmpOption.innerText;
		  selOpts.options(i+1).value =  tmpOption.value;
		 
		  selOpts.options(i+1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
  }	
setSel();
}
function setSel(){
	
	var selOpts=document.all("SelOpts");
	
	var lens=selOpts.options.length;
	var SEL_OPTS=document.all("SEL_OPTS");
	var tempSel="";
	for(var i=0;i<lens;i++)
	{
	 
	 
	 	var val=selOpts.options[i].value;
	 	var showName=selOpts.options[i].innerText;
	 	if(tempSel=="") 
	 		tempSel=val+":"+showName;
	 	else
	 		tempSel=tempSel + "," + val+":"+showName;
	 
	}
	SEL_OPTS.value=tempSel;	
}
</script>