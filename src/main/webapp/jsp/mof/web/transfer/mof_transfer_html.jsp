<%@ page contentType="text/html;charset=gb2312" %>
 <form action="http://localhost:7001/windowHtml.cmd?method=update&windowId=402888b30556313b01055660b7c80018" method="post">
<textarea name="windowHtml" rows=40 cols=130><%out.print(request.getAttribute("windowHtml"));%></textarea>
<input type="windowId" value="<%=request.getParameter("windowId")%>">
<input type="submit">
</form>