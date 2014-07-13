<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.bsp.lc.view.CommonSingleParmsView"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<HTML><HEAD><TITLE>自助服务 - 更换皮肤</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<mast:ui css='skinportal.css'/>" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="<mast:ui js='dcwork.js'/>"></SCRIPT>
<%
	CommonSingleParmsView view = (CommonSingleParmsView)request.getAttribute("html.data");
 
%>
<META content="MSHTML 6.00.2800.1476" name=GENERATOR></HEAD>
<BODY topMargin=10  >
<DIV class=btnareacss>
	<INPUT class=advbutton onmouseover="this.className='advbutton-over';" onclick=forUpdate() onmouseout="this.className='advbutton';" type=button value=" 保存 " name=btn_update> 
</DIV>

 
<TABLE class=tblContent cellPadding=3 width="100%"> 
  <TR>
    <TD>(1)蓝色水晶<INPUT type=radio <%if(String.valueOf(view.getSingelStyle()).equals("")||String.valueOf(view.getSingelStyle()).equals("null")||String.valueOf(view.getSingelStyle()).equals("default")){ out.println("checked");}%>  value=default name=skinradio></TD>
    <TD><IMG width=380 height=280 src="<%=request.getContextPath()%>/skins/skin/images/default.gif"><BR></TD></TR>
 
   <TR>
    <TD>(2)紫色淡雅<INPUT type=radio <%if(String.valueOf(view.getSingelStyle()).equals("purple")){ out.println("checked");}%> value=purple name=skinradio ></TD>
    <TD><IMG  width=380 height=280  src="<%=request.getContextPath()%>/skins/skin/images/purple.gif"><BR></TD></TR> 
    
    <TR>
    <TD>(3)绿色清新<INPUT type=radio <%if(String.valueOf(view.getSingelStyle()).equals("green")){ out.println("checked");}%> value=green name=skinradio ></TD>
    <TD><IMG  width=380 height=280  src="<%=request.getContextPath()%>/skins/skin/images/green.gif"><BR></TD></TR> 

</TABLE>

<FORM name=frmList action="" method=post>
<html:hidden name="organId" property="organId" />
<html:hidden name="singelStyle" property="singelStyle"/>
</FORM>


<SCRIPT language=javascript>
function init()
{
var rad=document.all("skinradio");
var style=document.all("singelStyle").value;
if(style!=null && style!="")
{
	if(style==rad[1].value)
		rad[1].checked=true;
	else if(style==rad[2].value)
		rad[2].checked=true;
}
	

}
function forUpdate(){
	  var styleValue;
	  var style=document.all("skinradio");
	  for(var i=0;i<style.length;i++)
	{
		if(style[i].checked==true)
			styleValue = style[i].value;

	}
 
 
	  if(document.frmList.singelStyle.value==styleValue)
		  return;
	  else
		  document.frmList.singelStyle.value = styleValue;
 
	if(document.all("organId").value!=null && document.all("organId").value!="")
		{
	 
		 document.forms[0].action ="commonsingleparms.cmd?method=updateStyle";
		}
	else
		{
		 document.forms[0].action ="commonsingleparms.cmd?method=insertStyle"; 
		}
 
	  document.forms[0].submit();
 
}
if(<%=String.valueOf(request.getAttribute("saveportalflag"))%> == "1")
	 top.location.reload();

</SCRIPT>
</BODY></HTML>
