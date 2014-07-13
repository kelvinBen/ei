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

<%//2008-09-21 ����ִ��SQL��ʾ���ҳ��

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
			maxRows=0;
			e1.printStackTrace();
		}
			String jndiNameTmp=jndiName;

			Connection conn = null;
			Statement stmt = null;
			ResultSet set = null;
			//out.println("<BR>�������ݿ�.......");
			response.flushBuffer();
			try {
				conn = DBUtil.getDBConnection(dbtype, para);
			} catch (SQLException e) {
				e.printStackTrace();
				message.append("<br>�������ݿ����!:" + e);
				//return ;
			}catch (Exception e) {
				//System.out.println("<br>�������ݿ����!:" + e);
				e.printStackTrace();
				message.append("<br>�������ݿ����!:" + e);
				//return ;
			}
			if (!message.toString().equals("")) {
				out.println("<BR>���ݿ�����ʧ�ܣ�<BR>");
				message.append("<br><A HREF=\"datamain.jsp\">����</A>");
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
			//out.println(para.get("message"));

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
<title>SQLִ�н��</title>
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
		document.form1.action="result.jsp";		
	//	document.form1.submit();
		//alert(document.form1.sql.value);
}

function update(){
if(!check())
	return;
var isQuery=document.form1.isQuery;	
		isQuery.value="update";
		document.form1.action="result.jsp";	
//		alert(document.form1.isQuery.value);	
//		document.form1.submit();
}

function createInsertSql(){
if(!check())
	return;
var isQuery=document.form1.isQuery;		
		isQuery.value="createInsertSql";
		document.form1.action="result.jsp";		
		document.form1.maxRows.value=0;
	
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
document.form1.action="result.jsp";
document.form1.submit();
}

</script>
<body topmargin="10px" bgcolor="#eff7ff">

<form action="result.jsp" enctype="multipart/form-data" name=form1
	method=post><INPUT TYPE="hidden" name="dbserver" value="<%=dbserver%>">
<INPUT TYPE="hidden" name="dbname" value="<%=dbname%>"> 
<INPUT	TYPE="hidden" name="username" value="<%=username%>"> 
<INPUT 	TYPE="hidden" name="password" value="<%=password%>"> 
<INPUT 	TYPE="hidden" name="dbtype" value="<%=dbtype%>"> 
<INPUT TYPE="hidden" name="jndiType" value="<%=jndiType%>"> 
<INPUT TYPE="hidden" name="jndiName" value="<%=jndiNameTmp%>"> 
<INPUT TYPE="hidden" name="dataSource" value="<%=dataSource%>"> 
<INPUT TYPE="hidden" name="isQuery" value=""> 

<table cellpadding=2 cellspacing=0 border=0 style="display:none;">
	<tr>
		<td style="border:0">�������ݿ�ɹ�</td>
		<td style="border:0"><A HREF="datamain.jsp">�������ݿ�����</A>&nbsp;&nbsp;ÿ��SQL���ʹ��";"�Ž�����"--"���ű�ʾע��ĳһ��</td>
	</tr>

	<tr>
		<td style="border:0">
		<p>����SQL��䣺<input type="text" name="maxRows" value="<%=maxRows%>" title="0��ʾû������" size="5"/></p>
		</td>
		<td style="border:0"><textarea rows="8" name="sql" cols="89"></textarea></td>
		<td style="border:0">
		<BUTTON class=btn id=btnSave2 accessKey=R name=btnSave2 type=button
			onClick="query()" title="��ݼ���Alt+R">ִ�в�ѯ(Alt+R)</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave3 accessKey=U name=btnSave3 type=button
			onClick="update()"�� title="��ݼ���Alt+U">ִ�и���(Alt+U)</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave4 name=btnSave4 type=button
			onClick="createInsertSql()">����SQL</BUTTON>
		<BUTTON class=btn id=btnSave5 name=btnSave5 type=button
			onClick="getInsertSqlFile()">����SQL�ļ�</BUTTON>
	</tr>
</table>
</form>

<div align="center">ִ�н����
<%
			ResultSetMetaData rm = null;
			// ��������������ֶ�����
			int col_number = 0;
			// ÿһ�еĿ��
			int[] col_widths = null;
			// �ܿ��
			int sum_w = 0;
			try {
				List excuteSqlList=null;
				if (isQuery.equals("excutefile")) {
					sql=(String)para.get("uploadFile");
				//	System.out.println("excute===="+sql);
					excuteSqlList = DBUtil.getExcuteSqlList(sql);
					if (excuteSqlList.size() == 0)
						message.append("<br>����Ч�ĸ������SQL��Ҫִ��! sql=" + sql);
					stmt = conn.createStatement();
					for (int i = 0; i < excuteSqlList.size(); i++) {
						String excuteSql = (String) excuteSqlList.get(i);
						message.append("<br>ִ�� [<font color=\"#6633FF\">"
								+ excuteSql + "</font>]");
						message.append("�ɹ�! Ӱ���¼����Ϊ:"
								+ stmt.executeUpdate(excuteSql));
					}
					return;
				}
				
				if ("".equals(sql))
					return;
				excuteSqlList = DBUtil.getExcuteSqlList(sql);							
				
				stmt = conn.createStatement();
				if (isQuery.equals("update")) {
					if (excuteSqlList.size() == 0)
						message.append("<br>����Ч�ĸ������SQL��Ҫִ��! sql=" + sql);
					for (int i = 0; i < excuteSqlList.size(); i++) {
						String excuteSql = (String) excuteSqlList.get(i);
						message.append("<br>ִ�� [<font color=\"#6633FF\">"
								+ excuteSql + "</font>]");
						message.append("�ɹ�! Ӱ���¼����Ϊ:"
								+ stmt.executeUpdate(excuteSql));
					}
					return;
				}

				


				if (excuteSqlList.size() > 0) {
					sql = (String) excuteSqlList.get(0);
				}
				out.println("ִ��[" + sql + "]");
				//int maxRows=50;
				stmt.setMaxRows(maxRows);//Ĭ���������50��
				set = stmt.executeQuery(sql);

				rm = set.getMetaData();
				col_number = rm.getColumnCount();

				if (isQuery.equals("createInsertSql")) {//����ǲ����������Ļ�
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
						for (int i = 1; i <= col_number -1; i++) {//���һ��i��ǰ����ֶ����ظ�,���Բ�ʹ��
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
					out.println("<Th width=60>��¼��</th>");
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
				message.append("<br>������ : " + e2);

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
