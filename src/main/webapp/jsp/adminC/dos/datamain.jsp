<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
// 2010-2-9 
%>

<HTML><HEAD>

<META http-equiv=Content-Type content="text/html; charset=GBK">

</head>

	

<body topmargin="10px" bgcolor="#eff7ff">
<DIV class=HdrProps>
  <TABLE class=Form>
    <COLGROUP> <COL width="20%"> <COL width="80%"><TBODY> 
    <TR class=Section> 
      <TH colSpan=2>��&nbsp;ʼ&nbsp;��&nbsp;��&nbsp;��&nbsp;��</TH>
    </TR>
    </TBODY> 
  </TABLE>
</DIV>

<hr>

<FORM style="MARGIN-TOP: 0px"  name=frmMain method=post action="initing.jsp">
<!--
<FORM style="MARGIN-TOP: 0px" enctype="multipart/form-data" name=frmMain method=post action="initing.jsp" >
-->
<div>

<BUTTON class=btn id=btnClear accessKey=R name=btnClear type=reset>��&nbsp;��</BUTTON> 
<BR>
<hr>
  <TABLE class=Form>
    <COLGROUP> <COL width="50%"> <COL width="50%"><TBODY> 
    <TR algin="right"> 
      <TD algin="right" colSpan=2 align="center">ʹ�������ļ��е�����Դ�������ݿ�,����ԴbeanIdΪ��
	   <input accesskey=Z name=dataSource  maxlength="30" value="dataSource"><br><hr>
	  </TD>

    </TR>
 	<tr> 
    <td class=Field> 
		<BUTTON class=btn id=btnSave3 accessKey=S name=btnSave3 type=button  onClick="OnSubmit31()">���г�ʼ������</BUTTON>
	</td>
      <td class=Field> 
      	<BUTTON class=btn id=btnSave33 accessKey=S name=btnSave33 type=button  onClick="OnSubmit32()">�Զ���SQL��ִ��</BUTTON> 
   </td>
    </tr>
    </TBODY> 
  </TABLE>

</div>
<br>
   <hr>
  <TABLE class=Form>
    <COLGROUP> <COL width="20%"> <COL width="80%"><TBODY> 
    <TR class=Separator> 
      <TD class=sep1 colSpan=2 align="center">ֱ���������ݿ�<BR>  <HR></TD>
	  
    </TR>
    <tr> 
      <td>���ݿ�����</td>
      <td class=Field> 
        <select name=dbtype>
			<option value="1" >SqlServer</option>
			<option value="2">Oracle</option>
			<option value="3" selected>IBM_db2(Ӧ�÷�������װ�˿ͻ���)</option>
			<option value="4">IBM_db2_type4��Ӧ�÷�����δ��װ�ͻ��ˣ�</option>
			<option value="jndi">ʹ��JNDI����</option>
			<option value="dataSource">ʹ��ʹ�������ļ��е�����Դ�������ݿ�����</option>
		</select>
      </td>
    </tr>
    <tr> 
      <td>���ݿ������IP</td>
      <td class=Field> 
        <input accesskey=Z name=dbserver  maxlength="20" value="127.0.0.1">
      </td>
    </tr>
    <tr> 
      <td>���ݿ�����</td>
      <td class=Field> 
        <input accesskey=Z name=dbname  maxlength="20" value="mast">
      </td>
    </tr>
    <tr> 
      <td>�û���</td>
      <td class=Field> 
        <input accesskey=Z name=username  maxlength="20" value="sa">
      </td>
    </tr>
    <tr> 
      <td>����</td>
      <td class=Field> 
        <input accesskey=Z type=password name=password  maxlength="20" value="">
      </td>
    </tr>
	    <tr> 
      <td>ʹ���������ݿ�</td>
      <td class=Field> 
      	<BUTTON class=btn id=btnSave1 accessKey=S name=btnSave1 type=button  onClick="OnSubmit11()">��ʼ������ʼ������</BUTTON> 
      &nbsp;
      	<BUTTON class=btn id=btnSave11 accessKey=S name=btnSave11 type=button  onClick="OnSubmit12()">�������ݿ�,��ִ���Զ���SQL</BUTTON> 
      </td>
    </tr>

    </TBODY> 


  </TABLE>

<hr>

<TABLE class=Form>
    <COLGROUP> <COL width="20%"> <COL width="80%"><TBODY> 
    <TR class=Separator> 
      <TD class=sep1 colSpan=2 align="center">ʹ��JNDI<BR><HR></TD>
    </TR>
    <tr> 
      <td>JNDI����</td>
      <td class=Field> 
        <select name=jndiType>			
			<option value="1" selected>&nbsp;Websphere,Weblogic��ʹ��JNDI&nbsp;</option>
			<option value="2">&nbsp;Tomcat����ʹ��JNDI&nbsp;</option>
		</select>
      </td>
    </tr>
    <tr> 
      <td>JNDI����</td>
      <td class=Field> 
        <input accesskey=Z name=jndiName  maxlength="20" value="">
      </td>
    </tr>
      <tr> 
      <td>  ʹ��JNDI����  </td>
      <td class=Field> 
     <BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button  onClick="OnSubmit21()">��ʼ������ʼ������</BUTTON>&nbsp;&nbsp;
      
      	<BUTTON class=btn id=btnSave22 accessKey=S name=btnSave22 type=button  onClick="OnSubmit22()">�������ݿ�,��ִ���Զ���SQL</BUTTON> 
      </td>
    </tr>
    </TBODY> 

  </TABLE>
<HR>


  </FORM>

	<DIV>
	<font color=red size=2>

	</font>
	</DIV>
<HR>
<FONT SIZE="3" COLOR="#3333FF">
ʹ��˵��:<BR>
�뽫��ʼ�������ļ������ڵ�ǰӦ�õĸ�Ŀ¼�µ�sql �ļ������档<BR>
���磺Ӧ��abc,���ڷ������ϵ��ļ�·��Ϊ��D:\Tomcat\webapps\abc&nbsp;����ô�򽫳�ʼ�����ݵ��ļ�����D:\Tomcat\webapps\abc\sql\��&nbsp;���档�����û��sql�ļ��У�����һ���Ϳ����ˡ���<BR>
��ʼ�������ļ��������������Ϊǰ׺������ִ�е��Ⱥ�˳������<BR>
����ʼ�����ݡ���ť������󣬻ᰴ��sqlĿ¼������ļ�����˳������ִ����ЩĿ¼�����SQL�ű���
����֧�ֽű����Զ༶Ŀ¼��š�ͨ���ļ������ļ�Ŀ¼����������Щ�ű����Ⱥ�ִ��˳��
sqlĿ¼����ֶ������ݿ�ű������ڲ�ͬ���͵����ݿ���Ҫ������Ÿ��ԵĽű����ֱ���DB2��Sybase��SqlServer��Oracle Ŀ¼����Ҫ��
<br>
����ִ�г�ʼ�����ݽű�ǰ�����Ƚ������ݿ⡣~_~
</FONT>
<HR>
<SCRIPT language="javascript">
function check(){
var dbserver= document.frmMain.dbserver.value;

if(dbserver==""){
	alert("���������ݿ������IP!");
	return false;
}

var username= document.frmMain.username.value;

if(username==""){
	alert("�������û���!");
	return false;
}
var dbname= document.frmMain.dbname.value;
if(dbname==""){
	alert("���������ݿ���!");
	return false;
}

var dbtype= document.frmMain.dbtype;
if(dbtype.value=="jndi"){	
		alert("ʹ��JNDI������д�����JNDI������Ϣ�����������\"��ʼ����\"��ť");
		dbtype.select();
		dbtype.focus();
		return false;
}

 return true;
}

function check2(){
var jndiName= document.frmMain.jndiName.value;

if(jndiName==""){
	alert("������JNDI����!");
	return false;
}
 return true;
}
function diableButton(){
		document.frmMain.btnSave1.disabled = true;
		document.frmMain.btnSave11.disabled = true;
		document.frmMain.btnSave2.disabled = true;
		document.frmMain.btnSave22.disabled = true;
		document.frmMain.btnSave3.disabled = true;
		document.frmMain.btnSave33.disabled = true;
}

function OnSubmit11(){
	if(!check()) return;
        diableButton();
		document.frmMain.submit();
}

function OnSubmit21(){
	if(!check2()) return;
	var dbtype=document.frmMain.dbtype;		
		dbtype.value="jndi";
		diableButton();
		document.frmMain.submit();
}

function OnSubmit31(){

	var dbtype=document.frmMain.dbtype;	
		dbtype.value="dataSource";
		diableButton();
		document.frmMain.submit();
}
function OnSubmit12(){
	if(!check()) return;
	document.frmMain.action="loadsql.jsp";
        diableButton();
		document.frmMain.submit();
}

function OnSubmit22(){
	if(!check2()) return;
	var dbtype=document.frmMain.dbtype;
	document.frmMain.action="loadsql.jsp";		
		dbtype.value="jndi";
		diableButton();
		document.frmMain.submit();
}
function OnSubmit32(){

	var dbtype=document.frmMain.dbtype;		
	document.frmMain.action="loadsql.jsp";
		dbtype.value="dataSource";
		diableButton();
		document.frmMain.submit();
}

function OnSubmitUpload(){

	var dbtype=document.frmMain.dbtype;		
	document.frmMain.action="test.jsp";
		dbtype.value="dataSource";
		diableButton();
		document.frmMain.submit();
}


</script>
</BODY>
</HTML>
