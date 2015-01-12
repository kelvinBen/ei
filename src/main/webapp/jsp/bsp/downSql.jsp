<%@ page import="java.io.*,java.net.*"%>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*"%>
<%@ page import="net.mast.waf.ComponentFactory" %>
<%@ page import="net.mast.waf.RF"%>

<%! 
public String null2String(String s) {
	return s != null ? s : "";
}
//�÷����õ���ǰ��ѯ�ӣѣ̵ı���
public static String getTableName(String sql){
		String tableName=null;
		String SQL2=sql.toUpperCase();

		int from=SQL2.indexOf("FROM")+4;
		int where=SQL2.indexOf("WHERE");
		if(where>-1)
		tableName=sql.substring(from,where);
		else
			tableName=sql.substring(from);

		return tableName;
	}

	public void Flush(ServletOutputStream output , String forout) throws IOException {
		byte[] todown = forout.getBytes();
		output.write(todown);
		output.flush();

	}

%>

<%

		// 2007-01-19 �Ƶ�Ӿ�������ɳ�ʼ���ű�SQL�����ع���

		String dbserver = null2String(request.getParameter("dbserver"));
		String dbname = null2String(request.getParameter("dbname"));
		String username = null2String(request.getParameter("username"));
		String password = null2String(request.getParameter("password"));
		String dbtype = null2String(request.getParameter("dbtype"));
		String jndiType = null2String(request.getParameter("jndiType"));
		String jndiName = null2String(request.getParameter("jndiName"));
		String jndiNameTmp = jndiName;
		String url = "";
		String forname = "";
		StringBuffer message = new StringBuffer();

		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;

		if (dbtype.equals(""))
			dbtype = "dataSource";
		if (dbtype.equals("dataSource")) {
			try {// ȡĬ�ϵ�����Դ����

				DataSource dataSource = (DataSource) ComponentFactory
						.getBean("dataSource");
				conn = dataSource.getConnection();

			} catch (Exception f) {
				message.append(RF.get("bspother.get_default_datasource_error") + f);
			}
		} else if (dbtype.equals("jndi")) {
			if (jndiType.equals("2"))
				jndiName = "java:comp/env/" + jndiName;

			try {
				Context ctx = new InitialContext(); // ����jndi��Ŀ¼
				DataSource ds = (DataSource) ctx.lookup(jndiName);// �õ�demo���ds����
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
				// out.println("<BR>�������ͣ�ֱ�����ӣ�url=" + url);
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
			message.append("<BR>"+RF.get("bspother.db_connect_fail")+"<BR>");

			message.append("<br><A HREF=\"datamain.jsp\">"+RF.get("COMMON.BACK")+"</A>");

			// out.println(message);
			try {
				if (conn != null)
					conn.close();
			} catch (java.sql.SQLException se) {
			}
			conn = null;
			return ;
		}

		String sql = null2String(request.getParameter("sql")).trim();
		// System.out.println("---sql="+sql);
ServletOutputStream output =null;
		try {
			ResultSetMetaData rm = null;
			// ��������������ֶ�����
			int col_number = 0;

			StringBuffer downsql = new StringBuffer();
			String tableName = getTableName(sql);
			String fileName = tableName + ".sql";
			;// �����ļ�����
			request.setCharacterEncoding("GBK");
			// �������ص��ļ��ַ���,�Լ���ǰҳ��Ϊ����ҳ��
			response.setContentType("application/x-download; charset=GBK");
			// ���ñ�ͷ��Ϣ,�������ص��ļ��ı����ļ���ΪfileName
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ new String(fileName.getBytes(), "ISO-8859-1") + "\"");
			// ���ص��������ע����Ҫ��response������ȡ�ã���������ʹ���û��ܹ��õ���Ӧ���ļ�
			output = response.getOutputStream();
			try {
				if (sql.equals(""))
					return ;
				stmt = conn.createStatement();
				set = stmt.executeQuery(sql);
				rm = set.getMetaData();
				col_number = rm.getColumnCount();
				StringBuffer insertInit = new StringBuffer();

				insertInit.append("INSERT INTO " + tableName + "(");
				for (int i = 1; i <= col_number - 1; i++) {
					insertInit.append(rm.getColumnName(i) + ", ");
				}
				insertInit
						.append(rm.getColumnName(col_number) + " ) VALUES ( ");
				while (set.next()) {
					StringBuffer insertSql = new StringBuffer();
					insertSql.append(insertInit);
					for (int i = 1; i <= col_number - 1; i++) {
						int type = rm.getColumnType(i);
						String col = set.getString(i);
						if (col == null) {
							insertSql.append(null + ", ");
						} else {
							if (type == Types.BIGINT || type == Types.DECIMAL
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
							|| type == Types.INTEGER || type == Types.NUMERIC
							|| type == Types.SMALLINT) {
						insertSql.append(set.getString(col_number) + " );\n");
					} else {
						insertSql.append("'" + set.getString(col_number)
								+ "' );\n");
					}
					downsql.append(insertSql);
					if (downsql.length() > 1024) {
						Flush(output,downsql.toString());
						downsql=new StringBuffer();
					}

				}

			} catch (SQLException e2) {
				message.append("<br>"+RF.get("bspother.is_error") + e2);

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
				//	response.setContentType("charset=GBK");
					System.out.println(message);
					return ;
				}
			}

			if(downsql.length()>0)
				Flush(output,downsql.toString());


		} catch (Exception e) {
			throw new RuntimeException(RF.get("bspother.is_error")+ e);
		} finally {
			try {
				if(output!=null)
					output.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

		}

	%>