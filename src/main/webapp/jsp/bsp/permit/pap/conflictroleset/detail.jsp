<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<%
     String refreshId = (String)request.getAttribute("refreshId");
     if(refreshId==null)
        refreshId="";
%>

<HTML>
<HEAD>
<TITLE>�����ݽ�ɫ��ά����ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="�����ݽ�ɫ����ϸ" >
<bsp:containbutton text="�޸�" onclick="forUpdate()" action="conflictRoleSet.cmd?method=forupdate"></bsp:containbutton>
<html:messages></html:messages>
<tab:tab  id="tab1" type="table">
      <tab:card id="card0" text="�����ݽ�ɫ��������Ϣ">
           <table width="100%" cellpadding="0" class="tblContent">
  		         <html:hidden name="setId" property="setId" write="false"/>
                 <tr>
                     <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CONF_ROLESET.SET_NAME")%>��</td>
                     <td class="tdRight"><html:hidden name="setName" property="setName" write="true"/></td>
                 </tr>
                 <tr>
                     <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CONF_ROLESET.CARDINALITY")%>��</td>
                     <td class="tdRight"><html:hidden name="cardinality" property="cardinality" write="true"/></td>
                 </tr>

           </table>
     </tab:card>
     <tab:card id="card1" text="�����ݽ�ɫ" > 	
           <table width="100%" cellpadding="0" class="tblContent" >     
                 <tr>
	                   <td class="tdLeft">���ý�ɫ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ݽ�ɫ��</td>
	             </tr> 
                 <tr>
                    <td>
	                   <list:pageToPage style="width:400"  type="multiImg" name="multi_0" disabled="true">
                           <list:left size="10" name="availableRolesId"  multiple="true" property="availableRolesId" styleTd="align:center;width:40%" style="width:100%">
                                   <html:optionsCollection property="availableRoles" label="roleAlias" value="roleId"/>
                            </list:left>
                            <list:right size="10" name="conflictRolesId" multiple="true"  property="conflictRolesId" styleTd="align:center;width:40%" value="" style="width:100%">  
                                     <html:optionsCollection property="conflictRoles" label="roleAlias" value="roleId"/>
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
function forUpdate()
{
  var setId=document.all("setId").value;
  document.forms[0].action ="conflictRoleSet.cmd?method=forupdate&setId="+setId;
  document.forms[0].submit();	
}
function init()
{
  var refreshId = "<%=refreshId%>";
  getTreeFrame().seltree.refreshNodeById(refreshId);
}
init();
</script>