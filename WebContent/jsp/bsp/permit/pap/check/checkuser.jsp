<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>

<HTML> 
<HEAD>
<TITLE>初始化数据检查</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>


</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="初始化数据检查" >

<div align="center">
	<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    <br>
    业务规则
    <br>
    <br>
	１)系统一个集团级公用帐号<br>
	２)每个法人一个公司级公用帐号<br>
	３)任何用户自动代理集团级公用用户和公司级公用用户<br>
	４)集团级公用用户和公司级公用用户不能代理其他用户<br>
	５)人力资源组织结构中,法人所属法人为其自身，法人所有下属非法人单位的所属法人为其自身。<br>
	６)用户帐号的所属法人与所属部门、所属员工的所属法人必须一致。<br>
	７)用户数据权限中参考类型为机构时，组织结构关系码和组织结构类型不能为空。<br>
	８)菜单的所有父节点PARENT_ID必须存在(根节点除外)!<br>
    <br>
    <br>
    &nbsp;
	</td></tr>
   <tr>
   <td class="tdTitle">内置的系统检查：</td>
    <td class="tdTitle">&nbsp;</td>
   </tr>
  <tr> 
   <td align="right">
  <html:button name="button" onclick="checkCPubUser()" value="  公用用户冗余检查  "></html:button>
  </td>
  <td align="Left">
  <html:button name="button" onclick="checkUserPer()" value="    用户代理检查   "></html:button>
</td>
</tr>
   <tr>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr> 
   <tr> 
   <td align="right">
  <html:button name="button" onclick="checkCorporation()" value="  组织所属法人检查  "></html:button>
  </td>
  <td align="Left">                                  
  <html:button name="button" onclick="checkUserStru()" value="  用户所属组织检查 "></html:button>
</td>
</tr>
<tr>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr> 
   <tr> 
   <td align="right">
  <html:button name="button" onclick="checkUsrDataRef()" value="  用户数据权限检查  "></html:button>
  </td>
  <td align="Left">                                  
    <html:button name="button" onclick="checkMenuParent()" value="    菜单节点检查   "></html:button>
  </td>
</tr>

  </table>
</div>
<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    &nbsp;
	</td></tr>
	  </table>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">

//公司公用用户冗余检查
function checkCPubUser(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkCPubUser";
  document.forms[0].submit();
}

//用户代理检查
function checkUserPer(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkUserPer";
  document.forms[0].submit();
}

//组织所属法人检查
function checkCorporation(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkCorporation";
  document.forms[0].submit();
}

//用户所属组织检查
function checkUserStru(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkUserStru";
  document.forms[0].submit();
}

//用户数据权限检查
function checkUsrDataRef(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkUsrDataRef";
  document.forms[0].submit();
}
//菜单节点检查
function checkMenuParent(){  
  document.forms[0].action ="checkuserCmd.cmd?method=checkMenuParent";
  document.forms[0].submit();
}
</script>