<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<% 
    List list = new ArrayList();
    HashMap map = new HashMap();
    map.put("value","1");
    map.put("label","��");
    list.add(map);
    HashMap map1 = new HashMap();
    map1.put("value","0");
    map1.put("label","��");
    list.add(map1);
    request.setAttribute("isClosed",list);
%>
<HTML>
<HEAD>
<TITLE>��������ϸ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<html:hidden name="primaryKey" value=""/>
<bsp:container title="��������ϸ" >
<bsp:containbutton text="����" onclick="forReturn()"  action="financialyearquery.cmd" ></bsp:containbutton>

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">

    <tr>
      <td class="tdTitle">�����ȣ�</td>
      <td class="tdRight"><html:hidden name="finYear" property="finYear" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">��ʼ�գ�</td>
      <td class="tdRight"><html:hidden name="beginDate" property="beginDate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">��ֹ�գ�</td>
      <td class="tdRight"><html:hidden name="endDate" property="endDate" write="true"/></td>
    </tr>
    <tr>
      <td class="tdTitle">�����ڼ������</td>
      <td class="tdRight"><html:hidden name="periodNum" property="periodNum" write="true"/></td>
    </tr>
  </table>
  
       <table width="100%" cellpadding="0" class="tblContent" >      
	      <tr>
	         <td>
                <grid:grid name="finalcialMonths" property="finalcialMonths" type="edit" height="300" sumRow="false">
                     <grid:textCol property="finMonth" name="finMonth" caption="�����ڼ�"  index="1" ></grid:textCol>
                     <grid:textCol property="beginDate" name="beginDate" caption="��ʼ��" readonly="true" index="2" width="150"></grid:textCol>
                     <grid:textCol property="endDate" name="endDate" caption="��ֹ��" readonly="true" index="3" ></grid:textCol>
	                 <grid:labelCol collection="isClosed" property="isClosed" name="isClosed" labelProperty="label" labelKey="value" caption="�Ƿ�ر�"  index="4" width="150" >
	                 </grid:labelCol>   
	                 <grid:primaryKeyCol property="id" name="primaryKey" caption="������" readonly="true" index="5" ></grid:primaryKeyCol>
	            </grid:grid>
	         </td>
          </tr>  
   </table> 
   
</div>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn(){
  document.forms[0].action ="financialyearquery.cmd";
  document.forms[0].submit();	
}
</script>