<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<% String corporationId=(String)request.getAttribute("corporationId");%>
<HTML>
<HEAD>
<TITLE>��Ȩ�޷��ʲ˵��Ľ�ɫ���û�ͳ�Ʊ�</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��Ȩ�޷��ʲ˵��Ľ�ɫ���û�ͳ�Ʊ�" >
<bsp:containbutton text="��ѯ" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">��Ȩ�޷��ʲ˵��Ľ�ɫ���û�ͳ�Ʊ�</font>
    <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">�˵���</td>
                       <td class="tdRight" align="center"><html:hidden name="menuId" value="" write="false"/><html:text name="menuText"  value="" size="20" maxlength="20"  readonly="true" ondblclick="clean1()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectMenu()"></td>
                    </tr>   
                    <tr>
                       <td class="tdTitle">�û��ʻ�����������</td>
                       <td class="tdRight" align="center"><html:hidden name="departmentId" value="" write="false"/><html:text name="departmentName"  value="" size="20" maxlength="20"  readonly="true" ondblclick="clean2()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectDepartment()"></td>
                    </tr>                               
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function clean1(){
	document.forms[0].menuId.value="";   
	document.forms[0].menuText.value=""; 	
}
function clean2(){
	document.forms[0].departmentId.value="";   
	document.forms[0].departmentName.value=""; 	
}
function forQuery(){
  var menuId = document.forms[0].menuId;
  if(menuId.value=="")
  {
  	alert("��ѡ��˵�����в�ѯ��");
      menuId.value="";
      menuId.select();
      return;
  }
  var departmentId = document.forms[0].departmentId;
  if(departmentId.value=="")
  {
  	alert("��ѡ���û��ʻ�������������в�ѯ��");
      departmentId.value="";
      departmentId.select();
      return;
  }
  document.forms[0].action ="menuvisitor.cmd?method=query";     
  document.forms[0].submit();
}
function selectDepartment(){
    var url="user.cmd?method=getStruUserRoot&isSelect=1";
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
    if(win==null)
       return;
    document.all("departmentId").value=win[2];
    document.all("departmentName").value=win[1];
}
function selectMenu(){
	var url ="menuhelp.cmd?method=getRoot";
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
    if(win==null)
       return;
    document.all("menuId").value=win[0];
    document.all("menuText").value=win[1];
}
</script>