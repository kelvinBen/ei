<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*,java.io.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.context.*"%>
<%@ page import="org.ld.soa.util.*"%>
<%! 
public String null2String(String s) {
	return s != null ? s : "";
}
//该方法得到当前查询ＳＱＬ的表名
public static String getTableName(String sql){
		System.out.println(sql);
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
//得到能够执行的SQL,其中每条SQL语句以 ; 分割, -- 表示注释
public static List getExcuteSqlList(String sql){
	String sqls[]=sql.split("\n");
	List excuteSqlList=new ArrayList();
	StringBuffer s=null;
	for(int i=0;i<sqls.length;i++){
		//System.out.println(sqls[i]);
		String s1=sqls[i].trim();
		if(s==null)
			 s=new StringBuffer();
		if(s1.startsWith("--"))
			continue;
		else{
			s.append(s1).append(' ');
			if(s1.endsWith(";")){
				//如果遇到; 那么就执行该条SQL语句
				int x=s.lastIndexOf(";");
				String excuteSql=s.substring(0,x);
				excuteSqlList.add(excuteSql);
				s=null;
			}
				
		}
	}
	return excuteSqlList;
}
%>
<%//2006-07-21 黄道泳 添加上产生插入ＳＱＬ的功能
			//2007-01-19 黄道泳加入生成初始化脚本SQL的下载功能
			//2007-09-06 huangdos 加入能够执行多条SQL的功能，并且能够自动判断注释
			//2007-11-13 huangdos 加入执行单个SQL脚本文件的功能
			request.setCharacterEncoding("GBK");
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
			System.out.println("<BR>连接数据库.......");
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
				System.out.println("<BR>数据库连接失败！<BR>");
				message.append("<br><A HREF=\"datamain.jsp\">返回</A>");
				System.out.println(message);
				System.out.println(para.get("message"));
				try {
					if (conn != null)
						conn.close();
				} catch (java.sql.SQLException se) {
				}
				conn = null;
				return;
			}
		//	out.println(para.get("message"));
List excuteSqlList=null;
		System.out.println("---sql="+sql);
		if ("".equals(sql))
				return;
		excuteSqlList = DBUtil.getExcuteSqlList(sql);
		if (excuteSqlList.size() > 0) {
			sql = (String) excuteSqlList.get(0);
		}		
		String tableName = getTableName(sql);
		String fileName = tableName + ".sql";
		ServletOutputStream output =null;
		try {
			ResultSetMetaData rm = null;
			// 结果集的列数（字段数）
			int col_number = 0;

			StringBuffer downsql = new StringBuffer();

			// 下载文件名称

			// 定义下载的文件字符集,以及当前页面为下载页面
			response.setContentType("application/x-download; charset=GBK");
			// 设置报头信息,定义下载的文件的保存文件名为fileName
			response.setHeader("Content-Disposition", "attachment; filename=\""
					+ new String(fileName.getBytes(), "ISO-8859-1") + "\"");
			// 下载的输出流，注意需要从response对象中取得，这样才能使得用户能够得到对应的文件
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
				message.append("<br>出错了 : " + e2);

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
			throw new RuntimeException("下载出错！" + e);
		} finally {
			try {
				if(output!=null)
					output.close();
			} catch (Exception e1) {
				e1.printStackTrace();
			}

		}

	%>