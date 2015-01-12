<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.bsp.permit.context.BspInfo"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='tab.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request, "inching.js")%>"></script>
<script language="javascript">
function checkSsCategory(){
    var blacklistName = document.forms[0].blacklistName;
    if (trim(frmList.blacklistName.value)=="")
    {
      alert("黑名单名称不能为空！");
      blacklistName.select();
      blacklistName.focus();
      return false;
    }
     var blacklistEmail = document.forms[0].blacklistEmail;
    if (trim(frmList.blacklistEmail.value)=="")
    {
      alert("黑名单地址不能为空！");
      blacklistEmail.select();
      blacklistEmail.focus();
      return false;
    }
    
  var blacklistName = document.forms[0].blacklistName;
  if ( __isQuoteIn(blacklistName.value) )
  {
    alert("黑名单名称不能带有特殊符号！");
    blacklistName.select();
    blacklistName.focus();
    return false;
  }
  var blacklistEmail = document.forms[0].blacklistEmail;
  if ( !__checkEmail(blacklistEmail.value) )
  {
    alert("黑名单地址格式错误，请输入正确的E-MAIL地址！");
    blacklistEmail.select();
    blacklistEmail.focus();
    return false;
  }
      return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<span id="message"><html:messages/></span>
<bsp:container title="新建黑名单" >
	<bsp:containbutton onclick="forSave()" name="btn_insert" text="保存" ></bsp:containbutton>
	<bsp:containbutton onclick="forReturn()" name="btn_delete" text="返回" ></bsp:containbutton>

<div align="center">

  <table width="100%" cellpadding="0" cellspacing="0" class="tblContent" border="0">                  
                     <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_BLACKLIST.BLACKLIST_NAME")%>：</td>
                    <td class="tdRight"><html:text name="blacklistName" property="blacklistName" size="30" maxlength="30" /><span id="blacklistName_span" class="xinghaoCss">*</span></td>
                    </tr>                    
                     <tr>
                    <td class="TdLeft"><%=ResourcesFactory.getString("MAIL_BLACKLIST.BLACKLIST_EMAIL")%>：</td>
                    <td class="tdRight"><html:text name="blacklistEmail" property="blacklistEmail" size="30" maxlength="30" /><span id="blacklistEmail_span" class="xinghaoCss">*</span></td>
                    </tr>                                       
   </table>

</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkSsCategory()) return;	
  document.forms[0].action ="mailblacklist.cmd?method=insert";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mailblacklistquery.cmd";
  document.forms[0].submit();	
}
</script>