<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%
String app=request.getContextPath();
%>
<HTML>
<HEAD><TITLE>��֯�ṹ���� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
  

<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="��֯�ṹ����" height="200">
<widgets:containbutton name="save1" onclick="doSave();" text="����"></widgets:containbutton> 
<table>
<tr>
	<td class="tdTitle"><font color="red">��ѡ��Ҫ�������֯�ṹ�ļ�:</font></td>
	<td class="tdRight"><html:file name="uploadFile" value="" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"/></td>
</tr>
  		       <tr >
                <td class="tdTitle">���뵽�Ļ���������Ϊ</td>
                <td class="tdRight"><html:hidden name="struId" property="struId" write="true"/> </td>
                </tr>
     <tr>
      <td class="tdTitle">���뵽�Ļ�������:</td>
      <td class="tdRight"><html:hidden name="organName" property="organName" write="true"/></td>
    </tr>  
    <tr>
      <td class="tdTitle">Ĭ�ϵĵ�������Ĺ����ص㣺</td>
      <td class="tdRight">
				<html:select name="workplaceId" property="workplaceId" >
	            	<html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_ID"/>
	        	</html:select>
</td>
    </tr> 
     <tr>
       <td class="tdTitle">Ĭ�ϵ���Ļ�������Ϊ:</td>
       <td class="tdRight">
       <html:select name="organType" value="" >
       		<html:option value="">-��ѡ��-</html:option>
	            <html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
	        </html:select></td>
      </tr>  

     <tr>
       <td class="tdTitle">���뷽ʽ:</td>
       <td class="tdRight">
       <html:select name="isgenId" value="" >
       		<html:option value="">-��ѡ��-</html:option>
       		<html:option value="0">��ģ�嵼�룺���ؼ򵥵�ģ����д���ݽ��е���,ֻ�ܵ���һ������</html:option>
       		<html:option value="1">�༶���룺�༶����ģ������ݵ���</html:option>
       		<html:option value="2">Ǩ�Ƶ��룺�������ļ��Ǵ�ƽ̨������ϵͳ�е��������ļ�</html:option>
	   </html:select></td>
      </tr>  
      
      <tr>
       <td class="tdTitle">����ģ������:</td>
       <td class="tdRight">
<a href="#" style="color: blue" onClick="downloadAtt('templetfordown/orgimportmore.xls')">���أ��༶���ӵ�ģ��</a>&nbsp;&nbsp;&nbsp;

<br/><a href="#" style="color: blue" onClick="downloadAtt('templetfordown/orgimport.xls')">���أ��򵥵�ģ��(ֻ�ܵ���һ������)</a>&nbsp;&nbsp;&nbsp;

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
		alert("��ѡ��Ҫ�������֯�ṹ�ļ���");
		return;
	}
	if(files.value.lastIndexOf(".xls")==-1){
		alert("��ѡ���ļ���ʽΪ*.xls��Excel�ļ�");
		return; 
	} 
	var organType=document.forms[0].organType;
 	if(organType.value==""){
		alert("��ѡ��Ĭ�ϵ���֯���ͣ�");
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
	document.forms[0].action="stru.cmd?method=importStru";
	document.forms[0].save1.disabled="disabled";
	document.forms[0].submit();
}

//���ظ���
function downloadAtt(url){
 url="<%=app%>/"+url;
window.open(url);
}


</script>


