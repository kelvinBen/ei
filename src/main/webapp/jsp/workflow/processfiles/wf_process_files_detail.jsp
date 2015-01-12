<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>流程文件列表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="流程文件列表明细" >
<bsp:containbutton action="wfprocessfiles.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="wfprocessfilesquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$processId" write="false"/>
	<tr>	                   
<!-- 流程定义ID -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.PROCESS_ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="processId" property="processId" write="true"/></td>
     
<!-- 流程名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="name" property="name" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 类型编号 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="typeId" property="typeId" write="true"/></td>
     
<!-- 类型名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.TYPE_NAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="typeName" property="typeName" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 所属机构 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="organId" property="organId" write="true"/></td>
     
<!-- 所属机构名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ORGAN_NAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="organName" property="organName" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 是否在所有下级机构中使用 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ISALLSUB")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="isallsub" property="isallsub" collection="WFPROCESSFILES_ISALLSUB_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 表单ID -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="formid" property="formid" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 表单名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.FORMNAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="formname" property="formname" write="true"/></td>
     
<!-- 保留域类型 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.RESERVETYPE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="reservetype" property="reservetype" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 作者 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.AUTHPR")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="authpr" property="authpr" write="true"/></td>
     
<!-- 创建时间 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.CREATE_TIME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="createTime" property="createTime" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 是否导入 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.SAVEIMPORT")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="saveimport" property="saveimport" write="true"/></td>
     
<!-- 版本号 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.VERSIONID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="versionid" property="versionid" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 是否模板 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.ISTEMPLET")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="istemplet" property="istemplet" collection="WFPROCESSFILES_ISTEMPLET_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 描述 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.DESCRIPTION")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="description" property="description" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 备注 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE2")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_FILES.NOTE3")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note3" property="note3" write="true"/></td>
     
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="wfprocessfiles.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="wfprocessfilesquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>