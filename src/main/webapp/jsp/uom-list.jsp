<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>计量单位维护</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
		<table border="1">
			<tr>
				<th width="20%">
					计量单位
				</th>
				<th>
					描述
				</th>
				<th width="20%">
					操作
				</th>
			</tr>
			<s:iterator value="#request.uomList" id="uom">
				<tr>
					<td>
						<s:property value="#uom.uom" />
					</td>
					<td>
						<s:property value="#uom.description" />
					</td>
					<td>

					</td>
				</tr>
			</s:iterator>

		</table>
  </body>
</html>
