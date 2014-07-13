<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=GB18030"
pageEncoding="GB18030"
%>
<META http-equiv="Content-Type" content="text/html; charset=GB18030">
<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>testload.jsp</TITLE>
</HEAD>
<BODY>
<form action="taskinfo.cmd?method=xpdlupload" method="post">
xpdl路径 <INPUT type="text" name="xpdlpath" size="20">
<INPUT type="submit" name="ssss" value="提交">
</form>

重新装入
<form action="taskinfo.cmd?method=xpdlreload" method="post">
<INPUT type="text" name="xpdlpathr" size="20">
<INPUT type="submit" name="ssss" value="提交">
</form>
</BODY>
</HTML>
