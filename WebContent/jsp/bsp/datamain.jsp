<%@ page import="net.mast.waf.RF"%>

<%
//huangdy 2006-2-9 create huangdy@langchao.com
//response.setHeader("cache-control", "no-cache");
//response.setHeader("pragma", "no-cache");
//response.setHeader("expires", "Mon 1 Jan 1990 00:00:00 GMT");
%>

<HTML><HEAD>


</head>

	

<body topmargin="10px" bgcolor="#eff7ff">
<DIV class=HdrProps>
  <TABLE class=Form>
    <COLGROUP> <COL width="20%"> <COL width="80%"><TBODY> 
    <TR class=Section> 
      <TH colSpan=2><%=RF.get("bspother.init_db") %></TH>
    </TR>
    </TBODY> 
  </TABLE>
</DIV>

<hr>

<FORM style="MARGIN-TOP: 0px" name=frmMain method=post action="initing.jsp">
<div>

<BUTTON class=btn id=btnClear accessKey=R name=btnClear type=reset><%=RF.get("bspother.reset") %></BUTTON> 
<BR>
<hr>
  <TABLE class=Form>
    <COLGROUP> <COL width="50%"> <COL width="50%"><TBODY> 
    <TR class=Separator> 
      <TD class=sep1 colSpan=2 align="center"><%=RF.get("bspother.use_config_connect_db") %><BR>  <HR></TD>
    </TR>
 	<tr> 
    <td class=Field> 
		<BUTTON class=btn id=btnSave3 accessKey=S name=btnSave3 type=button  onClick="OnSubmit31()"><%=RF.get("bspother.init_data") %></BUTTON>
	</td>
      <td class=Field> 
      	<BUTTON class=btn id=btnSave33 accessKey=S name=btnSave33 type=button  onClick="OnSubmit32()"><%=RF.get("bspother.custom_sql_execute") %></BUTTON> 
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
      <TD class=sep1 colSpan=2 align="center"><%=RF.get("bspother.direct_connect_db") %><BR>  <HR></TD>
	  
    </TR>
    <tr> 
      <td><%=RF.get("bspother.db_type") %></td>
      <td class=Field> 
        <select name=dbtype>
			<option value="1" >SqlServer</option>
			<option value="2">Oracle</option>
			<option value="3" selected>IBM_db2<%=RF.get("bspother.install_client") %></option>
			<option value="4">IBM_db2_type4<%=RF.get("bspother.uninstall_client") %></option>
			<option value="jndi"><%=RF.get("bspother.use_jndi_connection") %></option>
			<option value="dataSource"><%=RF.get("bspother.use_config_connect_db") %></option>
		</select>
      </td>
    </tr>
    <tr> 
      <td><%=RF.get("SYS.DATABASESERVER") %>IP</td>
      <td class=Field> 
        <input accesskey=Z name=dbserver  maxlength="20" value="127.0.0.1">
      </td>
    </tr>
    <tr> 
      <td><%=RF.get("SYS.DATABASENAME") %></td>
      <td class=Field> 
        <input accesskey=Z name=dbname  maxlength="20" value="loushang">
      </td>
    </tr>
    <tr> 
      <td><%=RF.get("SYS.USERNAME") %></td>
      <td class=Field> 
        <input accesskey=Z name=username  maxlength="20" value="sa">
      </td>
    </tr>
    <tr> 
      <td><%=RF.get("SYS.PASSWORD") %></td>
      <td class=Field> 
        <input accesskey=Z type=password name=password  maxlength="20" value="">
      </td>
    </tr>
	    <tr> 
      <td><%=RF.get("bspother.use_now_db") %></td>
      <td class=Field> 
      	<BUTTON class=btn id=btnSave1 accessKey=S name=btnSave1 type=button  onClick="OnSubmit11()"><%=RF.get("bspother.start_create_init_data") %></BUTTON> 
      &nbsp;
      	<BUTTON class=btn id=btnSave11 accessKey=S name=btnSave11 type=button  onClick="OnSubmit12()"><%=RF.get("bspother.connect_db_execute_sql") %></BUTTON> 
      </td>
    </tr>

    </TBODY> 


  </TABLE>

<hr>

<TABLE class=Form>
    <COLGROUP> <COL width="20%"> <COL width="80%"><TBODY> 
    <TR class=Separator> 
      <TD class=sep1 colSpan=2 align="center">JNDI<BR><HR></TD>
    </TR>
    <tr> 
      <td><%=RF.get("bspother.jndi_type") %></td>
      <td class=Field> 
        <select name=jndiType>			
			<option value="1" selected>&nbsp;Websphere,Weblogic&nbsp;</option>
			<option value="2">&nbsp;Tomcat&nbsp;</option>
		</select>
      </td>
    </tr>
    <tr> 
      <td><%=RF.get("bspother.jndi_name") %></td>
      <td class=Field> 
        <input accesskey=Z name=jndiName  maxlength="20" value="">
      </td>
    </tr>
      <tr> 
      <td><%=RF.get("bspother.use_jndi_connection") %></td>
      <td class=Field> 
     <BUTTON class=btn id=btnSave2 accessKey=S name=btnSave2 type=button  onClick="OnSubmit21()"><%=RF.get("bspother.start_create_init_data") %></BUTTON>&nbsp;&nbsp;
      
      	<BUTTON class=btn id=btnSave22 accessKey=S name=btnSave22 type=button  onClick="OnSubmit22()"><%=RF.get("bspother.connect_db_execute_sql") %></BUTTON> 
      </td>
    </tr>
    </TBODY> 

  </TABLE>

  </FORM>

	<DIV>
	<font color=red size=2>

	</font>
	</DIV>
<HR>
<!--
<FONT SIZE="3" COLOR="#3333FF">
<%=RF.get("bspother.use_note") %><BR>
<%=RF.get("bspother.hints1") %><BR>
<%=RF.get("bspother.hints2") %><BR>
<%=RF.get("bspother.hints3") %><BR>
<%=RF.get("bspother.hints4") %> <BR>
<%=RF.get("bspother.hints5") %><BR>
<%=RF.get("bspother.hints6") %><BR>
<%=RF.get("bspother.hints7") %><BR>
<%=RF.get("bspother.hints8") %><BR>
<%=RF.get("bspother.hints9") %><BR>
<%=RF.get("bspother.hints10") %><BR>
<%=RF.get("bspother.hints11") %><BR>
<%=RF.get("bspother.hints12") %><BR>
<%=RF.get("bspother.hints13") %>

</FONT>  -->
<HR>
<SCRIPT language="javascript">
function check(){
var dbserver= document.frmMain.dbserver.value;

if(dbserver==""){
	alert('<%=RF.get("bspother.check1")%>');
	return false;
}

var username= document.frmMain.username.value;

if(username==""){
	alert('<%=RF.get("bspother.check2")%>');
	return false;
}
var dbname= document.frmMain.dbname.value;
if(dbname==""){
	alert('<%=RF.get("bspother.check3")%>');
	return false;
}

var dbtype= document.frmMain.dbtype;
if(dbtype.value=="jndi"){	
		alert('<%=RF.get("bspother.check4")%>');
		dbtype.select();
		dbtype.focus();
		return false;
}

 return true;
}

function check2(){
var jndiName= document.frmMain.jndiName.value;

if(jndiName==""){
	alert('<%=RF.get("bspother.check5")%>');
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



</script>
</BODY>
</HTML>
