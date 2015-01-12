<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<HTML>
<HEAD>
<TITLE>选择需要的系统菜单项</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="请选择您所需要的菜单项" >
<bsp:containbutton text="确定" onclick="clickOk()"></bsp:containbutton>
<bsp:containbutton text="关闭" onclick="forClose()"></bsp:containbutton> 
    <div align="center">
    <font size="5pt"></font>
    <table cellpadding="0" class="tblContent">      
                    <tr>
                       <td class="tdTitle">系统菜单：</td>
                       <td class="tdRight" align="center">
                       <html:select name="typeId" value="" onchange="menuSysOnChang()">
                           <html:options collection="menuTypeList" labelProperty="typeName" property="typeId"/>
                       </html:select>
                       <html:hidden name="typeName" value=""/>
                       </td>
                    </tr>  				
                    <tr>
                       <td class="tdTitle">菜单项：</td>
                       <td class="tdRight" align="center"><html:hidden name="menuSysId" value="" write="false"/><html:text name="menuText"  value="" size="20" maxlength="20"  readonly="true" ondblclick="clean1()"/> <img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectMenu()"></td>
                    </tr>   
    </table>
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function menuSysOnChang(){
	document.forms[0].menuSysId.value="";
	document.forms[0].menuText.value="";
}
function clickOk(){
  	var menuSysId=document.all.menuSysId.value;
  	if(menuSysId=="")
  {
  	  alert("请选择菜单项！");
      return;
  }
window.returnValue=menuSysId;
parent.close();
}

function selectMenu(){
	var typeId = document.forms[0].typeId.value;
	var url ="menusys.cmd?method=getMenuSysRootHelp&menuTypeId="+typeId+"&isCheckBox=1"+"&isAll=1";
    var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
    if(win==null)
       return;
    document.all("menuSysId").value=win[0];
    document.all("menuText").value=win[1];
}

function forClose(){
    parent.close();
}
</script>