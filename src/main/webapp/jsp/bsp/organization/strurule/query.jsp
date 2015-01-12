<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.util.Page"%>
<%@ page import="net.mast.web.taglib.util.Global"%>

<%
     String struType = (String)request.getParameter("struType");
     if(struType==null)
             struType="";
     String srcRef = (String)request.getParameter("srcRef");
     if(srcRef==null)
             srcRef="";
     String targetRef = (String)request.getParameter("targetRef");
     if(targetRef==null)
             targetRef="";
%>

<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<script language="javascript" src="<%=SkinUtils.getJS(request,"flexgrid.js")%>"></script>
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"flexgrid.css")%>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"skin.css")%>">
<BODY topmargin="10px">
<% 
    String rule_type = request.getParameter("rule_type");
	if (rule_type==null){
	  rule_type="";
	}
%>
<bsp:container title="��֯�ṹ�����ѯ" > 
       <bsp:containbutton onclick="forInsert()" text="����" action ="strurule.cmd?method=forinsert"></bsp:containbutton>
       <bsp:containbutton onclick="forUpdate()" text="�޸�" action ="strurule.cmd?method=forupdate"></bsp:containbutton>
       <bsp:containbutton onclick="forDetail()" text="��ϸ" action ="strurule.cmd?method=detail"></bsp:containbutton>
       <bsp:containbutton onclick="forDelete()" text="ɾ��" action ="strurule.cmd?method=delete"></bsp:containbutton>
<html:form name="frmList" action="strurulequery.cmd">
<table id="tblSearch">
<flex:search>
	<tr>
    <td nowrap>��֯�ṹ���ͣ�<flex:searchSelect name="struType" searchName="V_STRU_RULE.STRU_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=struType%>">
    	                <option value="">ȫ��</option>
    	                <html:options collection="struTypeCollection" labelProperty="TYPE_NAME" property="STRU_TYPE"/>
	</flex:searchSelect>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td nowrap>�ϼ���֯���ͣ�<flex:searchSelect name="srcRef" searchName="V_STRU_RULE.SRC_REF" dataType="java.lang.String" operSymbol="=" value="<%=srcRef%>">
	    	                <option value="">ȫ��</option>
	    	                <html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
	</flex:searchSelect>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td nowrap>�¼���֯���ͣ�<flex:searchSelect name="targetRef" searchName="V_STRU_RULE.TARGET_REF" dataType="java.lang.String" operSymbol="=" value="<%=targetRef%>">
	                        <option value="">ȫ��</option>
	    	                <html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
	</flex:searchSelect>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	<td><flex:searchImg name="chaxun" action="struruleQueryInit.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>

<support:flexgrid name="grid" height="340" isSubmit="true" action="">
      <flex:checkboxCol caption="ѡ��" width="40" property="RULE_ID" name="primaryKey" sortName="V_STRU_RULE.RULE_ID"></flex:checkboxCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_RULE.STRU_TYPE")%>' width="135" property="TYPE_NAME" style="text-align:left" sortName="V_STRU_RULE.TYPE_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_RULE.SRC_REF")%>' width="80" property="SRC_REF" style="text-align:left" sortName="V_STRU_RULE.SRC_REF"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_RULE.SRC_NAME")%>' width="150" property="SRC_NAME" style="text-align:left" sortName="V_STRU_RULE.SRC_NAME"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_RULE.TARGET_REF")%>' width="150" property="TARGET_REF" style="text-align:left" sortName="V_STRU_RULE.TARGET_REF"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU_RULE.TARGET_NAME")%>' width="150" property="TARGET_NAME" style="text-align:left" sortName="V_STRU_RULE.TARGET_NAME"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="struruleQueryInit.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="strurule.cmd?method=detail&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
grid.setTouAlign(6,"center");
function forInsert(){
  document.forms[0].action ="strurule.cmd?method=forinsert";    
  document.forms[0].submit();	
}
function forUpdate(){
  if(!getSelect()) return;
  document.forms[0].action ="strurule.cmd?method=forupdate";    
  document.forms[0].submit();	
}
function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="strurule.cmd?method=detail";    
  document.forms[0].submit();	
}
function forDelete(){
  if(!getDelete()) return;
  document.forms[0].action ="strurule.cmd?method=delete";    
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
</script>