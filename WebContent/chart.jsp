<%@ page contentType="text/html;charset=GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
String app=request.getContextPath();
%>
<html>


<head>
<title>办理进度统计</title>
<link href="/css/css_deepblue.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=app %>/Charts/FusionCharts.js"></script>

<script language="javascript">
//查询条件验证
function list_checked(){
  return true;
}

//查询
function list_search(){
	//if(list_checked()){
		document.listForm.action="/bill/statisticsAction!countByProgress.action?action=search";
		document.listForm.submit();
	//}
}

//查询条件重置
function list_reset(){
	document.listForm.processor.value = '';
	document.listForm.areacode.value = '';
	document.listForm.enddate1.value = '';
	document.listForm.enddate2.value = '';
	document.listForm.billtype.value = '';
}

</script>
</head>
<body class="bgcolor3">
<form name="listForm" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 	<tr>
  	 <td height="30" class="bgcolor5">
	  	  <table width="100%" border="0" cellpadding="0" cellspacing="0"  class="titlyCss">
	  	    <tr> 
	  	      <td width="31px"><img src="/images/deepblue/unitinfo.gif" style="padding-left:10px"/></td>
	  	      <td>办理进度统计查询</td>
	  	    </tr>
	  	   </table>
  	   </td>
  	</tr>
  	 <tr>
	    <td width="100%" class="bgcolor5">
		</td>
	 </tr>
  <!-- end:查询条件显示区域 -->
	
  <!-- start:tab类标签页面实现部分 分为三部分：标签，颜色条，标签内容-->
  <tr>
    <td> <table class="table3" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <!-------- start: tab标签----------------------------------->	 
			<div>
	            <table class="table3" width="100%" border="0" cellpadding="0" cellspacing="0">
	              <tr>
	                <td  class="tabbg" style="padding-top:8px; padding-left:10px"> <table border="0" cellpadding="0" cellspacing="0">
	                    <tr>
	                      <td id="tda1" style="CURSOR:pointer;padding-right:4px"><div id="tda1" class="tabbg1"><p>办理进度统计</p></div></td>
	                    </tr>
	                  </table></td>
	              </tr>
	            </table>
			</div>
            <!-------- end: tab标签-------------------------------------->
            <!-------- start: 标签表格部分-------------------------------------------------->
            <table class="table4" width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                  <!-------------start---表格sa1部分--------------------------------------------------------------------------------->
                  <table width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
                    <!----------start:功能按钮部分--------------->
                    
                    <!----------end:功能按钮部分--------------->
                    <!----------start:数据记录部分----------------------------->
                    <tr>
                      <td align="center"> 
                     <div id="chartdiv" align="center"> </div>
					     		<script type="text/javascript">
						   			var chart = new FusionCharts("<%=app%>/Charts/Pie3D.swf", "ChartId", "100%", "380", "0", "0");
						   			chart.setDataXML("<chart  xAxisName='单位名称' yAxisName='单位：件' formatNumberScale='1' shownames='1' showValues='0' bgColor='FFFFFF,CC3300' bgAngle='270' bgAlpha='10,10' showBorder='1' showPercentageValues='1'><set label='待审查=0' value='0' tooltext='待审查0条'/><set label='审查中=1' value='1' tooltext='审查中1条'/><set label='待立案交办=0' value='0' tooltext='待立案交办0条'/><set label='办理中=1' value='1' tooltext='办理中1条'/><set label='已回复=1' value='1' tooltext='已回复1条'/><set label='已反馈=0' value='0' tooltext='已反馈0条'/><set label='审查退回=0' value='0' tooltext='审查退回0条'/><styles><definition><style name='CaptionFont' type='font' font='SimSun' Color='000000' Bold='0' size='16'/></definition><application><apply toObject='xAxisName' styles='CaptionFont'/><apply toObject='yAxisName' styles='CaptionFont'/><apply toObject='LEGEND' styles='CaptionFont'/><apply toObject='DATALABELS' styles='CaptionFont'/><apply toObject='YAXISVALUES' styles='CaptionFont'/><apply toObject='TOOLTIP' styles='CaptionFont'/></application></styles></chart>");
						   			chart.render("chartdiv");
								</script>
                       </td>
                    </tr>
                    <!----------end:数据记录部分----------------------------->
                    <!----------start:上下翻页------------------>
                    <tr>
                      <td class="td11">

					  </td>
                    </tr>
                    <!----------end:上下翻页------------------>
                  </table></td>
              </tr>
            </table>
            <!-------- end: 标签表格部分---------------------------------------------------->
          </td>
        </tr>
      </table></td>
  </tr>
  <!-- end:tab类标签页面实现部分 -->
</table>
</form>
</body>

</html>

