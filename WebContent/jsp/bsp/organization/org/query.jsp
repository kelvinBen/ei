<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<% 
    String stru_id = request.getParameter("struId");
	if (stru_id==null){
	  stru_id="";
	}
%>
<html:form action="orgquery.cmd">
<div align="right">
    <table id="buttonspace" width="100" border="0" height="30">
      <tr>

        <td><html:button name="btn.mod" value="�޸�" onclick="forUpdate()"></html:button></td>
        <td><html:button name="btn.add" value="��ϸ" onclick="forDetail()"></html:button></td>
        <td><html:button name="btn.del" value="ɾ��" onclick="forDelete()"></html:button></td>
       <td><html:button name="btn.add" value="����" onclick="forMergeTo()"></html:button></td>
       <td><html:button name="btn.add" value="ѡ���¼�" onclick="forSelect()"></html:button></td>
       <td><html:button name="btn.add" value="�����¼�" onclick="forInsert()"></html:button></td>
       <td><html:button name="btn.del" value="�¼�����" onclick="forOrdere()"></html:button></td>
      </tr>
    </table>
</div>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>���룺<flex:searchText name="stru_idSearch" searchName="V_STRU_ORGAN.STRU_ID" dataType="java.lang.String" operSymbol="=" value="<%=stru_id%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="chaxun" action="struquery.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="240" action="" isSubmit="true">
      <flex:checkboxCol caption="ѡ��" width="40" property="STRU_ID"  name="primaryKey" sortName="V_STRU_ORGAN.STRU_ID"></flex:checkboxCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>' width="100" property="ORGAN_CODE" style="text-align:left" sortName="V_STRU_ORGAN.ORGAN_CODE"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>' width="100" property="ORGAN_NAME" style="text-align:left" sortName="V_STRU_ORGAN.ORGAN_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.SHORT_NAME")%>' width="100" property="SHORT_NAME" style="text-align:left" sortName="V_STRU_ORGAN.SHORT_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_ALIAS")%>' width="100" property="ORGAN_ALIAS" style="text-align:left" sortName="V_STRU_ORGAN.ORGAN_ALIAS"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="struquery.cmd" pageSize="10">
</flex:pagePolit>
</html:form>
</BODY>
</HTML>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="stru.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
function forInsert(){
   if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=forinsert";    
  document.forms[0].submit();	
}

function forSelect(){
   if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=getAddRoot";    
  document.forms[0].submit();	
}

function forMergeTo(){
   if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=getMergeRoot";    
  document.forms[0].submit();	
}

function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="stru.cmd?method=delete";    
  document.forms[0].submit();	
}
function forOrder(){
   if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=getChangeOrderRoot";    
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
    alert("����һ�ζԶ���ϼ���Ա���в���!");
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
   	     return flase;
   	     }  
  return true;
}
</script>