<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>委员附表明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="委员附表明细" >
<bsp:containbutton action="proposaluser.cmd?method=forupdate" text="修改" onclick="forUpdate()"></bsp:containbutton>
<bsp:containbutton action="proposaluserquery_page_init.cmd" text="返回" onclick="forReturn()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
  		<html:hidden name="pk" property="$id" write="false"/><html:hidden name="id" property="id"/>
	<tr>	                   
<!-- 主键 -->
<!-- 系统登录号 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.USERID")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="userid" property="userid" write="true"/></td>
 <!-- 委员编号 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.NO")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="no" property="no" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 姓名 -->
       <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.NAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="name" property="name" write="true"/></td>
 
<!-- 界别名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.CONSTITUENCY")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="constituency" property="constituency" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 界别code -->
    
<!-- 第一党派 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.FIRSTPARTY")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="firstparty" property="firstparty" write="true"/></td>
     
<!-- 第一党派code -->
<!-- 第二党派 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.SECONDPARTY")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="secondparty" property="secondparty" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 办公电话 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.PHONE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="phone" property="phone" write="true"/></td>
     
<!-- 手机 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.MOBILE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="mobile" property="mobile" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 工作单位 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.DEPT")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="dept" property="dept" write="true"/></td>
     
<!-- 通讯地址 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.ADDRESS")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="address" property="address" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 邮编 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.ZIPCODE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="zipcode" property="zipcode" write="true"/></td>
     
<!-- EMAIL -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.EMAIL")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="email" property="email" write="true"/></td>
     
		</tr>
	<tr>	                   
<!-- 届别名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.SESSIONTYPE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="sessiontype" property="sessiontype" write="true"/></td>
     
<!-- 职务 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.DUTY")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="duty" property="duty" write="true"/></td>

		</tr>
	<tr>	                   
<!-- 行政区划名称 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.USERAREANAME")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="userareaname" property="userareaname" write="true"/></td>
     
<!-- 备注 -->
    
      <td class="tdTitle" width="15%"><%=ResourcesFactory.getString("PROPOSAL_USER.NOTE")%>：</td>
      <td class="tdRight" width="35%"><html:hidden name="note" property="note" write="true"/></td>
     
		</tr>

  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("pk").value;
  document.forms[0].action ="proposaluser.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="proposaluserquery_page_init.cmd";
  document.forms[0].submit();	
}
</script>