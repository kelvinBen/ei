<%@ page language="java" isThreadSafe="true"
	contentType="text/html; charset=GBK"%>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.context.*"%>
<%@ page import="org.openadaptor.core.adaptor.Adaptor" %>

<%@ page import="org.ld.soa.util.*"%>
<%!
	public String null2String(String s) {
		return s != null ? s : "";
	}

%>

<%//2006-07-21  ����ϲ�������ӣѣ̵Ĺ���
			//2007-01-19 �������ɳ�ʼ���ű�SQL�����ع���
			//2007-09-06  �����ܹ�ִ�ж���SQL�Ĺ��ܣ������ܹ��Զ��ж�ע��
			//2007-11-13  ����ִ�е���SQL�ű��ļ��Ĺ���
			String url = "";
			String forname = "";
			StringBuffer message = new StringBuffer();
			 
			ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			Adaptor adaptor = (Adaptor) ctx.getBean("Adaptor");
		    adaptor.run();//����Adaptor��run����
		    int exitCode=0;
		    if (adaptor!=null) {
		      exitCode=adaptor.getExitCode();
		    }
			out.println(exitCode);
%>


<html>
<style>
td
{
font-size:10pt;
border:1 solid #5b99c8;
}
th
{
font-size:12pt;
background-color:#8fcae9;
border:1 solid #5b99c8;
}
</style>
<head>
<title>����SQLִ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
</head>
<SCRIPT language="javascript">
function check(){
var sql=document.form1.sql.value;
	if(sql==""){
		alert("�������Զ���SQL���");
		return false;
		}
	return true;
}

function query(){
if(!check())
	return;
var isQuery=document.form1.isQuery;		
		isQuery.value="query";
		document.form1.action="loadsql.jsp";		
		document.form1.submit();
}

function update(){
if(!check())
	return;
var isQuery=document.form1.isQuery;		
		isQuery.value="update";
		document.form1.action="loadsql.jsp";		
		document.form1.submit();
}

function createInsertSql(){
if(!check())
	return;
var isQuery=document.form1.isQuery;		
		isQuery.value="createInsertSql";
		document.form1.action="loadsql.jsp";		
		document.form1.submit();
}

function getInsertSqlFile(){
if(!check())
	return;
document.form1.action="downSql.jsp";
document.form1.submit();
}

function excuteFile(){
var uploadFile=document.all("uploadFile").value;
//alert(uploadFile);
	if(uploadFile==""){
		alert("��ѡ����Ҫִ��SQL�ļ����ļ�����.sql��β������SQL����� ; �Ž�β�� -- ���ű�ʾһ��ע�͡�");
		return false;
		}
		var isQuery=document.form1.isQuery;		

		isQuery.value="excutefile";
document.form1.action="loadsql.jsp";
document.form1.submit();
}


</script>
<body topmargin="10px" bgcolor="#eff7ff">


<p align="center">����SQLִ��</p>
<hr>
<form action="loadsql.jsp" enctype="multipart/form-data" name=form1
	method=post>
<INPUT TYPE="hidden" name="isQuery" value=""> ��ѡ����Ҫִ�е�SQL�ű��ļ���
<INPUT TYPE="file" 	NAME="uploadFile">
<INPUT NAME="excuteFilebt" TYPE="button" VALUE="ִ��SQL�ļ�" onClick="excuteFile()"> <br>
<hr>
<table cellpadding=2 cellspacing=0 border=0>
	<tr>
		<td style="border:0">�������ݿ�ɹ�</td>
		<td style="border:0"><A HREF="datamain.jsp">���������µ����ݿ�</A>&nbsp;&nbsp;ÿ��SQL���ʹ��";"�Ž�����"--"���ű�ʾע��ĳһ��</td>
	</tr>

	<tr>
		<td style="border:0">
		<p>����SQL��䣺</p>
		</td>
		<td style="border:0"><textarea rows="8" name="sql" cols="89">aa</textarea></td>
		<td style="border:0">
		<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button
			onClick="query()">ִ�в�ѯ</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button
			onClick="update()">ִ�и���</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave3 accessKey=S name=btnSave3 type=button
			onClick="createInsertSql()">���ɲ���SQL</BUTTON>
		<BUTTON class=btn id=btnSave4 accessKey=S name=btnSave3 type=button
			onClick="getInsertSqlFile()">����SQL�ļ�</BUTTON>
	</tr>
</table>
</form>
<hr>
<div align="center">
