<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
        
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="组织结构规则明细" >
<bsp:containbutton text="修改" onclick="forUpdate()" action="strurule.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="strurulequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
   <html:hidden name="ruleId" property="ruleId" write="false"/>
     <tr>
      <td class="tdTitle">组织机构类型代码：</td>
      <td class="tdRight"><html:hidden name="struType" property="struType" write="true"/></td>
    </tr>
     <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.STRU_TYPE")%>：</td>
      <td class="tdRight"><html:hidden name="struTypeName" property="struTypeName" write="true"/></td>
    </tr>   
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.SRC_REF")%>：</td>
      <td class="tdRight"><html:hidden name="srcRef" property="srcRef" write="true"/></td>
    </tr>   
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.SRC_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="srcName" property="srcName" write="true"/></td>
    </tr>    
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.TARGET_REF")%>：</td>
      <td class="tdRight"><html:hidden name="targetRef" property="targetRef" write="true"/></td>
    </tr>  
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.TARGET_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="targetName" property="targetName" write="true"/></td>
    </tr>  
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.RULE_NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="ruleNote" property="ruleNote" write="true"/></td>
    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("ruleId").value;
  document.forms[0].action ="strurule.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  self.location.href ="strurulequery.cmd?clear=true";	
}
</script>