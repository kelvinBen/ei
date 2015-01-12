<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>

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
<TITLE>员工扩展示例表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="员工扩展示例表明细" >
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text=" 基本信息  ">
    <jsp:include page="../../../organization/org/base_detail_info.jsp" flush="true" />
</tab:card>
<tab:card id="card1" text=" 扩展信息  " >
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle">联系电话：</td>
      <td class="tdRight"><html:hidden name="tel" property="tel" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">网络地址：</td>
      <td class="tdRight"><html:hidden name="www" property="www" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">电子邮件：</td>
      <td class="tdRight"><html:hidden name="email" property="email" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">MSN：</td>
      <td class="tdRight"><html:hidden name="msn" property="msn" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">QQ：</td>
      <td class="tdRight"><html:hidden name="qq" property="qq" write="true"/></td>
    </tr>
  </table>
</tab:card>
</tab:tab> 
</bsp:container>
</html:form>
</BODY>
</HTML>

