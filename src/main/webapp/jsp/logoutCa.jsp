<%@ page contentType="text/html;charset=GBK" %>
<SCRIPT LANGUAGE="JavaScript">
//top.location=self.location;
function closed()
{
var ua=navigator.userAgent 
var ie=navigator.appName=="Microsoft Internet Explorer"?true:false 
if(ie){ 
var IEversion=parseFloat(ua.substring(ua.indexOf("MSIE ")+5,ua.indexOf(";",ua.indexOf("MSIE ")))) 
if(IEversion< 5.5){ 
var str = '<object id=noTipClose classid="clsid:ADB880A6-D8FF-11CF-9377-00AA003B7A11">' 
str += '<param name="Command" value="Close"></object>'; 
document.body.insertAdjacentHTML("beforeEnd", str); 
document.all.noTipClose.Click(); 
top.close();
}else{ 
top.opener =null; 
top.close(); 
} 
} 
else{ 
top.close() ;
} 
}
closed();
</SCRIPT>