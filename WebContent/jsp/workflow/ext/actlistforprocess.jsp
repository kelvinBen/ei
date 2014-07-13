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
<TITLE>根据流程实例查询环节</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='editgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='messages/grid_zh_CN.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="采办申请审批表增加" >

<html:messages></html:messages>
<html:form  name="frmList"  action=""> 
<div>
  <table width="100%" cellpadding="0" class="tblContent">  
	<tr>	                   
<!-- 编码 --><td class="tdTitle">业务单位：  <span class="red1">*</span>   	</td>
         	<td class="tdRight"> </td>
         	        
<!--策略名称--><td class="tdTitle">工厂：  <span class="red1">*</span>   	</td>
         	<td class="tdRight"> </td>    
	</tr>
	<tr>	                   
<!-- 编码 --><td class="tdTitle">审批策略：  <span class="red1">*</span>   	</td>
         	<td class="tdRight"><html:text name="prApplyOrg" property="prApplyOrg" size="35" disabled="true"   maxlength="50" /> </td>      
<!--策略名称--><td class="tdTitle"><%=ResourcesFactory.getString("PRW_APPROVETACTIC.FLD_STACTIC_NAME")%>：  <span class="red1">*</span>   	</td>
         	<td class="tdRight"> </td>              
	</tr>             
	</tr>			
</table>
		<grid:grid name="grid1" sumRow="true" headCss="divToucsss" detailCss="divTiSkins" sumCss="divSumcsss" complexHead="false" property="listPrwApprovetacticAct" type="input" headHeight="22"  sumHeight="22" width="100%" height="200">		       	
			<grid:textCol property="fldActDesc" caption="环节名称" readonly="true" defaultValue="双击选择步骤" onclick="selActDef()" width="150" index="3" xml="fldActDesc"  name="fldActDesc" style="width:100%" styleClass="default" ></grid:textCol>
			<grid:textCol property="fldAppStep" caption="审批步骤" readonly="true" width="100" index="10" xml="fldAppStep"  name="fldAppStep" style="width:100%" styleClass="default"></grid:textCol>
			<grid:textCol property="fldAppStepdesc" caption="步骤描述" width="100" index="11" xml="fldAppStepdesc"  name="fldAppStepdesc" style="width:100%" styleClass="default" ></grid:textCol>					
			<grid:textCol property="fldActPartys" caption="审批人帐号" width="90" index="4" xml="fldActPartys"  name="fldActPartys" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActName" caption="审批人名称" width="90" index="5" xml="fldActName"  name="fldActName" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActDept" caption="审批部门编码" width="100" index="6" xml="fldActDept"  name="fldActDept" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActDeptname" caption="审批部门名称" width="100" index="7" xml="fldActDeptname"  name="fldActDeptname" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActUnit" caption="审批单位编码" width="100" index="8" xml="fldActUnit"  name="fldActUnit" style="width:100%" styleClass="default" ></grid:textCol>		
			<grid:textCol property="fldActUnitname" caption="审批单位名称" width="100" index="9" xml="fldActUnitname"  name="fldActUnitname" style="width:100%" styleClass="default" ></grid:textCol>									
		</grid:grid>
</div>
</html:form>
</bsp:container>
</BODY>
</HTML>