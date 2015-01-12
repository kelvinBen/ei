<%@ taglib uri="/tags/web-seltree" prefix="tree" %>
<%@ page contentType="text/html;charset=GBK" %>
<%
String isCheckBox = (String)request.getParameter("isCheckBox");
%>
 <%
     	if(isCheckBox!=null&&isCheckBox.equals("1")){
     %>
<tree:selXmlNode title="userName" nodeId="userId" nodeValue="userName" collection="user_tree"  checkData="" type="checkbox" isChecked="" caption="">
</tree:selXmlNode>

<%}else{%>

<tree:selXmlNode title="userName" nodeId="userId" nodeValue="userName" collection="user_tree"  radioData="" type="radio" isChecked="" caption="">
</tree:selXmlNode>

 <%}%>