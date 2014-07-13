<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE>窗口模型增加</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<sotower:ui css='date.css'/>">
<script language="javascript" src="<sotower:ui js='calendar.js'/>"></script>
<script language="javascript" src="<sotower:ui js='sotowerfunction.js'/>"></script>
<script language="javascript">
function checkSoaWindow(){
	  var categoryId = document.forms[0].categoryId;
  	  if ( __isQuoteIn(categoryId.value) )
	  {
	    alert("标识不能含有引号或单引号!");
	    categoryId.select();
	    categoryId.focus();
	    return false;
	  }
      if (trim(categoryId.value)=="")
	{
	  alert("请输入标识！");    
	  categoryId.focus();
	  return false;
	}
    categoryId.value = trim(categoryId.value) ;
	  var name = document.forms[0].name;
      if (trim(name.value)=="")
	{
	  alert("请输入窗口名称！");    
	  name.focus();
	  return false;
	}
    name.value = trim(name.value) ;
	  var desc = document.forms[0].desc;
      if (trim(desc.value)=="")
	{
	  alert("请输入描述！");    
	  desc.focus();
	  return false;
	}
    desc.value = trim(desc.value) ;
	  var jspPath = document.forms[0].jspPath;
	  var pageSize = document.forms[0].pageSize;
	  var parent = document.forms[0].parent;
      if (trim(parent.value)=="")
	{
	  alert("请输入所属模块！");    
	  parent.focus();
	  return false;
	}
    parent.value = trim(parent.value) ;
	  var creTime = document.forms[0].creTime;
	return true
}
</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="窗口模型增加" >
<bsp:containbutton action="soawindow.cmd?method=insert" text="保存" onclick="forSave()"></bsp:containbutton>
<html:messages></html:messages>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
					<html:hidden name="categoryId" property="categoryId" write="false" />                   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CATEGORY_NAME")%>：</td>
                    <td class="tdRight"><html:text name="name" property="name" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CATEGORY_DESC")%>：</td>
                    <td class="tdRight"><html:text name="desc" property="desc" size="32" maxlength="255" /></td>
                    </tr>                    
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.JSP_PATH")%>：</td>
                    <td class="tdRight"><html:text name="jspPath" property="jspPath" size="32" maxlength="500" /></td>
                    </tr> 
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.JAVAPACKAGE")%>：</td>
                    <td class="tdRight"><html:text name="javaPackage" property="javaPackage" size="32" maxlength="255" /></td>
                    </tr>                                         
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.PAGE_SIZE")%>：</td>
                    <td class="tdRight"><html:text name="pageSize" property="pageSize" size="32" maxlength="32" /></td>
                    </tr>                    
					<html:hidden name="winTemplate" property="winTemplate" write="false"/>                                      
					<html:hidden name="winWebroot" property="winWebroot" write="false"/>                                      
                    <html:hidden name="parent" property="parent" write="false" />                   
					<tr>
                    <td class="tdTitle"><%=ResourcesFactory.getString("SOA_WINDOW.CRE_TIME")%>：</td>
                    <td>
						<date:date name="creTime" property="creTime" divname="creTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd">
						</date:date>
					</td>
					</tr>
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkSoaWindow()) return;	
  document.forms[0].action ="soawindow.cmd?method=insert";
  document.forms[0].submit();	
}
</script>