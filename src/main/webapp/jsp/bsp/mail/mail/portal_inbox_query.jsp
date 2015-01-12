<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.List"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.bsp.mail.mail.view.MailResourceView"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<%
List datas = (List)request.getAttribute(Global.getString("flexgrid.data"));
%>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px" leftmargin="10px"  style="background-color:#F8FBFE;margin-right:0px;">
	<%
		MailResourceView mailResourceView = null;
		boolean flag=false;
		String classname="portalTdCss1";
		if (datas != null &&  !datas.isEmpty() ) {
	%>
	<table width="100%"  class="portalTableCss" cellspacing=0 cellpadding=0 border="0">
	<%
		for ( int i = 0 ; i < datas.size() ; i ++ ) {
		if(i>9) {
		flag=true;
		break;
		}
		if(i%2==1)
					 classname="portalTdCss";
				else
					classname="portalTdCss1";
		mailResourceView = (MailResourceView)datas.get(i);
	%>
	<tr>
            <td align="right" width=30  class="<%=classname%>"><img src="<%=SkinUtils.getImage(request,"tou.gif")%>"></td>
            <td align="left" height="20" valign="top" class="<%=classname%>"><span><a href="mailresource.cmd?method=detail&primaryKey=<%=mailResourceView.getResourceId()%>" title="<%=mailResourceView.getSubject()%>" target="_parent"><%=mailResourceView.getSubject()%>(<%=mailResourceView.getSendTime().trim()%>)</a></span></td>
	</tr>
	<%
		}
	%>
	<%if (flag){%>
	<tr>
		<td  colspan=2 height="20" valign="top" align="right"><a href="inboxmailquery.cmd?mailType=0" target="_parent">¸ü¶àÓÊ¼þ</a></td>
	</tr>
	<%
		}
	%>
		</table>	
	<%
	}
	%>

</BODY>
</HTML>
