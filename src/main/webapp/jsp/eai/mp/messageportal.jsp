<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.eai.mp.view.MpUserMessageView"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
	List list = (List)request.getAttribute("list");
	String ismore = (String)request.getAttribute("ismore");
%>
<HTML>
<HEAD>
<TITLE>用户消息</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<style>
A.visit:link 
{
    COLOR: black;
    TEXT-DECORATION: none
}
A.visit:visited
{
    COLOR: black;
    TEXT-DECORATION: none
}
A.visit:hover {
	COLOR: #FF9966;
	TEXT-DECORATION: underline
}
A:link 
{
    COLOR: blue;
    TEXT-DECORATION: none
}
A:visited
{
    COLOR: black;
    TEXT-DECORATION: none
}
A:hover {
	COLOR: #FF9966;
	TEXT-DECORATION: underline
}
</style>
<BODY topmargin="10px" leftmargin="10px" style="margin:10px;">
<div align="center">
  <table width="100%" cellpadding="0" border="0">  
    <tr>
      <td width="100%" valign="top">
          <%
           if ( list != null &&  !list.isEmpty() ) {
          %>
               <table width="100%" borderColor="#4895DB" cellpadding="5" border=1 cellspacing="0">
          <%
               MpUserMessageView view = null;
               String[] bgcolor={"","bgcolor=\"#D2E5F6\""};
             for ( int i = 0 ; i < list.size() ; i ++ ) {
                 view = (MpUserMessageView)list.get(i);
                 if(view.getStatus().equals("0")){
          %>
                 <tr>
                   <td width="10%" height="20" <%=bgcolor[i%2]%>><img src="<%=SkinUtils.getImage(request,"star.gif")%>"/> <a href="mpusermessage.cmd?method=detail&primaryKey=<%=view.getUserMessageId()%>"><%=view.getSubject()%>(<%=view.getCreateTime()%>)</a></td>
                 </tr>
          <%
          		}else{
          %>
          		<tr>
                   <td width="10%" height="20" <%=bgcolor[i%2]%>><img src="<%=SkinUtils.getImage(request,"star.gif")%>"/> <a class="visit" href="mpusermessage.cmd?method=detail&primaryKey=<%=view.getUserMessageId()%>" style=""><%=view.getSubject()%>(<%=view.getCreateTime()%>)</a></td>
                </tr>
          <%
          		}}
                  if(ismore.equals("true")){
          %>
                 <tr>
                   <td colspan=2 height="20" valign="top" align="right"><a href="mpusermessagequery_page_init.cmd" target="_parent">更多消息</a></td>
                 </tr>
          <%
               }
          %>
               </table>
          <%
             }
          %>
      </td>
    </tr>
   </table>
</div>
</BODY>
</HTML>