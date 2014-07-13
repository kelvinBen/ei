<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<div align="center" style="border:1 solid #999999;">
    <table  cellpadding="0" >
         <html:hidden name="id" property="id"/>
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU.TEXT")%>：</td>
      <td><html:text name="text" property="text" /><font color="red">*</font></td>
    </tr>           
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU.PARENT")%>：</td>
      <td><html:hidden name="parent" property="parent"/><html:hidden name="parentText" property="parentText" write="true"/></td>
    </tr>    
  
    <tr>
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
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU.TITLE")%>：</td>
      <td><html:text name="title" property="title" /></td>
    </tr>

    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU.FUNCTION")%>：</td>
      <td><html:text name="function1" property="function" /></td>
    </tr>

    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU.TARGET")%>：</td>
      <td><html:text name="target" property="target" /></td>
    </tr>
    
    <tr>
      <td align="right"><%=ResourcesFactory.getString("PUB_MENU.OPTIONS")%>：</td>
      <td><html:text name="options" property="options" /></td>
    </tr>
    
    <tr>      
    	<td align="right"><%=ResourcesFactory.getString("PUB_MENU.FUNCTION_ID")%>：</td>
      	<td> 
      		<html:text name="functionId" property="functionId" readonly="readonly"/>
	    	<img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectFunctionId()">
	    </td> 
    </tr>
    <tr>
    	<td colspan="2" align="center">
    <html:button name="btnSave" value="保  存" onclick="doSave()"></html:button>
	</td>
	</tr>
  </table>
</div>
