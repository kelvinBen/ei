<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="net.mast.bsp.permit.context.GetBspInfo"%>
<HTML>
<HEAD>
<TITLE>��������ʵ����ѯ����</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='messages/grid_zh_CN.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="�ɰ���������������" >

<html:messages></html:messages>
<html:form  name="frmList"  action=""> 
<div>
  <table width="100%" cellpadding="0" class="tblContent">  
	<tr>	                   
<!-- ���� --><td class="tdTitle">ҵ��λ��  <span class="red1">*</span>   	</td>
         	<td class="tdRight"> </td>
         	        
<!--��������--><td class="tdTitle">������  <span class="red1">*</span>   	</td>
         	<td class="tdRight"> </td>    
	</tr>
	<tr>	                   
<!-- ���� --><td class="tdTitle">�������ԣ�  <span class="red1">*</span>   	</td>
         	<td class="tdRight"><html:text name="prApplyOrg" property="prApplyOrg" size="35" disabled="true"   maxlength="50" /> </td>      
<!--��������--><td class="tdTitle"><%=ResourcesFactory.getString("PRW_APPROVETACTIC.FLD_STACTIC_NAME")%>��  <span class="red1">*</span>   	</td>
         	<td class="tdRight"> </td>              
	</tr>             
	</tr>			
</table>
		<grid:grid name="grid1" sumRow="true" headCss="divToucsss" detailCss="divTiSkins" sumCss="divSumcsss" complexHead="false" property="listPrwApprovetacticAct" type="input" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:textCol property="fldActDesc" caption="��������" readonly="true" defaultValue="˫��ѡ����" onclick="selActDef()" width="150" index="3" xml="fldActDesc"  name="fldActDesc" style="width:100%" styleClass="default" ></grid:textCol>
			<grid:textCol property="fldAppStep" caption="��������" readonly="true" width="100" index="10" xml="fldAppStep"  name="fldAppStep" style="width:100%" styleClass="default"></grid:textCol>
			<grid:textCol property="fldAppStepdesc" caption="��������" width="100" index="11" xml="fldAppStepdesc"  name="fldAppStepdesc" style="width:100%" styleClass="default" ></grid:textCol>					
			<grid:textCol property="fldActPartys" caption="�������ʺ�" width="90" index="4" xml="fldActPartys"  name="fldActPartys" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActName" caption="����������" width="90" index="5" xml="fldActName"  name="fldActName" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActDept" caption="�������ű���" width="100" index="6" xml="fldActDept"  name="fldActDept" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActDeptname" caption="������������" width="100" index="7" xml="fldActDeptname"  name="fldActDeptname" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActUnit" caption="������λ����" width="100" index="8" xml="fldActUnit"  name="fldActUnit" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActUnitname" caption="������λ����" width="100" index="9" xml="fldActUnitname"  name="fldActUnitname" style="width:100%" styleClass="default" ></grid:textCol>									
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>