<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkStruVersion(){
var version = document.forms[0].version;
  if (trim(version.value)=="")
  {
    alert("请输入组织结构版本号！");
    version.focus();
    return false;
  }
  version.value = trim(version.value) ;
  if(!__isNum(version.value )){
     alert("组织结构版本号必须是数字！");
     version.value="";
     version.select();
     version.focus();
     return false;
  }
   var versionUser=document.forms[0].versionUser;
   var versionNote=document.forms[0].versionNote;
  
  if(!stringLengthCheck(version,30,"组织结构版本号不能超过30个字符！")){
       version.value="";
       version.select();
       version.focus();
       return false;
  }
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
<bsp:container title="组织机构版本增加" >
<bsp:containbutton text="保存" onclick="forSave()" action="struversion.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="恢复" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="struversionquery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
                    <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION")%>：</td>
                    <td class="tdRight"><html:text name="version" property="version"   /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
                                    
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_USER")%>：</td>
                    <td class="tdRight"><html:text name="versionUser" property="versionUser" size="30" maxlength="30" /></td>
                    </tr>                                                      
                     <tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_VERSION.VERSION_NOTE")%>：</td>
                    <td class="tdRight"><html:text name="versionNote" property="versionNote" size="40" maxlength="255" /></td>
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
  document.forms[0].action ="struversion.cmd?method=insert";
  document.forms[0].submit();	
}
function forSaveContinue(){
  if(!checkStruVersion()) return;
  document.forms[0].action ="struversion.cmd?method=insertContinue";
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