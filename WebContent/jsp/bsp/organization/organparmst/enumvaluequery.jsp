<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ page import="java.util.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<%
	List enumValeCollection = (ArrayList)request.getAttribute("enumValeCollection");
	
%>
<BODY topmargin="10px"> 
    	
	     <html:select name="enumParmsValue"  property="parmsValue" size="1" value="parmsValueDefault">
	     <%
	    	 for(int i=0;i<enumValeCollection.size();i++)
	    	 {
		    	 String key=(String) ((HashMap) enumValeCollection.get(i)).get("enumNameKey");
				 String value=(String) ((HashMap) enumValeCollection.get(i)).get("enumNameValue");
	     %>
		        <html:option value="<%=key%>"><%out.println(value);%></html:option>
	     <%
	     	 }
	     %>
	     </html:select>
</BODY>
</HTML>
<script language="javascript">
init(document.all("enumParmsValue"));
function init(parms){ 
	var parmsValueDefault=parent.document.forms[0].parmsValueEnum.value;
	parent.insertEnumValue(document.all("enumParmsValue").outerHTML);
}
</script>