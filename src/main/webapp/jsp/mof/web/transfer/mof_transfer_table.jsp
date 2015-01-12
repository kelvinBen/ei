<%@ page contentType="text/html;charset=gb2312" import="java.util.*" %>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%	 
	Map map = new HashMap();
    request.setAttribute(Global.getString("html.data"), map); 
%> 
<form name="frm">
<html:select name="editobject" property="" size="1">
    <html:options collection="tableList" property="id" labelProperty="tableName"/>
</html:select>
</form>
<script> 
	var selectObj = document.frm.editobject;
 
 	for(var i=0;i<selectObj.options.length;i++)
	{
				selectObj.options[i].name = selectObj.options[i].value.split(";")[1];
				selectObj.options[i].value = selectObj.options[i].value.split(";")[0];
	} 
 	parent.fillDate(document.getElementsByName("editobject")[0]);
</script>