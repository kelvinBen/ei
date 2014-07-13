<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.context.*"%>

<%@ page import="org.ld.soa.util.*"%>
<%!
	public String null2String(String s) {
		return s != null ? s : "";
	}

%>

<%//2006-07-21  添加上产生插入ＳＱＬ的功能
			//2007-01-19 黄道泳加入生成初始化脚本SQL的下载功能
			//2007-09-06  加入能够执行多条SQL的功能，并且能够自动判断注释
			//2007-11-13 加入执行单个SQL脚本文件的功能
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
%>
<HTML>
<HEAD><TITLE></TITLE>
<META http-equiv="Content-Type" content="text/html;charset=gb2312">
</HEAD>

<frameset>
<frameset cols="300,*" framespacing="0" border="1" frameborder="0" >
		<frame id="Left"  name="Left"  src="LeftLoad.jsp"  />
		<frameset rows="288,*" framespacing="1" name="right">
			<frame  id="forsql" 
					name="forsql" 
					src="forsql.jsp" 
					scrolling="no" />
			<frame  id="toresult" 
					name="toresult"  
					src="result.jsp" 
					scrolling="auto" />
		</frameset>
	</frameset>
	
  <noframes>
  <body>

  <p>此网页使用了框架，但您的浏览器不支持框架。</p>

  </body>
  </noframes>
</frameset>
</HTML>