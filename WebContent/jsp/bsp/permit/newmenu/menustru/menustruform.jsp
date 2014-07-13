<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.permit.newmenu.view.MenuStruView"%>
<%
	MenuStruView view = (MenuStruView)request.getAttribute("html.data");
	String isSys = view.getIsSys();
%>

<div align="center" style="border:1 solid #999999;">
    <table  cellpadding="0" >
         <html:hidden name="menuStruId" property="menuStruId"/>
         <html:hidden name="parentId" property="parentId"/>
         <html:hidden name="menuId" property="menuId"/>
         <html:hidden name="struTypeId" property="struTypeId"/> 
         <html:hidden name="isSys" property="isSys"/>  
         <html:hidden name="seq" property="seq"/>  
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_STRU.MENU_ALIAS")%>：</td>
      <td><html:text name="menuAlias" property="menuAlias" /><font color="red">*</font></td>
    </tr>  
    <%
    	if(isSys.equals("S")){
    %>
    <tr> 
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_STRU.PARENT_MENU_ID")%>：</td>
      <td>
      		<html:hidden name="parentMenuAlias" property="parentMenuAlias" write="true"/>
      </td>
    </tr>   
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TYPE")%>：</td>
      <td>
      	<html:select name="type" property="type" disabled="true">
	      	<html:option value="0">普通</html:option>
	      	<html:option value="1">功能</html:option>
	      	<html:option value="2">窗口</html:option>
	      	<html:option value="3">报表</html:option>
      	</html:select>
      </td>
    </tr>    
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TITLE")%>：</td>
      <td><html:text name="title" property="title" disabled="true"/></td>
    </tr>
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.VALUE")%>：</td>
      <td><html:text name="value" property="value" disabled="true"/></td>
    </tr>   
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TARGET")%>：</td>
      <td><html:text name="target" property="target" disabled="true"/></td>
    </tr>  
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.OPTIONS")%>：</td>
      <td><html:text name="options" property="options" disabled="true"/></td>
    </tr> 
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TEXT")%>：</td>
      <td><html:text name="text" property="text" disabled="true"/></td>
    </tr> 
 	<%
 		}else{
 	%>
    <tr> 
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_STRU.PARENT_MENU_ID")%>：</td>
      <td>
      		<html:hidden name="parentMenuAlias" property="parentMenuAlias" write="true"/>
      </td>
    </tr>   
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TYPE")%>：</td>
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
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TITLE")%>：</td>
      <td><html:text name="title" property="title" /></td>
    </tr>
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.VALUE")%>：</td>
      <td><html:text name="value" property="value" /></td>
    </tr>   
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TARGET")%>：</td>
      <td><html:text name="target" property="target" /></td>
    </tr>  
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.OPTIONS")%>：</td>
      <td><html:text name="options" property="options" /></td>
    </tr> 
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.TEXT")%>：</td>
      <td><html:text name="text" property="text"/></td>
    </tr> 
 	<%
 		}
 	%>
    <%
    	if(isSys.equals("S")){
    %>
    <tr>      
	  <td align="right"><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.FUNCTION_ID")%>：</td>
	  <td> 
      	<html:text name="functionId" property="functionId" disabled="true"/>
      	<img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectFunctionId()" disabled="true">
	  </td> 
    </tr>
    <!--gaochuanji 添加一个一行用于主机和应用的映射-->
    <tr>      
	  <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.APP_ID")%>：</td>
	  <td> 
      	<html:hidden name="appId" property="appId" />
      	<html:text name="appName" property="appName" disabled="true"/>
	    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectAppId()"  disabled="true">
	  </td> 
    </tr>
    <!--over-->
    <%
    	}else{
    %>
    <tr>      
	  <td align="right" ><%=ResourcesFactory.getString("PUB_MENU_PER_ITEM.FUNCTION_ID")%>：</td>
	  <td> 
      	<html:text name="functionId" property="functionId"/>
	    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectFunctionId()">
	  </td> 
    </tr>
    <!--gaochuanji 添加一个一行用于主机和应用的映射-->
    <tr>      
	  <td align="right"><%=ResourcesFactory.getString("PUB_MENU_SYSITEM.APP_ID")%>：</td>
	  <td> 
      	<html:hidden name="appId" property="appId"/>
      	<html:text name="appName" property="appName" readonly="readonly"/>
	    <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectAppId()">
	  </td> 
    </tr>	
    <!--over-->
    <%
    	}
    %>
    <tr>
    	<td colspan="2" align="center">
    		<html:button name="btnSave" value="保  存" onclick="doSave()"></html:button>
		</td>
	</tr>
  </table>
</div>
