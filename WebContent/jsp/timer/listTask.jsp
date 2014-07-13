<%@ page import="net.mast.jcrontab.timer.data.*,net.mast.jcrontab.timer.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=GBK"%>

<%
String app=request.getContextPath();

	String state = null;
	String disabled = "";
	Crontab crontab = Crontab.getInstance();
	Map sorted  = null;
	String test = PropertyMgr.getTaskRunner();
	if( test == null ){
		sorted = new HashMap();
		state = "��ʱ��������δ����!" ;
		disabled = "disabled";
	}else{
		Map map = new HashMap();
		try{
			CrontabEntryBean[] listOfBeans = CrontabEntryDAO.getInstance().findAll();
			if( listOfBeans != null ){
			   for( int i = 0; i < listOfBeans.length; i ++){
			   	  if( listOfBeans[i] == null ){
			   	     System.out.println("listOfBeans["+i+"] is null.");
			   	  }
	  			  map.put( listOfBeans[i].getName(),listOfBeans[i]);
	  		   }
	  		}
	  	}catch(DataNotFoundException e){	  		
	  	}catch(Exception e){
	  		e.printStackTrace();
	  	}
		sorted = new TreeMap( map );
		if( Crontab.getInstance().isStarted( ) )
			state = "��ʱ��������";
		else
			state = "��ʱ����ֹͣ";
	}
%>
<html>
<head>
<!-- ����JS��CSS��ʽ-->

<title>����ƻ�</title>
<style>
<!--
.td1{
cursor:hand;
border-left-style: outset;
 border-left-width: 1;
border-right-style: outset;
 border-right-width: 1;
border-top-style: outset;
border-top-width: 1;
border-bottom: 1px solid #FFFFFF;
background-color:#eeeeee;
}

.td2{
cursor:hand;
border-left-style: outset; border-left-width: 2;
border-right-style: outset; border-right-width: 2;
border-top-style: outset; border-top-width: 2";
background-color:#FFFFFF;
}

-->
</style>
<script>
function startTask(){
	document.all.form1.action="startTask.jsp";
	document.all.form1.submit();
}
function stopTask(){
	document.all.form1.action="stopTask.jsp";
	document.all.form1.submit();
}
function removeTask(){
	document.all.form1.action="removeTask.jsp";
	document.all.form1.submit();
}
function newTask(){
	document.all.form1.action="taskForAdd.jsp";
	document.all.form1.submit();
}
function modifyTask(){
	document.all.form1.action="taskForUpdate.jsp";
	document.all.form1.submit();
}
function startSchedule(){
	document.all.form1.action="startSchedule.jsp";
	document.all.form1.submit();
}

function stopSchedule(){
	document.all.form1.action="stopSchedule.jsp";
	document.all.form1.submit();
}

function loadSchedule(){
	document.all.form1.action="loadSchedule.jsp";
	document.all.form1.submit();
}

</script>
</head>

<body  >

    <form name="form1" method="POST">
  
<table border="1" cellpadding="1"  cellspacing="0" style="border-collapse:collapse;"  bordercolor="#111111" width="100%" id="tblBody">
  <tr>
  <td>             
  <table class="table6" bgcolor="#3399FF" width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td> <table border="0"  cellpadding="0" cellspacing="0">
                    <tr>
                      <td id="tda1" height="23" width="112" class="tabbg1" style="CURSOR:pointer;">����ƻ�</td>
                    </tr>
                  </table></td>
              </tr>
            </table> 

  </td>

  </tr>
   <tr> <td align="center" valign="top">
    
    <table class="table7" align="right" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td class="button1" style="CURSOR: hand"><input type="button" name="start" value="��������" onclick="startTask()" <%=disabled%> /></td>
							<td class="button1" style="CURSOR: hand"><input type="button" name="stop" value="��ͣ����" onclick="stopTask()" <%=disabled%> />&nbsp; </td>
							<td class="button1" style="CURSOR: hand"><input type="button" name="add" value="����������" onclick="newTask()" <%=disabled%> />&nbsp; </td>
	                        <td class="button1" style="CURSOR: hand"><input type="button" name="delete" value="ɾ������" onclick="removeTask()" <%=disabled%> />&nbsp; </td>
                            <td class="button1" style="CURSOR: hand"><input type="button" name="modify" value="�޸�����" onclick="modifyTask()"  <%=disabled%> /></td>
                          </tr>
    </table>
    </td>
</tr>

  <tr>
    <td valign="top" align="center" >
    
    <table border="0" width="100%" cellspacing="4" cellpadding="0" style="border-style: outset; border-width: 1; border-right-style: outset; border-right-width: 2; border-bottom-style: outset; border-bottom-width:2;">

    <tr >
          <td  style="border-style: groove; border-width:2" valign="top"  width="100%">
     
    <table width="100%" cellspacing="1" cellpadding="4" >
            <tr bgcolor="#CCCCCC">

    <td width="60" bgColor="#008080" height="16"><font color="#ffff00">ѡ��</font></td>
    <td width="150" bgColor="#008080" height="16"><font color="#ffff00">��������</font></td>
    <td width="150" bgColor="#008080" height="16"><font color="#ffff00">ִ�з���(��/Bean)</font></td>
    <td width="350" bgColor="#008080" height="16"><font color="#ffff00">�ճ̰���</font></td>
    <td width="150" bgColor="#008080" height="16"><font color="#ffff00">����״̬</font></td>
     <td width="150" bgColor="#008080" height="16"><font color="#ffff00">ִ���ܴ���</font></td>
  </tr>
  <%
  	Iterator it = sorted.keySet().iterator();
	int i=0;
  	while( it.hasNext() ){
  		String key = (String)it.next();
		CrontabEntryBean entry = (CrontabEntryBean)sorted.get( key );
  %>
  <tr height="22"  class="<%if(i%2==0){%>td1<%}else{%>td2<%}%>"  >
     <td width="60" ><input type="checkbox" name="task_name" value="<%=entry.getName()%>"></td>
     <td width="150" ><%=entry.getName()%></td>
     <td width="150"  ><%=entry.getClassName()%>��</td>
     <td width="350" ><%=entry.toWellContent()%>��</td>
     <td width="150" ><%=entry.getState()%></td>
     <td width="150" ><%=entry.getRunCount()%></td>
  </tr>
  <%
	i++;  }
  %>

  <tr bgcolor="#eeeeee">
     <td width="210" height="16" colspan="2" bgColor="#008080"><font color="#ffff00">��ʱ��״̬</font></td>
     <td width="150"  height="16">
     <p align="center"><font color="#FF0000"><b><%=state%></b></font></td>
     <td width="350" colspan="3" height="16" bgcolor="#cccccc"> 
     <input type="button" name="startS" value="������ʱ��" onclick="startSchedule()"  <%=disabled%> />&nbsp;&nbsp; 
     <input type="button" name="stopS" value="ֹͣ��ʱ��" onclick="stopSchedule()"  <%=disabled%> />��
     <input type="button" name="stopS" value="��������" onclick="loadSchedule()" />��</td>
  </tr>

	</table>
    </td>
  </tr>
</table>
</td>
</tr>
</table>
</table>
	</form>
</body>
</html>