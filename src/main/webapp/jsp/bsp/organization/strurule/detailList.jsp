<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ page import="java.util.*" %>
<%
	List organTypeList =(List) request.getAttribute("organTypeList");
%>           
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script> 
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="组织结构规则明细" >
<bsp:containbutton text="返回" onclick="forReturn()" action="strurulequery.cmd"></bsp:containbutton>

<tab:tab  id="tab1" type="table">
<tab:card id="card0" text=" 一般信息  ">
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
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_RULE.RULE_NOTE")%>：</td>
      <td class="tdRight"><html:hidden name="ruleNote" property="ruleNote" write="true"/></td>
    </tr>
  </table>

</tab:card>


<tab:card id="card1" text="下级类型">

  <table width="100%" cellpadding="0" class="tblContent" >  
	<tr>
		<td class="tdLeft">允许引用的类型名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;引用的类型名称：</td>
	</tr> 
	<tr>
		<td> 
		 	<list:pageToPage style="width:400"  type="multiImg" name="multi_0" disabled="true">
				<list:left size="10" name="targetRefId"  multiple="true" property="targetRef" styleTd="align:center;width:40%" style="width:100%">
					 <html:options collection="organTypeAllCollection" labelProperty="typeName" property="typeId"/>
				</list:left>
				<list:right size="10" name="targetRef" multiple="true" styleTd="align:center;width:40%" value="" style="width:100%">	
					 <html:options collection="organTypeList" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/> 
				</list:right>
			</list:pageToPage>
		</td>
	</tr>               
 </table>
 
</tab:card>
</tab:tab>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">

function forReturn(){
  self.location.href ="strurulequery.cmd?clear=true";	
}
</script>