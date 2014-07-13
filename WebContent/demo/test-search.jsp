<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

    
  <head>
 <script type="text/javascript" src="../js/jquery.js"></script>
 
 <script type="text/javascript">
     $(document).ready(function(){
       $("#productSelect").click(function(event){
			 var str = window.showModalDialog('/prc/product/init.do');
			 $("#materialNumber").get(0).value = str;
       });
       
       $("#testButton").click(function(event){

       });
     }); 
 

</script>
  </head>
  
  <body>
  	<label for="materialNumber">物料编码</label><input type="text" id="materialNumber">
    <input id="productSelect" type="button" value="选择..." >
    <input id="testButton" type="button" value="测试" >

  
  </body>
</html>
