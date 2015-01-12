<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript" src="../js/jquery.js"></script>

<script type="text/javascript">
     $(document).ready(function(){
       $("#matGroupSelect").click(function(event){
			 var str = window.showModalDialog('/prc/matGroup/init.do');
			 $("#materialGroup").get(0).value = str;
       });
       
       $("#testButton").click(function(event){

       });
     }); 
 </script>

<title>Insert title here</title>
</head>
<body>
<label for="materialGroup">物料组</label>
<input type="text" id="materialGroup">
<input id="matGroupSelect" type="button" value="选择...">
<input id="testButton" type="button" value="测试">


</body>
<body>
</body>
</html>