<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="net.mast.waf.ComponentFactory" %>
<%@ page import="net.mast.waf.RF"%>
<HTML>
<HEAD>

<%//黄道泳 2006-2-9 创建 huangdy@langchao.com
			//黄道泳 2006-03-15 修改   处理weblogic下面不兼容的情况
%>

</head>
<BODY>



<%!public static String excuteFile(File file, String linepara, Statement stmt) {
		if (!file.isFile())
			return RF.get("bspother.new_url_a_file") + file;
		BufferedReader is=null;
		StringBuffer message = new StringBuffer();
		message.append("<BR>"+RF.get("bspother.read_file") + file);
		try {
			is = new BufferedReader(new InputStreamReader(new FileInputStream(
					file)));
			String readline = "";
			StringBuffer sqlstr = new StringBuffer();
			int i = 0;
			while ((readline = is.readLine()) != null) {
				readline = readline.trim();

				if (readline.startsWith("--")
						|| readline.equalsIgnoreCase("COMMIT;"))
					continue;
				sqlstr.append(" " + readline);
				if (readline.endsWith(linepara)) {
					try {
						//去掉结尾标志符
						sqlstr.append(linepara);
						//sqlstr =new StringBuffer(sqlstr.toString().replaceAll(linepara+linepara,""));
						//stmt.executeUpdate(sqlstr.toString());// 执行SQL
						stmt.executeUpdate(sqlstr.toString().replaceAll(
								linepara + linepara, ""));// 执行SQL						
						i++;
						//message.append("<br><font color=green>执行SQL成功：" + sqlstr + "</font><br>");
					} catch (SQLException e) {
						message.append("<br><font color=red>"+RF.get("bspother.execute_sql_error")
								+ sqlstr.toString().replaceAll(
										linepara + linepara, "")
								+ "</font><br>"+RF.get("bspother.error_exception_info") + e);

					}
					sqlstr = new StringBuffer();

				}

			}
			is.close();
			is=null;
			message.append("<BR><font color=blue>"+RF.get("bspother.over_execute_success_sql") + i
					+RF.get("bspother.record")+"</font>");
		} catch (FileNotFoundException e) {
			message.append("<br><font color=red>文件" + file + RF.get("bspother.not_found") + e);
			e.printStackTrace();
		} catch (IOException e) {
			message.append("<br><font color=red>"+RF.get("bspother.read_file") + file + RF.get("bspother.is_error") + e);
			e.printStackTrace();
		} finally {
			if (is != null)
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			is = null;
		}
		
		return message.toString();
	};

	%>

<%!public List findFile(File dir) {
		//out.println("<br>查看文件路径：" + dir + "下面的文件");
		if (dir == null || !dir.isDirectory())
			return new ArrayList();
		File files[] = queue(dir.listFiles());
		List list = new ArrayList();
		for (int i = 0; i < files.length; i++) {
			if (files[i].isFile())
				list.add(files[i]);
		}
		return list;
	}

	public List findDirectoy(File dir) {
		//out.println("<br>查看文件路径：" + dir + "下面的文件夹");
		if (dir == null || !dir.isDirectory())
			return new ArrayList();
		File files[] = queue(dir.listFiles());
		List list = new ArrayList();
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory())
				list.add(files[i]);
		}
		return list;
	}

	public List findAllFile(File dir) {
		if (dir == null || !dir.isDirectory())
			return new ArrayList();
		List filelist = new ArrayList();
		filelist.addAll(findFile(dir));
		List directorylist = findDirectoy(dir);

		for (int i = 0; i < directorylist.size(); i++)
			filelist.addAll(findAllFile((File) directorylist.get(i)));

		return filelist;
	}

	public String null2String(String s) {
		return s != null ? s : "";
	}

	public static File[] queue(File fileList[]) {
		for (int i = 0; i < fileList.length; i++) {
			for (int j = i + 1; j < fileList.length; j++) {
				if (fileList[i].compareTo(fileList[j]) > 0) {
					File tmpfileList = fileList[i];
					fileList[i] = fileList[j];
					fileList[j] = tmpfileList;
				}
			}
		}
		return fileList;
	}
	
	%>
<%
			response.setHeader("cache-control", "no-cache");
			response.setHeader("pragma", "no-cache");

			String dbserver = null2String(request.getParameter("dbserver"));
			String dbname = null2String(request.getParameter("dbname"));
			String username = null2String(request.getParameter("username"));
			String password = null2String(request.getParameter("password"));
			String dbtype = null2String(request.getParameter("dbtype"));
			String jndiType = null2String(request.getParameter("jndiType"));
			String jndiName = null2String(request.getParameter("jndiName"));

			%>

<%		String url = "";
		String forname = "";
		StringBuffer message = new StringBuffer();
		String path = getServletConfig().getServletContext().getRealPath("/sql");
		String linepara = ";";
		String sqlfile = "";

		Connection conn = null;
		Statement stmt = null;
		ResultSet set = null;
		out.println("<BR>"+RF.get("bspother.conect_db")+".......<BR>");
		response.flushBuffer();
		if (dbtype.equals(""))
			dbtype = "dataSource";
		if (dbtype.equals("dataSource")) {
				try {// 取默认的数据源对象
					out.println("<BR>"+RF.get("bspother.use_config_connect_db"));
					DataSource dataSource = (DataSource) ComponentFactory.getBean("dataSource");
					conn=dataSource.getConnection();
					
				} catch (Exception f) {
					message.append(RF.get("bspother.get_default_datasource_error")+ f);
				}
			}
		else if (dbtype.equals("jndi")) {
				if (jndiType.equals("2"))
					jndiName = "java:comp/env/" + jndiName;
				out.println("<BR>"+RF.get("bspother.connect_type_jndi")+"jndiName=" + jndiName);
				try {
					Context ctx = new InitialContext(); // 访问jndi根目录
					DataSource ds = (DataSource) ctx.lookup(jndiName);// 拿到demo这个ds对象
					conn = ds.getConnection();
					//path="";
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
					Driver driver = (Driver) Class.forName(forname)
							.newInstance();
					DriverManager.registerDriver(driver);
					Properties props = new Properties();
					props.put("user", username);
					props.put("password", password);
					props.put("CHARSET", "ISO");
					conn = DriverManager.getConnection(url, props);
				} catch (InstantiationException e) {
					message.append("<BR>"+RF.get("bspother.db_driver_error") + e);
					e.printStackTrace();
					//throw new RuntimeException("可能原因：数据库驱动程序不正确", e);
				} catch (IllegalAccessException e) {
					//out.println("<BR>出错了：" + e);
					message.append("<BR>"+RF.get("bspother.is_error") + e);
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					//out.println("<BR>出错了：" + e);
					message.append("<BR>"+RF.get("bspother.is_error") + e);
					e.printStackTrace();
				} catch (SQLException e) {
					//out.println("<BR>出错了：" + e);
					message.append("<BR>"+RF.get("bspother.is_error") + e);
					e.printStackTrace();
				}

			}
			if (!message.toString().equals("")) {
				out.println("<BR>"+RF.get("bspother.db_connect_fail")+"<BR>");
				message.append("<BR><A HREF=\"../../\">"+RF.get("bspother.enter_os")+"</A>");
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
							
			String dbName = null;
			try {
				if (conn != null) {
					DatabaseMetaData dbmd = conn.getMetaData();
					if (dbmd != null) {
						dbName = dbmd.getDatabaseProductName();
						out.println("<br>"+RF.get("SYS.DATABASETYPE")+":"+dbName);
						if (dbName != null && dbName.startsWith("DB2/")) {
							path = getServletConfig().getServletContext().getRealPath("/sql/DB2");//DB2 数据库名称： DB2/NT 
						} else if (dbName != null && dbName.startsWith("Adaptive")) {
							path = getServletConfig().getServletContext().getRealPath("/sql/Sybase");//Sybase 数据库名称：  
						} else if (dbName != null && dbName.startsWith("Microsoft")) {
							path = getServletConfig().getServletContext().getRealPath("/sql/SqlServer");//SQL Server 数据库名称：Microsoft SQL Server
						}else if(dbName != null && dbName.startsWith("Oracle")){
							path =  getServletConfig().getServletContext().getRealPath("/sql/Oracle");//Oracle 数据库名称：Oracle
						}
						}
						
					}
					
				}catch (SQLException e1) {
					e1.printStackTrace();
				}
			
			out.println("<BR>"+RF.get("bspother.db_connect_successful")+"<BR>");
			out.println("<BR>"+RF.get("bspother.start_read_init_file")+"<BR>");
			File dir=null;
			String fileList[]=null;

						
			try {
				try{
					dir = new File(path);
					fileList = dir.list();
					if(fileList==null){
						dir = new File(getServletConfig().getServletContext().getRealPath("/sql"));
						fileList = dir.list();						
						}
					}catch(Exception e){
						out.println("<BR>"+RF.get("bspother.is_error") + e);
						e.printStackTrace();				
					}
				if(fileList==null){
					out.println("<BR>"+RF.get("bspother.error_not_found_folder")+path);
					out.println("<BR><A HREF=\"../../\">"+RF.get("bspother.enter_os")+"</A>");
					out.println("<br><A HREF=\"datamain.jsp\">"+RF.get("COMMON.BACK")+"</A>");
					return;	
				}
				out.println("<br>"+RF.get("bspother.start_execute_sql"));
				stmt = conn.createStatement();
			
				List filelist = findAllFile(dir);
			
				for (int i = 0; i < filelist.size(); i++) {
					try {
					File sqlFile = (File) filelist.get(i);
					
					if (sqlFile.toString().endsWith(".sql")) {					
						out.println(excuteFile(sqlFile, linepara,stmt));
					}
					} catch (Exception e) {
					e.printStackTrace();
				}
				}
				
			} catch (SQLException e) {
				out.println("<BR>"+RF.get("bspother.is_error") + e);
				e.printStackTrace();
			} catch (Exception e) {
				out.println("<BR>"+RF.get("bspother.is_error") + e);
				e.printStackTrace();
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
			}
			
			
			%>
<%//=message%>
<br>
<br>
<%=RF.get("bspother.init_over") %>
<br>
<A HREF="../../"><%=RF.get("bspother.enter_os" )%></A>
<BR>
<A HREF="datamain.jsp"><%=RF.get("COMMON.BACK") %></A>

</BODY>
</HTML>
