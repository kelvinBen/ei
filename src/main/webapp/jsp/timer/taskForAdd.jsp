
<%@ page contentType="text/html;charset=gb2312" %>
<%
String app=request.getContextPath();
String style="green";//Ĭ����ʽ
//PFUser pfUser=(PFUser)session.getAttribute("pfuser");//�ڴ����������δ�
//style=pfUser.getCurrent_style();
%>
<html>
<head>

<link href="skin.css" rel="stylesheet" type="text/css"/>
<title>������ƻ�</title>
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
<script language="javascript">
function forreturn(){
	window.history.back();

}


</script>
</head>

<body >

    <form name="form1" action="insertTask.jsp">
<table border="1"  cellpadding="0"  cellspacing="0" style="border-collapse: collapse;height:253;" bordercolor="#111111" width="100%" id="tblBody">
  <tr>
    <td >
 <table class="table6" width="100%" border="0" bgcolor="#3399FF" cellpadding="0" cebllspacing="0">
              <tr>
                <td> <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td id="tda1" height="23" width="112" class="tabbg1" style="CURSOR:pointer;"><b>����������</b></td>
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
<td clos=5  >&nbsp;<input class="table7" type="submit" name="save" style="CURSOR: hand" value="����������" /></td>
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
              <td  width="243" ><input type="text" name="taskName" size="28" value="" onFocus="inStyle(this)" onBlur="outStyle(this)"></td>
              <td nowrap width="100"> ִ�з���(��/Bean)��</td>
              <td width="303" colspan="3"><input type="text" name="serviceid" size="46" value="" onFocus="inStyle(this)" onBlur="outStyle(this)"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" >ִ�з�����</td>
              <td width="226" ><input type="text" name="method" size="28" value=""></td>
              <td nowrap  >������</td>
              <td width="352"   colspan="3">
                  <input type="text" name="extra" size="46" value="" onFocus="inStyle(this)" onBlur="outStyle(this)"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="576"  colspan="8" bgcolor="#6699CC"><font color="#FFFFFF">�ճ̰���</font></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" ><p align="right">�£�</td>
              <td width="237" ><input type="text" name="month" size="29" value="*"></td>
              <td width="86" ><p align="right">�գ�</td>
              <td width="297"  colspan="3"><input type="text" name="day" size="46" value="*"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" ><p align="right">�ܣ�</td>
              <td width="620"  colspan="8"><input type="text" name="week" size="29" value="*"></td>
            </tr>
            <tr bgcolor="#eeeeee">
              <td width="100" ><p align="right">ʱ��</td>
              <td width="237" ><input type="text" name="hour" size="29" value="*"></td>
              <td width="100" ><p align="right">�֣�</td>
              <td width="297" ><input type="text" name="minute" size="46" value="*"></td>
              <td width="86" ><p align="right">�룺</td>
              <td width="80" ><input type="text" name="second" size="10" value="0"></td>
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
</body>
</html>