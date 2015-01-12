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

<%//2006-07-21  添加上产生插入ＳＱＬ的功能
			//2007-01-19 加入生成初始化脚本SQL的下载功能
			//2007-09-06  加入能够执行多条SQL的功能，并且能够自动判断注释
			//2007-11-13  加入执行单个SQL脚本文件的功能
			String url = "";
			String forname = "";
			StringBuffer message = new StringBuffer();
			 
			ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
			Adaptor adaptor = (Adaptor) ctx.getBean("Adaptor");
		    adaptor.run();//运行Adaptor的run方法
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
<title>定义SQL执行</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
</head>
<SCRIPT language="javascript">
function check(){
var sql=document.form1.sql.value;
	if(sql==""){
		alert("请输入自定义SQL语句");
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
		alert("请选择需要执行SQL文件，文件名以.sql结尾，各个SQL语句以 ; 号结尾， -- 符号表示一行注释。");
		return false;
		}
		var isQuery=document.form1.isQuery;		

		isQuery.value="excutefile";
document.form1.action="loadsql.jsp";
document.form1.submit();
}


</script>
<body topmargin="10px" bgcolor="#eff7ff">


<p align="center">定义SQL执行</p>
<hr>
<form action="loadsql.jsp" enctype="multipart/form-data" name=form1
	method=post>
<INPUT TYPE="hidden" name="isQuery" value=""> 请选择需要执行的SQL脚本文件：
<INPUT TYPE="file" 	NAME="uploadFile">
<INPUT NAME="excuteFilebt" TYPE="button" VALUE="执行SQL文件" onClick="excuteFile()"> <br>
<hr>
<table cellpadding=2 cellspacing=0 border=0>
	<tr>
		<td style="border:0">连接数据库成功</td>
		<td style="border:0"><A HREF="datamain.jsp">重新连接新的数据库</A>&nbsp;&nbsp;每个SQL语句使用";"号结束，"--"符号表示注释某一行</td>
	</tr>

	<tr>
		<td style="border:0">
		<p>输入SQL语句：</p>
		</td>
		<td style="border:0"><textarea rows="8" name="sql" cols="89">aa</textarea></td>
		<td style="border:0">
		<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button
			onClick="query()">执行查询</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button
			onClick="update()">执行更新</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave3 accessKey=S name=btnSave3 type=button
			onClick="createInsertSql()">生成插入SQL</BUTTON>
		<BUTTON class=btn id=btnSave4 accessKey=S name=btnSave3 type=button
			onClick="getInsertSqlFile()">生成SQL文件</BUTTON>
	</tr>
</table>
</form>
<hr>
<div align="center">
