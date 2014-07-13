<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<TITLE>±¸×¢</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="±¸×¢" >

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td><html:hidden name="memoContent" property="memoContent" write="true"/></td>
    </tr>
   
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
