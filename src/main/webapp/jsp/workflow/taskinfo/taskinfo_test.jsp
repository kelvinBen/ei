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
<TITLE>newwf.jsp</TITLE>
</HEAD>
<BODY>
<P>�½����̲�����</P>
<form action="taskinfo.cmd?method=forcreate" method="post">

<br>
procDefId ����id<INPUT type="text" name="procDefId" size="20" value="Flow_8ce15343940">
<br>

formId ��id<INPUT type="text" name="formId" size="20" value="WorkFormSequnceId1109590030890">

<INPUT type="submit" name="sub" value="�ύ">
</form>


<P>��ȡ�����б�</P>
<form action="taskinfoquery.cmd"  method="post">
processType ��������id<INPUT type="text" name="processType" size="20" value="ProcessType_83599b32710">
<br>
formId ��id<INPUT type="text" name="formId" size="20" value="WorkFormSequnceId1109590030890">

<INPUT type="submit" name="sub" value="�ύ">
</form>


<P>��ȡ��ɫ�����б�</P>
<form action="taskinfoquery.cmd"  method="post">
processType ��������id<INPUT type="text" name="processType" size="20" value="ProcessType_83599b32710">
<br>
formId ��id<INPUT type="text" name="formId" size="20" value="WorkFormSequnceId1109590030890">

<INPUT type="submit" name="sub" value="�ύ">
</form>

</BODY>
</HTML>
