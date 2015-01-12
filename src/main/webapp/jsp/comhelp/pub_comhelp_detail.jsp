<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>通用选择明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="通用选择明细" >
<bsp:containbutton action="pubcomhelp.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="pubcomhelpquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$helpId" write="false"/>
	<tr>	                   
<!-- 帮助编号 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="helpId" property="helpId" write="true"/></td>
     
<!-- 帮助标题 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TITLE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="helpTitle" property="helpTitle" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 显示选择的SQL -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_SQL")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="helpSql" property="helpSql" write="true"/></td>
     
<!-- 唯一标示字段 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.ID_FIELD")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="idField" property="idField" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 名称字段 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NAME_FIELD")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="nameField" property="nameField" write="true"/></td>
     
<!-- 显示字段 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_FIELD")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="showField" property="showField" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 返回字段 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.RETURN_FIELD")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="returnField" property="returnField" write="true"/></td>
     
<!-- 查询条件字段 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.SHEARCH_FIELD")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="shearchField" property="shearchField" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 帮助字段显示名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.SHOW_NAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="showName" property="showName" write="true"/></td>
     
<!-- 排序用的表名 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_TABLE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="helpTable" property="helpTable" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 说明 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.HELP_NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="helpNote" property="helpNote" write="true"/></td>
     
<!-- 数据源 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.DATASOURCE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="datasource" property="datasource" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 备注 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
<!-- NOTE2 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE2")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- NOTE3 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PUB_COMHELP.NOTE3")%>：</td>
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
  document.forms[0].action ="pubcomhelp.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="pubcomhelpquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>