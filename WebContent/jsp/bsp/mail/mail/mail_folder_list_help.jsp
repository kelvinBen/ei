<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<table   width="100%" class="TabTitleCss" valign=top height=28 cellspacing=0 cellpadding=0>
<TR>
	<TD valign="top"><img src="<mast:ui img='hdReport.gif'/>" height=10>&nbsp;<span id="tdBar">文件夹列表</span></td></tr>
<tr>
</table>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<% 
  
	String fullName = (String)request.getAttribute("fullName");

	String url = "mailresource.cmd?method=mailFolderList&fullName="+fullName;
%>

<html:form name="frmList" action="<%=url%>">

<table id="tblSearch">
<flex:search>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="400" action="" isSubmit="false">
			<flex:radioCol caption="选择" width="50" name="folderFullName" property="folderFullName" sortName="folder.folderFullName"></flex:radioCol>
                        <flex:flexCol caption='文件夹' width="100" property="folder" sortName="folder.folder"></flex:flexCol>
        </support:flexgrid>
<flex:pagePolit action="<%=url%>">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center><table width=100%>
<tr><td><p align="center">
<button name="btnClose" onclick="doConfirm()"  class="advbutton">确 定</button>
<button name="btnClose" onclick="forCancel()"  class="advbutton">取消</button>
</p></td></tr></table></div>

</html:form>
<script language="javascript">
grid.show();
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert('你还没选择文件夹！');
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert('只能选择一个文件夹！');
    return false;
  }  
  return true;
}
function doConfirm(){
	if(!getSelect()) return;
	var row=grid.getCheckAll();
	var folder=row.split(",");
	var result = new Array();
	result[0]=folder[0];	 
	parent.returnValue = result;
	parent.close();
}
function forCancel(){
	parent.close();
}

</script>