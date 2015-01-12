
<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.help.utils.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<jsp:useBean id="PubCommonHelpView" type="net.mast.help.view.PubCommonHelpView" scope="request"/>
<jsp:useBean id="GRID_COLS_LIST" type="java.util.List" scope="request"/>
<jsp:useBean id="SEARCH_HTML" type="java.lang.String" scope="request"/>
<%
	String show_field=PubCommonHelpView.getShowField();
	if(show_field==null || show_field.trim().equals(""))
		show_field=PubCommonHelpView.getCodeField()+","+PubCommonHelpView.getNameField();
	String 	SEL_OPTS=request.getParameter("SEL_OPTS");
	if(SEL_OPTS==null)SEL_OPTS="";
	
	String pageSize = HelpConfigManager.getString("help.pagesize");
	if (pageSize==null || pageSize.trim().equals(""))
		pageSize="10";
	int pagesize = Integer.parseInt(pageSize);
	//控制默认查询条件	
	String defaultSearch = HelpConfigManager.getString("help.defaultsearch");
	String helpState=request.getParameter("helpState");
	if(helpState==null||"".equals(helpState))
		helpState="0";
	
%>
<HTML>
<HEAD>
<TITLE><%=PubCommonHelpView.getHelpTitle()%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onkeydown="dokeyPageUp()">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<widgets:container title="<%=PubCommonHelpView.getHelpTitle()%>" >

<html:form name="frmList" action="pubcommonhelpmoretablesqlgrid.cmd">
<!--存放已经被选项，格式：选项1的值:选项1的显示名称,选项2的值:选项2的显示名称,......-->
<input type="hidden" name="SEL_OPTS" value="<%=SEL_OPTS%>" size=50> 
<%
HashMap parmsMap = (HashMap)request.getAttribute("PUBCOMMONHELP_PARMS_MAP");

java.util.Iterator it=parmsMap.keySet().iterator();
while(it.hasNext())
{
	String parm_name=(String)it.next();
	String parm_value=(String)parmsMap.get(parm_name);
 	%>
<input type="hidden" name="<%=parm_name%>" value="<%=parm_value%>"> 	
 <%
 }
%>
<widgets:containbutton onclick="doConfirm()" text="确 定"></widgets:containbutton>
<widgets:containbutton onclick="doClose()" text="关 闭"></widgets:containbutton>
<widgets:containbutton onclick="doClear()" text="清 除"></widgets:containbutton>
<table>
<flex:search>
	<tr>
	<td><%=SEARCH_HTML%></td>
	<td>
	<flex:searchImg name="chaxun" action="pubcommonhelpmoretablesqlgrid.cmd" imgClick="if(!checkSearch())return false;setState()" image="search.gif"/>
	
	</td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=70% onkeydown="javscript:doCheckKeyDown();">
<flex:flexgrid name="grid" height="250" action="pubcommonhelpmoretablesqlgrid.cmd" isSubmit="true">
	<%
	   String key_sort_name=PubCommonHelpView.getHelpTable() + "." + PubCommonHelpView.getIdField();
	   String idField=PubCommonHelpView.getIdField();
	   String nameField=PubCommonHelpView.getNameField();
	   int k=idField.indexOf(".");
	   if(k!=-1){
	   	idField=idField.substring(k+1).trim();
	   }
	   k=nameField.indexOf(".");
	   if(k!=-1){
	   	nameField=nameField.substring(k+1).trim();
	   }
	%>
	   
	   <flex:checkboxCol caption="选择" width="40"  property="<%=idField%>"  name="primaryKey" sortName="<%=key_sort_name%>"  canSort="false"></flex:checkboxCol>
	  
	   <flex:flexCol caption='返回值数据存放列'  property="RETURN_VALUES"  width="100"  sortName="<%=key_sort_name%>" style="display:none"></flex:flexCol>
	   <flex:flexCol caption='名称字段'  property="<%=nameField%>"  width="100"  sortName="<%=key_sort_name%>" style="display:none"></flex:flexCol>
	<%
	   for(int i=0;i<GRID_COLS_LIST.size();i++){
	   HashMap maps=(HashMap)GRID_COLS_LIST.get(i);
	   String caption=(String)maps.get("caption");
	   String property=(String)maps.get("property");
	   String width=(String)maps.get("width");
	   String sortName=(String)maps.get("sortName");
	   String align=(String)maps.get("align");
	   String fStyle="text-align:"+align;
	%>
	   <flex:flexCol caption='<%=caption%>'  property="<%=property%>"  width="<%=width%>"  sortName="<%=sortName%>" style="<%=fStyle%>"></flex:flexCol>
	<%			
	   }
	%>                                 
                                 
                                 
                                  
        </flex:flexgrid>
<flex:pagePolit action="pubcommonhelpmoretablesqlgrid.cmd" pageSize="<%=pagesize%>">
</flex:pagePolit>
</td>
<td width=10% align="center">

<button name="btnUp" onclick="moveUp()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">∧</button>
<br><br>
<button name="btnRight" onclick="moveRight()"  onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">＞</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()"  onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">＜</button>
<br><br>
<button name="btnDown" onclick="moveDown()"  onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">∨</button>
</td>
<td width=20% align=center valign="top">
已选项<br>
<select name="SelOpts"  size="15"  style="width:80" multiple="multiple">
<%
		StringTokenizer sel= new StringTokenizer(SEL_OPTS,",");
		while(sel.hasMoreTokens()){
			String opt=sel.nextToken();
			StringTokenizer o = new StringTokenizer(opt,":");
			String val=o.nextToken();
			String show=o.nextToken();
%>
<option value="<%=val%>"><%=show%></option>		
<%			
		}
%>
</select>
</td>
</tr>
</table>

<input type="hidden" name="helpState" value="<%=helpState%>"> 
</html:form>
</widgets:container>
<script language="javascript">

function init(){
	grid.show();
	var fs=<%=GRID_COLS_LIST.size()+3%>;
	for(var i=4;i<=fs;i++){
		grid.setTouAlign(i,"center");
	}
	grid.setSumText("");
}
init();

var searchtxt=document.all("SEARCH_COL_VALUE");
if(searchtxt!=null)
{
searchtxt.attachEvent("onkeydown",doInputKeyDown);
var len=grid.returnRowCount();

if(searchtxt.value!="" && len>0)
    {
    var ftd=grid.getCell(1,1);
    var or=ftd.children[0];
    if(or!=null && or.tagName=="INPUT")
        {
        grid.focus(1,1);
        or.checked=true;
        }
    }
else
    {
    //searchtxt.focus();
    }
}

function doConfirm(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	if(lens==0){
		alert("请选择记录!");
		return;
	}
	var result = new Array();
	for(var i=0;i<lens;i++){
		var val=selOpts.options[i].value;
		result[i]=val.split("#"); 
	}
	parent.returnValue = result;
	parent.close();	
}
function doClose(){
	parent.close();
}
function moveRight(){
	var sel=grid.getCheckLine();
	  if(sel==""){
	    alert("请选择记录!");
	    return false;
	  }
	  var selOpts=document.all("SelOpts");
	 var lines=grid.getCheckAll();	 
	 var LineArray = lines.split("|");//行数组
	 for(var i=0;i<LineArray.length;i++){
	 	var line=LineArray[i].split(","); 
	 	//如果已选项中已经存在，则忽略
	 	var exist=0;
	 	for(var j=selOpts.options.length-1;j>=0;j--)
	 	{
	 		var val=selOpts.options[j].value;
	 		if(val==line[1])exist=1;
	 			
	 	}
	 	if(exist==0){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);
	 		opn.innerText=line[2];
	 		opn.value=line[1];	 		
	 	}
	 	

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
function doClear(){
	var result = new Array();
	var lineArray=new Array();
	<%
		String returnField[]=PubCommonHelpView.getReturnField().split(",");
		int ret_line_size=returnField.length;
		for(int i=0;i<ret_line_size;i++)
		{
	%>
		lineArray[<%=i%>]="";
	<%	
		}
	%>
	
	result[0]=lineArray;
	parent.returnValue = result;
	parent.close();	
}
function doCheckKeyDown()
{
var obj=window.event.srcElement;
var keycode=event.keyCode;
if(keycode=="27"||keycode=="107")
   doClose();
if(obj==null || obj.tagName!="INPUT")
    return;
var len=grid.returnRowCount();
if(typeof(len)=="undefined")
    return;
if(keycode=="13"){
    doConfirm();
}
if(keycode=="37"){
    //doConfirm();
    var curline=grid.getCurrentLine();
    if(curline&&grid.getCell(curline,1)){
        var or=grid.getCell(curline,1).children[0];
        if(or!=null && or.tagName=="INPUT")
            {
           //grid.focus(curline,1);
            if(or.checked)
                or.checked=false;
            else 
                or.checked=true;
            //grid.focus(curline,1);
            }
    }
}
if(keycode=="38"){
    var curline=grid.getCurrentLine();
    if(curline&&grid.getCell(curline,1)){
        var or=grid.getCell(curline,1).children[0];
        if(or!=null && or.tagName=="INPUT")
            {
            grid.focus(curline,1);
            //or.checked=true;
            }
    }
    
    
}
if(keycode=="40"){
    var curline=grid.getCurrentLine();
    if(curline&&grid.getCell(curline,1)){
        var or=grid.getCell(curline,1).children[0];
        if(or!=null && or.tagName=="INPUT")
            {
            grid.focus(curline,1);
            //or.checked=true;
            }
    }
}

}
function doInputKeyDown()
{
var keycode=event.keyCode;
if(keycode=="13")
    {
    document.forms[0].action='pubcommonhelpmoretablesqlgrid.cmd';
    document.all('net.mast.web.taglib.util.GRIDINFOPRIMARY').value=null;
    document.all('net.mast.web.taglib.util.RESETPAGEINDEX').value='true';
    document.forms[0].submit();
    }
if(keycode=="27"||keycode=="107")
    doClose();
var line=parseInt(keycode);
if(line>=96&&line<=105){
    event.cancelBubble=true;
   }
}

function dokeyPageUp()
{
    var keycode=event.keyCode;
if(keycode=="33")
    {
        document.forms[0].action='pubcommonhelpmoretablesqlgrid.cmd';
        var page=document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value;
        if(page==1)
        return false;
        document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value=parseInt(document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value)-1;
        document.forms[0].submit();
    }
    if(keycode=="34")
    {
    document.forms[0].action='pubcommonhelpmoretablesqlgrid.cmd';
    document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value=parseInt(document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value)+1;
    document.forms[0].submit();
    }
if(keycode=="27"||keycode=="107")
    doClose();
if(keycode=="39"){
    moveRight();    
}
//选中数字键1-9可以选中相应记录，0选中第10条
var line=parseInt(keycode);
if(line>=96&&line<=105){
    line=line-96;
    if(line==0) line=10;
    var cell=grid.getCell(line,1);
    if(cell){
        var or=cell.children[0];
        grid.focus(line,1);
        if(or.checked)
            or.checked=false;
        else 
            or.checked=true;
    }
}
}
function checkSearch() {
    var value = document.all("SEARCH_COL_VALUE").value;
    if (value.indexOf("'")!=-1){
        alert("查询条件中不能有单引号！");
        return false;
    }
    return true;
}
function setState(){
	document.forms[0].helpState.value="1";
}
<%
	if(defaultSearch != null && defaultSearch.equals("NAME")) {
%>
if(document.forms[0].helpState.value=="0")
	document.all("SEARCH_COL_NAME").options[1].selected=true;
<%}%>
</script>