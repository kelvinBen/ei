<%@ page language="java" isThreadSafe="true"
	contentType="text/html; charset=GBK"%>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*"%>
<%@ page import="java.io.*"%>

<%//jsp�ļ��ϴ�Դ�룬��һ����ļ�Ҳ���������굥���ͻ���ʹ�ã��ɲ������ϴ���С���ٶ�һ�� 
			//���ߣ�sgzyl   2007.10.26 
			request.setCharacterEncoding("GBK");
			response.setContentType("text/html;charset=GB2312");
			char[] hchl = { 13, 10 };
			String contentType= request.getContentType();//contentType���ͱ���Ϊ��multipart/form-data
			out.println("<br>contentType="+contentType);
			if( null == contentType || !contentType.startsWith("multipart/")){
				out.println("<br>the request doesn't contain a multipart/form-data or multipart/mixed stream");
				return ;
			}
			System.out.println("<br>contentType="+contentType);
			String boundary = contentType.substring(30);
			out.println("<br>boundary="+boundary);//�ֽ���
			String field_boundary ="--" + boundary + new String(hchl);
			out.println("<br>field_boundary="+field_boundary);//�ֽ���
			String last_boundary ="--" + boundary +"--" + new String(hchl);
			out.println("<br>last_boundary="+last_boundary);//�ֽ���
			ServletInputStream getdata = request.getInputStream();
			ByteArrayOutputStream temp = new ByteArrayOutputStream();
			byte[] data_line = new byte[8192];//һ������,����Ĭ�ϳ���Ϊ8K
			int line_byte_count = 0;
			boolean found_boundary = false;//�Ƿ�ֽ���
			while ((line_byte_count = getdata.readLine(data_line, 0,
					data_line.length)) != -1) {
				out.println("<br>line_byte_count="+line_byte_count+"��һ�е�����Ϊ�ֽ��ߣ�"+new String(data_line));//һ������ȡ���ַ���
				if (!found_boundary) {
					line_byte_count = getdata.readLine(data_line, 0,
							data_line.length);
					out.println("<br>�Ƿ������ֽ���found_boundary="+found_boundary+"��line_byte_count="+line_byte_count+",data_line.length="+data_line.length);//һ������ȡ���ַ���
				}
				String temp_str = new String(data_line, 0, line_byte_count);
		out.println("<br>һ������ȡ�����ݣ�ת��Ϊ�ַ���temp_str="+temp_str);//һ������ȡ�����ݣ�ת��Ϊ�ַ���
	
				if (temp_str.indexOf("filename") != -1) {
					//if (temp_str.substring(temp_str.indexOf("filename=") + 9,	temp_str.lastIndexOf("\"") + 1).length() > 2) {
				int begin= temp_str.indexOf("filename=") + 9;//�����ַ�<< filename= >>��λ���ټ�9,������Ϊfilename= ������ļ�����λ�ÿ�ʼ
				int end= temp_str.lastIndexOf("\"") + 1;//���������һ�� " �ŵ�λ���ټ�1
				String sub=temp_str.substring(begin,end);//�õ��ϴ����ļ�������·����
		out.println("<br>begin="+begin+",end="+end+",sub="+sub);
	//	out.println("<br>begin-9="+(begin-9)+",end-1="+(end-1)+",sub2="+temp_str.substring(begin-9,end-1));
				if (sub.length() > 2) {//ǿ��У���ļ�·������2��ִ��,���Կ���ȥ��
					//����õ��ļ�����ֻ��Ҫȡ sub ��������һ��\ ���ź�����ַ������ɡ�
					//String file_name = temp_str.substring(temp_str.lastIndexOf("\\") + 1, temp_str.lastIndexOf("\""));//�õ��������ļ���
					String file_name=sub.substring(sub.lastIndexOf('\\')+1,sub.lastIndexOf('\"'));
					//�ٴζ�ȡ2������ ����Ϊ��ȡ�������ļ�������ݣ���2�еĿ��У���Ҫ�Լ��ֶ�����
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
								String line=new String(data_line, 0, line_byte_count);//����ȡ������һ������ת��Ϊ�ַ���							
							
								//if (new String(data_line, 0, line_byte_count).equals(field_boundary)|| new String(data_line, 0, line_byte_count).equals(last_boundary)) 

							//�жϸ���֧�����Ƿ��Ƿֽ���
							if(line.equals(field_boundary)||line.equals(last_boundary))
									{
									myfile.write(temp.toByteArray(), 0, temp
											.toByteArray().length - 2);
									temp.reset();
									myfile.close();
									
									test = false;
									found_boundary = true;
									out.println("<br>�����ֽ���: found_boundary="+found_boundary +",һ������: line="+line);
out.println("<br>"+file_name +"�ϴ��ɹ��� <br>");
								} else {
									out.println("<br>һ������: line="+line);
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
						out.println("<br>"+field_name +"û��ѡ���ϴ��ļ��� <br>");

					}
				} else {
					String field_name = temp_str.substring(temp_str
							.indexOf("name") + 6, temp_str.lastIndexOf("\""));
					//�ٴζ�ȡ1������ ����Ϊ��ȡ�����ķ��ļ���������ǰ����1�еĿ��У���Ҫ�Լ��ֶ�����
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
								out.println("<br>"+field_name +":û�����ݣ� <br>");
							}
							temp.reset();
						} else {
							temp.write(data_line, 0, line_byte_count);//���������������ҳ����
						}
					}
				}

			}
			getdata.close();
		%>
