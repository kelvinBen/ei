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
      <TH colSpan=2>初&nbsp;始&nbsp;化&nbsp;数&nbsp;据&nbsp;库</TH>
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

<BUTTON class=btn id=btnClear accessKey=R name=btnClear type=reset>重&nbsp;置</BUTTON> 
<BR>
<hr>
  <TABLE class=Form>
    <COLGROUP> <COL width="50%"> <COL width="50%"><TBODY> 
    <TR algin="right"> 
      <TD algin="right" colSpan=2 align="center">使用配置文件中的数据源连接数据库,数据源beanId为：
	   <input accesskey=Z name=dataSource  maxlength="30" value="dataSource"><br><hr>
	  </TD>

    </TR>
 	<tr> 
    <td class=Field> 
		<BUTTON class=btn id=btnSave3 accessKey=S name=btnSave3 type=button  onClick="OnSubmit31()">进行初始化数据</BUTTON>
	</td>
      <td class=Field> 
      	<BUTTON class=btn id=btnSave33 accessKey=S name=btnSave33 type=button  onClick="OnSubmit32()">自定义SQL的执行</BUTTON> 
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
      <TD class=sep1 colSpan=2 align="center">直接连接数据库<BR>  <HR></TD>
	  
    </TR>
    <tr> 
      <td>数据库类型</td>
      <td class=Field> 
        <select name=dbtype>
			<option value="1" >SqlServer</option>
			<option value="2">Oracle</option>
			<option value="3" selected>IBM_db2(应用服务器安装了客户端)</option>
			<option value="4">IBM_db2_type4（应用服务器未安装客户端）</option>
			<option value="jndi">使用JNDI连接</option>
			<option value="dataSource">使用使用配置文件中的数据源连接数据库连接</option>
		</select>
      </td>
    </tr>
    <tr> 
      <td>数据库服务器IP</td>
      <td class=Field> 
        <input accesskey=Z name=dbserver  maxlength="20" value="127.0.0.1">
      </td>
    </tr>
    <tr> 
      <td>数据库名称</td>
      <td class=Field> 
        <input accesskey=Z name=dbname  maxlength="20" value="mast">
      </td>
    </tr>
    <tr> 
      <td>用户名</td>
      <td class=Field> 
        <input accesskey=Z name=username  maxlength="20" value="sa">
      </td>
    </tr>
    <tr> 
      <td>密码</td>
      <td class=Field> 
        <input accesskey=Z type=password name=password  maxlength="20" value="">
      </td>
    </tr>
	    <tr> 
      <td>使用现有数据库</td>
      <td class=Field> 
      	<BUTTON class=btn id=btnSave1 accessKey=S name=btnSave1 type=button  onClick="OnSubmit11()">开始创建初始化数据</BUTTON> 
      &nbsp;
      	<BUTTON class=btn id=btnSave11 accessKey=S name=btnSave11 type=button  onClick="OnSubmit12()">连接数据库,并执行自定义SQL</BUTTON> 
      </td>
    </tr>

    </TBODY> 


  </TABLE>

<hr>

<TABLE class=Form>
    <COLGROUP> <COL width="20%"> <COL width="80%"><TBODY> 
    <TR class=Separator> 
      <TD class=sep1 colSpan=2 align="center">使用JNDI<BR><HR></TD>
    </TR>
    <tr> 
      <td>JNDI类型</td>
      <td class=Field> 
        <select name=jndiType>			
			<option value="1" selected>&nbsp;Websphere,Weblogic下使用JNDI&nbsp;</option>
			<option value="2">&nbsp;Tomcat下面使用JNDI&nbsp;</option>
		</select>
      </td>
    </tr>
    <tr> 
      <td>JNDI名称</td>
      <td class=Field> 
        <input accesskey=Z name=jndiName  maxlength="20" value="">
      </td>
    </tr>
      <tr> 
      <td>  使用JNDI连接  </td>
      <td class=Field> 
     <BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button  onClick="OnSubmit21()">开始创建初始化数据</BUTTON>&nbsp;&nbsp;
      
      	<BUTTON class=btn id=btnSave22 accessKey=S name=btnSave22 type=button  onClick="OnSubmit22()">连接数据库,并执行自定义SQL</BUTTON> 
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
使用说明:<BR>
请将初始化数据文件放置在当前应用的根目录下的sql 文件夹下面。<BR>
例如：应用abc,它在服务器上的文件路径为：D:\Tomcat\webapps\abc&nbsp;，那么则将初始化数据的文件放在D:\Tomcat\webapps\abc\sql\　&nbsp;下面。（如果没有sql文件夹，则建立一个就可以了。）<BR>
初始化数据文件名称最好以数字为前缀，按照执行的先后顺序排序。<BR>
《初始化数据》按钮被点击后，会按照sql目录下面的文件名的顺序，依次执行这些目录下面的SQL脚本。
可以支持脚本语言多级目录存放。通过文件名和文件目录名来决定这些脚本的先后执行顺序。
sql目录下面分多种数据库脚本，对于不同类型的数据库需要单独存放各自的脚本。分别是DB2，Sybase，SqlServer，Oracle 目录名不要改
<br>
另外执行初始化数据脚本前，请先建好数据库。~_~
</FONT>
<HR>
<SCRIPT language="javascript">
function check(){
var dbserver= document.frmMain.dbserver.value;

if(dbserver==""){
	alert("请输入数据库服务器IP!");
	return false;
}

var username= document.frmMain.username.value;

if(username==""){
	alert("请输入用户名!");
	return false;
}
var dbname= document.frmMain.dbname.value;
if(dbname==""){
	alert("请输入数据库名!");
	return false;
}

var dbtype= document.frmMain.dbtype;
if(dbtype.value=="jndi"){	
		alert("使用JNDI，请填写下面的JNDI名称信息，并点击下面\"开始创建\"按钮");
		dbtype.select();
		dbtype.focus();
		return false;
}

 return true;
}

function check2(){
var jndiName= document.frmMain.jndiName.value;

if(jndiName==""){
	alert("请输入JNDI名称!");
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
