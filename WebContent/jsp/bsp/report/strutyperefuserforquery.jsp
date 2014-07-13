<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.bsp.permit.context.GetBspInfo"%>
<%
	String defaultStruTypeRootId = (String)request.getAttribute("defaultStruTypeRootId");
%>
<HTML>
<HEAD>
<TITLE>组织结构权限查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="组织结构权限查询" >
<bsp:containbutton text="查询" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">组织结构权限查询</font>
    <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">组织结构类型：</td>
                       <td class="tdRight" align="center">
                       <html:select name="value" value="00" onchange="clean()">
                       		<html:options collection="struTypeCollection"  property="$STRU_TYPE+'#'+ROOT_ID" labelProperty="TYPE_NAME" />
                       </html:select>
                       <html:hidden name="typeName" value=""/>
		               </td>
                    </tr>       
                    <tr>
                       <td class="tdTitle">访问权限：</td>
                       <td class="tdRight" align="center"><html:hidden name="struId" value="" write="false"/><html:text name="organName"  value="" size="20" maxlength="20"  readonly="true" ondblclick="clean()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectStruId()"></td>
                    </tr>                                 
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean(){
	document.forms[0].struId.value="";   
	document.forms[0].organName.value="";   
}
function forQuery(){
var struId = document.forms[0].struId;
  if(struId.value=="")
  {
  	alert("请选择访问权限后进行查询！");
      struId.value="";
      struId.select();
      return;
  }
	  var select = document.getElementById("value");
	  var value = select.options[select.selectedIndex].value;
	  var newvalue = value.split("#");
  	  document.forms[0].typeName.value = select.options[select.selectedIndex].innerText;
	  document.forms[0].action ="strutyperefuserquery.cmd?method=query&struType="+newvalue[0];     
	  document.forms[0].submit();
}
function selectStruId(){
		var select = document.getElementById("value");		
		var value = select.options[select.selectedIndex].value;
		var newvalue = value.split("#");
		if(newvalue[0]=="00"){
			newvalue[1]= "<%=defaultStruTypeRootId%>";
		}
		var url ="stru.cmd?method=getSelectRoot&struType="+newvalue[0]+"&rootId="+newvalue[1]+"&isCheckBox=0&isIncludeSelf=1&isTree=1&nevervote=1";
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
		if (win == null) {  
			return;
		}else{
			if(win[0]=="")
				return;
			document.all("struId").value=win[2];
    		document.all("organName").value=win[1];
		}
}
</script>