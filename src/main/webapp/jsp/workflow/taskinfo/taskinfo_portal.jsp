<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px" leftmargin="10px" style="background-color:#F8FBFE;margin-right:0px;">

<%
		List list=(List)request.getAttribute("taskinfoList");
           if ( list != null &&  !list.isEmpty() ) {
%>
	<table width="100%"  class="portalTableCss" cellspacing=0 cellpadding=0 border="0">
		
		<%
		boolean flag=false;
		 String classname="portalTdCss1";
		if(list==null)list = new ArrayList();
		if(list.size()>0)
		{
			
			for(int i=0;i<list.size();i++)
			{
				if(i>9) {
				flag=true;
				break;
				}
				if(i%2==1)
					 classname="portalTdCss";
				else
					classname="portalTdCss1";
				Map m=(Map)list.get(i);
				String sysProcessName=(String)m.get("sysProcessName");
				String sysActCreateTime=(String)m.get("sysActCreateTime");
				if(sysActCreateTime!=null && sysActCreateTime.length()>16)
					sysActCreateTime=sysActCreateTime.substring(0,16);
				String sysActivityId=(String)m.get("sysActivityId");
				String sysProcessId=(String)m.get("sysProcessId");
				String subject=(String)m.get("SUBJECT");
				if(subject==null || subject.trim().equals("")) subject=sysProcessName;
		%>
		<tr>
            <td align="right" width=30  class="<%=classname%>"><img src="<%=SkinUtils.getImage(request,"tou.gif")%>"></td>
            <td align="left" height="20" valign="top" class="<%=classname%>"><span><a href="taskinfo.cmd?method=fordeal&activityId=<%=sysActivityId%>&processId=<%=sysProcessId%>" title="<%=subject%>" target=_parent><%=subject%>(<%=sysActCreateTime.trim()%>)</a></span></td>
		</tr>
		<%	
			}
		
		%>	
		<%if (flag){%>
		<tr>
		<td  colspan=2 height="20" valign="top" align="right"><a href=taskinfoquery.cmd target=_parent>更多流程</a></td></tr>	
		<%
			}
		}
		%>
	</table>
          <%
             }
          %>

</BODY>
</HTML>

