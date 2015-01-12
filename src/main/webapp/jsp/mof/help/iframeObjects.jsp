<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="java.util.List"%>
<%
  String single=request.getParameter("is_single");
  if(single==null){
	  single=(String)request.getAttribute("is_single");
  }
  if(single==null) single="false";
%>
<HTML>
<HEAD><TITLE>通用帮助返回对象</TITLE>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>
<body  topmargin="0" leftmargin="0" onload="returnHelpObjs()" >

</body>

<script language = "javascript">
var is_single=<%=single%>;
	function returnHelpObjs(){
		var objects  = new Array();
<% List list = (List)request.getAttribute("help_objects");
 for( int i = 0 ; i < list.size(); i ++ ){
 	List record = (List)list.get(i);%>
		objects[<%=i%>] = new Array();
	<%for(int j = 0; j < record.size();j++){%>
		objects[<%=i%>][<%=j%>]=trim("<%=record.get(j)%>");
	<%}%>
<%}%>
		var url="jsp/mof/help/helpObjList.jsp";
	    var list;
	    if( is_single && objects !=null && objects.length>1){
	     	var line = showModalDialog(url,objects,"scroll:auto;status:no;dialogWidth:500px;dialogHeight:300px");
	    	//alert("win:"+win);
	    	if(line!=null){
	        	list = new Array();
 	 			list[0]=objects[line];
 	 			//alert("obj:"+objects);
 	 			//alert(list);
 	 		}
 	 	}else{
 	 		list=objects;
 	 	}
		parent.<%=request.getAttribute("help_method")%>(list);
	}
</script>
</HTML>