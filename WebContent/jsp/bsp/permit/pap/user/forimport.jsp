<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%
	String refreshId =(String) request.getAttribute("refreshId");
String app=request.getContextPath();
%>
<HTML>
<HEAD><TITLE>�û����� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">  
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="�û�����" height="200">
<widgets:containbutton onclick="doSave();" text="����"></widgets:containbutton> 
<table>
<tr>
	<td class="tdTitle"><font color="red">��ѡ��Ҫ������û��ļ�:</font></td>
	<td class="tdRight"><html:file name="uploadFile" value="" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"/></td>
</tr>
	<tr >
      <td class="tdTitle">���뵽�Ļ���������Ϊ</td>
      <td class="tdRight"><html:hidden name="struId" property="struId" write="true"/> </td>
     </tr>
     <tr>
      <td class="tdTitle">���뵽�Ļ�������:</td>
      <td class="tdRight"><html:hidden name="organAlias" property="organAlias" write="true"/></td>
    </tr>  
 
     <tr>
       <td class="tdTitle">�Ƿ��ʻ���ӦԱ�����뵽��������:</td>
       <td class="tdRight">
       <html:select name="organType" value="" >
       		<html:option value="0">-��-</html:option>
			<html:option value="1">-��-</html:option>
	        </html:select></td>
      </tr>  

     <tr>
       <td class="tdTitle">���뷽ʽ:</td>
       <td class="tdRight">
       <html:select name="isgenId" value="" >
       		<html:option value="">-��ѡ��-</html:option>
       		<html:option value="0">��ģ�嵼�룺���ؼ򵥵�ģ����д���ݽ��е���</html:option>
      <!--  <html:option value="2">Ǩ�Ƶ��룺�������ļ��Ǵ�ƽ̨������ϵͳ�е��������ļ�</html:option> -->
	   </html:select></td>
      </tr>  
      
      <tr>
       <td class="tdTitle">����ģ������:</td>
       <td class="tdRight">

 <a href="#" style="color: blue" onClick="downloadAtt('templetfordown/userimport.xls')">���أ��򵥵ĵ���ģ��</a>&nbsp;&nbsp;&nbsp;

       </td>
      </tr>  

</table>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function doSave(){
	var files=document.forms[0].uploadFile;
 
	if(files.value==""){
		alert("��ѡ��Ҫ������û��ļ���");
		return;
	}
	if(files.value.lastIndexOf(".xls")==-1){
		alert("��ѡ���ļ���ʽΪ*.xml���ļ�");
		return; 
	} 
	var isgenId=document.forms[0].isgenId;
 	if(isgenId.value==""){
		alert("��ѡ���뷽ʽ��");
		return;
	}
	
	if(!window.confirm("��ȷ���㵼������ݺ�����ѡ�еĵ��뷽ʽ��ģ��һ��,����ᵼ�����ݵ���ʧ��!\n���ݵ���֮ǰ���鱸��ϵͳ!")){
		return ;
	}
	
	document.forms[0].action="user.cmd?method=importUser&refreshId="+"<%=refreshId%>"; 
	document.forms[0].submit();
}

//���ظ���
function downloadAtt(url){
 url="<%=app%>/"+url;
window.open(url);
}


</script>
