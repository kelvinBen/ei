<%@ page language="java" isThreadSafe="true"
	contentType="text/html; charset=GBK"%>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*"%>
<%@ page import="java.io.*"%>

<%//jsp文件上传源码，单一或多文件也可与其他标单类型混杂使用，可不限制上传大小，速度一流 
			//作者：sgzyl   2007.10.26 
			request.setCharacterEncoding("GBK");
			response.setContentType("text/html;charset=GB2312");
			char[] hchl = { 13, 10 };
			String contentType= request.getContentType();//contentType类型必须为：multipart/form-data
			out.println("<br>contentType="+contentType);
			if( null == contentType || !contentType.startsWith("multipart/")){
				out.println("<br>the request doesn't contain a multipart/form-data or multipart/mixed stream");
				return ;
			}
			System.out.println("<br>contentType="+contentType);
			String boundary = contentType.substring(30);
			out.println("<br>boundary="+boundary);//分界线
			String field_boundary ="--" + boundary + new String(hchl);
			out.println("<br>field_boundary="+field_boundary);//分界线
			String last_boundary ="--" + boundary +"--" + new String(hchl);
			out.println("<br>last_boundary="+last_boundary);//分界线
			ServletInputStream getdata = request.getInputStream();
			ByteArrayOutputStream temp = new ByteArrayOutputStream();
			byte[] data_line = new byte[8192];//一行数据,设置默认长度为8K
			int line_byte_count = 0;
			boolean found_boundary = false;//是否分界线
			while ((line_byte_count = getdata.readLine(data_line, 0,
					data_line.length)) != -1) {
				out.println("<br>line_byte_count="+line_byte_count+"第一行的数据为分界线："+new String(data_line));//一行所读取的字符数
				if (!found_boundary) {
					line_byte_count = getdata.readLine(data_line, 0,
							data_line.length);
					out.println("<br>是否遇到分界线found_boundary="+found_boundary+"，line_byte_count="+line_byte_count+",data_line.length="+data_line.length);//一行所读取的字符数
				}
				String temp_str = new String(data_line, 0, line_byte_count);
		out.println("<br>一行所读取的数据，转换为字符串temp_str="+temp_str);//一行所读取的数据，转换为字符串
	
				if (temp_str.indexOf("filename") != -1) {
					//if (temp_str.substring(temp_str.indexOf("filename=") + 9,	temp_str.lastIndexOf("\"") + 1).length() > 2) {
				int begin= temp_str.indexOf("filename=") + 9;//遇到字符<< filename= >>的位置再加9,则正好为filename= 后面的文件名的位置开始
				int end= temp_str.lastIndexOf("\"") + 1;//遇到的最后一个 " 号的位置再加1
				String sub=temp_str.substring(begin,end);//得到上传的文件的完整路径名
		out.println("<br>begin="+begin+",end="+end+",sub="+sub);
	//	out.println("<br>begin-9="+(begin-9)+",end-1="+(end-1)+",sub2="+temp_str.substring(begin-9,end-1));
				if (sub.length() > 2) {//强制校验文件路径大于2才执行,可以考虑去掉
					//下面得到文件名，只需要取 sub 里面的最后一个\ 符号后面的字符串即可。
					//String file_name = temp_str.substring(temp_str.lastIndexOf("\\") + 1, temp_str.lastIndexOf("\""));//得到参数：文件名
					String file_name=sub.substring(sub.lastIndexOf('\\')+1,sub.lastIndexOf('\"'));
					//再次读取2行数据 ，因为读取上来的文件类的数据，有2行的空行，需要自己手动过掉
						line_byte_count = getdata.readLine(data_line, 0,
								data_line.length);
						line_byte_count = getdata.readLine(data_line, 0,
								data_line.length);
						FileOutputStream myfile = new FileOutputStream("C://temp/"
								+ file_name, false);
						boolean test = true;
						while (test) {
							line_byte_count = getdata.readLine(data_line, 0,
									data_line.length);
							if (line_byte_count == -1) {
								test = false;
								break;
							}
							if (temp.size() == 0) {
								temp.write(data_line, 0, line_byte_count);
							} else {
								String line=new String(data_line, 0, line_byte_count);//将读取出来的一行数据转换为字符串							
							
								//if (new String(data_line, 0, line_byte_count).equals(field_boundary)|| new String(data_line, 0, line_byte_count).equals(last_boundary)) 

							//判断该行支付串是否是分界线
							if(line.equals(field_boundary)||line.equals(last_boundary))
									{
									myfile.write(temp.toByteArray(), 0, temp
											.toByteArray().length - 2);
									temp.reset();
									myfile.close();
									
									test = false;
									found_boundary = true;
									out.println("<br>遇到分界线: found_boundary="+found_boundary +",一行数据: line="+line);
out.println("<br>"+file_name +"上传成功了 <br>");
								} else {
									out.println("<br>一行数据: line="+line);
									temp.writeTo(myfile);
									temp.reset();
									temp.write(data_line, 0, line_byte_count);
								}
							}
						}
					} else {
						String field_name = temp_str.substring(temp_str
								.indexOf("name") + 6, temp_str
								.lastIndexOf(";") - 1);
						line_byte_count = getdata.readLine(data_line, 0,
								data_line.length);
						line_byte_count = getdata.readLine(data_line, 0,
								data_line.length);
						line_byte_count = getdata.readLine(data_line, 0,
								data_line.length);
						line_byte_count = getdata.readLine(data_line, 0,
								data_line.length);
						found_boundary = true;
						out.println("<br>"+field_name +"没有选择上传文件！ <br>");

					}
				} else {
					String field_name = temp_str.substring(temp_str
							.indexOf("name") + 6, temp_str.lastIndexOf("\""));
					//再次读取1行数据 ，因为读取上来的非文件的数据流前面有1行的空行，需要自己手动过掉
					line_byte_count = getdata.readLine(data_line, 0,
							data_line.length);
					temp.reset();
					boolean test = true;
					while (test) {
						line_byte_count = getdata.readLine(data_line, 0,
								data_line.length);
						if (line_byte_count == -1) {
							test = false;
							break;
						}
						if (new String(data_line, 0, line_byte_count)
								.equals(field_boundary)
								|| new String(data_line, 0, line_byte_count)
										.equals(last_boundary)) {
							test = false;
							found_boundary = true;
							if (temp.size() > 2) {
								out.println("<br>"+field_name +"="
										+ new String(temp.toByteArray())
										+" <br>");
							} else {
								out.println("<br>"+field_name +":没有内容！ <br>");
							}
							temp.reset();
						} else {
							temp.write(data_line, 0, line_byte_count);//将该行数据输出到页面上
						}
					}
				}

			}
			getdata.close();
		%>
