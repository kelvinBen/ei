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
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<% 
    String struId = request.getParameter("struId");
	if (struId==null ||"".equals(struId)){
	  struId="";
	}  
	
    String organId = request.getParameter("organId");
	if (organId==null ||"".equals(organId)){
	  organId="";
	}
	
    String organCode = request.getParameter("organCode");
	if (organCode==null ||"".equals(organCode)){
	  organCode="";
	}
	
    String organName = request.getParameter("organName");
	if (organName==null ||"".equals(organName)){
	  organName="";
	}
	
    String organType = request.getParameter("organType");
	if (organType==null ||"".equals(organType)){
	  organType="";
	}
%>
<bsp:container title="��֯�ṹ����" >
<bsp:containbutton text="��λ" onclick="forTree()" ></bsp:containbutton>
<bsp:containbutton text="��ϸ" onclick="forDetail()" ></bsp:containbutton>
<html:form action="struquery.cmd?method=query">

<table id="tblSearch">

<flex:search>
	<tr>
	    <flex:searchHidden name="struId" searchName="PUB_ORGAN.STRU_ID" dataType="java.lang.String" operSymbol="=" value="<%=struId%>">
		</flex:searchHidden>
		<td>��֯���ͣ�<flex:searchSelect name="organType" searchName="PUB_ORGAN.ORGAN_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=organType%>">
		<option value="">ȫ��</option>
    		<html:options collection="organTypeCollection" labelProperty="TYPE_NAME" property="ORGAN_TYPE"/>
	   </flex:searchSelect>
	   </td>
		<td>��֯���룺<flex:searchText name="organCode" searchName="PUB_ORGAN.ORGAN_CODE" dataType="java.lang.String" operSymbol="=" value="<%=organCode%>" size="10">
		</flex:searchText></td> <td>��֯���ƣ�<flex:searchText name="organName" searchName="PUB_ORGAN.ORGAN_NAME" dataType="java.lang.String" operSymbol=" like" value="<%=organName%>" size="26">
		</flex:searchText></td><td><flex:searchImg name="chaxun" action="struquery.cmd?method=query" imgClick="if(addSymbol()) return false;" image="search.gif"/></td>
		
	</tr>
</flex:search>

</table>
<flex:flexgrid name="grid" height="240" action="" isSubmit="true">
      <flex:radioCol caption="ѡ��" width="40" property="struId"  name="primaryKey" sortName="stru.struId"></flex:radioCol>
      <flex:flexCol caption="��֯����" width="100" property="organCode" style="text-align:left" sortName="stru.organCode"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN.ORGAN_NAME")%>' width="100" property="organName" style="text-align:left" sortName="stru.organName"></flex:flexCol>
      <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_ORGAN.ORGAN_TYPE")%>' width="100" property="organTypeName" style="text-align:left" sortName="stru.organTypeName"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="struquery.cmd?method=query" pageSize="10">
</flex:pagePolit>
<iframe style="display:none" id="dataFrame"></iframe>
</html:form>
</bsp:container>
</BODY>
</HTML>
<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="stru.cmd?method=detailProxy&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
function addSymbol(){
if(!checkCondition()) return true;
}
function checkCondition(){
	 if ( __isQuoteIn(document.forms[0].organCode.value) )
		  {
		    alert("�ʻ����Ʋ��ܺ��������ַ���");
		    document.forms[0].organCode.select();
		    document.forms[0].organCode.focus();
		    return false;
		  }
		  if ( __isQuoteIn(document.forms[0].organName.value) )
		  {
		    alert("���������ܺ��������ַ���");
		    document.forms[0].organName.select();
		    document.forms[0].organName.focus();
		    return false;
		  }
	return true;
	}

function forDetail(){
  if(!getSelect()) return;
  document.forms[0].action ="stru.cmd?method=detailProxy&sdetail=1";    
  document.forms[0].submit();	
}
function forTree(){
  if(!getSelect()) return;
  var a = grid.getCheckLine();
  var url = "stru.cmd?method=getNodeId&struId="+a;
  
  var f = document.getElementById("dataFrame");
  f.src = url;
}

function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("����һ�ζԶ����֯������ϸ����!");
    return false;
  }  
  return true;
}
</script>