 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
	<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<META http-equiv="Content-Type" content="text/html; charset=GBK">
<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>ѡ���ļ�</TITLE>
	<script language="javascript" src="<mast:ui js='gwp.js'/>"></script>
	<script language="javascript" src="<mast:ui js='tree.js'/>"></script>
	<script language="javascript" src="<mast:ui js='tree_tpl.js'/>"></script>
<script language = "javascript">
function cancelMe(){
	window.parent.returnValue = null;
	window.parent.close();
}

</script>
</HEAD>
<body bgcolor="#EBECED" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" scroll=no>
<table border="0" id="table1" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2" align="right">
		<input type="button" value="�ӱ���ѡ��..." onclick = "javascript:up.document.all('upload').click()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="cancelMe()" value="ȡ ��">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td><iframe id="tree" src="workformgraph.cmd?method=exec" width="130" height="252"></iframe></td>
		<td><iframe id="display" src="workformgraph.cmd?method=getfiles&path=" width="465" height="252"></iframe></td>
	</tr>
		<tr>
	</tr>
</table>
<br>

<iframe id="up" src="uploadFile.jsp"></iframe>
</body>
</HTML>
