<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>流程类型明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="流程类型明细" >
<bsp:containbutton action="wfprocesstype.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="wfprocesstypequery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$typeId" write="false"/>
	<tr>	                   
<!-- 类型编号 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.TYPE_ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="typeId" property="typeId" write="true"/></td>
     
<!-- 类型名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="name" property="name" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 所属机构 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_ID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="organId" property="organId" write="true"/></td>
     
<!-- 所属机构名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.ORGAN_NAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="organName" property="organName" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 是否在所有下级机构中使用 -->
  	
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.ISALLSUB")%>：</td>
      <td class="tdRight" width="35%">
      	<html:label name="isallsub" property="isallsub" collection="WFPROCESSTYPE_ISALLSUB_COLLECTION" labelProperty="value" labelKey="key" />
      </td>
     
<!-- 显示顺序 
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.SORTNUM")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="sortnum" property="sortnum" write="true"/></td>
    
		</tr>
	<tr>	     -->               
<!-- 描述 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.DESCRIPTION")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="description" property="description" write="true"/></td>
     
<!-- 备注 
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
    --> 
		</tr>
	<tr>	                   
<!-- NOTE2 
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NOTE2")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note2" property="note2" write="true"/></td>
    --> 
<!-- NOTE3 
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("WF_PROCESS_TYPE.NOTE3")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note3" property="note3" write="true"/></td>
  -->  
		</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="processtype.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
if(window.opener){
	window.close();
}else{
	
  document.forms[0].action ="processtypequery.cmd";
  document.forms[0].submit();	
  }
}
</script>