<%@ page contentType="text/html;charset=GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
String app=request.getContextPath();
%>
<html>


<head>
<title>�������ͳ��</title>
<link href="/css/css_deepblue.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=app %>/Charts/FusionCharts.js"></script>

<script language="javascript">
//��ѯ������֤
function list_checked(){
  return true;
}

//��ѯ
function list_search(){
	//if(list_checked()){
		document.listForm.action="/bill/statisticsAction!countByProgress.action?action=search";
		document.listForm.submit();
	//}
}

//��ѯ��������
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
	  	      <td>�������ͳ�Ʋ�ѯ</td>
	  	    </tr>
	  	   </table>
  	   </td>
  	</tr>
  	 <tr>
	    <td width="100%" class="bgcolor5">
		</td>
	 </tr>
  <!-- end:��ѯ������ʾ���� -->
	
  <!-- start:tab���ǩҳ��ʵ�ֲ��� ��Ϊ�����֣���ǩ����ɫ������ǩ����-->
  <tr>
    <td> <table class="table3" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <!-------- start: tab��ǩ----------------------------------->	 
			<div>
	            <table class="table3" width="100%" border="0" cellpadding="0" cellspacing="0">
	              <tr>
	                <td  class="tabbg" style="padding-top:8px; padding-left:10px"> <table border="0" cellpadding="0" cellspacing="0">
	                    <tr>
	                      <td id="tda1" style="CURSOR:pointer;padding-right:4px"><div id="tda1" class="tabbg1"><p>�������ͳ��</p></div></td>
	                    </tr>
	                  </table></td>
	              </tr>
	            </table>
			</div>
            <!-------- end: tab��ǩ-------------------------------------->
            <!-------- start: ��ǩ��񲿷�-------------------------------------------------->
            <table class="table4" width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                  <!-------------start---���sa1����--------------------------------------------------------------------------------->
                  <table width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">
                    <!----------start:���ܰ�ť����--------------->
                    
                    <!----------end:���ܰ�ť����--------------->
                    <!----------start:���ݼ�¼����----------------------------->
                    <tr>
                      <td align="center"> 
                     <div id="chartdiv" align="center"> </div>
					     		<script type="text/javascript">
						   			var chart = new FusionCharts("<%=app%>/Charts/Pie3D.swf", "ChartId", "100%", "380", "0", "0");
						   			chart.setDataXML("<chart  xAxisName='��λ����' yAxisName='��λ����' formatNumberScale='1' shownames='1' showValues='0' bgColor='FFFFFF,CC3300' bgAngle='270' bgAlpha='10,10' showBorder='1' showPercentageValues='1'><set label='�����=0' value='0' tooltext='�����0��'/><set label='�����=1' value='1' tooltext='�����1��'/><set label='����������=0' value='0' tooltext='����������0��'/><set label='������=1' value='1' tooltext='������1��'/><set label='�ѻظ�=1' value='1' tooltext='�ѻظ�1��'/><set label='�ѷ���=0' value='0' tooltext='�ѷ���0��'/><set label='����˻�=0' value='0' tooltext='����˻�0��'/><styles><definition><style name='CaptionFont' type='font' font='SimSun' Color='000000' Bold='0' size='16'/></definition><application><apply toObject='xAxisName' styles='CaptionFont'/><apply toObject='yAxisName' styles='CaptionFont'/><apply toObject='LEGEND' styles='CaptionFont'/><apply toObject='DATALABELS' styles='CaptionFont'/><apply toObject='YAXISVALUES' styles='CaptionFont'/><apply toObject='TOOLTIP' styles='CaptionFont'/></application></styles></chart>");
						   			chart.render("chartdiv");
								</script>
                       </td>
                    </tr>
                    <!----------end:���ݼ�¼����----------------------------->
                    <!----------start:���·�ҳ------------------>
                    <tr>
                      <td class="td11">

					  </td>
                    </tr>
                    <!----------end:���·�ҳ------------------>
                  </table></td>
              </tr>
            </table>
            <!-------- end: ��ǩ��񲿷�---------------------------------------------------->
          </td>
        </tr>
      </table></td>
  </tr>
  <!-- end:tab���ǩҳ��ʵ�ֲ��� -->
</table>
</form>
</body>

</html>

