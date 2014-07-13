<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>窗口定制器</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<%
	String path = request.getContextPath()+"/skins/default";
	String contextPath =request.getContextPath();
	String mofWindowId = request.getParameter("mofWindowId");
	String formHtml = String.valueOf(request.getAttribute("formHtml"));
	String windowName = String.valueOf(request.getAttribute("windowName"));	 
%>
<link href="<%=path%>/css/css.css" rel="stylesheet" type="text/css">
<style>

.textarea {
	BORDER-RIGHT: #5B5F62 1px solid; BORDER-TOP: #5B5F62 1px solid; FONT-WEIGHT: normal; BORDER-LEFT: #5B5F62 1px solid; COLOR: #5B5F62; BORDER-BOTTOM: #5B5F62 1px solid;background-color:#F4F5F7;
}.dh {
	font-family: "宋体";
	font-size: 12px;
	color: #FFFFFF;
}
.a {
	font-family: "宋体";
	font-size: 12px;
}



.designtablecss
{
table-layout:fixed;
border-collapse:collapse;
margin-top:5;
}
.designtablecss td
{
height:25;
}
.selectspancss
{
	border:2 solid #3366FF;
	cursor:move;
    COLOR: #5B5F62;background-color:#F4F5F7;

}
.bgtou{
	background-image:url('<%=path%>/images/window/top-bj.jpg');
	background-repeat:repeat-x;
	filter: Alpha(Opacity=40, FinishOpacity=100, Style=1, StartX=0, StartY=0, FinishX=0, FinishY=50);
	border-color: #E6E6E6;
	vertical-align:center;
	white-space:   nowrap;
	color: #000000;
	font-size:9pt;
	padding:5px;
}
.bgtou button
{
	background-color:#E6E6E6;
	border:1 solid #E6E6E6;
	vertical-align:top;
	white-space:   nowrap;
	color: #000000;
	font-size:9pt;
	cursor:hand;
	height:23;
}
.fieldsetCss
{
width:  100%;
padding:10;
margin-left:12px;
margin-bottom:4;
margin-right:12px;
}
.xwin {
	position:absolute;
	cursor:default;
	border-width:3px;
	border-style:outset;
	padding:0px;
	font-size:9pt;
	overflow:hidden;
	display:block;
	background-color:#EEEEEE

}
.xwin.deftitle
{
font-size:9pt;
padding:2px;
background-color:highlight;
color:#ffffff;
}
.xwin table td
{
font-size:9pt;
}

.xwin input
{
border:1 solid ;
}
.rightmenutabcss td
{
font-size:10pt;
border:1 solid F0F6FF;
cursor:hand;
}
.rightmenutrcss td
{
font-size:10pt;
border:1 solid #FF9900;
 
}
.taboncss{padding-left:5px;padding-right:5px;font-size:9pt;white-space:nowrap;padding-top:0px;border-left:1px solid #ffffff;border-top:1px solid #ffffff;border-right:1px solid #666666;border-bottom:1px solid #f1f1f1;background-color:#f1f1f1}
.taboffcss{padding-left:5px;padding-right:5px;font-size:9pt;white-space:nowrap;padding-top:3px;border-left:1px solid #ffffff;border-top:1px solid #f1f1f1;border-right:1px solid #666666;border-bottom:1px solid #ffffff;background-color:#cccccc}
td{
	font-size:9pt;
	white-space:nowrap
}
</style>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>


</HEAD>
<script language="javascript" src="<%=path%>/js/DefMbTool.js"></script>
<script language="javascript">
var SubFormIndex=1;//子表单名称
var lineobj=null;
var linedraw=null;
var currentInsertPoint=null;//插入点
var JsObj=null;//全局对象
//初始化
function init()
{
//		var tabstr='<TABLE id="tab1" width=500 border=1 height=300 unselectable=on   borderColor=#000000 cellSpacing=0 cellPadding=0 bgColor=#ffffff border=1>';
//		for(var i=0;i<5;i++)
//		{
//			tabstr+="<tr>";
//			for(var j=0;j<6;j++)
//			{
//			tabstr+='<td phcol="'+(j+1)+'" phrow="'+(i+1)+'" >'+j+'</td>' ;
//			}
//			tabstr+="</tr>";
//		}
//		tabstr+="</table>";
JsObj= new DefFormTool("JsObj");

JsObj.init();
 
		//setFormHtml(tabstr);

//createFileds();
}
//导入XML
function doImportMofXml(){
	 
	 
	if(getFormXml()=="")
	{
		alert("请先定制窗口!");
		return ;
	}
	

	if(!confirm("当前定制保存后,窗口原信息将被更新,确实要保存吗?"))
		return;
 
	JsObj.resetcurrentDiv(); 
	document.importXml.windowXml.value = getFormXml();
	document.importXml.formHtml.value = getFormHtml(); 
	document.importXml.submit();
}

//外部getFormXml
function getFormXml()
{	 
	return	JsObj.getFormXml();
}
//外部getFormTemplate
function getFormTemplate()
{
	return	document.frames.ff.OBJ.getFormTemplate();
}

//外部getFormHtml
function getFormHtml()
{
	return	document.all("designdiv").innerHTML;
}
//外部set另存为
function reSetFormName()
{
document.frames.ff.OBJ.reSetFormName();
}
//外部set大小写
function setCharType(val)
{
document.frames.ff.OBJ.setCharType(val);
}
//外部set字段名，表名只读
function setReadonlyType(val)
{
document.frames.ff.OBJ.setReadonlyType(val);
}

//外部get大小写
function getCharType()
{
return document.frames.ff.OBJ.getCharType();
}

//外部set url
function setUrl(url)
{
		document.frames.ff.OBJ.setUrl(url);
}
//外部set formtype修改时为1
function setFormType(val)
{
		document.frames.ff.OBJ.setFormType(val);
}

//外部set 编辑区HTML
function setFormHtml()
{		
		document.all("designdiv").innerHTML=document.getElementsByName("htmlFull")[0].value;
}
//外部set 打印模板
function setFormPrintTemplate(str)
{
		document.frames.ff.OBJ.setFormPrintTemplate(str);
}
//外部set 正文模板
function setFormTextTemplate(str)
{
		document.frames.ff.OBJ.setFormTextTemplate(str);
}
//用来判断是否填写表单NAME
function hasFormName()
{
	var formnamestr=document.frames.ff.document.all("pages").formid;;
	if(formnamestr==null || formnamestr=="")
	return false;
	else
	return true;
}
  function openMbPer()
  {
  var curobj=document.frames.ff.OBJ.getCurXmlNode();
  if(curobj==null)
  {
  alert("没有选择板块！");
  return;
  }
  window.showModalDialog("<%=path%>bankuai.htm",window,"dialogWidth:300px;dialogHeight:300px;status:no");
  }
    function openTdPer()
  {
   var curobj=document.frames.ff.OBJ.getFirstTd();
  if(curobj==null)
  {
  alert("没有选择单元格！");
  return;
  }
  window.showModalDialog("<%=path%>cell_attrib.htm",window,"dialogWidth:400px;dialogHeight:300px;status:no");
  }

  function showtabwin()
  {
    var curobj=JsObj.getTabAll();
  if(curobj==null)
  {
  alert("请选择表格！");
  return;
  }
    window.showModalDialog("<%=contextPath%>/jsp/mof/window/form.htm",window,"dialogWidth:450px;dialogHeight:400px;status:no");
  }
  //单元格属性
  function opentd()
  {
	 window.showModalDialog("<%=contextPath%>/jsp/mof/window/cell_attrib.htm",window,"dialogWidth:450px;dialogHeight:400px;status:no");
  }

  function showformwin()
  {
      window.showModalDialog("<%=contextPath%>/jsp/mof/window/form.htm",window,"dialogWidth:400px;dialogHeight:400px;status:no");

  }
    function showsubformwin()
  {
   var tab=document.frames.ff.OBJ.getTabAll();
  if(tab==null || tab.type!="sub")
  {
  alert("请选择子表单！");
  return;
  }
      window.showModalDialog("<%=contextPath%>/jsp/mof/window/subform.htm",window,"dialogWidth:400px;dialogHeight:400px;status:no");

  }

  function dozoom()
  {
  var obj=event.srcElement;
  document.frames.ff.document.body.style.zoom=obj.options[obj.selectedIndex].value;
  }
  function redo()
  {
	var str=document.frames.ff.OBJ.reDo();
	if(str==null) return;
	document.frames.ff.OBJ.reDraw(str,1);
  }
  function repeate()
  {
  var str=document.frames.ff.OBJ.repertDo();
  	if(str==null) return;
	document.frames.ff.OBJ.reDraw(str,1);
  }
  function noborder()
  {
  //alert(document.frames.ff.document.all('tt').outerHTML);
  var img=window.event.srcElement;
  var tt=document.frames.ff.document.all('tt');
  if(tt.className=="noborder")
  {
  img.src="<%=path%>/images/window/12.gif";
  tt.className="";
  }
  else
  {
    img.src="<%=path%>/images/window/12_h.gif";
	tt.className="noborder";
  }
  }
  function doview(){
	tex2.value=ff.document.body.innerHTML;
	document.frames.ff.OBJ.makeTabXml();
  }
 function dosave()
 {
 tex1.value=document.frames.ff.OBJ.getAllHtmlStr();
//alert(xmlstr.xml);
 }
 function WBTB_format(what,opt)
{
var insertPoint=document.frames.ff.document.selection.createRange();
//alert(insertPoint.parentElement().tagName);
if(insertPoint.parentElement()!=null && insertPoint.parentElement().tagName=="TD" && insertPoint.parentElement().offsetParent!=null && insertPoint.parentElement().offsetParent.id=="tabpage")
return;
	if (opt=="removeFormat")
	{
		what=opt;
		opt=null;
	}
	ff.focus();
	if (opt==null)
	{
		ff.document.execCommand(what);
	}else{
		ff.document.execCommand(what,"",opt);
	}
//	ff.focus();
}
function WBTB_foreColor()
{
	//if (!WBTB_validateMode()) return;
	var arr = showModalDialog("<%=path%>selcolor.html", "", "dialogWidth:20.5em; dialogHeight:20.5em; status:0; help:0");
	if (arr != null) WBTB_format('forecolor', arr);
	document.all('colorspan').style.backgroundColor=arr;
}
function WBTB_foreColor2()
{
	WBTB_format('forecolor', document.all('colorspan').style.backgroundColor);
}

function InsertTextFiled()
{
var insertPoint=document.frames.ff.document.selection.createRange();
//alert(insertPoint.parentElement()+","+ insertPoint.parentElement().tagName);
var otaball=document.frames.ff.OBJ.getTabAll();

if(otaball==null || document.frames.ff.document.selection.type=="Control" || insertPoint.parentElement()==null || insertPoint.parentElement().tagName!="TD")
// || !otaball.contains(insertPoint.parentElement()))
{
alert("请选择插入位置!");
return false;
}
if(insertPoint.parentElement().children.length>0)
{
alert("不能在同一单元格中插入多个域!");
return false;

}
var obj=event.srcElement;
if(obj!=null && obj.tagName=="TD")
	obj=obj.parentElement;
if(obj!=null && obj.tagName=="IMG")
	obj=obj.parentElement.parentElement;
insertPoint.pasteHTML('<input type="text"  style="BORDER-RIGHT: #5B5F62 1px solid; BORDER-TOP: #5B5F62 1px solid; FONT-WEIGHT: normal; BORDER-LEFT: #5B5F62 1px solid; COLOR: #5B5F62; BORDER-BOTTOM: #5B5F62 1px solid;background-color:#F4F5F7;"  fieldtype="'+obj.type+'"/>');
}
function DelTextFiled()
{
var insertPoint=document.frames.ff.document.selection;
if(insertPoint.type=="Control")
	insertPoint.clear();
}
function InsertPl()
{
var otaball=document.frames.ff.OBJ.getTabAll();
var insertPoint=document.frames.ff.document.selection.createRange();
//alert(insertPoint.parentElement().tagName);
if(otaball==null || document.frames.ff.document.selection.type=="Control" || insertPoint.parentElement()==null || insertPoint.parentElement().tagName!="TD")
// || !otaball.contains(insertPoint.parentElement()))
{
alert("请选择插入位置!");
return false;
}
if(insertPoint.parentElement().children.length>0)
{
alert("不能在同一单元格中插入多个域!");
return false;

}

if(otaball==null)
return;
if(otaball.type=="sub")
{
alert("评论域不能插入到子表单!");
return;
}
if(otaball.type=="sub")
{
alert("评论域不能插入到子表单!");
return;
}
var areas=document.frames.ff.document.getElementsByTagName("TEXTAREA");
for(var i=0;i<areas.length;i++)
{
	var oarea=areas[i];
	if(oarea.type=="pl")
	{
	alert("表单只能有一个评论域!");
	return;
	}
}
var insertPoint=document.frames.ff.document.selection.createRange();
insertPoint.pasteHTML('<textarea type="pl">评论域</textarea>');
}

function InsertTextArea()
{
var insertPoint=document.frames.ff.document.selection.createRange();
insertPoint.pasteHTML('<textarea></textarea');
}
function InsertSelect()
{
var insertPoint=document.frames.ff.document.selection.createRange();
insertPoint.pasteHTML('<select ></select>');
}
function insertsubform()
{
var tabtab=document.frames.ff.document.all("tabpage");
var obody=null;
for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
{
	var otd=tabtab.rows[0].cells[jj];
	if(otd.className=="taboncss")
	{
	obody=document.frames.ff.document.all("page"+(otd.index));
	break;
	}
}
var tabstr='';
var fieldsetcount=obody.getElementsByTagName("FIELDSET");
if(fieldsetcount.length>0)
	{
	fieldsetcount=fieldsetcount[fieldsetcount.length-1].getAttribute("fid");
	if(fieldsetcount==null)
	fieldsetcount=0;
	}
else
	{
	fieldsetcount=0;
//	tabstr+='<hr class="hrcss">';
	}
var chartype=getCharType();
var fomid="sub";
//if(chartype=="1")
//fomid="SUB";
tabstr+='<fieldset fid="'+(parseInt(fieldsetcount)+1)+'"  unselectable=on   class="fieldsetCss" ><legend> 子表单'+(parseInt(fieldsetcount)+1)+' </legend><TABLE   unselectable=on  id="sub'+SubFormIndex+'" formid="${sub'+SubFormIndex+'}"  type="sub" borderColor=#000000 cellSpacing=0 cellPadding=0  bgColor=#ffffff border=1>';
for(var i=0;i<3;i++)
{
if(i==0)
	tabstr+='<tr class="tabtoucss">';
else if(i==2)
	tabstr+='<tr class="tabsumcss">';
else
	tabstr+='<tr >';
	for(var j=0;j<6;j++)
	{
	tabstr+='<td phcol="'+(j+1)+'" phrow="'+(i+1)+'" >' ;
	//if(i==2)
	//tabstr+='<input  sumtype="col"  style="border:1 solid;width:90%;" value="列合计">';
	tabstr+="</td>";
	}
	
	tabstr+="</tr>";
}
tabstr+="</table></fieldset>";
obody.insertAdjacentHTML("beforeEnd",tabstr);
SubFormIndex++;

}
//删除子表单
function delsubform()
{
var taball=document.frames.ff.OBJ.getTabAll();
if(taball==null || taball.tagName!="TABLE")
	return;
	if(taball.parentElement!=null && taball.parentElement.tagName=="FIELDSET")
	{
	taball.parentElement.removeNode(true);
	taball=null;
	}
}
var index=1;
function InsertNewPage()
{
var tabtab=document.frames.ff.document.all("tabpage");
var titletd=document.frames.ff.document.all("titledesign");
var subtitletd=document.frames.ff.document.all("subtitledesign");

tabtab.style.position="relative";
for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
{
var otd=tabtab.rows[0].cells[jj];
if(otd.className=="taboncss")
{
otd.tabtitle=titletd.innerHTML;
otd.tabtitlexml=titletd.innerText;
if(subtitletd!=null)
{
otd.subtabtitle=subtitletd.innerHTML;
otd.subtabtitlexml=subtitletd.innerText;
}
}
otd.className="taboffcss";
if(otd.index!=null && otd.index!="")
index=parseInt(otd.index);
}
var ntd=tabtab.rows[0].insertCell();
//var index=ntd.cellIndex;
ntd.className="taboncss";
if(ntd.tabtitle==null || ntd.tabtitle=="")
titletd.innerText="表单标题";
else
titletd.innerText=ntd.tabtitle;
if(subtitletd!=null)
{
if(ntd.subtabtitle==null)
subtitletd.innerText="";
else
subtitletd.innerText=ntd.subtabtitle;
}
ntd.innerText="第"+(index+1)+"页";
ntd.width=50;
ntd.index=index+1;
var tabstr='<TABLE   unselectable=on   id="tab'+parseInt(index+1)+'" borderColor=#000000 cellSpacing=0 cellPadding=0  bgColor=#ffffff border=1>';
		for(var i=0;i<5;i++)
		{
			tabstr+="<tr>";
			for(var j=0;j<6;j++)
			{
			tabstr+='<td phcol="'+(j+1)+'" phrow="'+(i+1)+'" ></td>' ;
			}
			tabstr+="</tr>";
		}
		tabstr+="</table>";
document.frames.ff.document.all("pages").insertAdjacentHTML("beforeEnd","<div unselectable=on style='position:absolute;z-index:100;width:100%;height:100%' id='page"+(index+1)+"'>"+tabstr+"  <iframe unselectable=on width='100%' frameborder='0' height='100%' style='top:-1;position:absolute;z-index:-1;'></iframe></div>");
var odiv=document.frames.ff.document.all("page"+(index+1));
var oldheight=document.frames.ff.document.all("page"+(index)).clientHeight;
var oheight=odiv.clientHeight;
//alert(oheight+"<"+oldheight);
if(oheight<oldheight)
	odiv.style.height=oldheight;
index++;
//var ntab=document.frames.ff.document.all("tab"+parseInt(index+1));
//if(ntab!=null && ntab.tagName=="TABLE")
//ntab.rows[0].cells[0].click();
}
function delOPage()
{
	var tabtab=document.frames.ff.document.all("tabpage");
	if(tabtab.rows[0].cells.length==1)
	{
	return;
	}
	for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
	{
	var otd=tabtab.rows[0].cells[jj];
		if(otd.className=="taboncss")
		{
		var ptd=otd.previousSibling;
		if(ptd!=null && ptd.tagName=="TD")
		{
		ptd.className="taboncss";
		var pdiv=document.frames.ff.document.all("page"+(ptd.index));
		pdiv.style.zIndex="100";
		}
		var odiv=document.frames.ff.document.all("page"+(otd.index));
		if(odiv!=null)
		odiv.removeNode(true);
		otd.removeNode(true);
		break;
		}
	}
	if(tabtab.rows[0].cells.length==1)
	{
	tabtab.style.position="absolute";
	}

}
function insertLine()
{
var otaball=document.frames.ff.OBJ.getTabAll();
var insertPoint=document.frames.ff.document.selection.createRange();
if(otaball==null || document.frames.ff.document.selection.type=="Control" || insertPoint.parentElement()==null || insertPoint.parentElement().tagName!="TD")
// || !otaball.contains(insertPoint.parentElement()))
{
alert("请选择插入位置!");
return false;
}

if(linedraw==null)
{
lineobj=document.frames.ff.document.all("line");
linedraw=document.frames.ff.Line;
}
if(lineobj==null) return;
if(lineobj.length>1)
lineobj=lineobj[0];
var otd=insertPoint.parentElement();
	if(linedraw!=null)
	{
	var x1=0;//otd.offsetLeft;
	var y1=0;//otd.offsetTop;
	var x2=x1+otd.offsetWidth-1;
	var y2=y1+otd.offsetHeight-1;
	linedraw.drawLine(x1, y1, x2, y2); 
	//alert(x1+","+y1+","+x2+","+y2);
	linedraw.paint(); 
	//alert(lineobj.innerHTML);
	insertPoint.pasteHTML("<div style='position:absolute;margin:-3' unselectable=on>"+lineobj.innerHTML+"</div>");
	linedraw.clear();
	}
}
//删除斜线
function delLine()
{
var otaball=document.frames.ff.OBJ.getTabAll();
var insertPoint=document.frames.ff.document.selection.createRange();
if(otaball==null || document.frames.ff.document.selection.type=="Control" || insertPoint.parentElement()==null)
{
alert("请选择要删除的斜线!");
return false;

}
var otd=insertPoint.parentElement();
if(otd==null) return;
if(otd.tagName!="TD")
{
if(otd.parentElement.tagName=="TD")
otd=otd.parentElement;
}

if(otd.tagName!="TD")
{
return false;
}
var arrdiv=otd.getElementsByTagName("DIV");

	if(arrdiv.length>5)
	{
		for(var i=arrdiv.length-1;i>=0;i--)
		{
		arrdiv[i].removeNode();
		}
	}
}

//合计列
function InsertColSum()
{
var otaball=document.frames.ff.OBJ.getTabAll();
var insertPoint=document.frames.ff.document.selection.createRange();
if(otaball==null || document.frames.ff.document.selection.type=="Control" || otaball.type!="sub" || insertPoint.parentElement()==null || insertPoint.parentElement().tagName!="TD")// || !otaball.contains(insertPoint.parentElement()))
{
alert("不能在主表单中插入合计列!");
return false;
}
if(insertPoint.parentElement().children.length>0)
{
alert("不能在同一单元格中插入多个域!");
return false;

}

insertPoint.pasteHTML('<input  sumtype="col"  style="BORDER-RIGHT: #5B5F62 1px solid; BORDER-TOP: #5B5F62 1px solid; FONT-WEIGHT: normal; BORDER-LEFT: #5B5F62 1px solid; COLOR: #5B5F62; BORDER-BOTTOM: #5B5F62 1px solid;background-color:#F4F5F7;"  style="border:1 solid;width:90%;" value="列合计">');
}
//合计行
function InsertRowSum()
{
var otaball=document.frames.ff.OBJ.getTabAll();
var insertPoint=document.frames.ff.document.selection.createRange();
if(otaball==null || document.frames.ff.document.selection.type=="Control" || otaball.type!="sub" || insertPoint.parentElement()==null || insertPoint.parentElement().tagName!="TD")// || !otaball.contains(insertPoint.parentElement()))
{
alert("不能在主表单中插入合计行!");
return false;
}
if(insertPoint.parentElement().children.length>0)
{
alert("不能在同一单元格中插入多个域!");
return false;

}

insertPoint.pasteHTML('<input  sumtype="row"  style="border:1 solid;width:90%;" value="行合计">');
}

//左边控件菜单
function doMenuclk()
{
	var modalTab=JsObj.getTabAll();
	if(modalTab==null)
	{
	alert("请选择Table");
	return;
	}

	var obj=event.srcElement;
	if(obj==null || obj.tagName!="TD")
		return;
	 
	var otr=obj.parentElement;
	 
	var trindex=otr.rowIndex; 
	if(trindex===0)
	{
		otr.nextSibling.nextSibling.nextSibling.style.display="none";
		otr.nextSibling.style.display="block";
	}
	else
	{
	 
		otr.previousSibling.style.display="none";
		otr.nextSibling.style.display="block";
	}

	//遍历tablist，赋值onmouseover事件
/*	 
	var tablist=document.all("divcontrols").children[0];
	//alert(tablist.outerHTML);
	 
	for(var i=0;i<tablist.rows.length;i++)
	{
	var otd=tablist.rows[i].cells[0];
	var fun1=new Function("","event.srcElement.parentElement.className='rightmenutrcss';");
	var fun2=new Function("","event.srcElement.parentElement.className='';");
	otd.onmouseover=fun1;
	otd.onmouseout=fun2;
	}
*/
}

//插入自定义表格
function showDefTable(odiv)
{
	if(odiv.card!=2)
	{
	alert("表格必须放到选项卡里面！");
	return false;
	}
currentInsertPoint=odiv;
var deftab=document.all("divtabdef");
deftab.style.display="block";
var wid=document.body.clientWidth;
var hei=document.body.clientHeight;
var otop=(hei-deftab.clientHeight)/2;
var oleft=(wid-deftab.clientWidth)/2;
deftab.style.top=otop;
deftab.style.left=oleft;
}

//选择对象后,初始化对象表格
function getInitTable(url)
{
	var xmldoc=loadData(url,1);
	var  a = new Array();
	var j=0;
	var tabName = xmldoc.selectNodes('table')[0].getAttribute("TABLENAME");
	for(var i=0;i<xmldoc.selectNodes('table')[0].selectNodes('column').length;i++)
	{
		var onode=xmldoc.selectNodes('table')[0].selectNodes('column')[i];
		//if(onode.getAttribute("ISMANDATORY")==1)
		//{
			//onode.getAttribute("DESCRIPTION") + ':'+'<input MOF_COLUMN_ID="'+onode.getAttribute("MOF_COLUMN_ID")+'" fieldname="'+ onode.getAttribute("COLUMNNAME") +'" chaname="'+ onode.getAttribute("DESCRIPTION") +'"style="border:1 solid ;width:50%" readonly>';
				a[j]='<label style="width:50%;height:100%;background-color:#E1E8EF;padding-top:5;valign:bottom">'+onode.getAttribute("DESCRIPTION") +  '：</label>'+'<input MOF_COLUMN_ID="'+onode.getAttribute("MOF_COLUMN_ID")+'" MOF_FIELD_ID="@' + tabName+"."+onode.getAttribute("COLUMNNAME") + '@"  fieldname="'+ onode.getAttribute("COLUMNNAME") +'" ISMANDATORY="'+ onode.getAttribute("ISMANDATORY") +'" chaname="'+ onode.getAttribute("DESCRIPTION") +'"style="border:1 solid "  style="BORDER-RIGHT: #5B5F62 1px solid; BORDER-TOP: #5B5F62 1px solid; FONT-WEIGHT: normal; BORDER-LEFT: #5B5F62 1px solid; COLOR: #5B5F62; BORDER-BOTTOM: #5B5F62 1px solid;background-color:#F4F5F7;"  size=20 readonly>';
				j++;
		//}
	}
 
	return a;

}

//显示插入自定义表格
function insertDefTable()
{
var rows=document.all("deftabrow").value;
var cols=document.all("deftabcol").value;
var wid='';
var deftabwidth=document.all("deftabwidth").value;
var colwid=100;
if(deftabwidth!="")
colwid=Math.round(deftabwidth/parseInt(cols));
var widrao=document.all("deftabrao");
if(widrao[1].checked)
{
wid=deftabwidth+"px";
colwid=colwid+"px";
}
else
{
wid=deftabwidth+"%";
colwid=colwid+"%";
}
//根据编辑对象取域列表
		var editobject=document.all("editobject");
		var repeatTabSize=0;  //是否已存在同样的TAB，如果存在，两各tab的名称是不能一样的，所以后加的TAB名称默认

		for(var i=0;i<document.all("designdiv").getElementsByTagName("TABLE").length;i++)
		{
			if(typeof(document.all("designdiv").getElementsByTagName("TABLE")[i].tabname)!="undefined")
			{
				if(document.all("designdiv").getElementsByTagName("TABLE")[i].tabname.toUpperCase()==editobject.options[editobject.selectedIndex].text.toUpperCase())
				{
					repeatTabSize++;
				}
			}
		}

		var localurl=location.pathname;
		var aa=localurl.split('/');
		 
		var url='';
		if(aa.length==3)
		url='/'+aa[1]+'/mofXml.cmd?method=getMofXml&type=table&objectId='+editobject.value;
		else
		url='/mofXml.cmd?method=getMofXml&type=table&objectId='+editobject.value;
		 
		var allfildstr=createFileds(url);
	 

		var fieldList =  getInitTable(url);
 
	 






	if(repeatTabSize==0)
	{
		repeatTabSize="";
	}

var tablestr='<TABLE id="tab1" MOF_TAB_ID="@'+ editobject.options[editobject.selectedIndex].name+ repeatTabSize +'@" mofTableId="'+ editobject.value +'"  tabname="'+ editobject.options[editobject.selectedIndex].name+ repeatTabSize +'" tabdes="'+ editobject.options[editobject.selectedIndex].innerText+ repeatTabSize +'" filedlist="'+allfildstr+'" width="'+wid+'"   class="designtablecss" borderColor=#000000 cellSpacing=0 cellPadding=2  bgColor=#ffffff border=1>';
 
if(currentInsertPoint.children.length==0)
	{
	
		for(var c=0;c<currentInsertPoint.parentElement.children[0].children[0].children[0].children.length;c++)
		{
			if(currentInsertPoint.parentElement.children[0].children[0].children[0].children[c].className=="taboncss")
				currentInsertPoint.parentElement.children[0].children[0].children[0].children[c].innerHTML = editobject.options[editobject.selectedIndex].innerText;
		}
	}

var tabstr='';
var cosgroupstr='';
var fieldNum =0 ;
	if(rows< Math.ceil(fieldList.length/cols))
		rows = Math.ceil(fieldList.length/cols)
		for(var i=0;i<rows;i++)
		{
			tabstr+="<tr>";
			for(var j=0;j<cols;j++)
			{
				tabstr+='<td nowrap phcol="'+(j+1)+'" phrow="'+(i+1)+'" >';
				if(fieldNum < fieldList.length)
				{
					tabstr+=fieldList[fieldNum];
					fieldNum++;
				}
				'</td>' ;
				if(i==0)
				{
				//	if(j==cols-1 && widrao[0].checked)
					cosgroupstr+='<col>';
				//	else
				//	cosgroupstr+='<col width="'+colwid+'">';
				}
			}
			tabstr+="</tr>";
		}
		tablestr+='<colgroup>'+cosgroupstr+'</colgroup>'+tabstr+"</table>";
		 
		currentInsertPoint.insertAdjacentHTML("beforeEnd",tablestr);
		document.all("divtabdef").style.display="none";
		
}
//隐藏插入自定义表格
function cancelInsertDefTable()
{
var deftab=document.all("divtabdef");
deftab.style.display="none";
}
//插入重复表格(子表单)
function showSubTable()
{
//showModalDialog("insertTable.html",window,"dialogWidth:180px;dialogHeight:180px;status:no;scroll:no");
currentInsertPoint=ff.document.selection.createRange();
if(document.frames.ff.document.selection.type=="Control" || currentInsertPoint.parentElement()==null || currentInsertPoint.parentElement().tagName==null)
{
alert("请先选择插入位置!");
return false;
}
//alert(currentInsertPoint.parentElement()+","+ currentInsertPoint.parentElement().tagName);
//alert(currentInsertPoint.parentElement().innerHTML);
var deftab=document.all("divtabsub");
deftab.style.display="block";
var wid=document.body.clientWidth;
var hei=document.body.clientHeight;
var otop=(hei-deftab.clientHeight)/2;
var oleft=(wid-deftab.clientWidth)/2;
deftab.style.top=otop;
deftab.style.left=oleft;
}
//显示插入自定义表格
function insertSubTable()
{
var insertPoint=document.frames.ff.document.selection.createRange();
if(currentInsertPoint!=null && currentInsertPoint.parentElement().tagName!=null)
insertPoint=currentInsertPoint;
else
{
alert("请先选择插入位置!");
return false;
}
var cols=document.all("subtabcol").value;
var tablestr='<TABLE type="sub"   unselectable=on   borderColor=#000000 cellSpacing=0 cellPadding=0 bgColor=#ffffff border=1>';
var tabstr='';
var cosgroupstr='';
		for(var i=0;i<3;i++)
		{
			tabstr+="<tr>";
			for(var j=0;j<cols;j++)
			{
			tabstr+='<td phcol="'+(j+1)+'" phrow="'+(i+1)+'" >' ;
			if(i==0)
			cosgroupstr+='<col width="100">';
			if(i==1)
			tabstr+='<input size=8>';
			tabstr+='</td>';
			}
			tabstr+="</tr>";
		}
		tablestr+='<colgroup>'+cosgroupstr+'</colgroup>'+tabstr+"</table><iframe width='100%' frameborder='0'  unselectable=on   height='100%' style='top:0;position:absolute;z-index:-1;'></iframe>";
		insertPoint.pasteHTML(tablestr);
		document.all("divtabsub").style.display="none";
}
//隐藏插入自定义表格
function cancelInsertSubTable()
{
var deftab=document.all("divtabsub");
deftab.style.display="none";
}
//插入选项卡
function insertDefTabCard()
{
var insertPoint=document.frames.ff.document.selection.createRange();
if(insertPoint!=null && insertPoint.parentElement().tagName!="TD")
{
alert("请先选择插入位置!");
return false;
}
var pnode=insertPoint.parentElement();
if(pnode.type=="card")
{
var cardtable=pnode.parentElement.parentElement.parentElement;
var cardspan=cardtable.parentElement;
var conspan=cardtable.nextSibling;
//alert(conspan.parentElement.outerHTML);
var cardspan=cardtable.parentElement;
	for(var i=0;i<cardtable.rows[0].cells.length;i++)
	{
	var otd=cardtable.rows[0].cells[i];
	if(otd.className=="taboncss")
	{
	otd.cardhtml=conspan.innerHTML;
	}
	otd.className="taboffcss";
	}
conspan.innerHTML='<TABLE type="tab"   unselectable=on  style="table-layout:auto"  borderColor=#000000 cellSpacing=0 cellPadding=0 bgColor=#ffffff border=2><colgroup><col width="200"></colgroup><tr><td style="overflow:hidden;background-color:"></td></tr></table>';
var newtd=cardtable.rows[0].insertCell();
newtd.type="card";
newtd.className="taboncss";
newtd.innerText="CARD";
var cols=cardtable.children[0];
var newcol=ff.document.createElement("COL");
newcol.width="50";
cardtable.children[0].appendChild(newcol);
return;
}
var tablestr='<span  unselectable=on type="tab">';
//tablestr+='<tr><td  style="padding:-20;background-color:#eeeeee">';
tablestr+='<TABLE type="tab"   unselectable=on onclick="doTabpageClick();"  borderColor=#000000 cellSpacing=0 cellPadding=0 bgColor=#ffffff border=1>';
tablestr+='<colgroup><col width="50" ></colgroup><tr><td type="card"  class="taboncss">CARD</td></tr></table>';
tablestr+='<span   unselectable=on ><TABLE type="tab"   unselectable=on style="table-layout:auto"  borderColor=#000000 cellSpacing=0 cellPadding=0 bgColor=#ffffff border=2>';
tablestr+='<colgroup><col width="200"></colgroup><tr><td ></td></tr></table>';
tablestr+='</span></span>';
insertPoint.pasteHTML(tablestr);

}
//选项卡操作
function doTabpageClick()
{
var nowtd=event.srcElement;
var tab=nowtd.offsetParent;
if(tab==null || tab.tagName!="TABLE") return;
var div=tab.parentElement;
	for(var i=0;i<tab.rows[0].cells.length;i++)
	{
	var otd=tab.rows[0].cells[i];
	otd.className="taboffcss";
	if(otd!=nowtd)
	div.children[i+1].style.display="none";
	else
	div.children[i+1].style.display="block";
	}
nowtd.className="taboncss";
}
//删除控件
function delObj()
{
var obj=JsObj.getCurrentDiv();
	if(obj)
	{
			switch(obj.tagName)
			{
			case 'TD':
					if(confirm("确定要删除当前表格吗？"))
					obj.offsetParent.removeNode(true);
					break;
			case 'DIV':
					var odiv=obj.parentElement;
					var otab=odiv.children[0];
					var ind=null;
					if(otab.rows[0].cells.length==1)
						{
						if(confirm("确定要删除当前选项卡吗？"))
						odiv.removeNode(true);
						break;
						}
					for(var i=1;i<odiv.children.length;i++)
					{
					if(odiv.children[i]==obj)
					{ind=i;break;}
					}
					if(ind)
					{
						if(confirm("确定要删除当前选项卡吗？"))
						{
						otab.rows[0].cells[ind-1].removeNode(true);
						obj.removeNode(true);
						otab.rows[0].cells[0].fireEvent("onclick");
						}
					}

					break;
			case 'INPUT':
					if(obj.ISMANDATORY==1)
					{
						alert("'"+obj.chaname+"'为必须字段，不能删除！");
					}
					else
					{
						if(confirm("确定要删除当前字段吗？"))
						{
						
							obj.parentElement.innerHTML="";
							//obj.removeNode(true);
						}
					}
					break;
			case 'SPAN':
					if(confirm("确定要删除当前文字标签吗？"))
					obj.removeNode(true);
					break;
			//case 'TD':
				
						
			}
	}
}
//加载域的xml，生成域列表
function createFileds(url)
{
 
	var xmldoc=loadData(url,1);
	var tabstr="<TABLE width='100%' border=0 cellspacing=0 cellpadding=2   bgcolor='F4F5F7'>";
	//alert(xmldoc.selectNodes('table')[0].selectNodes('column').length);onmouseover='this.className=\"rightmenutrcss\";' onmouseout='this.className=\"\";'


	var tabName= xmldoc.selectNodes('table')[0].getAttribute("TABLENAME");
	for(var i=0;i<xmldoc.selectNodes('table')[0].selectNodes('column').length;i++)
		{
		var onode=xmldoc.selectNodes('table')[0].selectNodes('column')[i];
		tabstr+="<tr   type='text'>";
		tabstr+="<td valign=middle COLUMNNAME='"+onode.getAttribute("COLUMNNAME")+"'  MOF_COLUMN_ID='"+onode.getAttribute("MOF_COLUMN_ID")+"' MOF_FIELD_ID='@"+tabName +"."+onode.getAttribute("COLUMNNAME")+"@'    MOF_REFERENCE_ID='"+onode.getAttribute("MOF_REFERENCE_ID")+"'   DESCRIPTION='"+onode.getAttribute("DESCRIPTION")+"'	NAME='"+onode.getAttribute("COLUMNNAME") +"' banshitype='text'><img src='<%=path%>/images/window/list.gif' align='absmiddle'  banshitype='text'>&nbsp;"+onode.getAttribute("DESCRIPTION")+"</td></tr>";
		}
	return tabstr+"</table>";

//document.all("divcontrols").innerHTML=tabstr+'</table>';
}
//xml读取数据，数据来自一个xml文件，参数是这个xml文件的url
function loadData (url,param) {
	var xmlDoc = new ActiveXObject("Msxml.DOMDocument");
	xmlDoc.async = false;
	xmlDoc.preserveWhiteSpace = true;
	if (param == null)
	{
		var restr=/>\s</g;
		url=url.replace(restr,"");
		 
	  xmlDoc.loadXML(url);
	 }
	else
	  //xmlDoc.load(window.location.protocol + "//" + window.location.host+url);
	   xmlDoc.load(url);
	   
	if(xmlDoc.childNodes[1]!=null)
		return xmlDoc.childNodes[1];
}
//根据隐藏iframe里面的select来填充当前页面的编辑对象select
function fillDate(selobj)
{
  
if(selobj==null || selobj.tagName!="SELECT")
return;
document.all("editobjectdiv").innerHTML=selobj.outerHTML;
}
</script>


<script language="JavaScript" type="text/JavaScript">
 
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
 
</script>
<body  SCROLL=no onLoad="init();MM_preloadImages('<%=path%>/images/window/top01-01.gif','<%=path%>/images/window/top02-02.gif','<%=path%>/images/window/top03-03.gif','<%=path%>/images/window/top04-01.gif','<%=path%>/images/window/top05-01.gif','<%=path%>/images/window/top06-01.gif','<%=path%>/images/window/top07-01.gif','<%=path%>/images/window/top08-02.gif')" onselectstart="return false" ondragstart="return false;">
<textarea style="display:none" name ="htmlFull"><%=formHtml%></textarea> 
<table width="100%" height="100%"   cellpadding="0"  cellspacing="1" bgcolor="#5B5F62">
  <tr >
    <td colspan=2  height="25"  valign="top" bgcolor="#FFFFFF"><table width="100%"   height="25" cellpadding="0"  cellspacing="0" background="<%=path%>/images/window/top.gif">
      <tr>
        <td><table width="100%"  cellspacing="0" cellpadding="0">
            <tr>
              <td width="10"><img src="<%=path%>/images/window/dot.gif" width="4" height="10"></td>
              <td width="23"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','<%=path%>/images/window/top01-01.gif',1)"><img src="<%=path%>/images/window/top01.gif" name="Image10" width="22" height="22" border="0"   onclick="showtabwin();" id="05" title="表格属性" ></a></td>
              <td width="23" align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','<%=path%>/images/window/top02-02.gif',1)"><img src="<%=path%>/images/window/top02.gif" name="Image11" width="22" height="22" border="0"  onclick="JsObj.Merge();"  title="合并单元格"></a></td>
              <td width="23" align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','<%=path%>/images/window/top03-03.gif',1)"><img src="<%=path%>/images/window/top03.gif" name="Image12" width="22" height="22" border="0" onclick="JsObj.Split();" title="拆分单元格"></a></td>
              <td width="23" align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','<%=path%>/images/window/top04-01.gif',1)"><img src="<%=path%>/images/window/top04.gif" name="Image13" width="22" height="22" border="0" onclick="JsObj.addRow();" title="插入一行"></a></td>
              <td width="23" align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','<%=path%>/images/window/top05-01.gif',1)"><img src="<%=path%>/images/window/top05.gif" name="Image14" width="22" height="22" border="0" onclick="JsObj.delRow();" title="删除一行" ></a></td>
              <td width="23" align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','<%=path%>/images/window/top06-01.gif',1)"><img src="<%=path%>/images/window/top06.gif" name="Image15" width="22" height="22" border="0" onclick="JsObj.addCol();" title="插入一列"></a></td>
              <td width="23" align="right"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','<%=path%>/images/window/top07-01.gif',1)"><img src="<%=path%>/images/window/top07.gif" name="Image16" width="22" height="22" border="0" onclick="JsObj.delCol();"  title="删除一列"></a></td>
              <td width="23"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','<%=path%>/images/window/top08-02.gif',1)"><img src="<%=path%>/images/window/top08.gif" name="Image17" width="22" height="22" border="0" onclick="delObj();"  title="删除"></a></td>
              <td>&nbsp;</td>
            </tr>
        </table></td>
        <td width="110" valign="bottom">	

			<table width="100%"  cellspacing="0" cellpadding="0">
			  <tr>
				<form name="importXml" action="mofXml.cmd?method=importMofXml&primaryKey=<%=mofWindowId%>" method="post">
				<input type="hidden" name="windowXml" value=''>
				<input type="hidden" name="formHtml">
				<input type="hidden" name="mofWindowId" value= "<%=mofWindowId%>">
				<input type="hidden" name="window_name" value="<%=windowName%>">
				<td>
				  <img name="imageField" style="cursor:hand"  onclick="doImportMofXml()" src="<%=path%>/images/window/anniu.gif" width="46" height="20" border="0">            </td>
				<td>
				  <img name="imageField2"   style="cursor:hand"  onclick="javascript:location.href='mofexecquery.cmd?window_name=mof_window'" src="<%=path%>/images/window/anniu2.gif" width="46" height="20" border="0">            </td>
			  </tr></form>
			</table> 
		</td>
      </tr>
	</table>
	</td>
	</tr>
	<tr style="display:none">
		<td class="bgtou" height="15" valign=top colspan=2>
			
				<button onmousedown="InsertTextFiled();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/def_text.gif"   title="插入域"></button>&nbsp;<button onclick="DelTextFiled();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/dele_h.gif"   title="删除域"></button><img border="0" src="<%=path%>images/dianline.gif">
				<button onclick="insertsubform();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'" ><img border="0" src="<%=path%>images/copy.gif"   title="插入子表单"></button>&nbsp;<button onclick="delsubform();"  onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/delsub.gif"   title="删除子表单"></button>&nbsp;<img border="0" src="<%=path%>images/dianline.gif">
				<button onclick="InsertNewPage();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/new.gif"  title="插入新页面" ></button>&nbsp;	<button onclick="delOPage();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/delpage.gif"  title="删除页" ></button><img border="0" src="<%=path%>images/dianline.gif"><button onclick="InsertPl();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/statistic_h.gif"  title="插入评论域" ></button><img border="0" src="<%=path%>images/dianline.gif"><button onclick="InsertColSum();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/list.gif"  title="插入列合计" ></button>&nbsp;<button onclick="InsertRowSum();" onmouseover="this.style.borderColor='#000000';" onmouseout="this.style.borderColor='#E6E6E6'"><img border="0" src="<%=path%>images/list1.gif"  title="插入行合计" ></button>

		</td>
	</tr>
    <tr id="desiangTr" > 
          <td  valign="top" width="80%"   bgcolor="F4F5F7">
			<div id="designdiv" style="width:100%;height:100%;overflow:auto" ></div>
		   </td> 

           
          
		  <td  bgcolor="EEF1F6" width="200">
		  
				<TABLE width="100%" border=0 height="100%" cellspacing=0 cellpadding=2  bgcolor="EEF1F6">
						<tr>
							<td  background="<%=path%>/images/window/left01.gif" height="20" onclick="doMenuclk();">
								<img src="<%=path%>/images/window/banshi.gif">&nbsp;版式
							</td>
						</tr>
						<tr>
							<td valign=top >
								<div style="overflow:auto;height:200;border:1 solid #00000F">
									<TABLE width="100%"  border=0 cellspacing=2 cellpadding=2 style=""  >
										<tr  onmouseover="this.className='rightmenutrcss';" onmouseout="this.className='';">
											<td  banshitype="deftab">
												<img src="<%=path%>/images/window/tabcard.gif"   align="absmiddle"   banshitype="deftable">&nbsp;选项卡
											</td>
										</tr>
										<tr  onmouseover="this.className='rightmenutrcss';" onmouseout="this.className='';">
											<td valign=top   banshitype="deftable">
												<img src="<%=path%>/images/window/deftable.gif" height="20" align="absmiddle" banshitype="deftable">
												自定义表格
											</td>
										</tr>
										<tr style="display:none" onmouseover="this.className='rightmenutrcss';" onmouseout="this.className='';">
											<td  banshitype="defdiv">
											<img src="<%=path%>/images/window/biaoqian.gif"   banshitype="defdiv"   align="absmiddle"  >
											标签
											</td>
										</tr></table>
								</div>
							</td>
						</tr>
						<tr>
							<td  height="20"    background="<%=path%>/images/window/left01.gif"  onclick="doMenuclk();">
								<img src="<%=path%>/images/window/kongjian.gif">&nbsp;控件
							</td>
						</tr>
				 		<tr style="display:none">
							<td  valign=top >
								<div id="divcontrols"  editobject="" style="overflow:auto;height:expression(this.parentElement.clientHeight-10);border:1 solid #00000F">
								 </div>
							</td>
						</tr>
					 
					</TABLE>
 
 

<div id="divtabdef" class="xwin" style="width:300;position:absolute;display:none">
	<span class="deftitle"  style="width:300">自定义表格</span>
	<table width="100%">
	<tr>
		<td width=50>行数:
		</td>
		<td><input name="deftabrow" size=5 value=5>
		</td>
	</tr>
	<tr>
		<td>列数:
		</td>
		<td><input name="deftabcol" size=5 value="2">
		</td>
	</tr>
	<tr>
		<td>宽度:
		</td>
		<td><input name="deftabwidth" size=5 value="100">&nbsp;<input type="radio" name=deftabrao value="1" checked  onclick="document.all('deftabwidth').value=100;">百分比&nbsp;<input type="radio" value="2"  name=deftabrao onclick="document.all('deftabwidth').value=600;">象素
		</td>
	</tr>
	<tr>
		<td>编辑对象:
		</td>
		<td id="editobjectdiv"><select name="editobject" ><option value="aa">对象1</option></select>
		</td>
	</tr>

	<tr>
		<td colspan=2 align=center>
			<button onclick="insertDefTable();">确定</button>&nbsp;<button onclick="cancelInsertDefTable();">取消</button>
		</td>
	</tr>
	</table>
</div>
<div id="divtabsub" class="xwin" style="width:300;position:absolute;display:none">
	<span class="deftitle"  style="width:300">重复表格</span>
	<table width="100%">
		<tr>
			<td>列数:
			</td>
			<td><input name="subtabcol" size=5 value="6">
			</td>
		</tr>
		<tr>
			<td colspan=2 align=center>
				<button onclick="insertSubTable();">确定</button>&nbsp;<button onclick="cancelInsertSubTable();">取消</button>
			</td>
		</tr>
	</table>
</div>



 
<script>
	
	mofWindowId = "<%=mofWindowId%>";
	path = "<%=request.getContextPath()%>";

 
	function setWindowPreXml(xmlStr){
		mofWindowPreXml = xmlStr;
	}

</script>
 <script> 
	 setFormHtml(); 
	 
</script>


<iframe src="mofXml.cmd?method=getWindowPreXml&mofWindowId=<%=mofWindowId%>" style="display:none"></iframe>
<iframe src="mofXml.cmd?method=getAllTable" style="display:none"></iframe>
 
 
</BODY>
</HTML>
