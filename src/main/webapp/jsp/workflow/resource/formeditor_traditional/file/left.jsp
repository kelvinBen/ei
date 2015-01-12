<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
	<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<META http-equiv="Content-Type" content="text/html; charset=GBK">
<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>tree</TITLE>
	<script language="javascript" src="<mast:ui js='gwp.js'/>"></script>
	<script language="javascript" src="<mast:ui js='tree.js'/>"></script>
	<script language="javascript" src="<mast:ui js='tree_tpl.js'/>"></script>
<script language = "javascript">
function checkMe(s){
		
}
function checkFolder(obj){
	var title="";
	if (obj!=null){
		title = obj.getAttribute("title");
	}
	parent.up.document.all("path").value = title;
	if (title == null){
		parent.display.location = "workformgraph.cmd?method=getfiles&ExtendName=.gif.png.jpg.jpeg";
	}else{
		parent.display.location = "workformgraph.cmd?method=getfiles&ExtendName=.gif.png.jpg.jpeg.&path=" + title  ;
	}
}
</script>
</HEAD>
<BODY bgcolor="#EBECED" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<P>
<SCRIPT language=JavaScript>
	var TREE_ITEMS=[<%=request.getAttribute("com.mast.workform.selectFile")%>];
	new tree(TREE_ITEMS, tree_tpl);
</SCRIPT>
</P>
</BODY>
</HTML>
