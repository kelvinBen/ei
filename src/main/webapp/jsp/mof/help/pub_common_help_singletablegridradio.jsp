
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
	
	String pageSize = HelpConfigManager.getString("help.pagesize");
	if (pageSize==null || pageSize.trim().equals(""))
		pageSize="10";
	int pagesize = Integer.parseInt(pageSize);
	String gridHeight=pagesize*20+60+"";
	//控制默认查询条件	
	String defaultSearch = HelpConfigManager.getString("help.defaultsearch");
	String helpState=request.getParameter("helpState");
	if(helpState==null||"".equals(helpState))
		helpState="0";
	String searchTextFocus = HelpConfigManager.getString("help.searchTextFocus");
%>
<HTML>
<HEAD>
<TITLE><%=PubCommonHelpView.getHelpTitle()%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onkeydown="dokeyPageUp();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<widgets:container title="<%=PubCommonHelpView.getHelpTitle()%>" >

<html:form name="frmList" action="pubcommonhelpsingletablegrid.cmd">
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
	<flex:searchImg name="chaxun" action="pubcommonhelpsingletablegrid.cmd" imgClick="if(!checkSearch())return false;setState()" image="search.gif"/>
	
	
	</td>
	</tr>
</flex:search>
</table>

<flex:flexgrid name="grid" height="<%=gridHeight%>" action="pubcommonhelpsingletablegrid.cmd" isSubmit="true">
	<%
	   String key_sort_name=PubCommonHelpView.getHelpTable() + "." + PubCommonHelpView.getIdField();
	%>
	
           <flex:radioCol caption="选择" width="50"  property="<%=PubCommonHelpView.getIdField()%>"  name="primaryKey" sortName="<%=key_sort_name%>" canSort="false"></flex:radioCol>
	 
	   <flex:flexCol caption='返回值数据存放列'  property="RETURN_VALUES"  width="100"  sortName="<%=key_sort_name%>" style="display:none"></flex:flexCol>
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
     
<flex:pagePolit action="pubcommonhelpsingletablegrid.cmd" pageSize="<%=pagesize%>">
</flex:pagePolit>
<input type="hidden" name="helpState" value="<%=helpState%>"> 
</html:form>
</widgets:container>
<script language="javascript">
//双击grid选中
grid.dblclickEvent=function()
{
    if(grid.getCurrentLine()&&document.all("primaryKey"))
       document.all("primaryKey")[grid.getCurrentLine()].checked=true;
    doConfirm();
}

grid.show();
var fs=<%=GRID_COLS_LIST.size()+2%>;
	for(var i=3;i<=fs;i++){
		grid.setTouAlign(i,"center");
	}
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++)
{
var otd=grid.getCell(i,1);
if(otd!=null)
	{
	var or=otd.children[0];
	if(or!=null && or.tagName=="INPUT")
		{
		or.attachEvent("onkeydown",doRadioKeyDown);
		}
	}
}

var searchtxt=document.all("SEARCH_COL_VALUE");
var searchTextFocus=<%=searchTextFocus%>;
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
		or.focus();
		or.checked=true;
		}
	}
else if(searchTextFocus)
	{
	searchtxt.focus();
	}
}
function doRadioKeyDown()
{
var obj=window.event.srcElement;
if(obj==null || obj.tagName!="INPUT")
	return;
var arrobj=document.all(obj.name);
var len=arrobj.length;
if(typeof(len)=="undefined")
	return;
var keycode=event.keyCode;
if(keycode=="13")
	doConfirm();
if(keycode=="27"||keycode=="107")
	doClose();
if(keycode=="38"){
    var curline=grid.getCurrentLine();
    if(!curline||curline=="1"){
        event.returnValue=false;
    }
}
}
function doInputKeyDown()
{
var keycode=event.keyCode;
if(keycode=="13")
	{
	document.forms[0].action='pubcommonhelpsingletablegrid.cmd';
	document.all('net.mast.web.taglib.util.GRIDINFOPRIMARY').value=null;
	document.all('net.mast.web.taglib.util.RESETPAGEINDEX').value='true';
	document.forms[0].submit();
	}
if(keycode=="27"||keycode=="107")
	doClose();
//选中数字键1-9可以选中相应记录，0选中第10条
var line=parseInt(keycode);
if(line>=96&&line<=105){
   event.cancelBubble=true;
}
//向下向上键选中记录
if(keycode=="40"||keycode=="38"){
	var len=grid.returnRowCount();
	if(len>0)
		{
		var ftd=grid.getCell(0,1);
		var or=ftd.children[0];
		if(or!=null && or.tagName=="INPUT")
			{
			or.focus();
			or.checked=true;
			}
		}
	else{
		searchtxt.focus();
		}	
	}
}

function dokeyPageUp()
{
	var keycode=event.keyCode;
if(keycode=="33")
	{
	    document.forms[0].action='pubcommonhelpsingletablegrid.cmd';
		var page=document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value;
		if(page==1)
		return false;
		document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value=parseInt(document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value)-1;
		document.forms[0].submit();
	}
	if(keycode=="34")
	{
	document.forms[0].action='pubcommonhelpsingletablegrid.cmd';
	document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value=parseInt(document.all('net.mast.web.taglib.util.PAGEPOLITCURRENTPAGEINDEX').value)+1;
	document.forms[0].submit();
	}
if(keycode=="27"||keycode=="107")
	doClose();

//选中数字键1-9可以选中相应记录，0选中第10条
var line=parseInt(keycode);
if(line>=96&&line<=105){
    line=line-96;
    if(line==0) line=10;
    var cell=grid.getCell(line,1);
    if(cell){
        var or=cell.children[0];
        grid.focus(line,1);
        or.checked=true;
    }
}
//按INSERT键聚焦查询框
if(keycode=="45"){
	var searchtxt=document.all("SEARCH_COL_VALUE");
	if(searchtxt!=null&&!searchTextFocus){
		searchtxt.focus();
		searchTextFocus=true;
	}else{
		searchtxt.blur();
		searchTextFocus=false;
	}	
}
}

function doConfirm(){
	var sel=grid.getCheckLine();
	  if(sel==""){
	    alert("请选择记录!");
	    return false;
	  }
	 var lines=grid.getCheckAll();
	 var result = new Array();
	 var LineArray = lines.split("|");//行数组
	 
	 for(var i=0;i<LineArray.length;i++){
		var line=LineArray[i].split(","); 
		//因为第二列存放的是返回数据用#分隔，所以直接赋给result  
		result[i]=line[1].split("#");
	 }
	parent.returnValue = result;
	parent.close();
}
function doClose(){
	parent.close();
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