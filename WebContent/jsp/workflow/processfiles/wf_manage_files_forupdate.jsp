<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>流程定义文件修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkWfManageFiles(){
	var processType = document.forms[0].processType;
      if ( __isQuoteIn(processType.value) )
    {
      alert("流程定义ID不能含有引号或单引号!"); 
      processType.focus();     
      return false;
    }
	if (trim(processType.value)=="")
	{
	  alert("请输入流程定义ID！");   
	  processType.focus(); 
	  return false;
	}
    processType.value = trim(processType.value) ;
      	var fileName = document.forms[0].fileName;
      if ( __isQuoteIn(fileName.value) )
    {
      alert("文件类型不能含有引号或单引号!"); 
      fileName.focus();     
      return false;
    }
	if (trim(fileName.value)=="")
	{
	  alert("请输入文件类型！");   
	  fileName.focus(); 
	  return false;
	}
    fileName.value = trim(fileName.value) ;
      	var fileContent = document.forms[0].fileContent;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px" onKeyDown="ctlent(event);">
<html:form  name="frmList"  action="">
<bsp:container title="流程定义文件修改" >
<bsp:containbutton action="wfmanagefiles.cmd?method=update" text="保存" onclick="forSave()"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()"></bsp:containbutton>
<bsp:containbutton action="wfmanagefilesquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
					<tr>	                   
<!-- 流程定义ID --><td class="tdTitle"><%=ResourcesFactory.getString("WF_MANAGE_FILES.PROCESS_TYPE")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="processType" property="processType" size="35"  onblur="checkId(this);"  maxlength="255" /> </td>
<!-- 文件类型 --><td class="tdTitle"><%=ResourcesFactory.getString("WF_MANAGE_FILES.FILE_NAME")%>：  <span style="color: red">*</span>   	</td>

                    <td class="tdRight"><html:text name="fileName" property="fileName" size="35"  onblur="checkId(this);"  maxlength="255" /> </td>
					</tr>
					<tr>	                   
<!-- 文件内容 --><td class="tdTitle"><%=ResourcesFactory.getString("WF_MANAGE_FILES.FILE_CONTENT")%>： 	</td>

                    <td class="tdRight"><html:text name="fileContent" property="fileContent" size="35"  maxlength="8" /> </td>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkWfManageFiles()) return;	
  document.forms[0].action ="wfmanagefiles.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="wfmanagefilesquery_page_init.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
function ctlent(event) {
	if((event.ctrlKey && event.keyCode == 13) || (event.altKey && event.keyCode == 83)) {
			forSave();
			return;
	}
}
</script>