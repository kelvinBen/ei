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
       alert("�������ɫģ�����ƣ�");
       name.select();
       name.focus();
       return false;
    } 
    if ( __isQuoteIn(name.value))
	{
		    alert("��ɫģ�����Ʋ��ܺ��������ַ���");
		    name.select();
		    name.focus();
		    return false;
	}
    var name_exit = document.forms[0].name_exit;
    for(var i=0;i<name_exit.options.length;i++){
       if(name.value==name_exit.options[i].innerText){
          alert("�Ѿ����ڸ����ƣ�");
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
<bsp:container title="���ӽ�ɫģ��" >
<bsp:containbutton text="����" onclick="forinsert()" ></bsp:containbutton>

   <table width="100%" cellpadding="0" class="tblContent">
   <tr style="display:none">
				<td class="tdTitle">�������еĽ�ɫģ�壺</td>
                <td class="tdRight"><html:select name="name_exit" value="">
	                <html:options collection="list" labelProperty="templateName" property="templateId"/>
	           </html:select>
			   </td>
   </tr>
   <tr>
                <td class="tdTitle"> ��ɫģ�����ƣ� </td>
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