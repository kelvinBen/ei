<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%
     String refreshId = (String)request.getAttribute("refreshId");
%>
<script language="javascript">
function check(){
    var name = document.forms[0].templateName;
    if(trim(name.value)==""){
       alert("请输入角色模板名称！");
       name.select();
       name.focus();
       return false;
    } 
    if ( __isQuoteIn(name.value))
	{
		    alert("角色模板名称不能含有特殊字符！");
		    name.select();
		    name.focus();
		    return false;
	}
    var name_exit = document.forms[0].name_exit;
    for(var i=0;i<name_exit.options.length;i++){
       if(name.value==name_exit.options[i].innerText){
          alert("已经存在该名称！");
          name.value="";   
          name.select();
          name.focus();
          return false;
       } 
    }
    return true;
}
</script>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<input type="hidden" name="refreshId" value="<%=refreshId%>">
<bsp:container title="增加角色模板" >
<bsp:containbutton text="保存" onclick="forinsert()" ></bsp:containbutton>

   <table width="100%" cellpadding="0" class="tblContent">
   <tr style="display:none">
				<td class="tdTitle">其它已有的角色模板：</td>
                <td class="tdRight"><html:select name="name_exit" value="">
	                <html:options collection="list" labelProperty="templateName" property="templateId"/>
	           </html:select>
			   </td>
   </tr>
   <tr>
                <td class="tdTitle"> 角色模板名称： </td>
				<td class="tdRight"><input type="text" name="templateName" value="" size="20" maxlength="30" ><FONT COLOR=#ff0000>*</FONT>
                </td>
    </tr>
			  
    
   </table>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
  function forinsert(){
     if(!check()) return;
     var templateName = document.all("templateName").value;
     //alert(templateName);
	
	 document.forms[0].action ="templates.cmd?method=insert";    
     document.forms[0].submit();
	 //parent.close();
  }

</script>