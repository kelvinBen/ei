<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.jcrontab.timer.data.*,java.util.*"%>

<%
String app=request.getContextPath();
//PFUser pfUser=(PFUser)session.getAttribute("pfuser");//�ڴ����������δ�
//style=pfUser.getCurrent_style();
if(request.getCharacterEncoding()==null)
	 request.setCharacterEncoding("GBK");	
 String msg = null;
 CrontabEntryBean entry = null;
 String task_name = request.getParameter("task_name");
 try{
   if(task_name != null){
		entry = CrontabEntryDAO.getInstance().find( task_name );
   }
 }catch(Exception e){ 	
    e.printStackTrace();
	msg = e.getMessage() + e;
 }
%>
<html>
<head>

<title>�޸�����ƻ�</title>
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
}

.td2{
cursor:hand;
border-left-style: outset; border-left-width: 2;
border-right-style: outset; border-right-width: 2;
border-top-style: outset; border-top-width: 2";
background-color:#e2e2e2;
}

-->
</style>
<script>
function forreturn(){
	window.history.back();

}


</script>
</head>

<body >
<% if(msg != null) {%>
<script language="javascript">
 alert("����<%=msg%>");
 document.location.href="listTask.jsp";
</script>
<%}%>

<% if(entry == null) {%>
<script language="javascript">
 alert("δ�ҵ�bean��<%=task_name%>" );
 document.location.href="listTask.jsp";
</script>
<%}%>

<% if(entry != null) {%>


<form name="form1" action="updateTask.jsp">
<table border="1"  cellpadding="0"  cellspacing="0" style="border-collapse: collapse;height:253;" bordercolor="#111111" width="100%" id="tblBody">
  <tr>
    <td >
 <table class="table6" width="100%" bgcolor="#3399FF" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td> <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td id="tda1" height="23" width="112" class="tabbg1" style="CURSOR:pointer;">�޸���������</td>
                    </tr>
                  </table></td>
              </tr>
            </table> 

    </td>
  </tr>
  <tr>
    <td align="center" height="208" valign="top">
      <table width="916" border="0" cellspacing="0" cellpadding="0">


<tr class="table7" align="right">
<td clos=5  >&nbsp;<input class="table7" type="submit" name="save" style="CURSOR: hand" value="��������" /></td>
<td clos=5  >&nbsp;<input class="table7" type="button" name="save" onclick="forreturn()" style="CURSOR: hand" value="����" /></td>
</tr>

  <tr>
    <td valign="top" width="499">
    
    <table border="0" cellspacing="4" cellpadding="0" style="border-style: outset; border-width: 1; border-right-style: outset; border-right-width: 2; border-bottom-style: outset; border-bottom-width: 2;">

    <tr>
          <td style="border-style: groove; border-width: 2" valign="top">
		  <table width="755" cellspacing="1" cellpadding="4"  height="103">
            <tr bgcolor="#CCCCCC">
              <td width="576" bgcolor="#6699CC"  colspan="8"><font color="#FFFFFF">��������</font></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td  nowrap width="100">�������ƣ�</td>
              <td  width="243" ><input type="text" name="taskName" size="28" value="<%=entry.getName()%>" readOnly></td>
              <td nowrap width="100"> ִ�з���(��/Bean)��</td>
              <td width="303" colspan="3"><input type="text" name="serviceid" size="46" value="<%=entry.getClassName()%>" onFocus="inStyle(this)" onBlur="outStyle(this)"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" >ִ�з�����</td>
              <td width="226" ><input type="text" name="method" size="28" value="<%=entry.getMethodName()%>"></td>
              <td nowrap  >������</td>
              <td width="352"   colspan="3"><%
     String[] extras = entry.getExtraInfo();
     StringBuffer para = new StringBuffer();
     if(extras!=null)
     for(int i =0; i< extras.length;i++){
       if( i > 0)
         para.append(" ");
       para.append(extras[i]);
     }
     %>
                  <input type="text" name="extra" size="46" value="<%=para.toString()%>"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="576"  colspan="8" bgcolor="#6699CC"><font color="#FFFFFF">�ճ̰���</font></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" ><p align="right">�£�</td>
              <td width="237" ><input type="text" name="month" size="29" value="<%=entry.getMonths()%>"></td>
              <td width="86" ><p align="right">�գ�</td>
              <td width="297"  colspan="3"><input type="text" name="day" size="46" value="<%=entry.getDaysOfMonth()%>"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" ><p align="right">�ܣ�</td>
              <td width="620"  colspan="8"><input type="text" name="week" size="29" value="<%=entry.getDaysOfWeek()%>"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" ><p align="right">ʱ��</td>
              <td width="237" ><input type="text" name="hour" size="29" value="<%=entry.getHours()%>"></td>
              <td width="100" ><p align="right">�֣�</td>
              <td width="297" ><input type="text" name="minute" size="46" value="<%=entry.getMinutes()%>"></td>
              <td width="86" ><p align="right">�룺</td>
              <td width="80" ><input type="text" name="second" size="10" value="<%=entry.getSeconds()%>"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="576"  colspan="8" bgcolor="#6699CC"><font color="#FFFFFF">����˵����</font></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td   colspan="8" >
			    ʱ��˵����<p> *      �� ���������¡��ա�ʱ����
                  <p> */n    �� ����ÿn�¡��ա�ʱ����
                  <p> n1-n2  �� ����n1(��...)��n2(��...)
                  <p> n1,n2  �� ����n1��n2(��...)
                  <p> ��      �� ����һ��������...�������ǵ�һ��������...�ܣ�����0��������                  
				  <p>  �������ƣ�����ָ����ʱ���������������Spring�����ļ��е�BeanId) 
				  <p> ִ�з���: ��ʾָ����������/Bean���еķ������������Ļ�������Ϊ��̬�����������Bean�Ļ����������ⷽ��
				  </td>
            </tr>
          </table></td>
  </tr>
</table>
</td>
</tr>
</table>
</table>
	</form>
<%}%>
</body>
</html>