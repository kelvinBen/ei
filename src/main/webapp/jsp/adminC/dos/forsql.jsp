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

<%//2008-09-21 �����ӣѣ̵��������

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
			out.println("�������ݿ�.......");
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
<title>����SQLִ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
</head>
<SCRIPT language="javascript">
function check(){
var sql=document.form1.sql.value;
	if(sql==""){
		alert("��������Ҫִ�е�SQL���");
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
		alert("��ѡ����Ҫִ��SQL�ļ����ļ�����.sql��β������SQL����� ; �Ž�β�� -- ���ű�ʾһ��ע�͡�");
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
				out.println(",���ݿ�����Ϊ:"+dbName+"<BR>");
					}

%>
<div align="center" style="font-size: 16px;">����SQLִ��(�򻯰�����ʣ�loadsql.jsp)</div>
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

<INPUT TYPE="hidden" name="isQuery" value=""> <div style="font-size: 16px;">��ѡ����Ҫִ�е�SQL�ű��ļ���<INPUT TYPE="file" 	NAME="uploadFile">
<INPUT NAME="excuteFilebt" TYPE="button" VALUE="ִ��SQL�ļ�" onClick="excuteFile()">
���Ʋ�ѯ��ʾ�����������<input type="text" name="maxRows" value="<%=maxRows%>" title="0��ʾû������" size="5"/>
</div>
<hr>
<table cellpadding=2 cellspacing=0 border=0>
	<tr  border=0>
		
		<td colspan="2" style="border:0"><A HREF="datamain.jsp">�������ݿ�����</A>&nbsp;&nbsp;ÿ��SQL���ʹ��";"�Ž�����"--"���ű�ʾע��ĳһ��</td>
	</tr>
	<tr>
		<td style="border:0">
		<p>����SQL��䣺</p>
		</td>
		<td style="border:0"><textarea rows="8" name="sql" cols="89"><%=sql%></textarea></td>
		<td style="border:0">
		<BUTTON class=btn id=btnSave2 accessKey=R��name=btnSave2 type=button
			onClick="query()">ִ�в�ѯ(Alt+R)</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave2 accessKey=U name=btnSave2 type=button
			onClick="update()">ִ�и���(Alt+U)</BUTTON>
		<BR>
		<BUTTON class=btn id=btnSave3 name=btnSave3 type=button
			onClick="createInsertSql()">���ɳ�ʼ��SQL</BUTTON>
		<BUTTON class=btn id=btnSave4 name=btnSave3 type=button
			onClick="getInsertSqlFile()">����SQL�ļ�</BUTTON>
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
