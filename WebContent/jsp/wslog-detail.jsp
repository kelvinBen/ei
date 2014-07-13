<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/jsp/directives.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>详细页</title>
<%@ include file="/WEB-INF/jsp/metadata.jsp"%>
<style type="text/css">
th{text-align:right;}
td{text-align:left;word-break:break-all;word-wrap:break-word;}
select{width:100px;}
</style>
</head>
<body id="body_dialog">
<div id="container_dialog">
	  <table class="inputtable" style="width:100%;margin:0;">
	    <colgroup>
	    	<col style="width:17%;"></col>
	    	<col style="width:83%;"></col>
	    </colgroup>
		<thead>
		  <tr><td colspan="2" style="text-align:right;"><button onclick="window.close();"><s:text name='button.close'/></button></td></tr>
		</thead>
		<tbody>
		  <tr>
		    <th>id</th>
		    <td><s:property value="log.id"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.requestType"/></th>
		    <td><s:property value="log.requestType"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.requestID"/></th>
		    <td><s:property value="log.requestID"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.requestXML"/></th>
		    <td><s:property value="log.requestXML"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.status"/></th>
		    <td><s:property value="log.status"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.result"/></th>
		    <td><s:property value="log.result"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.key"/></th>
		    <td><s:property value="log.key"/></td>
		  </tr>	
		  <tr>
		    <th><s:text name="单位"/></th>
		    <td><s:property value="log.unit.name"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.esStatus"/></th>
		    <td><s:property value="log.esStatus"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.esResult"/></th>
		    <td><s:property value="log.esResult"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.ecmStatus"/></th>
		    <td><s:property value="log.ecmStatus"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.ecmResult"/></th>
		    <td><s:property value="log.ecmResult"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.sapStatus"/></th>
		    <td><s:property value="log.sapStatus"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.sapResult"/></th>
		    <td><s:property value="log.sapResult"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.reqStatus"/></th>
		    <td><s:property value="log.reqStatus"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.reqResult"/></th>
		    <td><s:property value="log.reqResult"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.startDate"/></th>
		    <td><s:property value="log.startDate"/></td>
		  </tr>
		  <tr>
		    <th><s:text name="wslog.lastDate"/></th>
		    <td><s:property value="log.lastDate"/></td>
		  </tr>			  			  		  		  				  		  		  			  	  			  			  		  
		</tbody>
		<thead>
		  <tr><td colspan="2" style="text-align:right;"><button onclick="window.close();"><s:text name='button.close'/></button></td></tr>
		</thead>
	  </table>
</div>
</body>
</html>