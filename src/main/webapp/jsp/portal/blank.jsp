<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE> blank</TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<script language="javascript" src="<mast:ui js='DefPortalTool.js'/>"></script>
</HEAD>
<!-- 本系统用的是image/portal/blank.htm-->
<style>
table
{
table-layout:fixed;
border-collapse:collapse;

}

 td
{
vertical-align : top; 
padding:3px;
height:100px;
}
table div
{
font-size:9pt;
text-align:center;
vertical-align : middle; 
}
.noborder
{
border:1 dotted ;
}
.noborder td
{
border:1 dotted ;
}
div
{
vertical-align:top;
}
.taboncss{padding-left:5px;padding-right:5px;font-size:9pt;white-space:nowrap;padding-top:0px;border-left:1px solid #ffffff;border-top:1px solid #ffffff;border-right:1px solid #666666;border-bottom:1px solid #f1f1f1;background-color:#f1f1f1}
.taboffcss{padding-left:5px;padding-right:5px;font-size:9pt;white-space:nowrap;padding-top:3px;border-left:1px solid #ffffff;border-top:1px solid #f1f1f1;border-right:1px solid #666666;border-bottom:1px solid #ffffff;background-color:#cccccc}
hr
{
height:5px;
border:5 solid #7F7F7F ;
}
.tabtoucss td{
	background-color:#CCCCCC;
	border-width: 1px 0px 0px 1px;
	border-style: solid;
	filter: Alpha(Opacity=40, FinishOpacity=100, Style=1, StartX=0, StartY=0, FinishX=0, FinishY=50);
	border-color: #000000;
	vertical-align:center;
	white-space:   nowrap;
	padding-top:3;
	color: #000000;
	text-align:center;
}
.tabsumcss td{
	background-color:#E6E6E6;
	border-width: 1px 0px 0px 1px;
	border-style: solid;
	border-color: #000000;
	vertical-align:center;
	white-space:   nowrap;
	padding-top:3;
	color: #000000;
	text-align:left;
}

.fieldsetCss
{
width:  100%;
padding:10;
font-size:9pt;
}

</style>

<BODY  onbeforecut=""  onmousemove="OBJ.FrameMouseMove()" onmouseup="OBJ.FrameMouseUp();"  CONTENTEDITABLE="true" onkeypress="if(event.keyCode=='13') {document.selection.createRange().text='\n';return false;}">

<SCRIPT LANGUAGE="JScript">
var OBJ= new DefPortalTool("OBJ");
var CurrentTabDiv=null;

function merge()
{
var str="";
var xmlstr=OBJ.Merge();
}
function split()
{
var str="";
var xmlstr=OBJ.Split();
}
</SCRIPT>
</BODY>
</HTML>
