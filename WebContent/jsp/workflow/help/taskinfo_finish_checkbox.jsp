<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<% 
String organId=(String)request.getAttribute("ORGAN_ID");
String startTime=request.getParameter("startTime");
String endTime=request.getParameter("endTime");
if(startTime==null)startTime="";
if(endTime==null)endTime="";
String isShowReturnBtn=request.getParameter("isShowReturnBtn");
if(isShowReturnBtn==null)isShowReturnBtn="";
	String processType=request.getParameter("processType");
if(processType==null)processType="";
	String procDefId=request.getParameter("procDefId");
if(procDefId==null)procDefId="";
	String extReturnUrl="finishtaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;
	
List reserveList=(List)request.getAttribute("reserveList");
%>
<%
String id = request.getParameter("id");
if(id==null){
	id="";
}
String SUBJECT = request.getParameter("SUBJECT");
if(SUBJECT==null){
	SUBJECT="";
}
	String 	SEL_OPTS=request.getParameter("SEL_OPTS");
	if(SEL_OPTS==null)SEL_OPTS="";
%>
<widgets:container title='流程任务信息' >
<html:form name="frmList" action="finishtaskinfoquery.cmd?ischeckboxhelp=1">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
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
    
    <td  nowrap>开始日期：<date:date name="startTime" value="<%=startTime%>" zindex="20" divname="startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	</tr>
	<tr>
	<td  nowrap>结束日期：<date:date name="endTime" zindex="19" value="<%=endTime%>" divname="endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	<td><flex:searchImg name="chaxun" action="javascript:forsearch()" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:flexCol caption="选择" width="0" property="id"  name="primaryKey" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='标题' width="180" property="SUBJECT" sortName="taskinfo.SUBJECT"></flex:flexCol>						  
                          <flex:flexCol caption='流程名称' width="120" property="PROCESS_NAME" sortName="taskinfo.sysProcessName"></flex:flexCol>						  
                          <flex:flexCol caption='表单ID' width="150" property="FORM_ID" sortName="taskinfo.sysFormName" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='发起人' width="60" property="RESOURCE_REQ_NAME" sortName="taskinfo.sysResourceReqName" ></flex:flexCol>
                          <flex:flexCol caption='发起时间' width="150" property="STARTED_TIME" sortName="taskinfo.sysProcStartedTime" ></flex:flexCol>
                          <flex:flexCol caption='结束时间' width="150" property="LAST_STATE_TIME" sortName="taskinfo.sysLastStateTime" style="display:none"></flex:flexCol>
                          
<%		for(int i=0;i<reserveList.size();i++){
			Map m = (Map)reserveList.get(i);
			String fieldid=(String)m.get("field-id");
			String title=(String)m.get("title");
			if("EDOC".equals(processType) && "EDOC_TYPE".equals(fieldid)){
%>
						   <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" sortName="taskinfo.<%=fieldid%>" type="enum" enumCollection="EDOC_TYPE_COLLECTION" enumKey="TYPE_ID" enumValue="TYPE_NAME" />
<%			
			} else {
%>
						   <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" sortName="taskinfo.<%=fieldid%>" />
<%
			}
		}
%>
</support:flexgrid>
<flex:pagePolit action="finishtaskinfoquery.cmd?ischeckboxhelp=1">
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
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton"><%=ResourcesFactory.getString("button.confirm")%></button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton"><%=ResourcesFactory.getString("button.close")%></button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton"><%=ResourcesFactory.getString("button.cancel")%></button></td></tr></table></div>
</html:form>
</widgets:container>
<script language="javascript">
init();
function init(){
	var selOpts=document.all("SelOpts");
	var id = "<%=id%>";
	var SUBJECT = "<%=SUBJECT%>";
	var idArray = id.split(",");
	var nameArray = SUBJECT.split(",");
	if (id==""){
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
//setGridHeight("grid",0.4);
grid.show();
grid.setTabTiClick(moveRight);
grid.setSumText("");
function getSelect(){
if(grid.getCurrentLine()==null){
	alert('<%=ResourcesFactory.getString("query.select")%>');
	return false;
}
  return true;
}
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
		 var process_id=value[0];
		 value1["primary-value"]=value[0];
		 value1["display-str"]=value[1];
		 value1["display-url"]="taskinfo.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value+"&ishelp=1";	
		 result[i]=value1;
	}	
		
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
function forsearch(){
	var startTime=document.all("startTime").value;
	var endTime=document.all("endTime").value;
	if(startTime!="" && endTime!=""){
		if(startTime>endTime){
			alert("结束日期不能小于开始日期！");
			return;
		}
	}
	document.forms[0].action="finishtaskinfoquery.cmd?ischeckboxhelp=1";
	document.forms[0].submit();	
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