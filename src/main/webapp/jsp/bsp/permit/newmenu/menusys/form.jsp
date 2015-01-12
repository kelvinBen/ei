<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<% 
String parentMenuAlias = (String)request.getAttribute("parentMenuAlias");
if(parentMenuAlias==null){
	parentMenuAlias="";
	}
%>
<div align="center" style="border:1 solid #999999;">
    <table  cellpadding="0" >
     	<html:hidden name="menuSysId" property="menuSysId" />
     	<html:hidden name="menuId" property="menuId"/>
     	<html:hidden name="parentId" property="parentId"/>
     	<html:hidden name="seq" property="seq"/>
    
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYS.MENU_ALIAS")%>：</td>
      <td><html:text name="menuAlias" property="menuAlias" /><font color="red">*</font></td>
    </tr>     
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYS.PARENT_MENU_ID")%>：</td>
      <td><html:hidden name="parentMenuAlias" value="<%=parentMenuAlias%>" write="true"/></td>
    </tr>    
  
    <tr style="display: none;">
      <td align="right">类型：</td>
      <td>
      <html:select name="type" property="type">
      	<html:option value="0">普通</html:option>
      	<html:option value="1">功能</html:option>
      	<html:option value="2">窗口</html:option>
      	<html:option value="3">报表</html:option>
      </html:select>
      </td>
    </tr>  
  	
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TITLE")%>：</td>
      <td><html:text name="title" property="title" /></td>
    </tr>

    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.VALUE")%>：</td>
      <td><html:text name="value" property="value" /></td>
    </tr>

    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TARGET")%>：</td>
      <td><html:text name="target" property="target" /></td>
    </tr>
    
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.OPTIONS")%>：</td>
      <td><html:text name="options" property="options" /></td>
    </tr>
    
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.TEXT")%>：</td>
      <td><html:text name="text" property="text" /></td>
    </tr>      
    
    <tr>      
	  <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.FUNCTION_ID")%>：</td>
	  <td> 
      	<html:text name="functionId" property="functionId" readonly="readonly"/>
	    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectFunctionId()">
	  </td> 
    </tr>
    <tr style="display: none;">
	  <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.APP_ID")%>：</td>
	  <td> 
      	<html:hidden name="appId" property="appId"/>
      	<html:text name="appName" property="appName" readonly="readonly"/>
	    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectAppId()">
	  </td> 
    </tr>
    <tr>
    	<td colspan="2" align="center">
    <html:button name="btnSave" value="保  存" onclick="doSave()"></html:button>
	</td>
	</tr>
  </table>
</div>
