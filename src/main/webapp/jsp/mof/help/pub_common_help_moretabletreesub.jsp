<%@ taglib uri="/tags/web-seltree" prefix="tree" %>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<jsp:useBean id="PubCommonHelpView" type="net.mast.help.view.PubCommonHelpView" scope="request"/>
<%
	String is_multsel=PubCommonHelpView.getIsMultsel();//是否允许多选
	String tree_type="";
	if(is_multsel.equals("0"))tree_type="radio";
	else	tree_type="checkbox";					
%>
<%
	if(tree_type.equals("radio")){
%>
<tree:selXmlNode title="title" nodeId="nodeId" nodeValue="radioData" collection="tree" nodeXmlSrc="nodeXmlSrc" caption="title"   type="<%=tree_type%>"  radioData="radioData"></tree:selXmlNode>
<%}else{%>
<tree:selXmlNode title="title" nodeId="nodeId" nodeValue="checkData" collection="tree" nodeXmlSrc="nodeXmlSrc" caption="title"   type="<%=tree_type%>"  checkData="checkData"></tree:selXmlNode>
<%}%>
