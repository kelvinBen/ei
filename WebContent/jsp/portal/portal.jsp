<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%
String app=request.getContextPath();
%>
<HTML>
<HEAD>
<TITLE>首页定制</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skinportal.css'/>">

<style>
.bgtou{
	background-color:#E6E6E6;
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
</style>
<script language="" src="<mast:ui js='xmltree.js'/>"></script>

</HEAD>
<script language="javascript">
var SubFormIndex=1;//子表单名称
var lineobj=null;
var linedraw=null;

//初始化
function init()
{
	//alert("初始化表单");
		//showtabwin();
		//var tabstr='<TABLE id=tab1 borderColor=#3784c9 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff border=1 unselectable="on"><COLGROUP> <COL> <COL></COLGROUP> <TBODY> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="1" phcol="1"> <DIV style="BORDER-RIGHT: #3784c9 2px solid; BORDER-TOP: #3784c9 2px solid; BORDER-LEFT: #3784c9 2px solid; BORDER-BOTTOM: #3784c9 2px solid; HEIGHT: 100%; BACKGROUND-COLOR: #deeefc" url="mofroletaskinfoquery.cmd" bkId="undefined" bkType="工作流程"> <DIV class=divcls style="COLOR: #000000; BACKGROUND-COLOR: #97c9f6; TEXT-ALIGN: center;height:25;" align=center unselectable="on">工作流程</DIV></DIV></TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="1" phcol="2"> <DIV style="BORDER-RIGHT: #3784c9 2px solid; BORDER-TOP: #3784c9 2px solid; BORDER-LEFT: #3784c9 2px solid; BORDER-BOTTOM: #3784c9 2px solid; HEIGHT: 100%; BACKGROUND-COLOR: #deeefc" url="mofroletaskinfoquery.cmd" bkId="undefined" bkType="公告"> <DIV class=divcls style="COLOR: #000000; BACKGROUND-COLOR: #97c9f6; TEXT-ALIGN: center;height:25;" align=center unselectable="on">公告</DIV></DIV></TD></TR> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="2" phcol="1"> <DIV style="BORDER-RIGHT: #3784c9 2px solid; BORDER-TOP: #3784c9 2px solid; BORDER-LEFT: #3784c9 2px solid; BORDER-BOTTOM: #3784c9 2px solid; HEIGHT: 100%; BACKGROUND-COLOR: #deeefc" url="mofroletaskinfoquery.cmd" bkId="undefined" bkType="计划"> <DIV class=divcls style="COLOR: #000000; BACKGROUND-COLOR: #97c9f6; TEXT-ALIGN: center;height:25;" align=center unselectable="on">计划</DIV></DIV></TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="2" phcol="2"> <DIV style="BORDER-RIGHT: #3784c9 2px solid; BORDER-TOP: #3784c9 2px solid; BORDER-LEFT: #3784c9 2px solid; BORDER-BOTTOM: #3784c9 2px solid; HEIGHT: 100%; BACKGROUND-COLOR: #deeefc" url="mofroletaskinfoquery.cmd" bkId="undefined" bkType="新闻"> <DIV class=divcls style="COLOR: #000000; BACKGROUND-COLOR: #97c9f6; TEXT-ALIGN: center;height:25;" align=center unselectable="on">新闻</DIV></DIV></TD></TR> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="3" phcol="1"></TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="3" phcol="2"></TD></TR></TBODY></TABLE>';
	var tabstr='<TABLE id=tab1 borderColor=#3784c9 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff border=1 unselectable="on"><COLGROUP> <COL> <COL></COLGROUP> <TBODY> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="1" phcol="1"> </TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="1" phcol="2"> </TD></TR> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="2" phcol="1"> </TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="2" phcol="2"> </TD></TR> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="3" phcol="1"></TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="3" phcol="2"></TD></TR></TBODY></TABLE>';

		//alert(document.all("editHtml").value);
		if(document.all("editHtml").value!="")
			tabstr=document.all("editHtml").value;
		//alert(document.frames.ff.document);
		document.frames.ff.document.body.innerHTML=tabstr;
		document.frames.ff.OBJ.CursorImg="<%=SkinUtils.getImagePath(request)%>/portal/SizeAll.ani"
		//document.frames.ff.OBJ.imgPath="<%=SkinUtils.getImagePath(request)%>/portal";
		document.frames.ff.OBJ.imgPath="<%=request.getContextPath()%>/skins/default/images/portal";
		document.frames.ff.OBJ.init();
}
//外部getFormXml
function getFormXml()
{
	return	document.frames.ff.OBJ.getFormXml();
}
//外部getTemplate
function getTemplate()
{
	return	document.frames.ff.OBJ.getFormTemplate();
}

//外部getFormHtml
function getFormHtml()
{
	return	document.frames.ff.OBJ.getFormHtml();
}

//外部set url
function setUrl(url)
{
		document.frames.ff.OBJ.setUrl(url);
}
//外部set 编辑区HTML
function setFormHtml(str)
{
		if(str!=null && str!="")
		{
		document.frames.ff.OBJ.setFormHtml(str);
		document.frames.ff.OBJ.init();
		var tabs=document.frames.ff.document.body.getElementsByTagName("TABLE");
		var subs=1;
		for(var i=0;i<tabs.length;i++)
		{
		if(tabs[i].type=="sub")
		subs++;
		}
		SubFormIndex=subs;
		}
		//else
		//init();
}

  function openMbPer()
  {
  var curobj=document.frames.ff.OBJ.getCurXmlNode();
  if(curobj==null)
  {
  alert("没有选择板块！");
  return;
  }
  window.showModalDialog("bankuai.htm",window,"dialogWidth:300px;dialogHeight:300px;status:no");
  }
    function openTdPer()
  {
   var curobj=document.frames.ff.OBJ.getFirstTd();
  if(curobj==null)
  {
  alert("没有选择单元格！");
  return;
  }
  window.showModalDialog("cell_attrib.htm",window,"dialogWidth:400px;dialogHeight:300px;status:no");
  }

  function showtabwin()
  {
    var curobj=document.frames.ff.OBJ.getTabAll();
  if(curobj==null)
  {
  alert("请选择表格！");
  return;
  }

    window.showModalDialog("template.htm",window,"dialogWidth:450px;dialogHeight:400px;status:no");

  }
  function showformwin()
  {
      window.showModalDialog("form.htm",window,"dialogWidth:400px;dialogHeight:400px;status:no");

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
  img.src="images/12.gif";
  tt.className="";
  }
  else
  {
    img.src="images/12_h.gif";
	tt.className="noborder";
  }
  }
  function doview(){
	tex2.value=ff.document.body.innerHTML;
	document.frames.ff.OBJ.makeTabXml();
  }

 function WBTB_format(what,opt)
{
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
	var arr = showModalDialog("selcolor.html", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0; help:0");
	if (arr != null) WBTB_format('forecolor', arr);
}

function InsertTextFiled()
{
var otaball=document.frames.ff.OBJ.getTabAll();
var insertPoint=document.frames.ff.document.selection.createRange();
if(otaball==null )// || !otaball.contains(insertPoint.parentElement()))
{
alert("请选择插入位置!");
return false;
}

insertPoint.pasteHTML('<input type="text"/>');
}
function DelTextFiled()
{
var insertPoint=document.frames.ff.document.selection;
if(insertPoint.type=="Control")
	insertPoint.clear();
}



var index=1;
function InsertNewPage()
{
var tabtab=document.frames.ff.document.all("tabpage");
tabtab.style.position="relative";
for(var jj=0;jj<tabtab.rows[0].cells.length;jj++)
{
var otd=tabtab.rows[0].cells[jj];
otd.className="taboffcss";
if(otd.index!=null && otd.index!="")
index=parseInt(otd.index);
}
var ntd=tabtab.rows[0].insertCell();
//var index=ntd.cellIndex;
ntd.className="taboncss";
ntd.innerText="第"+(index+1)+"页";
ntd.width=50;
ntd.index=index+1;
var tabstr='<TABLE   unselectable=on   id="tab'+parseInt(index+1)+'" borderColor=#000000 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff border=1><COLGROUP><COL width="20%"><COL><COL><COL><COL><COL></COLGROUP>';
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
//var tabAll=document.frames.ff.OBJ.CurControl.parentElement;
if(linedraw==null)
{
lineobj=document.frames.ff.document.all("line");
linedraw=document.frames.ff.Line;
}
var insertPoint=document.frames.ff.document.selection.createRange();
var otd=insertPoint.parentElement();
	if(linedraw!=null)
	{
	var x1=otd.offsetLeft;
	var y1=otd.offsetTop;
	var x2=x1+otd.offsetWidth;
	var y2=y1+otd.offsetHeight;
	//alert(x1+","+y1+","+x2+","+y2);
	linedraw.drawLine(x1, y1, x2, y2); 
	linedraw.paint(); 
	insertPoint.pasteHTML(""+lineobj.innerHTML+"");
	linedraw.clear();
	}
}
//删除斜线
function delLine()
{
var insertPoint=document.frames.ff.document.selection.createRange();
var otd=insertPoint.parentElement();
if(otd==null) return;
if(otd.tagName!="TD")
{
if(otd.parentElement.tagName=="TD")
otd=otd.parentElement;
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


</script>
<BODY topmargin=0 onload="init()" ondragstart="return false;">
<!--<textarea id=ttt></textarea> 上面的按钮-->
<TABLE width="100%" border=0  cellspacing=0 cellpadding=0>
<TR>
	<TD    width="100%" height="25" valign="top"  class="bgtou">
		<html:button onclick="ff.merge();" name="合并单元格" >合并单元格</html:button>
		<html:button onclick="ff.merge();" name="拆分单元格" value="拆分单元格"/>
		<html:button onclick="document.frames.ff.OBJ.addRow();" name="插入一行" value="插入一行"/>

		<html:button onclick="document.frames.ff.OBJ.delRow();" name="删除一行" value="删除一行"/>

		<html:button onclick="document.frames.ff.OBJ.addCol();" name="插入一列" value="插入一列"/>

		<html:button onclick="document.frames.ff.OBJ.delCol();" name="删除一列" value="删除一列"/>

</TD>
	<td class="bgtou"><html:button onclick="forUpdate()" name="btn_update" value="保存"></html:button></td>
	<td class="bgtou"><html:button onclick="reset()" name="btn_reset" value="默认"></html:button></td>
</TR>
</table>
<TABLE width="100%" border=1 height="100%" cellspacing=0 cellpadding=0>
<TR onmousedown="document.frames['ff'].OBJ.FrameMouseDown();" onmousemove="document.selection.empty();">
	<TD width="150"  valign=top>
	<table  height="" border=0 cellspacing=0>
	<tr>
	<td>业务模块:</td>
	</tr>
	<tr>
	<TD width="150" id="treetd" valign=top >
	<!-- 树形选项,提供定制表单的选择项，必须放在 id=treetd 的下面 拖动的元素必须放在SPAN 中，并且必须包括 url 属性
	<DIV id="11" >++<SPAN url="user.cmd?method=forResetUserPassword">修改密码</SPAN></DIV>
	-->
	</TD>
	</tr>
	</table>
	</td>
	<TD width="90%" ><iframe width="100%" height="100%" id='ff' src="<%=app%>/jsp/portal/blank.htm"></iframe></TD>
</TR>
</TABLE>
<html:form  name="frmList" method="post" style="display:none"  action="">
showHtml:<html:textarea name="showHtml" property="showHtml"  style="width:50%;height:100px"  />
<br/>editHtml:<html:textarea name="editHtml" property="editHtml"  style="width:50%;height:100px"/>
<html:hidden name="primaryKey" value=""/>
<html:hidden name="organId" property="organId" />
<html:hidden name="editFileId" property="editFileId"/>
<html:hidden name="showFileId" property="showFileId"/>
<html:hidden name="singelStyle" property="singelStyle"/>

</html:form>

<script language="javascript">
  	var TreeObj = new XMLTree("TreeObj");
	TreeObj.openFlag="<%=SkinUtils.getImagePath(request)%>/portal/openflag.gif";
	TreeObj.closeFlag="<%=SkinUtils.getImagePath(request)%>/portal/closeflag.gif";
	//可定制的首页数据，可以修改为动态获取。
<%
net.mast.bsp.permit.context.BspInfo bspInfo = (net.mast.bsp.permit.context.BspInfo) request.getSession().getAttribute("UserLoginInfo");
String xmlName = "data";
if(net.mast.bsp.permit.pap.domain.support.PermitBeanFactory.hasPermission(bspInfo, "headTaskInfo.cmd"))
	xmlName = "data1";
%>
	//TreeObj.loadData("<%=app%>/desktop/<%=xmlName%>.xml",1);
	TreeObj.loadData("<%=app%>/menuxml.cmd",1);
	//在 treetd 中显示
	TreeObj.show("treetd");


function forUpdate(){
	document.all("primaryKey").value=document.all("organId").value;
	var action="commonsingleparms.cmd?method=update";
	if(document.all("organId").value=="")
		action="commonsingleparms.cmd?method=insert";
  document.all("showHtml").value=getTemplate();
  document.all("editHtml").value=getFormHtml();
  document.forms[0].action =action;
 
  document.forms[0].submit();
}
function reset()
{
	var tabstr='<TABLE id=tab1 borderColor=#3784c9 cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff border=1 unselectable="on"><COLGROUP> <COL> <COL></COLGROUP> <TBODY> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="1" phcol="1"> </TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="1" phcol="2"> </TD></TR> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="2" phcol="1"> </TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="2" phcol="2"> </TD></TR> <TR> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="3" phcol="1"></TD> <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" phrow="3" phcol="2"></TD></TR></TBODY></TABLE>';
		// table的id必须为 tab1 ,表示可编辑的表格
		document.frames.ff.document.body.innerHTML=tabstr;
		document.frames.ff.OBJ.CursorImg="<%=SkinUtils.getImagePath(request)%>/portal/SizeAll.ani"
		//document.frames.ff.OBJ.imgPath="<%=SkinUtils.getImagePath(request)%>/portal";
		document.frames.ff.OBJ.imgPath="<%=request.getContextPath()%>/skins/default/images/portal";
		document.frames.ff.OBJ.init();
}
</script>
</BODY>
</HTML>
