<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-sotower" prefix="sotower"%>
<%@ taglib uri="/tags/sotower-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ page import="org.sotower.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>����ģ�Ͳ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='skin.css'/>">
<script language="javascript" src="<sotower:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<sotower:ui css='flexgrid.css'/>">
<% 
    String category_id = request.getParameter("category_idSearch");
	if (category_id==null){
	  category_id="";
	}
    String category_desc = request.getParameter("category_descSearch");
	if (category_desc==null){
	  category_desc="";
	}
    String column_id = request.getParameter("column_idSearch");
	if (column_id==null){
	  column_id="";
	}
    String permanence_id = request.getParameter("permanence_idSearch");
	if (permanence_id==null){
	  permanence_id="";
	}
    String cre_time = request.getParameter("cre_timeSearch");
	if (cre_time==null){
	  cre_time="";
	}
%>
</HEAD>
<BODY topmargin="10px">
<widgets:container title="ѡ�������ϵ" >
<widgets:containbutton onclick="showcheckdata()" text="ȷ ��"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="�� ��"></widgets:containbutton>
<widgets:containbutton onclick="forCancel()" text="�� ��"></widgets:containbutton> 
<html:messages></html:messages>
<html:form name="frmList" action="soareferencequery_page_init.cmd">
<flex:flexgrid name="grid" height="250" action="" isSubmit="true">
				<flex:checkboxCol caption="ѡ��" width="100" property="categoryId" name="primaryKey" sortName="SOA_REFERENCE.CATEGORY_ID"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("SOA_REFERENCE.CATEGORY_DESC")%>' width="100" property="desc" sortName="SOA_REFERENCE.CATEGORY_DESC"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("SOA_REFERENCE.PERMANENCE_ID")%>' width="100" property="permanenceId" sortName="SOA_REFERENCE.PERMANENCE_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("SOA_REFERENCE.COLUMN_ID")%>' width="100" property="columnId" sortName="SOA_REFERENCE.COLUMN_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("SOA_REFERENCE.REF_COLUMN")%>' width="100" property="refColumn" sortName="SOA_REFERENCE.REF_COLUMN"></flex:flexCol>
</flex:flexgrid>
</html:form>
</widgets:container>
<script language="javascript">
grid.show();
function showcheckdata(){
var returnV=new Array(4); 
	returnV[0]=grid.getCheckLine();
	var b = returnV[0].split(",");
	if(b==null||b==""||b=="undefined"){
		alert("��ѡ��һ����¼!");
    	return false;
    }
	window.returnValue=returnV;
	
	parent.close();	
}
function forClose(){
	parent.close();
}
function forCancel(){
    var returnV=new Array(4);
    returnV[0]="";
    returnV[1]=""; 
    window.returnValue=returnV;
	parent.close();
}
</script>