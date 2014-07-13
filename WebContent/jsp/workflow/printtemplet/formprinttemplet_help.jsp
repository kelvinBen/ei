<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>表单打印模板列表</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<% 
    String formId = request.getParameter("formId");
	if (formId==null){
	  formId="";
	}
    String processType = request.getParameter("processType");
	if (processType==null){
	  processType="";
	}
%>
<div class="btnareaCss">
	<html:button onclick="selectOk()" name="btn_select" value="确定"></html:button>
	<html:button onclick="cancle()" name="btn_cancle" value="取消"></html:button>
</div>
<html:form name="frmList" action="formprinttemplethelp.cmd">
<INPUT type="hidden" name="formId" value="<%=formId%>">
<INPUT type="hidden" name="processType" value="<%=processType%>">
<flex:flexgrid name="grid" height="200" action="" isSubmit="true">
	<flex:radioCol caption="选择" width="50" property="ID"  name="primaryKey" sortName="FORMPRINTTEMPLET.ID"></flex:radioCol>
	<flex:flexCol caption='<%=ResourcesFactory.getString("FormPrintTemplet.TEMPLETNAME")%>' width="300" property="TEMPLETNAME" sortName="FORMPRINTTEMPLET.TEMPLETNAME"></flex:flexCol>
                    </flex:flexgrid>
<flex:pagePolit action="formprinttemplethelp.cmd" >
</flex:pagePolit>
</html:form>
<script language="javascript">
//setTitleInTreeBar('表单打印模板查询');
grid.show();
grid.setSumText("");
function cancle(){
	window.close();
}
function selectOk(){
  if(!getSelect()) return;
//隐性提交，取模板的详细信息
	var url = "formprinttemplet.cmd?method=detailHidden&primaryKey="+grid.getCheckLine();
  	var conn = new ActiveXObject("Microsoft.XMLHTTP");
	conn.open("GET", url, false);
    conn.send();
	window.returnValue = conn.responseText;
	window.close();
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
</script>