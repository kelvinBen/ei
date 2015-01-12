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
<TITLE><%=ResourcesFactory.getString("DOC_DOCUMENT.HELP")%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<!--
	使用说明：
		使用时需要修改以下几个参数：
			1、设置返回列序号-RETURN_CELLS，默认返回第一列和第二列数据
			2、设置显示列序号-SHOW_CELLS，默认显示第二列数据
			3、配置FLEXGRID标签
		

-->
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<%
String documentId = request.getParameter("documentId");
String documentName = request.getParameter("documentName");

	String 	SEL_OPTS=request.getParameter("SEL_OPTS");
	if(SEL_OPTS==null)SEL_OPTS="";
%>
<% 
    String document_name = request.getParameter("document_nameSearch");
	if (document_name==null){
	  document_name="";
	}
%>
<widgets:container title='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCINFO")%>' >
<html:form name="frmList" action="wfdochelpcheckbox.cmd">
<!--需要返回的列序号列表，列序号之间用“,”分隔-->
<input type="hidden" name="RETURN_CELLS" value="1,2"><!--表示返回第一列和第二列数据-->
<!--列表框中显示列序号列表，列序号之间用“,”分隔-->
<input type="hidden" name="SHOW_CELLS" value="2"><!--表示显示第二列数据-->
<!-- 列表框数据存放隐藏域，在提交当前页面时（搜索、翻页）保留已选数据-->
<input type="hidden" name="SEL_OPTS" value="<%=SEL_OPTS%>">
<!--返回一维还是二维数组参数配置：1－一维，2－二维-->
<input type="hidden" name="RETURN_CONFIG" value="2"> 
 
<table id="tblSearch">
<flex:search>
	<tr>
    <td><%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_NAME")%>：<flex:searchText name="document_nameSearch" searchName="DOC_DOCUMENT.DOCUMENT_NAME" dataType="java.lang.String" operSymbol="=" value="<%=document_name%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="wfdochelpcheckbox.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=70%>
<support:flexgrid name="grid" height="250" action="" isSubmit="false">
                          <flex:flexCol caption='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_ID")%>' width="100" property="documentId"  name="primaryKey" sortName="DOC_DOCUMENT.DOCUMENT_ID" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='<%=ResourcesFactory.getString("DOC_DOCUMENT.DOCUMENT_NAME")%>' width="200" property="documentName" sortName="DOC_DOCUMENT.DOCUMENT_NAME"></flex:flexCol>
                             
        </support:flexgrid>
<flex:pagePolit action="wfdochelpcheckbox.cmd" pageSize="10">
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
<%=ResourcesFactory.getString("query.selectedoption")%><br>
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
	<td><button name="btnClose" onclick="doConfirm()"  class="advbutton"><%=ResourcesFactory.getString("button.confirm")%></button></td>
	<td><button name="btnClose" onclick="doClose()"  class="advbutton"><%=ResourcesFactory.getString("button.close")%></button></td>
	<td><button name="btnCancel" onclick="doCancel()"  class="advbutton"><%=ResourcesFactory.getString("button.cancel")%></button></td>
</tr></table></div>
</html:form>
</widgets:container>
<script language="javascript">
init();
function init(){
	var selOpts=document.all("SelOpts");
	var documentId = "<%=documentId%>";
	var documentName = "<%=documentName%>";
	var idArray = documentId.split(",");
	var nameArray = documentName.split(",");
	if (documentId==""){
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
//确定返回函数
function doConfirm(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	if(lens==0){
		alert('<%=ResourcesFactory.getString("query.selectmutiple")%>');
		return;
	}
	var result = new Array();
	var value = new Array();
	for(var i=0;i<lens;i++){
		var value1 = new Array();
		var val=selOpts.options[i].value;
		 value = val.split("#");
		 value1["primary-value"]=value[0];
		 value1["display-str"]=value[1];
		 value1["display-url"]='<%=MatrixHref.getUrl("Document")%>'+value[0];	
		 result[i]=value1;
	}	
		
	parent.returnValue = result;
	parent.close();
}
//关闭窗口函数
function doClose(){
	parent.close();
}
//取消返回空值函数
function doCancel(){
	parent.returnValue="";
	parent.close();
}
//判断选择记录函数
function getSelect(){
if(grid.getCurrentLine()==null){
	alert('<%=ResourcesFactory.getString("query.select")%>');
	return false;
}
  return true;
}
//从grid中选择数据后右移到列表框
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
//从列表框中删除数据
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
//列表框数据上移排序
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
//列表框数据下移排序
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
//同步列表框数据到隐藏域，在执行上下移动排序、增加或删除列表框数据时需要同步隐藏列
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