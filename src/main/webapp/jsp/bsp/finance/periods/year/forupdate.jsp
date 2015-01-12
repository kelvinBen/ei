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
    map.put("label","是");
    list.add(map);
    HashMap map1 = new HashMap();
    map1.put("value","0");
    map1.put("label","否");
    list.add(map1);
    request.setAttribute("isClosed",list);
%>
<HTML>
<HEAD>
<TITLE>会计年度修改</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript">
function checkPubFinYear(){
var id = document.forms[0].id;
    if ( __isQuoteIn(id.value) )
    {
      alert("系统码不能含有引号或单引号");      
      return false;
    }
    if (trim(id.value)=="")
  {
    alert("请输入系统码！");    
    return false;
  }
  id.value = trim(id.value) ;
 var organId = document.forms[0].organId;
  if (trim(organId.value)=="")
  {
    alert("请输入机构系统码！");    
    return false;
  }
  organId.value = trim(organId.value) ;
 var finYear = document.forms[0].finYear;
  if (trim(finYear.value)=="")
  {
    alert("请输入会计年度！");    
    return false;
  }
  finYear.value = trim(finYear.value) ;
 var beginDate = document.forms[0].beginDate;
  if (trim(beginDate.value)=="")
  {
    alert("请输入起始日！");    
    return false;
  }
  beginDate.value = trim(beginDate.value) ;
 var endDate = document.forms[0].endDate;
  if (trim(endDate.value)=="")
  {
    alert("请输入终止日！");    
    return false;
  }
  endDate.value = trim(endDate.value) ;
 var periodNum = document.forms[0].periodNum;
  if (trim(periodNum.value)=="")
  {
    alert("请输入记帐期间个数！");    
    return false;
  }
  periodNum.value = trim(periodNum.value) ;
        var finYear = document.forms[0].finYear;
    if (!__checkStdYear(finYear ) )
    {
      alert("会计年度"+sError);
      finYear.focus();
      return false;
    }    
    var beginDate = document.forms[0].beginDate;
    if ( !__checkStdDate(beginDate ) )
    {
      alert("起始日"+sError);
      beginDate.focus();
      return false;
    }
    var endDate = document.forms[0].endDate;
    if ( !__checkStdDate(endDate ) )
    {
      alert("终止日"+sError);
      endDate.focus();
      return false;
    }
    	return true
}


</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="修改会计年度" >
<bsp:containbutton text="保存" onclick="forSave()" action="financialyear.cmd?method=update"></bsp:containbutton>
<bsp:containbutton text="返回" onclick="forReturn()" action="financialyearquery.cmd"></bsp:containbutton>

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
                  <html:hidden name="id"  property="id" write="false" />
				  <html:hidden name="organId"  property="organId" write="false" />                 
 					<tr>
                    <td class="tdTitle">会计年度：</td>
                    <td valign=top><html:hidden name="finYear" property="finYear" write="true"/>
					</td>
					</tr>
					
  					<tr>
                    <td class="tdTitle">起始日：</td>
    					<td class="tdRight" valign="top"><date:date name="beginDate" divname="beginDatedd" zindex="19" property="beginDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><input style="visibility:hidden"></td>
					</tr>
 					<tr>
                    <td class="tdTitle">终止日：</td><td class="tdRight" valign="top"><date:date name="endDate" divname="endDatedd"zindex="18" property="endDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><input style="visibility:hidden"></td>
					</tr>
					
                     <tr>
                    <td class="tdTitle">记帐期间个数：</td>
                    <td class="tdRight"><html:text name="periodNum" property="periodNum" size="8" maxlength="8" /></td>
                    </tr>                    
   </table>
   
     <table width="100%" cellpadding="0" class="tblContent" >  
          <tr>
             <td align="right">
                     <button name="btnAddRowOperations" onclick="addRow()" class="advbutton">增加</button>
	                 <button name="btnDeleteRowOperations" onclick="deleteRow()" class="advbutton">删除</button>
	         </td>
	      </tr>      
	      <tr>
	         <td>
                <grid:grid name="finalcialMonths" property="finalcialMonths" type="edit" height="300" sumRow="false">
                     <grid:textCol property="finMonth" name="finMonth" caption="记帐期间"  index="1" ></grid:textCol>
                     <grid:dateCol property="beginDate" name="beginDate" caption="起始日" readonly="true" index="2" width="150" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></grid:dateCol>
                     <grid:dateCol property="endDate" name="endDate" caption="终止日" readonly="true" index="3" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></grid:dateCol>
	                 <grid:selectCol property="isClosed" name="isClosed" caption="是否关闭"  index="4" width="150" >
	                 <grid:options collection="isClosed" property="value" labelProperty="label"/>
	                 </grid:selectCol>
	                 <grid:hideCol property="id" name="id" caption="id"  index="1" ></grid:hideCol>   
	                 <grid:primaryKeyCol property="id" name="primaryKey" caption="主键列" readonly="true" index="5" ></grid:primaryKeyCol>
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
finalcialMonths.show();
  function addRow(){
        var row = finalcialMonths.returnRowCount()+1;
        finalcialMonths.addRow();
  }
  
  function deleteRow(){
  var sel=finalcialMonths.getCurrentLine();
 
  if(sel==null){
    alert("请选择要删除的记录!");
    return false;
  }
    if(!confirm("该操作无法恢复，确定删除吗？"))
       return;
    finalcialMonths.delRow();
  } 
  
function forSave(){
  if(!checkPubFinYear()) return;	
  var count = finalcialMonths.returnRowCount();
  for(var i=1;i<count+1;i++){
     var finMonth = finalcialMonths.getCellValue(i,1);
     var beginDate = finalcialMonths.getCellValue(i,2);
     var endDate = finalcialMonths.getCellValue(i,3);
     var finMonthObject = finalcialMonths.getCellObject(i,1);
     var beginDateObject = finalcialMonths.getCellObject(i,2);
     var endDateObject = finalcialMonths.getCellObject(i,3);
     if((finMonth=="")||(beginDate=="")||(endDate=="")){
          alert("记录行的值不能为空！");
          return ;
     }
     if(!__isNum(finMonth)){
     alert("记账期间必须是数字！");
     finMonthObject.focus();
     return false;
     }
     if(!__isNum(beginDate)){
     alert("起始日必须是数字！");
     beginDateObject.focus();
     return false;
     }
     if(!__isNum(endDate)){
     alert("终止日必须是数字！");
     endDateObject.focus();
     return false;
     }
     if(finMonth.length!=6){
     alert("记账期间的长度须为6位！");
     finMonthObject.focus();
     return false;
     }
     if(beginDate.length!=8){
     alert("起始日的长度须为8位！");
     beginDateObject.focus();
     return false;
     }
     if(endDate.length!=8){
     alert("终止日的长度须为8位！");
     endDateObject.focus();
     return false;
     }
  }
  document.forms[0].action ="financialyear.cmd?method=update";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="financialyearquery.cmd";
  document.forms[0].submit();	
}

</script>