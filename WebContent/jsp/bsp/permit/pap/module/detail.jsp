<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.permit.pap.view.ModuleView"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
   String refreshId = (String)request.getAttribute("refreshId");
   ModuleView moduleView = (ModuleView)request.getAttribute("html.data");
   String isLeaf= moduleView.getIsLeaf();
   String isLeafName = "";
   if(isLeaf.equals("1"))
     isLeafName = "是";
   else
     isLeafName = "否";
%>

<HTML>
<HEAD>
<TITLE>模块明细</TITLE>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action=""> 
<html:hidden name="primaryKey" value=""/>
<bsp:container title="模块明细" >
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  			<tr>
                    <td class="tdTitle">模块ID：</td>
                    <td class="tdRight"><html:hidden name="moduleId" property="moduleId" write="true" /></td>
                    </tr>           
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>               
					<tr>
                    <td class="tdTitle">模块名称：</td>
                    <td class="tdRight"><html:hidden name="moduleName" property="moduleName" write="true" /></td>
                    </tr>    
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                     
					<tr>
                    <td class="tdTitle">上级模块名称：</td>
                    <td class="tdRight"><html:hidden name="parentModuleName" property="parentModuleName" write="true" /></td>
                    </tr>    
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr> 
                    
                    <html:hidden name="isLeaf" property="isLeaf" />
                                      
					<tr>
                    <td class="tdTitle">是否末级模块：</td>
                    <td class="tdRight"><%=isLeafName%></td>
                    </tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language=javascript>
function init(){
  var refreshId = "<%=refreshId%>"; 
  getTreeFrame().seltree.refreshNodeById(refreshId);
}
init();
</script>
