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
<%@ page import="net.mast.web.taglib.util.Global"%>
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
<TITLE>����������</TITLE>
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
 var finYear = document.forms[0].finYear;
  if (trim(finYear.value)=="")
  {
    alert("����������ȣ�");
    finYear.focus();
    return false;
  }
  finYear.value = trim(finYear.value) ;
 var beginDate = document.forms[0].beginDate;
  if (trim(beginDate.value)=="")
  {
    alert("��������ʼ�գ�");
    beginDate.focus();
    return false;
  }
  beginDate.value = trim(beginDate.value) ;
 var endDate = document.forms[0].endDate;
  if (trim(endDate.value)=="")
  {
    alert("��������ֹ�գ�");
    endDate.focus();
    return false;
  }
  endDate.value = trim(endDate.value) ;
 var periodNum = document.forms[0].periodNum;
  if (trim(periodNum.value)=="")
  {
    alert("����������ڼ������");
    periodNum.focus();
    return false;
  }
  if(!__isNum(periodNum.value)){
    alert("�����ڼ�������������֣�");
    periodNum.focus();
    return false;
  }
  periodNum.value = trim(periodNum.value) ;
  var finYear = document.forms[0].finYear;
    if (!__checkStdYear(finYear ) )
    {
      alert("������"+sError+"��");
      finYear.focus();
      return false;
    }    
var beginDate = document.forms[0].beginDate;
    if ( !__checkStdDate(beginDate ) )
    {
      alert("��ʼ��"+sError+"��");
      beginDate.focus();
      return false;
    }
var endDate = document.forms[0].endDate;
    if ( !__checkStdDate(endDate ) )
    {
      alert("��ֹ��"+sError+"��");
      endDate.focus();
      return false;
    }
return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="���ӻ�����" >
<bsp:containbutton text="����" onclick="forSave()"  action="financialyear.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="����" onclick="forReturn()" action="financialyearquery.cmd" ></bsp:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">  
   <html:hidden name="id"  property="id" write="false" />
					
					</tr>
					  <html:hidden name="organId"  property="organId" write="false" />                 
 					<tr>
                    <td class="tdTitle">�����ȣ�</td>
                    <td valign=top><html:text name="finYear" property="finYear" size="4" maxlength="4" /><FONT COLOR=#ff0000>*</FONT>
					</td>
					</tr>
					
 					<tr>
                    <td class="tdTitle">��ʼ�գ�</td>
    					<td class="tdRight" valign="top"><date:date name="beginDate" divname="beginDatedd" zindex="19" property="beginDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></date:date><input style="visibility:hidden"><FONT COLOR=#ff0000>*</FONT></td>
					</tr>
 					<tr>
                    <td class="tdTitle">��ֹ�գ�</td><td class="tdRight" valign="top"><date:date name="endDate" divname="endDatedd" zindex="18" property="endDate" readonly="true" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd">	</date:date><input style="visibility:hidden"><FONT COLOR=#ff0000>*</FONT></td>
					</tr>
					
                     <tr>
                    <td class="tdTitle">�����ڼ������</td>
                    <td class="tdRight"><html:text name="periodNum" property="periodNum" size="8" maxlength="8" /><FONT COLOR=#ff0000>*</FONT></td>
                    </tr>                    
   </table>
   
     <table width="100%" cellpadding="0" class="tblContent" >  
          <tr>
             <td align="right">
                     <button name="btnAddRowOperations" onclick="addRow()" class="advbutton">����</button>
	                 <button name="btnDeleteRowOperations" onclick="deleteRow()" class="advbutton">ɾ��</button>
	         </td>
	      </tr>      
	      <tr>
	         <td>
                <grid:grid name="finalcialMonths" property="finalcialMonths" type="edit" height="300" sumRow="false">
                     <grid:textCol property="finMonth" name="finMonth" caption="�����ڼ�"  index="1" ></grid:textCol>
                     <grid:dateCol property="beginDate" name="beginDate" caption="��ʼ��" readonly="true" index="2" width="150" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></grid:dateCol>
                     <grid:dateCol property="endDate" name="endDate" caption="��ֹ��" readonly="true" index="3" sourceFormat="yyyyMMdd" targetFormat="yyyyMMdd"></grid:dateCol>
	                 <grid:selectCol property="isClosed" name="isClosed" caption="�Ƿ�ر�"  index="4" width="150" >
	                 <grid:options collection="isClosed" property="value" labelProperty="label"/>
	                 </grid:selectCol>   
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
finalcialMonths.show();
  function addRow(){
        var row = finalcialMonths.returnRowCount()+1;
        finalcialMonths.addRow();
  }
  
  function deleteRow(){
  var sel=finalcialMonths.getCurrentLine();
 
  if(sel==null){
    alert("��ѡ��Ҫɾ���ļ�¼!");
    return false;
  }
    if(!confirm("�ò����޷��ָ���ȷ��ɾ����"))
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
          alert("��¼�е�ֵ����Ϊ�գ�");
          return ;
     }
     if(!__isNum(finMonth)){
     alert("�����ڼ���������֣�");
     finMonthObject.focus();
     return false;
     }
     if(!__isNum(beginDate)){
     alert("��ʼ�ձ��������֣�");
     beginDateObject.focus();
     return false;
     }
     if(!__isNum(endDate)){
     alert("��ֹ�ձ��������֣�");
     endDateObject.focus();
     return false;
     }
     if(finMonth.length!=6){
     alert("�����ڼ�ĳ�����Ϊ6λ��");
     finMonthObject.focus();
     return false;
     }
     if(beginDate.length!=8){
     alert("��ʼ�յĳ�����Ϊ8λ��");
     beginDateObject.focus();
     return false;
     }
     if(endDate.length!=8){
     alert("��ֹ�յĳ�����Ϊ8λ��");
     endDateObject.focus();
     return false;
     }
  }
  document.forms[0].action ="financialyear.cmd?method=insert";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="financialyearquery.cmd";
  document.forms[0].submit();	
}

</script>