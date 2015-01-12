
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
    if(refresh_id==null || refresh_id.equals("")){
    flag=false;
    }
	
%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui css='bsp.js'/>"></script>
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="组织结构明细" >
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="struId" property="struId" write="false"/>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>：</td>
      <td class="tdRight"><html:hidden name="organCode" property="organCode" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="organName" property="organName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.SHORT_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="shortName" property="shortName" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.ORGAN_ALIAS")%>：</td>
      <td class="tdRight"><html:hidden name="organAlias" property="organAlias" write="true"/></td>
    </tr> 
    
    
    
     <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.TYPE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="organTypeName" property="organTypeName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.PARENT_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="parentName" property="parentName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.PRINCIPAL_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="principalName" property="principalName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.CORPORATION_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="corporationName" property="corporationName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.COUNTRY_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="countryName" property="countryName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.CANT_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="cantName" property="cantName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.WORKPLACE_NAME")%>：</td>
      <td class="tdRight"><html:hidden name="workplaceName" property="workplaceName" write="true"/></td>
    </tr> 
         <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.BEGIN_DATE")%>：</td>
      <td class="tdRight"><html:hidden name="beginDate" property="beginDate" write="true"/></td>
    </tr> 
             <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU.END_DATE")%>：</td>
      <td class="tdRight"><html:hidden name="endDate" property="endDate" write="true"/></td>
    </tr> 
    
    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">

function forInsert(){

  document.forms[0].action ="stru.cmd?method=forinsert&primaryKey="+document.all("struId").value;  
  document.forms[0].submit();	
}

function forSelect(){

 var url ="stru.cmd?method=getAddMemberRoot&primaryKey="+document.all("struId").value;       
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  window.location.href =win[0];
 }
}

function forMergeTo(){
 var url ="stru.cmd?method=getMergeRoot&primaryKey="+document.all("struId").value;       
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
 
  if (win == null) {  
  	return;
  }else{
  window.location.href =win[0];
 }
}

function forUpdate(){
  document.forms[0].action ="stru.cmd?method=forupdate&primaryKey="+document.all("struId").value;    
  document.forms[0].submit();	
}

function forDelete(){
if (!confirm("真的要删除选中的纪录吗？此操作不能恢复！")) {
 return false;
 }  
  document.forms[0].action ="stru.cmd?method=delete&primaryKey="+document.all("struId").value;    
  document.forms[0].submit();	
}
function forOrder(){
var url ="stru.cmd?method=getChangeOrderRoot&primaryKey="+document.all("struId").value;          
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null) {  
  	return;
  }else{
  window.location.href =win[0];
 }
}

function init(){
<%

if(flag){
%>
        var parent_id = "<%=refresh_id%>";
        getTreeFrame().seltree.refreshNodeById(parent_id);        
	<%
	}
	%>
}
init();
</script>