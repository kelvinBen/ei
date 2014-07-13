<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>

<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<%@ page import="net.mast.waf.ResourcesFactory"%>

<HTML>
<HEAD>
<TITLE>选择行政区划</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
 
<widgets:container title="行政区划" >
<html:form name="frmList" action="">

<widgets:containbutton onclick="clickOk()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="清除"></widgets:containbutton>

<support:flexgrid name="grid" height="240"  action="" isSubmit="true">

   <flex:radioCol caption="选择" width="40" property="cantCode"  name="primaryKey" sortName="PUB_CANT.CANT_CODE"></flex:radioCol>
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_CANT.CANT_CODE")%>' width="80" property="cantCode" sortName="PUB_CANT.CANT_CODE"></flex:flexCol>
   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_CANT.CANT_NAME")%>' width="220" property="cantName" sortName="PUB_CANT.CANT_NAME" style="text-align:left"></flex:flexCol>                          
</support:flexgrid>


</html:form>
</widgets:container>
<script language="javascript">
grid.show();
grid.setSumText("");
var key;


function clickOk(){
	if(!getSelect()) return;
	var returnV=new Array(2);
	returnV[0]=key[0];
	returnV[1]=key[2];
	window.returnValue=returnV;
	parent.close();
}

function clickCancel(){
    var returnV=new Array(2);
	returnV[0]="";
	returnV[1]="";
	window.returnValue=returnV;
	parent.close();
}
function forClose(){
 parent.close();
}

function getSelect(){
  var sel=grid.getCheckLine();
  var myall=grid.getCheckAll();
  var ob=myall.split(",");
  key=ob;
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