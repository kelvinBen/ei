<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>

<HTML>
<HEAD>
<TITLE>��������ʾ��</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>

<%
Map map = new HashMap();
map.put("viewprop","����ֵ");
map.put("dateprop",new Date());
request.setAttribute("html.data", map);
%>
<widgets:container title="����ʾ��" >

<html:form name="frmList" action="cantquery.cmd">


<br/>
���÷�ʽA��Ƕ���ı����У��ñ�ǩ���ɵģʣӵ��ã�JS�������� name+"_dialog"  ,����name Ϊ������ǩ��name ����
<br/>
<input type="text" name="forhelp1" value="" onclick="postAddress_dialog()"  size=50> <input type="text" name="forhelp2" value="" > 
(help��ǩ������div��)
<div style="display:none" >
<help:helpsearch name="postAddress"  size="40"  helpid="helpUserNoPub" ismulti="false" value="" changefield="forhelp1#1,forhelp2#2"/>
</div>
<hr/>
<br/>���÷�ʽ�£�ֻ��ʾѡ��ť�� ������Ȼ�����ڱ�ǩ��name ��,����������״̬�� ��ѡ������ismulti="true" ,�����õĻ�Ĭ��Ϊ��ѡ
<br/><help:helpsearch name="postAddress2" style="display:none" size="40"  helpid="helpUserNoPub" ismulti="true" value="" changefield="forhelp1#1,forhelp2#2"/>
<hr/>
<br/>
<br/>���÷�ʽC�������ı���һ����ʾ����ǰ�ı�����Ǳ������Ҫ�ύ����,���û��Զ������,ѡ�������Ҫ���붯̬����������дparam ����,
<br/>param���Ե���д��ʽ��������1=ֵ1&������2=ֵ2&... ��������֮����& ���ŷָ ��ʵ���ǰѸĲ���ƴ�ӵ�URL���档
<br/>
<help:helpsearch name="postAddress3"  size="40"  helpid="helpUser" param="CORPORATION_ID=1" ismulti="true" value="" changefield="forhelp1#1,forhelp2#2"/>

<br/>
<hr/>
���÷�ʽD��JS����, ���� help ����
<br/>
<input type="text" name="forhelpjs1" value="" onclick=" forhelptest1()"  > 
<br/><hr/>

���÷�ʽE��JS����, ���� URL ,��ѡ
<br/>
<input type="text" name="forhelpjs2" value="" onclick="forhelptest(1)" > 

</html:form>
</widgets:container>

<script language="javascript">
function forhelptest1(){

  alert("ѡ��������� help(helpId,parms,style,SEL_OPTS)");
 var win=help('test','CODE=11','','');
 if(win!=null){
  	for(var i=0;i<win.length;i++){
  		var ret=win[i];
  		alert("��"+i+"�����ݿ�ʼ");
  		for(var j=0;j<ret.length;j++){
  		   alert(ret[j]);	
  		   $('forhelpjs1').value=ret[j];
  		}
  		alert("��"+i+"�����ݽ���");
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
  		alert("��"+i+"�����ݿ�ʼ");
  		for(var j=0;j<ret.length;j++){
  		   alert(ret[j]);	
  		   $('forhelpjs2').value=ret[j];
  		}
  		alert("��"+i+"�����ݽ���");
  	}
  }
 
}



</script>