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

<%//2006-07-21 添加上产生插入ＳＱＬ的功能
			//2007-01-19 加入生成初始化脚本SQL的下载功能
			//2007-09-06  加入能够执行多条SQL的功能，并且能够自动判断注释
			//2007-11-13  加入执行单个SQL脚本文件的功能
			String url = "";
			String forname = "";
			StringBuffer message = new StringBuffer();
			Map para = IOUtil.handleRequestToMap(request);
			 
			ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
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
			String jndiNameTmp=jndiName;

			Connection conn = null;
			Statement stmt = null;
			ResultSet set = null;
			out.println("<BR>连接数据库.......");
			response.flushBuffer();
			try {
				conn = DBUtil.getDBConnection(dbtype, para,ctx);
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

<%
			DatabaseMetaData dbmd = conn.getMetaData();
			if (dbmd != null) {
				String dbName = dbmd.getDatabaseProductName();
				out.println(",数据库类型为:"+dbName+"<BR>");
					}

%>
<p align="center">定义SQL执行(强化版的查询请访问：loadindex.jsp)</p>
<hr>
<form action="loadsql.jsp" enctype="multipart/form-data" name=form1
	method=post><INPUT TYPE="hidden" name="dbserver" value="<%=dbserver%>">
<INPUT TYPE="hidden" name="dbname" value="<%=dbname%>"> 
<INPUT	TYPE="hidden" name="username" value="<%=username%>"> 
<INPUT 	TYPE="hidden" name="password" value="<%=password%>"> 
<INPUT 	TYPE="hidden" name="dbtype" value="<%=dbtype%>"> 
<INPUT TYPE="hidden" name="jndiType" value="<%=jndiType%>"> 
<INPUT TYPE="hidden" name="jndiName" value="<%=jndiNameTmp%>"> 
<INPUT TYPE="hidden" name="dataSource" value="<%=dataSource%>"> 

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
		<td style="border:0"><textarea rows="8" name="sql" cols="89"><%=sql%></textarea></td>
		<td style="border:0">
		<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button
			onClick="query()">执行查询</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button
			onClick="update()">执行更新</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave3 accessKey=S name=btnSave3 type=button
			onClick="createInsertSql()">生成Insert的SQL</BUTTON><BR>
		<BUTTON class=btn id=btnSave4 accessKey=S name=btnSave3 type=button
			onClick="getInsertSqlFile()">生成SQL文件</BUTTON>
	</tr>
</table>
</form>
<hr>
<div align="center">
<%
			ResultSetMetaData rm = null;
			// 结果集的列数（字段数）
			int col_number = 0;
			// 每一列的宽度
			int[] col_widths = null;
			// 总宽度
			int sum_w = 0;
			try {
				List excuteSqlList=null;
				if (isQuery.equals("excutefile")) {
					sql=(String)para.get("uploadFile");
				//	System.out.println("excute===="+sql);
					excuteSqlList = DBUtil.getExcuteSqlList(sql);
					if (excuteSqlList.size() == 0)
						message.append("<br>无有效的更新类的SQL需要执行! sql=" + sql);
					conn.setAutoCommit(false);
					stmt = conn.createStatement();
					for (int i = 0; i < excuteSqlList.size(); i++) {
						String excuteSql = (String) excuteSqlList.get(i);
						try{
						message.append("<br>执行 [<font color=\"#6633FF\">"
								+ excuteSql + "</font>]");
						message.append("成功! 影响记录行数为:"
								+ stmt.executeUpdate(excuteSql));
							}catch(Exception e){
							message.append("<br><b>出错了 : " + e+"</b>");//执行出错，继续往下
								}
					}
					conn.commit();
					return;
				}
				
				if ("".equals(sql))
					return;
				excuteSqlList = DBUtil.getExcuteSqlList(sql);
			
				
				
				stmt = conn.createStatement();
				if (isQuery.equals("update")) {
					if (excuteSqlList.size() == 0)
						message.append("<br>无有效的更新类的SQL需要执行! sql=" + sql);
					for (int i = 0; i < excuteSqlList.size(); i++) {
						String excuteSql = (String) excuteSqlList.get(i);
						message.append("<br>执行 [<font color=\"#6633FF\">"
								+ excuteSql + "</font>]");
						message.append("成功! 影响记录行数为:"
								+ stmt.executeUpdate(excuteSql));
					}
					return;
				}

				


				if (excuteSqlList.size() > 0) {
					sql = (String) excuteSqlList.get(0);
				}
				out.println("<br>执行[" + sql + "]");
				set = stmt.executeQuery(sql);

				rm = set.getMetaData();
				col_number = rm.getColumnCount();

				if (isQuery.equals("createInsertSql")) {//如果是产生插入语句的话
					out
							.println("<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border:1 solid #5b99c8;\" cellpadding=2 cellspacing=0  id=\"AutoNumber1\" width=\"90%\">");
					String tableName = DBUtil.getTableName(sql);

					StringBuffer insertInit = new StringBuffer();

					insertInit.append("INSERT INTO " + tableName + "(");
					for (int i = 1; i <= col_number -1; i++) {
						insertInit.append(rm.getColumnName(i) + ", ");
					}
					insertInit.append(rm.getColumnName(col_number)
							+ " ) VALUES ( ");
					int buffer = 1;
					while (set.next()) {
						out.println("<TR>");
						out.println("<Td>");
						StringBuffer insertSql = new StringBuffer();
						insertSql.append(insertInit);
						for (int i = 1; i <= col_number -1; i++) {//最后一个i和前面的字段名重复,所以不使用
							int type = rm.getColumnType(i);
							String col = set.getString(i);
							if (col == null) {
								insertSql.append(null + ", ");
							} else {
								if (type == Types.BIGINT
										|| type == Types.DECIMAL
										|| type == Types.DOUBLE
										|| type == Types.FLOAT
										|| type == Types.INTEGER
										|| type == Types.NUMERIC
										|| type == Types.SMALLINT) {
									insertSql.append(col + ", ");
								} else {
									insertSql.append("'" + col + "', ");
								}
							}
						}
						int type = rm.getColumnType(col_number);
						if (type == Types.BIGINT || type == Types.DECIMAL
								|| type == Types.DOUBLE || type == Types.FLOAT
								|| type == Types.INTEGER
								|| type == Types.NUMERIC
								|| type == Types.SMALLINT) {
							insertSql.append(set.getString(col_number) + " );");
						} else {
							insertSql.append("'" + set.getString(col_number)
									+ "' );");
						}

						out.println(insertSql);
						out.println("</td></tr>");
						buffer++;
						if (buffer > 100) {
							buffer = buffer / 100;
							response.flushBuffer();
						}
					}
				} else {

					col_widths = new int[col_number + 1];
					for (int i = 1; i <= col_number; i++) {
						int tp=rm.getColumnType(i);
						int DisplaySize=rm.getColumnDisplaySize(i);
						if(tp==Types.BLOB||tp==Types.CLOB)
							DisplaySize=60;
						col_widths[i] = DisplaySize;
						sum_w += col_widths[i];
					}

					out
							.println("<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border:1 solid #5b99c8;\" cellpadding=2 cellspacing=0  id=\"AutoNumber1\" width="
									+ sum_w + ">");

					out.println("<TR align=\"CENTER\">");
					out.println("<Th width=60>记录号</th>");
					for (int i = 1; i <= col_number; i++){
						int tp=rm.getColumnType(i);
						//int DisplaySize=rm.getColumnDisplaySize(i);
						StringBuffer tmp=new StringBuffer("<th width=" + col_widths[i] + 10 + "> ("+tp+"="+ rm.getColumnTypeName(i)+")<br>[size=");						
					
						tmp.append(rm.getColumnDisplaySize(i)+"]<br><FONT COLOR=\"#CC0000\">"+ rm.getColumnName(i)+"</FONT></th> ");
						
						out.print(tmp);
					
					}
					out.println("</TR>");
					int buffer = 1;
					while (set.next()) {
						out.println("<TR align=\"CENTER\">");
						out.println("<Td width=60>" + buffer + "</td>");
						for (int i = 1; i <= col_number; i++){
						//	out.print("<td width=" + col_widths[i] + 10 + ">"
						//			+ set.getString(i) + "</td> ");
out.print("<td width=" + col_widths[i] + 10 + ">"+ set.getObject(i) + "</td> ");
						}
						out.println("</TR>");
						buffer++;
						if (buffer > 20)
							response.flushBuffer();
					}
					out.println("</table>");
				}

			} catch (SQLException e2) {
				message.append("<br>出错了 : " + e2);
				conn.rollback();//事物回滚
				conn.clearWarnings();
			} finally {
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
%></div>
<p><font color="#FF0000"> <%=message%></font></p>
</body>
</html>
<%}
			}

		%>
