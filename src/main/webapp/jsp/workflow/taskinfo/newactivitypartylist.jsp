<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<% 
    String partyName_search = request.getParameter("partyName_search");
	if (partyName_search==null){
	  partyName_search="";
	}
	String t_processId=request.getParameter("processId");
	String t_curActDefId=request.getParameter("curActDefId");
	String searchUrl="partynextactivityquery.cmd?processId="+t_processId+"&curActDefId="+t_curActDefId;
	String t_haveSelect=request.getParameter("haveSelect");
	if(t_haveSelect==null)t_haveSelect="";
%>

<widgets:container title="选择处理人" >
<widgets:containbutton onclick="doConfirm()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="doClose()" text="关 闭"></widgets:containbutton>
<widgets:containbutton onclick="doClear()" text="清 除"></widgets:containbutton>
<html:form name="frmList" action="<%=searchUrl%>">
<input type="hidden" name="processId" value="<%=t_processId%>">
<input type="hidden" name="curActDefId" value="<%=t_curActDefId%>">
<input type="hidden" name="haveSelect" value="<%=t_haveSelect%>">
<table id="tblSearch">
<flex:search>

	<tr>
	<td>参与者名称:</td>
    <td><input type="text" name="partyName_search"   size="20" value="<%=partyName_search%>">
	
	</td>
	<td>
	<flex:searchImg name="chaxun" action="" image="search.gif" imgClick="search()"/>
	</td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=70%>
<support:flexgrid name="grid" height="350" action=""  isSubmit="false">
	<flex:flexCol caption='参与者ID' width="50" property="partyId" sortName="PARTY.PARTY_ID" style="display:none"></flex:flexCol>                          
	<flex:flexCol caption='名称' width="120" property="partyName" sortName="PARTY.PARTY_NAME" onclick="moveRight()"></flex:flexCol>                          
	<flex:flexCol caption='所属部门' width="150" property="partyDept" sortName="PARTY.PARTY_DEPT"  onclick="moveRight()"></flex:flexCol>                          
</support:flexgrid>
<flex:pagePolit action="partynextactivityquery.cmd" pageSize="15">
</flex:pagePolit>
</td>
<td width=10% align=center>

<button name="btnUp" onclick="moveUp()"   class="advbutton" >∧</button>
<br><br>
<button name="btnRight" onclick="moveRight()"   class="advbutton" >＞</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()"   class="advbutton" >＜</button>
<br><br>
<button name="btnDown" onclick="moveDown()"  class="advbutton" >∨</button>
</td>
<td width=20%>
<select name="SelOpts"  size="25"  style="width:100" multiple="multiple" ondblclick="moveLeft()">
</select>
</td>
</tr>
</table>

</html:form>	
</widgets:container>
<script language="javascript">
grid.show();
grid.setSumText("");
initHaveSelect();
function initHaveSelect(){
	var selOpts=document.all("SelOpts");
	var haveSel=document.all("haveSelect").value;
	if(haveSel=="")return;
	var sel=haveSel.split("|"); 
	for(var i=0;i<sel.length;i++)
	{
		var opt=sel[i].split(",");
		var opn=document.createElement("<OPTION>");
		selOpts.options.add(opn);
		opn.innerText=opt[1];
		opn.value=sel[i];
	}
}
function getSelect(){
if(grid.getCurrentLine()==null){
	alert("请选择一条记录！");
	return false;
}
  return true;
}
function doConfirm(){


	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	if(lens==0){
		alert("请选择记录!");
		return;
	}
	var result = new Array();
	      var partyIds="";
      var partyNames="";
      
	for(var i=0;i<lens;i++){
		var val=selOpts.options[i].value;
		var values=val.split(","); 
		var partyId=values[0];
        var partyName=values[1];
        if(i>0){
         		partyIds=partyIds+",";
         		partyNames=partyNames+",";
        }
        partyIds+=partyId;
        partyNames+=partyName;
	}
	 result[0]=partyIds;
	 result[1]=partyNames;
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function doClose(){
	parent.close();
}
function setHaveSelect(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	var haveSel="";
	if(lens>0)
	{
		for(var i=0;i<lens;i++)
		{
			var val=selOpts.options[i].value;
			if(i>0)haveSel+="|";
			haveSel+=val;
		}
	}
	document.all("haveSelect").value=haveSel;

}
function search(){

  setHaveSelect();
  //searchImage中包含该功能
//  var pageIndex=document.all("net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX")[0];
//  if(pageIndex)
//  	pageIndex.value=1;
  	
  document.forms[0].action ="<%=searchUrl%>";
  document.forms[0].submit();
}

function moveRight(){
if(!getSelect()) return false;
var row=grid.getCurrentLine();

	  var selOpts=document.all("SelOpts");
	  //如果已选项中已经存在，则忽略
	 var showCells="2";//显示列序号列表
	 	var returnCells="1,2";//返回列序号列表
	 	var showCellsArray=showCells.split(","); 
	 	var returnCellsArray=returnCells.split(","); 
	 	var selName="";//列表框中每一项的显示名称
	 	var selRet="";//列表框中每一项对应的返回值，多个返回列之间用","分隔
	 	for(var i=0;i<showCellsArray.length;i++)
	 	{
	 		selName=selName+grid.getCellValue(row,showCellsArray[i]);	
	 	}
	 	for(var i=0;i<returnCellsArray.length;i++)
	 	{
	 		if(i==0)
	 			selRet=grid.getCellValue(row,returnCellsArray[i]);
	 		else
	 			selRet=selRet+","+grid.getCellValue(row,returnCellsArray[i]);	
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
	 	setHaveSelect();	
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
	setHaveSelect();
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
setHaveSelect();
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
  setHaveSelect();
}
</script>