<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>

<HTML>
<HEAD>
<TITLE>Ա����չʾ�����޸�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>

<script language="javascript">
 function checkPubExampleOrgan(){
    if (checkBase() )
    {
    
    }else{
    	return false;
    }
  return true

}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="Ա����չʾ�����޸�" >
<bsp:containbutton text="����" onclick="forSave()" action ="employee.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()" ></bsp:containbutton>
<bsp:containbutton text="����" onclick="javascript:window.history.go(-1)" action ="employee.cmd"></bsp:containbutton>
<tab:tab  id="tab1" type="table">
<tab:card id="card0" text=" ������Ϣ  ">
   <jsp:include page="../../../organization/org/base_update_info.jsp" flush="true"/>
</tab:card>
<tab:card id="card1" text=" ��չ��Ϣ  " >
  <table width="100%" cellpadding="0" class="tblContent">
                                                           <tr>
                    <td class="tdTitle">��ϵ�绰��</td>
                    <td class="tdRight"><html:text name="tel" property="tel" size="30" maxlength="30"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle">�����ַ��</td>
                    <td class="tdRight"><html:text name="www" property="www" size="30" maxlength="80"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle">�����ʼ���</td>
                    <td class="tdRight"><html:text name="email" property="email" size="30" maxlength="80"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle">MSN��</td>
                    <td class="tdRight"><html:text name="msn" property="msn" size="30" maxlength="80"/></td>
                    </tr>
                                                             <tr>
                    <td class="tdTitle">QQ��</td>
                    <td class="tdRight"><html:text name="qq" property="qq" size="30" maxlength="30"/></td>
                    </tr>
       </table>
</tab:card>
</tab:tab> 
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubExampleOrgan()) return;	
  document.forms[0].action ="employee.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="employee.cmd";
  document.forms[0].submit();	
}
function forReset(){  
  document.forms[0].reset();	
}

</script>