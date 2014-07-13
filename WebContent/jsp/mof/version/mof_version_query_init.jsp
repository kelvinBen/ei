<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE>�汾�����ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String version = request.getParameter("versionSearch");
	if (version==null){
	  version="";
	}
	
    String version_date = request.getParameter("version_dateSearch");
	if (version_date==null){
	  version_date="";
	}
    String version_type = request.getParameter("version_typeSearch");
	if (version_type==null){
	  version_type="";
	}
	
%>
<bsp:container title="�汾�����ѯ" >
<bsp:containbutton action="mofversion.cmd?method=forinsert" onclick="forInsert()" text="����"></bsp:containbutton>
<bsp:containbutton action="mofversion.cmd?method=forupdate" onclick="forUpdate()" text="�޸�"></bsp:containbutton>
<bsp:containbutton action="mofversion.cmd?method=detail" onclick="forDetail()" text="��ϸ"></bsp:containbutton>
<bsp:containbutton action="mofversion.cmd?method=delete" onclick="forDelete()" text="ɾ��"></bsp:containbutton>
<bsp:containbutton action="mofversion.cmd?method=versionimport" onclick="forImport()" text="����"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="mofversionquery_page_init.cmd">
<fieldset class="FieldsetCss" ><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>�汾�ţ�<flex:searchText name="versionSearch" searchName="MOF_VERSION.VERSION" dataType="java.lang.String" operSymbol="=" value="<%=version%>" size="12">
	</flex:searchText></td>
    <td><flex:searchImg name="chaxun" action="mofversionquery_page_init.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
<flex:flexgrid name="grid" height="258" action="" isSubmit="true">
				<flex:checkboxCol caption="ѡ��" width="50" property="version" name="primaryKey" sortName="MOF_VERSION.VERSION"></flex:checkboxCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_VERSION.VERSION")%>' width="100" property="version" sortName="MOF_VERSION.VERSION" onclick='forDetail(true)' style='text-align:left;cursor:hand'></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_VERSION.VERSION_TYPE")%>' width="150" property="versionType" sortName="MOF_VERSION.VERSION_TYPE" style='display:none'></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_VERSION.VERSION_DATE")%>' width="150" property="versionDate" sortName="MOF_VERSION.VERSION_DATE" style='text-align:left'></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_VERSION.VERSION_USER")%>' width="150" property="versionUser" sortName="MOF_VERSION.VERSION_USER" style='text-align:left'></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_VERSION.VERSION_TYPE")%>' width="100" property="versionType" type="enum" enumCollection="MOFVERSION_VERSIONTYPE_COLLECTION" enumKey ="key" enumValue="value" sortName="MOF_VERSION.VERSION_TYPE" style='text-align:left'></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("MOF_VERSION.VERSION_NOTE")%>' width="200" property="versionNote" sortName="MOF_VERSION.VERSION_NOTE" style='text-align:left'></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="mofversionquery_page_init.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.show();
grid.setSumText("");

function forInsert(){
  document.forms[0].action ="mofversion.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="mofversion.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(hand){
  if(!hand && !getSelect()) return;
  var sel;
  if( hand )
	sel = grid.getCurrentLine();
  else
	sel=grid.getCheckLineNo();
  //alert("sel:" +sel);
  var pk = grid.getCellValue(sel,1);
  document.forms[0].action ="mofversion.cmd?method=detail&primaryKey="+pk;    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="mofversion.cmd?method=delete";    
  document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
  return true;
}
function getDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��Ҫɾ���ļ�¼!");
    return false;
  }
  if (!confirm("���Ҫɾ��ѡ�еļ�¼�𣿴˲������ָܻ���")) {
   	     return false;
   	     }  
  return true;
}
function forImport(){
  if(!getSelect()) return;
  if(!confirm("�˲������Ḳ�ǵ�ǰ�������е�ģ�ͣ�ȷ��������"))return;
  var vType = grid.getCellValue(grid.getCurrentLine(),3);
  if(vType=="mof")
  	document.forms[0].action ="mofversion.cmd?method=versionimport";    
  else if(vType=="mofprocess")
  	document.forms[0].action ="mofprocessversion.cmd?method=versionimport";   	
  document.forms[0].submit();	
}
</script>