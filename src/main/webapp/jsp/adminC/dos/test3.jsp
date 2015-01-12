<%@ page language="java" isThreadSafe="true"
	contentType="text/html; charset=GBK"%>
<%@ page import="javax.naming.*,java.util.*,java.sql.*,javax.sql.*"%>
<%@ page import="java.io.*"%>
<% 
response.setContentType("text/html;charset=UTF-8");
      //  PrintWriter out=response.getWriter();
        final int MAX_SIZE=102400*102400;
        String rootPath;
        DataInputStream in=null;
        FileOutputStream fileOut=null;
        String realPath=request.getRealPath(request.getServerName());
        rootPath=realPath+"\\upload\\";
        String contentType=request.getContentType();
        if(contentType.indexOf("multipart/form-data")>=0){
            in=new DataInputStream(request.getInputStream());
            int formDataLength=request.getContentLength();
            if(formDataLength>MAX_SIZE){
                out.print("文件太大");
                return;
            }else{
                byte[] buffer=new byte[formDataLength];
                int byteRead=0;
                int totalBytesRead=0;
                while(totalBytesRead<formDataLength){
                    byteRead=in.read(buffer,totalBytesRead,formDataLength);
                    totalBytesRead+=byteRead;
                }
                String file=new String(buffer);
  out.print("<br>file="+file);
	                String saveFile=file.substring(file.indexOf("filename=\"")+10);
	                out.print("<br>saveFile="+saveFile);
	                saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
	                saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
	                out.print("<br>saveFile="+saveFile);
	                String fileName=rootPath+saveFile;
	                fileName="C://temp/test.sql";                int pos=0;
                pos=file.indexOf("filename=\"");
                pos=file.indexOf("\n",pos)+1;
                pos=file.indexOf("\n",pos)+1;
                pos=file.indexOf("\n",pos)+1;

                int startPos=file.substring(0,pos).getBytes().length;
                File checkfile=new File(fileName);
                if(checkfile.exists()){
                    out.print("文件已存在");
                    return;
                }
                File dirFile=new File(rootPath);
                if(!dirFile.exists()){
                    dirFile.mkdirs();
                }
                out.print(fileName);
                fileOut=new FileOutputStream(fileName);
                fileOut.write(buffer,startPos,(buffer.length-startPos));
                fileOut.close();
                in.close();
                out.print("上传成功");
            }
            in.close();
        }else{
            out.print("类型错误");
        }
        out.close();
%>