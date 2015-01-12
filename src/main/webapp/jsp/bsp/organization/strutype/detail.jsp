<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui css='flexgrid.js'/>"></script>
<html:form action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="��֯�ṹ������ϸ" >
<bsp:containbutton text="�޸�" onclick="forUpdate()" action ="strutype.cmd?method=forupdate"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action ="strutypequery.cmd"></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.STRU_TYPE")%>��</td>
      <td class="tdRight"><html:hidden name="struType" property="struType" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.TYPE_NAME")%>��</td>
      <td class="tdRight"><html:hidden name="typeName" property="typeName" write="true"/></td>
    </tr>
  
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.IS_DEFAULT")%>��</td>
      <td class="tdRight"><html:hidden name="isDefault" property="isDefault" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle"><%=ResourcesFactory.getString("PUB_STRU_TYPE.NOTE")%>��</td>
      <td class="tdRight"><html:hidden name="note" property="note" write="true"/></td>
    </tr>
    
    <tr>
      <td class="tdTitle">ʵʩ��֯�ṹ����Լ����</td>
      <td class="tdRight"><html:checkbox name="isApplyRule" property="isApplyRule" value="1" disabled="true"/></td>
    </tr> 
                    
    <tr>
      <td class="tdTitle">֧�־����ƣ�</td>
      <td class="tdRight"><html:checkbox name="isMatrix" property="isMatrix" value="1" disabled="true"/></td>
    </tr>  
    
    <tr>
     <td class="tdTitle">������ʷ��¼��</td>
     <td class="tdRight"><html:checkbox name="isKeepRecord" property="isKeepRecord" value="1" disabled="true"/></td>
    </tr>    
    
  </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.all("primaryKey").value=document.all("struType").value;
  document.forms[0].action ="strutype.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="strutypequery.cmd";
  document.forms[0].submit();	
}
</script>