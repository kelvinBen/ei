<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkStruVersion(){

    var versionUser=document.forms[0].versionUser;
    var versionNote=document.forms[0].versionNote;
    if(!stringLengthCheck(versionUser,30,"保存人员不能超过30个字符！")){
      versionUser.value="";
      versionUser.select();
      versionUser.focus();
      return false;
   }
   if(!stringLengthCheck(versionNote,255,"备注不能超过255个字符！")){
     versionNote.value="";
     versionNote.select();
     versionNote.focus();
     return false;
   }
 
   return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form action="">
<bsp:container title="组织机构版本修改" >
<bsp:containbutton text="保存" onclick="forSave()" action="struversion.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="struversionquery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION")%>：</td>
                    <td class="tdRight"><html:hidden name="version" property="version" write="true"/></td>
                    </tr>
                    
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_DATE")%>：</td>
                    <td class="tdRight"><html:hidden name="versionDate" property="versionDate" write="true"/></td>
                    </tr>
                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_USER")%>：</td>
                    <td class="tdRight"><html:text name="versionUser" property="versionUser" size="30" maxlength="30"/></td>
                    </tr>
                             
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_NOTE")%>：</td>
                    <td class="tdRight"><html:text name="versionNote" property="versionNote" size="40" maxlength="255"/></td>
                    </tr>
       </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkStruVersion()) return;	
  document.forms[0].action ="struversion.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="struversionquery.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}
</script>