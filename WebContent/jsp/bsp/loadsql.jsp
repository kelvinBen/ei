<%@ page language="java"
        isThreadSafe="true" %>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*"%>
<%@ page import="net.mast.waf.ComponentFactory" %>
<%@ page import="net.mast.waf.RF"%>
<%! 
public String null2String(String s) {
	return s != null ? s : "";
}
//该方法得到当前查询ＳＱＬ的表名
public static String getTableName(String sql){
		String tableName=null;
		String SQL2=sql.toUpperCase();
		//System.out.println("sql="+SQL2);
		int from=SQL2.indexOf("FROM")+4;
		int where=SQL2.indexOf("WHERE");
		if(where>-1)
		tableName=sql.substring(from,where);
		else
			tableName=sql.substring(from);
		//System.out.println("tableName="+tableName);
    	if(tableName.endsWith(";")) {
    	    tableName = tableName.substring(0,tableName.length() - 1);
    	}
		return tableName;
	}
%>

<%
//2006-07-21 黄道泳 添加上产生插入ＳＱＬ的功能
//2007-01-19 黄道泳加入生成初始化脚本SQL的下载功能
String dbserver = null2String(request.getParameter("dbserver"));
String dbname = null2String(request.getParameter("dbname"));
String username = null2String(request.getParameter("username"));
String password = null2String(request.getParameter("password"));
String dbtype = null2String(request.getParameter("dbtype"));
String jndiType = null2String(request.getParameter("jndiType"));
String jndiName = null2String(request.getParameter("jndiName"));
String jndiNameTmp=jndiName;
String url = "";
String forname = "";
StringBuffer message = new StringBuffer();


Connection conn = null;
Statement stmt = null;
ResultSet set = null;
out.println("<BR>"+RF.get("bspother.conect_db")+"<BR>");
response.flushBuffer();
if (dbtype.equals(""))
	dbtype = "dataSource";
if (dbtype.equals("dataSource")) {
	try {// 取默认的数据源对象
		out.println("<BR>"+RF.get("bspother.use_config_connect_db"));
		DataSource dataSource = (DataSource) ComponentFactory
				.getBean("dataSource");
		conn = dataSource.getConnection();

	} catch (Exception f) {
		message.append(RF.get("bspother.get_default_datasource_error") + f);
	}
} else if (dbtype.equals("jndi")) {
	if (jndiType.equals("2"))
		jndiName = "java:comp/env/" + jndiName;
	out.println("<BR>"+RF.get("bspother.connect_type_jndi")+"jndiName=" + jndiName);
	try {
		Context ctx = new InitialContext(); // 访问jndi根目录
		DataSource ds = (DataSource) ctx.lookup(jndiName);// 拿到demo这个ds对象
		conn = ds.getConnection();
		// path="";
	} catch (NamingException e1) {

		message.append("<BR>"+RF.get("bspother.is_error") + e1);
		e1.printStackTrace();
		// throw new RuntimeException(e1);

	} catch (SQLException e1) {

		message.append("<BR>"+RF.get("bspother.is_error") + e1);
		e1.printStackTrace();
	}
} else {
	if (dbtype.equals("1")) {
		url = "jdbc:microsoft:sqlserver://" + dbserver
				+ ":1433;DatabaseName=" + dbname;
		forname = "com.microsoft.jdbc.sqlserver.SQLServerDriver";

	} else if (dbtype.equals("2")) {
		url = "jdbc:oracle:thin:@" + dbserver + ":1521:" + dbname;
		forname = "oracle.jdbc.OracleDriver";
	} else if (dbtype.equals("4")) {
		url = "jdbc:db2://" + dbserver + ":50000/" + dbname;
		// forname = "COM.ibm.db2.jdbc.net.DB2Driver";
		forname = "com.ibm.db2.jcc.DB2Driver";
	} else if (dbtype.equals("3")) {
		url = "jdbc:db2:" + dbname;
		forname = "COM.ibm.db2.jdbc.app.DB2Driver";
	}
	try {
		out.println("<BR>"+RF.get("bspother.connect_type_direct_connect")+"url=" + url);
		Driver driver = (Driver) Class.forName(forname).newInstance();
		DriverManager.registerDriver(driver);
		Properties props = new Properties();
		props.put("user", username);
		props.put("password", password);
		props.put("CHARSET", "ISO");
		conn = DriverManager.getConnection(url, props);
	} catch (InstantiationException e) {
		message.append("<BR>"+RF.get("bspother.db_driver_error") + e);
		e.printStackTrace();
		
	} catch (IllegalAccessException e) {
	
		message.append("<BR>"+RF.get("bspother.is_error") + e);
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		
		message.append("<BR>"+RF.get("bspother.is_error") + e);
		e.printStackTrace();
	} catch (SQLException e) {
		
		message.append("<BR>"+RF.get("bspother.is_error") + e);
		e.printStackTrace();
	}

}
if (!message.toString().equals("")) {
	out.println("<BR>"+RF.get("bspother.db_connect_fail")+"<BR>");
	
	message.append("<br><A HREF=\"datamain.jsp\">"+RF.get("COMMON.BACK")+"</A>");

	out.println(message);
	try {
		if (conn != null)
			conn.close();
	} catch (java.sql.SQLException se) {
	}
	conn = null;
	return;
}
String isQuery = null2String(request.getParameter("isQuery")).trim();
String sql = null2String(request.getParameter("sql")).trim();


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
<title><%=RF.get("bspother.define_sql") %></title>
</head>
<SCRIPT language="javascript">
function check(){
var sql=document.form1.sql.value;
	if(sql==""){
		alert('<%=RF.get("bspother.please_enter_custom_sql")%>');
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



</script>
<body topmargin="10px" bgcolor="#eff7ff">


<p align="center"><%=RF.get("bspother.define_sql") %></p>
<hr>
<form action="loadsql.jsp"  name=form1 method=post>
<INPUT TYPE="hidden" name="dbserver" value="<%=dbserver%>">
<INPUT TYPE="hidden" name="dbname" value="<%=dbname%>">
<INPUT TYPE="hidden" name="username" value="<%=username%>">
<INPUT TYPE="hidden" name="password" value="<%=password%>">
<INPUT TYPE="hidden" name="dbtype" value="<%=dbtype%>">
<INPUT TYPE="hidden" name="jndiType" value="<%=jndiType%>">
<INPUT TYPE="hidden" name="jndiName" value="<%=jndiNameTmp%>">
<INPUT TYPE="hidden" name="isQuery" value="">
<table cellpadding=2 cellspacing=0 border=0>
<tr>
<td style="border:0"><%=RF.get("bspother.db_connect_successful") %></td>
<td style="border:0"><A HREF="datamain.jsp"><%=RF.get("bspother.re_conenct_new_db") %></A></td>
</tr>

<tr>
<td style="border:0"><p><%=RF.get("bspother.please_enter_custom_sql") %></p></td>
<td style="border:0"><textarea rows="8" name="sql" cols="89" ><%=sql%></textarea></td>
<td style="border:0">
<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button  onClick="query()"><%=RF.get("bspother.execute_query") %></BUTTON>
<BR>
<BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button  onClick="update()"><%=RF.get("bspother.execute_update") %></BUTTON>
<BR>
<BUTTON class=btn id=btnSave3 accessKey=S name=btnSave3 type=button  onClick="createInsertSql()"><%=RF.get("bspother.generate_insert_sql") %></BUTTON>
<BUTTON class=btn id=btnSave4 accessKey=S name=btnSave3 type=button  onClick="getInsertSqlFile()"><%=RF.get("bspother.generate_sql_file") %></BUTTON>

</tr></table>
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
	if (sql.equals(""))
		return;
	stmt = conn.createStatement();
	if(isQuery.equals("update")){
		message.append(RF.get("bspother.execute_successful")+stmt.executeUpdate(sql));
		return;
		
	}
	
	set = stmt.executeQuery(sql);
	rm = set.getMetaData();
	col_number = rm.getColumnCount();

	if(isQuery.equals("createInsertSql")){//如果是产生插入语句的话
			out.println("<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border:1 solid #5b99c8;\" cellpadding=2 cellspacing=0  id=\"AutoNumber1\" width=\"90%\">");
			String tableName = getTableName(sql);
			//out.println("tableName=" + tableName);
			
			StringBuffer insertInit = new StringBuffer();
			insertInit.append("INSERT INTO " + tableName + " (");
			for (int i = 1; i <= col_number-1; i++) {
				insertInit.append(rm.getColumnName(i) + ", ");
			}
			insertInit.append(rm.getColumnName(col_number) + " ) VALUES ( ");
			int buffer = 1;
			while (set.next()) {
				out.println("<TR>");
				out.println("<Td>");
				
				StringBuffer insertSql = new StringBuffer();
				insertSql.append(insertInit);
				for (int i = 1; i <= col_number - 1; i++) {
					int type = rm.getColumnType(i);
					String col=set.getString(i);
					if(col == null) {
						insertSql.append(null + ", ");
					} else {
    					if (type == Types.BIGINT || type == Types.DECIMAL
    							|| type == Types.DOUBLE || type == Types.FLOAT
    							|| type == Types.INTEGER || type == Types.NUMERIC
    							|| type == Types.SMALLINT) {
    						insertSql.append(col + ", ");
    					} else {
    						insertSql.append("'" + col + "', ");
    					}
					}
				}
				
				/*
				int type = rm.getColumnType(col_number);
				if (type == Types.BIGINT || type == Types.DECIMAL
						|| type == Types.DOUBLE || type == Types.FLOAT
						|| type == Types.INTEGER || type == Types.NUMERIC
						|| type == Types.SMALLINT) {
					insertSql.append(set.getString(col_number) + " );");
				} else {
					insertSql.append("'" + set.getString(col_number) + "' );");
				}
				*/
				
				int type = rm.getColumnType(col_number);
				String col=set.getString(col_number);
				if(col == null) {
					insertSql.append(null + " );");
				} else {
					if (type == Types.BIGINT || type == Types.DECIMAL
							|| type == Types.DOUBLE || type == Types.FLOAT
							|| type == Types.INTEGER || type == Types.NUMERIC
							|| type == Types.SMALLINT) {
						insertSql.append(col + " );");
					} else {
						insertSql.append("'" + col + "' );");
					}
				}
					

				out.println(insertSql);
				out.println("</td></tr>");
				buffer++;
				 if (buffer > 20){
					 buffer=buffer/20;
					 response.flushBuffer();
				 }
			}
	}else{

	col_widths = new int[col_number + 1];
	for (int i = 1; i <= col_number; i++) {
		col_widths[i] = rm.getColumnDisplaySize(i);					
		sum_w += col_widths[i];
	}
	
	out.println("<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border:1 solid #5b99c8;\" cellpadding=2 cellspacing=0  id=\"AutoNumber1\" width="
					+ sum_w + ">");

	out.println("<TR align=\"CENTER\">");
	out.println("<Th width=60>record number</th>");
	for (int i = 1; i <= col_number; i++)
		out.print("<th width=" + col_widths[i]+10 + ">"+ rm.getColumnName(i) + "</th> ");
	out.println("</TR>");
	int buffer=1;
	while (set.next()) {
		out.println("<TR align=\"CENTER\">");
		out.println("<Td width=60>"+buffer+"</td>");
		for (int i = 1; i <= col_number; i++)
			out.print("<td width=" + col_widths[i]+10 + ">"+ set.getString(i) + "</td> ");
		out.println("</TR>");
		buffer++;
		if(buffer>20)
			response.flushBuffer();
	}
	out.println("</table>");
	}
	
} catch (SQLException e2) {
	message.append( "<br>"+RF.get("bspother.is_error") + e2);
	
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

if( !message.toString().equals("") ){
%>
</div>
<p><font color="#FF0000"> <%=message%></font></p>
</body>
</html>
<%
 }
}
%>
