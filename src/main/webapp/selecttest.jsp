<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>

<HTML>
<HEAD>
<TITLE>帮助调用示例</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>

<%
Map map = new HashMap();
map.put("viewprop","参数值");
map.put("dateprop",new Date());
request.setAttribute("html.data", map);
%>
<widgets:container title="调用示例" >

<html:form name="frmList" action="cantquery.cmd">


<br/>
调用方式A：嵌入文本框中，用标签生成的ＪＳ调用．JS命名规则： name+"_dialog"  ,其中name 为帮助标签的name 属性
<br/>
<input type="text" name="forhelp1" value="" onclick="postAddress_dialog()"  size=50> <input type="text" name="forhelp2" value="" > 
(help标签隐藏在div中)
<div style="display:none" >
<help:helpsearch name="postAddress"  size="40"  helpid="helpUserNoPub" ismulti="false" value="" changefield="forhelp1#1,forhelp2#2"/>
</div>
<hr/>
<br/>调用方式Ｂ：只显示选择按钮， 数据仍然保留在标签的name 中,不过是隐藏状态， 多选：设置ismulti="true" ,不设置的话默认为单选
<br/><help:helpsearch name="postAddress2" style="display:none" size="40"  helpid="helpUserNoPub" ismulti="true" value="" changefield="forhelp1#1,forhelp2#2"/>
<hr/>
<br/>
<br/>调用方式C：包含文本框一起显示，当前文本框就是表单里面的要提交数据,带用户自定义参数,选择组件需要传入动态参数，需填写param 属性,
<br/>param属性的填写格式：参数名1=值1&参数名2=值2&... ，各参数之间以& 符号分割。 其实就是把改参数拼接到URL里面。
<br/>
<help:helpsearch name="postAddress3"  size="40"  helpid="helpUser" param="CORPORATION_ID=1" ismulti="true" value="" changefield="forhelp1#1,forhelp2#2"/>

<br/>
<hr/>
调用方式D：JS调用, 调用 help 函数
<br/>
<input type="text" name="forhelpjs1" value="" onclick=" forhelptest1()"  > 
<br/><hr/>

调用方式E：JS调用, 调用 URL ,多选
<br/>
<input type="text" name="forhelpjs2" value="" onclick="forhelptest(1)" > 

</html:form>
</widgets:container>

<script language="javascript">
function forhelptest1(){

  alert("选择帮助函数 help(helpId,parms,style,SEL_OPTS)");
 var win=help('test','CODE=11','','');
 if(win!=null){
  	for(var i=0;i<win.length;i++){
  		var ret=win[i];
  		alert("第"+i+"组数据开始");
  		for(var j=0;j<ret.length;j++){
  		   alert(ret[j]);	
  		   $('forhelpjs1').value=ret[j];
  		}
  		alert("第"+i+"组数据结束");
  	}
  }
}

function forhelptest(isCheckBox){
  var HELP_ID='for_cant';
  var cmdUrl="helpgridquery.cmd&clear=true&HELP_ID="+HELP_ID+"&isCheckBox="+isCheckBox;
   alert(cmdUrl);
 var url ="jsp/help.jsp?url="+cmdUrl;     
   url+="&CODE=110";
    // window.open(url);
 var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:640px;dialogHeight:480px"); 
 
  if(win!=null){
  	for(var i=0;i<win.length;i++){
  		var ret=win[i];
  		alert("第"+i+"组数据开始");
  		for(var j=0;j<ret.length;j++){
  		   alert(ret[j]);	
  		   $('forhelpjs2').value=ret[j];
  		}
  		alert("第"+i+"组数据结束");
  	}
  }
 
}



</script>