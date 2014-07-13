<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%
	String refreshId =(String) request.getAttribute("refreshId");
String app=request.getContextPath();
%>
<HTML>
<HEAD><TITLE>用户导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">  
<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="用户导入" height="200">
<widgets:containbutton onclick="doSave();" text="导入"></widgets:containbutton> 
<table>
<tr>
	<td class="tdTitle"><font color="red">请选择要导入的用户文件:</font></td>
	<td class="tdRight"><html:file name="uploadFile" value="" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"/></td>
</tr>
	<tr >
      <td class="tdTitle">导入到的机构的内码为</td>
      <td class="tdRight"><html:hidden name="struId" property="struId" write="true"/> </td>
     </tr>
     <tr>
      <td class="tdTitle">导入到的机构名称:</td>
      <td class="tdRight"><html:hidden name="organAlias" property="organAlias" write="true"/></td>
    </tr>  
 
     <tr>
       <td class="tdTitle">是否将帐户对应员工导入到机构树中:</td>
       <td class="tdRight">
       <html:select name="organType" value="" >
       		<html:option value="0">-否-</html:option>
			<html:option value="1">-是-</html:option>
	        </html:select></td>
      </tr>  

     <tr>
       <td class="tdTitle">导入方式:</td>
       <td class="tdRight">
       <html:select name="isgenId" value="" >
       		<html:option value="">-请选择-</html:option>
       		<html:option value="0">简单模板导入：下载简单的模板填写数据进行导入</html:option>
      <!--  <html:option value="2">迁移导入：待导入文件是从平台的其他系统中导出的来文件</html:option> -->
	   </html:select></td>
      </tr>  
      
      <tr>
       <td class="tdTitle">导入模板下载:</td>
       <td class="tdRight">

 <a href="#" style="color: blue" onClick="downloadAtt('templetfordown/userimport.xls')">下载：简单的导入模板</a>&nbsp;&nbsp;&nbsp;

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
		alert("请选择要导入的用户文件！");
		return;
	}
	if(files.value.lastIndexOf(".xls")==-1){
		alert("请选择文件格式为*.xml的文件");
		return; 
	} 
	var isgenId=document.forms[0].isgenId;
 	if(isgenId.value==""){
		alert("请选择导入方式！");
		return;
	}
	
	if(!window.confirm("请确认你导入的数据和与所选中的导入方式的模板一致,否则会导致数据导入失败!\n数据导入之前建议备份系统!")){
		return ;
	}
	
	document.forms[0].action="user.cmd?method=importUser&refreshId="+"<%=refreshId%>"; 
	document.forms[0].submit();
}

//下载附件
function downloadAtt(url){
 url="<%=app%>/"+url;
window.open(url);
}


</script>
