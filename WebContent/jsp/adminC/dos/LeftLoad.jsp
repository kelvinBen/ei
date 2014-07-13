<%@ page language="java" isThreadSafe="true"
	contentType="text/html; charset=GBK"%>
<%@ page
	import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.context.*"%>

<%@ page import="org.ld.soa.util.*"%>
<%!
	public String null2String(String s) {
		return s != null ? s : "";
	}

%>

<%//2008-08-21 创建左边数据列表信息

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
			String jndiNameTmp=jndiName;

			Connection conn = null;
			Statement stmt = null;
			ResultSet set = null;
			//out.println("<BR>连接数据库.......");
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
function getTableDetail(id){
	var obj=document.all(id);
//alert(obj.innerText);
	obj.style.display="block";
}



</script>
<body topmargin="10px" bgcolor="#eff7ff">
<form action="loadsql.jsp" enctype="multipart/form-data" name=form1
	method=post><INPUT TYPE="hidden" name="dbserver" value="<%=dbserver%>">
<INPUT TYPE="hidden" name="dbname" value="<%=dbname%>"> <INPUT
	TYPE="hidden" name="username" value="<%=username%>"> <INPUT
	TYPE="hidden" name="password" value="<%=password%>"> <INPUT
	TYPE="hidden" name="dbtype" value="<%=dbtype%>"> <INPUT TYPE="hidden"
	name="jndiType" value="<%=jndiType%>"> <INPUT TYPE="hidden"
	name="jndiName" value="<%=jndiNameTmp%>"> <INPUT TYPE="hidden"
	name="dataSource" value="<%=dataSource%>"> 

<table>



<%
try{
			DatabaseMetaData dbmd = conn.getMetaData();
			if (dbmd != null) {
				String dbName = dbmd.getDatabaseProductName();
				out.println("数据库类型为:"+dbName+"<BR>");
					}
			String types2[] = { "TABLE", "VIEW", "SYSTEM TABLE",
					"GLOBAL TEMPORARY", "ALIAS"};
			List types=DBUtil.changeResultSetToList(dbmd.getTableTypes());	

			for(int i = 1; i < types.size(); i++) {
				out.println("<tr><td>");
				Map m=(Map)types.get(i);
				String type[] = new String[1];
				type[0] = (String)m.get("TABLE_TYPE");
				out.print("<div onclick=\"getTableDetail('"+type[0]+"')\">"+type[0]+"</div>");
				List tablelist=DBUtil.getTablesFromDB(conn,null,type);
				out.print("<div id='"+type[0]+"' style='display:none' ><ol TYPE='1' >");
				for(int j=0;j<tablelist.size();j++){
				out.println("<li STYLE='padding:1px;margin:1px'  ><IMG src='book.gif' border=0/>"+tablelist.get(j)+"</li>");
				}
				out.print("</ol>");
				out.println("</div></tr></td>");
				response.flushBuffer();
			}
			}
			 finally {
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
			 }

%> 
</table>

</form>
<hr>
<div align="center"></div>

</body>
</html>

