<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>数据权限查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<%
	String corporationId =
			GetBspInfo.getBspInfo().getLoginCorporation().getStruId();
%>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="数据权限查询" >
<bsp:containbutton text="查询" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">数据权限查询</font>
    <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">数据资源：</td>
                       <td class="tdRight" align="center">
                       <html:hidden name="dataResourceIds" value=""/>
                       <html:hidden name="dataResTypes" value=""/>                       
                       <html:text name="dataResourceNames" value="" size="20" readonly="true" ondblclick="clean()"/>
       				   <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectDataResources()">
		               </td>
                       </td>
                    </tr>                                 
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].dataResourceNames.value="";   
}
function forQuery(){
  var dataResourceNames = document.forms[0].dataResourceNames;
  if(dataResourceNames.value=="")
  {
  	alert("请选择数据权限后进行查询！");
      dataResourceNames.value="";
      dataResourceNames.select();
      return;
  }
	  document.forms[0].action ="datarefuserquery.cmd?method=query";     
	  document.forms[0].submit();
}
function selectDataResources(){
     var str1;
     var str2;
     var str3;
     var str4;
     var str5;
     var str6;
     var rootId = "<%=corporationId%>"; 
     var cmdUrl = "user.cmd&method=selectUserDataResRef1&rootId="+rootId+"&isCheckBox=1";
     var url ="jsp/help.jsp?url="+cmdUrl; 
     var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:600px;dialogHeight:384px");
     if (win == null) {  
  	 return;
      }else{
      if(win[0]=="")
      return;
      str1 = win[0];
      str2 = win[1];
      str3 = win[2];
      str4 = win[3];
      str5 = win[4];
      str6 = win[5];
     }
     document.forms[0].dataResourceIds.value=str1;
     document.forms[0].dataResTypes.value=str3;
     document.forms[0].dataResourceNames.value=str2;  
}
</script>