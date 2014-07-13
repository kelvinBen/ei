<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="java.util.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
//保存查询条件
    String PROCESSDEPT = RequestUtil.getPara2String(request,"PROCESSDEPT");
    String starttime = RequestUtil.getPara2String(request,"starttime");
    String endtime = RequestUtil.getPara2String(request,"endtime");
    String NO = RequestUtil.getPara2String(request,"NO"); //委员编号
    String areacode = RequestUtil.getPara2String(request,"AREACODE");
    String areaname = RequestUtil.getPara2String(request,"AREANAME");
   // List l= (List)request.getAttribute("flexgrid.data");

   // out.println(l);
%>
<bsp:container title="按单位统计" >

<html:form name="frmList" action="proposalcountbydept.cmd">
<table id="tblSearch">
<flex:search>
	<tr>

    <td>
    单位：<flex:searchText name="PROCESSDEPT" searchName="PROPOSAL_BUZI.PROCESSDEPT" dataType="java.lang.String" operSymbol="=" value="<%=PROCESSDEPT%>" size="16"/>
    </td>
    <td style="display: none">
    PROCESSDEPTID：</td>
    <td style="display: none">
    <flex:searchText name="PROCESSDEPTID" searchName="PROPOSAL_BUZI.PROCESSDEPTID" dataType="java.lang.String" operSymbol="=" value="" size="12"/>
    
    </td>

     <td>交办时间：
     <data:date name="starttime" divname="starttime1" value="<%=starttime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date>
     --<data:date name="endtime" divname="endtime1" value="<%=endtime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date>
 	</td>
 	
	<td><flex:searchImg name="chaxun" action="proposalcountbydept.cmd" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="342" action="" hasSum="false" isSubmit="fasle" export="true">

		<flex:flexCol caption='单位编号' width="70" property="PROCESSDEPTID" sortName="PROPOSAL_BUZI.CASENO" style="display:none"/>
<!--2--><flex:flexCol  caption='单位名称' width="100" property="PROCESSDEPT" sortName="PROPOSAL_BUZI.TITLE"/>

<!-- 3--><flex:flexCol caption='待承办提案' width="100" property="SUM0" sortName="PROPOSAL_BUZI.PROPOSOR" />
<!--4 --><flex:flexCol caption='办理中提案' width="80" property="SUM1"  sortName="PROPOSAL_BUZI.TYPE"/>
<!-- 5 --><flex:flexCol caption='已退办提案' width="80" property="SUM2"  sortName="PROPOSAL_BUZI.CATEGORY"/>
<!-- 6 --><flex:flexCol caption='已答复提案' width="80" property="SUM3"  sortName="PROPOSAL_BUZI.CATEGORY"/>

<!-- 7 --><flex:flexCol caption='主办提案' width="80" property="SUM4" sortName="PROPOSAL_BUZI.REGISTERDATE" />
<!-- 8 --><flex:flexCol caption='协办提案' width="80" property="SUM5" sortName="PROPOSAL_BUZI.REGISTERDATE" />

<!--9--><flex:flexCol caption='合计'  width="80" property="SUM0" index="13" sortName="PROPOSAL_BUZI.SATISFY" />


</flex:flexgrid>

</html:form>
</bsp:container>
<script language="javascript">
grid.show();
for(var i=1;i<grid.returnRowCount()+1;i++){
		var no=grid.getCellValue(i, 1);
		var NAME=grid.getCellValue(i, 2);
		var forlook='<a href="javascript:forDetail(\''+no+'\',\''+NAME+'\')"  >'+NAME+'</a> ';
		var sum0=parseInt(grid.getCellValue(i, 3));
		var sum1=parseInt(grid.getCellValue(i, 4));
		var sum2=parseInt(grid.getCellValue(i, 5));
		var sum3=parseInt(grid.getCellValue(i, 6));
		var total=sum0+sum1+sum2+sum3;
		
		grid.getCell(i, 9).innerHTML =total;
		grid.getCell(i, 2).innerHTML =forlook;
}


function forDetail(NO,NAME){
 	$('PROCESSDEPT').value=NAME; 
	$('PROCESSDEPTID').value=NO; 
  document.forms[0].action ="smproppsalQueryAction.cmd?flag=PROCESSDEPT";    
  document.forms[0].submit();	
}


function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}

</script>