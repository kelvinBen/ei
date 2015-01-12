<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%> 
<%
String app=request.getContextPath();
%>
<HTML>
<HEAD><TITLE>组织结构导入 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>"> 
  

<BODY topmargin="10px">
<html:form method="POST" enctype="multipart/form-data" action="">
<widgets:container title="组织结构导入" height="200">
<widgets:containbutton name="save1" onclick="doSave();" text="导入"></widgets:containbutton> 
<table>
<tr>
	<td class="tdTitle"><font color="red">请选择要导入的组织结构文件:</font></td>
	<td class="tdRight"><html:file name="uploadFile" value="" onkeydown="return false;" style="ime-mode isabled"  oncontextmenu="return false;"/></td>
</tr>
  		       <tr >
                <td class="tdTitle">导入到的机构的内码为</td>
                <td class="tdRight"><html:hidden name="struId" property="struId" write="true"/> </td>
                </tr>
     <tr>
      <td class="tdTitle">导入到的机构名称:</td>
      <td class="tdRight"><html:hidden name="organName" property="organName" write="true"/></td>
    </tr>  
    <tr>
      <td class="tdTitle">默认的导入机构的工作地点：</td>
      <td class="tdRight">
				<html:select name="workplaceId" property="workplaceId" >
	            	<html:options collection="workplaceCollection" labelProperty="WORKPLACE_NAME" property="WORKPLACE_ID"/>
	        	</html:select>
</td>
    </tr> 
     <tr>
       <td class="tdTitle">默认导入的机构类型为:</td>
       <td class="tdRight">
       <html:select name="organType" value="" >
       		<html:option value="">-请选择-</html:option>
	            <html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
	        </html:select></td>
      </tr>  

     <tr>
       <td class="tdTitle">导入方式:</td>
       <td class="tdRight">
       <html:select name="isgenId" value="" >
       		<html:option value="">-请选择-</html:option>
       		<html:option value="0">简单模板导入：下载简单的模板填写数据进行导入,只能导入一层数据</html:option>
       		<html:option value="1">多级导入：多级复杂模板的数据导入</html:option>
       		<html:option value="2">迁移导入：待导入文件是从平台的其他系统中导出的来文件</html:option>
	   </html:select></td>
      </tr>  
      
      <tr>
       <td class="tdTitle">导入模板下载:</td>
       <td class="tdRight">
<a href="#" style="color: blue" onClick="downloadAtt('templetfordown/orgimportmore.xls')">下载：多级复杂的模板</a>&nbsp;&nbsp;&nbsp;

<br/><a href="#" style="color: blue" onClick="downloadAtt('templetfordown/orgimport.xls')">下载：简单的模板(只能导入一级数据)</a>&nbsp;&nbsp;&nbsp;

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
		alert("请选择要导入的组织结构文件！");
		return;
	}
	if(files.value.lastIndexOf(".xls")==-1){
		alert("请选择文件格式为*.xls的Excel文件");
		return; 
	} 
	var organType=document.forms[0].organType;
 	if(organType.value==""){
		alert("请选择默认的组织类型！");
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
	document.forms[0].action="stru.cmd?method=importStru";
	document.forms[0].save1.disabled="disabled";
	document.forms[0].submit();
}

//下载附件
function downloadAtt(url){
 url="<%=app%>/"+url;
window.open(url);
}


</script>


