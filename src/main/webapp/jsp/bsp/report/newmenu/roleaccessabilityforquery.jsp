<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<% 
String departmentId = (String)request.getAttribute("departmentId");
String departmentName = (String)request.getAttribute("departmentName");
%>
<HTML>
<HEAD>
<TITLE>��ɫ����������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="��ɫ����������" >
<bsp:containbutton text="��ѯ" onclick="forQuery()"></bsp:containbutton>
    <div align="center">
    <font size="5pt">��ɫ����������</font>
    <table cellpadding="0" class="tblContent">    				
                    <tr>
                       <td class="tdTitle">��ɫ��</td>
                       <td class="tdRight" align="center">
                       <html:select name="roleId" value="">
                           <html:options collection="allRoleList" labelProperty="roleAlias" property="roleId"/>
                       </html:select>
                       <html:hidden name="roleAlias" value=""/>
                       </td>
                    </tr>    
                    <tr>
                       <td class="tdTitle">ϵͳ�˵���</td>
                       <td class="tdRight" align="center">
                       <html:select name="typeId" value="">
                           <html:options collection="allMenuTypeList" labelProperty="typeName" property="typeId"/>
                       </html:select>
                       <html:hidden name="typeName" value=""/>
                       </td>
                    </tr>              
                    <tr>
                       <td class="tdTitle">�û��ʻ�����������</td>
                       <td class="tdRight" align="center"><html:hidden name="departmentId" value="<%=departmentId%>" write="false"/><html:text name="departmentName"  value="<%=departmentName%>" size="20" maxlength="20"  readonly="true" ondblclick="clean2()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectDepartment()"></td>
                    </tr>                        
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forQuery(){
  var select1 = document.getElementById("roleId");
  document.forms[0].roleAlias.value = select1.options[select1.selectedIndex].innerText; 
  
  var select2 = document.getElementById("typeId");
  document.forms[0].typeName.value = select2.options[select2.selectedIndex].innerText;
  
  var departmentId = document.all("departmentId").value;
  if(departmentId == ""){
	  alert("�û��ʻ�������������Ϊ�գ�");
      return false;
  }
  
  document.forms[0].action ="roleaccessability.cmd?method=query";     
  document.forms[0].submit();
}
function selectDepartment(){
    var url="userhelp.cmd?method=getStruUserRoot";
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
    if(win==null)
       return;
    document.all("departmentId").value=win[2];
    document.all("departmentName").value=win[1];
}
</script>