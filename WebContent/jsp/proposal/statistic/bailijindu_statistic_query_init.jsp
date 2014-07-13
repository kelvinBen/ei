<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<% 
//�����ѯ����
    String starttime = RequestUtil.getPara2String(request,"starttime");
    String endtime = RequestUtil.getPara2String(request,"endtime");
    String app=request.getContextPath();
 
    List list = (List)request.getAttribute("banlijingdulist");
	int sum = 0;
	String state = "";
	StringBuffer sbs = new StringBuffer(800);
	sbs.append("<chart  xAxisName='��λ����' yAxisName='��λ����' formatNumberScale='1' shownames='1' showValues='0' bgColor='FFFFFF,CC3300' bgAngle='270' bgAlpha='10,10' showBorder='1' showPercentageValues='1'>");
	EnumService e=ComponentFactory.getEnumService();	
	for(int i=0;i<list.size();i++){
	Map map = (Map)list.get(i);
	sum = Integer.parseInt((String)map.get("SUM"));
	state =e.getDescByValue("PROPOSALBUZI.STATE",String.valueOf(map.get("STATE")));
	sbs.append("<set label='"+state+"="+sum+"' value='"+sum+"' tooltext='"+state+""+sum+"��'/>");
	}
	sbs.append("<styles><definition><style name='CaptionFont' type='font' font='SimSun' Color='000000' Bold='0' size='16'/></definition><application><apply toObject='xAxisName' styles='CaptionFont'/><apply toObject='yAxisName' styles='CaptionFont'/><apply toObject='LEGEND' styles='CaptionFont'/><apply toObject='DATALABELS' styles='CaptionFont'/><apply toObject='YAXISVALUES' styles='CaptionFont'/><apply toObject='TOOLTIP' styles='CaptionFont'/></application></styles></chart>");

%>
<%@page import="net.mast.waf.ComponentFactory"%>
<%@page import="net.mast.waf.ext.service.enums.EnumService"%>
<HTML>
<HEAD>
<TITLE>�������ͳ�Ʋ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<script type="text/javascript" src="<%=app %>/Charts/FusionCharts.js"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>

<bsp:container title="�������ͳ�Ʋ�ѯ" >

<html:messages></html:messages>
<html:form name="frmList" action="proposalstatisticquery_page_init.cmd?flag=0?flag=0">
<table id="tblSearch">
<flex:search>
	<tr>
     <td>�ύ��ʼ���ڣ�<data:date name="starttime" divname="starttime1" value="<%=starttime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date></td>
 	<td>
 	<td>�ύ�������ڣ�<data:date name="endtime" divname="endtime1" value="<%=endtime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date></td>
 	<td>
 	<flex:searchImg name="chaxun" action="proposalstatisticquery_page_init.cmd?flag=0" image="search.gif"/></td>
 	
	</tr>
</flex:search>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
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
						   			var chart = new FusionCharts("<%=app%>/Charts/Pie2D.swf", "ChartId", "100%", "380", "0", "0");
						   			chart.setDataXML("<%=sbs.toString()%>");						   			
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
</html:form>
</bsp:container>
