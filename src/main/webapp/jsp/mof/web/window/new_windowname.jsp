<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD><TITLE>请输入新窗口的名称 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<body>
<table border="0" width="100%"  class="tblContent" cellspacing="0" cellpadding="0" bgcolor=white>
<html:form name="frmList" action="">
<tr>
  <td class="tdTitle" width="15%">请输入新窗口的名称：</td> 
  <td class="tdRight" width="30%" align="left" colspan="3">
      <html:text value="" name="new_window"  size="40" /><font color="#FF0000">*<br>(请输入英文名称)</font>
   </td>
</tr>   
  <td  width="100%"  colspan="4" align="center">
       <html:button name="submit_btn" value="  确  定  " onclick="closeWindow(true)"/>
       &nbsp;&nbsp; <html:button name="reset_btn" value="  取  消  " onclick="closeWindow(false)"/>
  </td> 
</tr>
</html:form>
</table>
</body>
<script language = "javascript">
	function closeWindow(isOk){
		if( isOk ){
			var window_name = document.forms[0].new_window.value;
			if( window_name == ""){
				alert("请输入窗口名称！");
				return;
			}
			window.returnValue = window_name;
		}else	
			window.returnValue = null;	
		window.close();
	}
</script>
</HTML>