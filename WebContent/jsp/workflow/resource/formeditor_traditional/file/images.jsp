<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
	<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<META http-equiv="Content-Type" content="text/html; charset=GBK">
<TITLE>tree</TITLE>
	<script language="javascript" src="<mast:ui js='gwp.js'/>"></script>
	<script language="javascript" src="<mast:ui js='tree.js'/>"></script>
	<script language="javascript" src="<mast:ui js='tree_tpl.js'/>"></script>
<script language = "javascript">
var arrImg = new Array();

function selectOk(value){
	window.parent.returnValue = getValue(value);
	window.parent.close();
}
function getValue(value){
	for (var i=0;i<arrImg.length;i++){
		if (arrImg[i]["url"]==value){
			return arrImg[i];
		}
	}
}
function load(){
	var zoomWidth = 100;
	var zoomHeight = 100;
	var imgs = document.getElementsByName("disImg");
	for (var i=0;i<imgs.length;i++){
		var width = parseInt(imgs[i].width);
		var height = parseInt(imgs[i].height);
		arrImg[i] = new Array();
		arrImg[i]["url"]=imgs[i].getAttribute("url");
		arrImg[i]["width"] = imgs[i].width;
		arrImg[i]["height"] =imgs[i].height;
		imgs[i].title = "尺寸:" + width + "×" + height + "\n" + imgs[i].title;
		if (width>zoomWidth || height>zoomHeight){
			var bw = zoomWidth/width;
			var bh = zoomHeight/height;
			if (bw>bh){
				bw = bh;
			}
			imgs[i].width = parseInt(width * bw);
			imgs[i].height = parseInt(height * bw);
		}
	}
}
</script>
<style type="text/css">
TD{font-size:10pt;} 
</style>
</HEAD>
<BODY bgcolor="#EBECED" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<P>
<%=request.getAttribute("com.mast.workform.selectFileList")%>

</P>
</BODY>
<script language="javascript">
load();
</script>
</HTML>
