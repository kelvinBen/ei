<%@ page language="java" isThreadSafe="true"
	contentType="text/html; charset=GBK"%>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.context.*"%>

<%@ page import="org.ld.soa.util.*"%>
<%!
	public String null2String(String s) {
		return s != null ? s : "";
	}

%>

<%//2008-09-21 创建ＳＱＬ的输入界面

			String url = "";
			String forname = "";
			StringBuffer message = new StringBuffer();
			Map para = IOUtil.handleRequestToMap(request);

			String dbserver = null2String((String)para.get("dbserver"));
			String dbname = null2String((String)para.get("dbname"));
			String username = null2String((String)para.get("username"));
			String password = null2String((String)para.get("password"));
			String dbtype = null2String((String)para.get("dbtype"));
			String jndiType = null2String((String)para.get("jndiType"));
			String jndiName = null2String((String)para.get("jndiName"));
			String dataSource = null2String((String)para.get("dataSource"));
			String isQuery = null2String((String)para.get("isQuery"));
			String sql = null2String((String)para.get("sql"));
			String maxRow=null2String((String)para.get("maxRows"));
		int maxRows=50;
		try {
			 maxRows=Integer.parseInt(maxRow);
		} catch (NumberFormatException e1) {
			maxRows=50;
			e1.printStackTrace();
		}
		ComponentFactory.setApplicationContext(this.getServletContext());
			String jndiNameTmp=jndiName;

			Connection conn = null;
			Statement stmt = null;
			ResultSet set = null;
			out.println("连接数据库.......");
			response.flushBuffer();
			try { 
				conn = DBUtil.getDBConnection(dbtype, para);
			} catch (SQLException e) {
				e.printStackTrace();
				message.append("<br>连接数据库出错!:" + e);
				//return ;
			}catch (Exception e) {
				//System.out.println("<br>连接数据库出错!:" + e);
				e.printStackTrace();
				message.append("<br>连接数据库出错!:" + e);
				//return ;
			}
			if (!message.toString().equals("")) {
				out.println("<BR>数据库连接失败！<BR>");
				message.append("<br><A HREF=\"datamain.jsp\">返回</A>");
				out.println(message);
				out.println(para.get("message"));
				try {
					if (conn != null)
						conn.close();
				} catch (java.sql.SQLException se) {
				}
				conn = null;
				return;
			}
			out.println(para.get("message"));

%>


<%@page import="net.mast.waf.ComponentFactory"%>
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
		alert("请输入需要执行的SQL语句");
		return false;
		}
	return true;
}
function gettoresult(){
	return window.parent.toresult;
}

function query(){
if(!check())
	return;
var isQuery=document.form1.isQuery;		
		isQuery.value="query";
		var toresult= gettoresult();	
		toresult.form1.sql.value=document.form1.sql.value;
		//alert(toresult.form1.sql.value);
		toresult.form1.btnSave2.click();
	var maxRows=document.form1.maxRows.value;
		toresult.form1.maxRows.value=maxRows;
		toresult.form1.submit();
}

function update(){
if(!check())
	return;

var isQuery=document.form1.isQuery;		
		isQuery.value="update";
		var toresult= gettoresult();	
		toresult.form1.sql.value=document.form1.sql.value;
		toresult.form1.btnSave3.click();

		toresult.form1.submit();
}

function createInsertSql(){
if(!check())
	return;

var isQuery=document.form1.isQuery;		
		isQuery.value="createInsertSql";

		var toresult= gettoresult();	
		toresult.form1.sql.value=document.form1.sql.value;
		//alert(toresult.form1.sql.value);
		toresult.form1.btnSave4.click();
		//document.form1.action="forsql.jsp";		
//		document.form1.submit();
		toresult.form1.submit();

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
		var toresult= gettoresult();	
				
		isQuery.value="excutefile";
		//toresult.form1.excuteFilebt.click();
		//toresult.form1.submit();
		document.form1.target='toresult';
		document.form1.action="result.jsp";
		document.form1.submit();

//document.form1.submit();
}


</script>
<body bgcolor="#eff7ff">

<%
			DatabaseMetaData dbmd = conn.getMetaData();
			if (dbmd != null) {
				String dbName = dbmd.getDatabaseProductName();
				out.println(",数据库类型为:"+dbName+"<BR>");
					}

%>
<div align="center" style="font-size: 16px;">定义SQL执行(简化版请访问：loadsql.jsp)</div>
<hr size="2" >
<form action="result.jsp" enctype="multipart/form-data" name=form1 target="toresult"
	method=post><INPUT TYPE="hidden" name="dbserver" value="<%=dbserver%>">
<INPUT TYPE="hidden" name="dbname" value="<%=dbname%>"> 
<INPUT	TYPE="hidden" name="username" value="<%=username%>"> 
<INPUT 	TYPE="hidden" name="password" value="<%=password%>"> 
<INPUT 	TYPE="hidden" name="dbtype" value="<%=dbtype%>"> 
<INPUT TYPE="hidden" name="jndiType" value="<%=jndiType%>"> 
<INPUT TYPE="hidden" name="jndiName" value="<%=jndiNameTmp%>"> 
<INPUT TYPE="hidden" name="dataSource" value="<%=dataSource%>"> 

<INPUT TYPE="hidden" name="isQuery" value=""> <div style="font-size: 16px;">请选择需要执行的SQL脚本文件：<INPUT TYPE="file" 	NAME="uploadFile">
<INPUT NAME="excuteFilebt" TYPE="button" VALUE="执行SQL文件" onClick="excuteFile()">
限制查询显示的最大行数：<input type="text" name="maxRows" value="<%=maxRows%>" title="0表示没有限制" size="5"/>
</div>
<hr>
<table cellpadding=2 cellspacing=0 border=0>
	<tr  border=0>
		
		<td colspan="2" style="border:0"><A HREF="datamain.jsp">重设数据库连接</A>&nbsp;&nbsp;每个SQL语句使用";"号结束，"--"符号表示注释某一行</td>
	</tr>
	<tr>
		<td style="border:0">
		<p>输入SQL语句：</p>
		</td>
		<td style="border:0"><textarea rows="8" name="sql" cols="89"><%=sql%></textarea></td>
		<td style="border:0">
		<BUTTON class=btn id=btnSave2 accessKey=R　name=btnSave2 type=button
			onClick="query()">执行查询(Alt+R)</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave2 accessKey=U name=btnSave2 type=button
			onClick="update()">执行更新(Alt+U)</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave3 name=btnSave3 type=button
			onClick="createInsertSql()">生成初始化SQL</BUTTON>
		<BUTTON class=btn id=btnSave4 name=btnSave3 type=button
			onClick="getInsertSqlFile()">生成SQL文件</BUTTON>
	</tr>
</table>
</form>

<%

			try {
				
			}  finally {
				if (set != null) {
					try {
						set.close();
					} catch (SQLException e) {
					}
					set = null;
				}
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
					}
					stmt = null;
				}
				try {
					if (conn != null)
						conn.close();
				} catch (java.sql.SQLException se) {
				}
				conn = null;

				if (!message.toString().equals("")) {
%>
<p><font color="#FF0000"> <%=message%></font></p>
</body>
</html>
<%}
			}

		%>
