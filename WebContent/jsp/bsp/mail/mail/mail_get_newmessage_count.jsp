<%
	String msgCount = "" + request.getAttribute( "msgCount" );
	if( msgCount == null || msgCount == "" )
		msgCount = "0";
	out.println( msgCount );
%>