
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<%
    String refresh_id=(String)request.getAttribute("REFRESHID");
    String isLeaf = (String)request.getAttribute("is_leaf");
    boolean flag=true;
    String root = (String)request.getAttribute("root");
    if(refresh_id==null || refresh_id.equals("")){
    flag=false;
    }
	
%>

<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="struId" property="struId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>£∫</td>
      <td class="tdRight"><html:hidden name="organCode" property="organCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="organName" property="organName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.SHORT_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="shortName" property="shortName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_ALIAS")%>£∫</td>
      <td class="tdRight"><html:hidden name="organAlias" property="organAlias" write="true"/></td>
    </tr> 
    
    
    
     <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.TYPE_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="organTypeName" property="organTypeName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.PARENT_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="parentName" property="parentName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.PRINCIPAL_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="principalName" property="principalName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.CORPORATION_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="corporationName" property="corporationName" write="true"/></td>
    </tr> 
    
    <tr>
    <td class="tdTitle">À˘ Ù≤ø√≈£∫</td>
    <td class="tdRight"><html:hidden name="departmentName" property="departmentName" write="true"/></td>
    </tr>
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.COUNTRY_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="countryName" property="countryName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.CANT_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="cantName" property="cantName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.WORKPLACE_NAME")%>£∫</td>
      <td class="tdRight"><html:hidden name="workplaceName" property="workplaceName" write="true"/></td>
    </tr> 
<!--          <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.BEGIN_DATE")%>£∫</td>
      <td class="tdRight"><html:hidden name="beginDate" property="beginDate" write="true"/></td>
    </tr> 
             <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.END_DATE")%>£∫</td>
      <td class="tdRight"><html:hidden name="endDate" property="endDate" write="true"/></td>
    </tr> 
  -->  
    
  </table>
  
  <script language="javascript">
function init(){
var root="<%=root%>";
var flag=<%=flag%>;
if(root=="1"){
getTreeFrame().location.href="";
getMainFrame().location.href = "jsp/content.jsp";
}
else 
 if(flag){
        var parent_id = "<%=refresh_id%>";
        getTreeFrame().seltree.refreshNodeById(parent_id);        
}
}
init();
</script>