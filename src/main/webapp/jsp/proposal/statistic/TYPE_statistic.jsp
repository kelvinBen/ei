<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="net.mast.util.KeyValue"%>
<%@page import="net.mast.waf.ext.service.enums.EnumService"%>
<%@page import="net.mast.waf.ComponentFactory"%>
<% 
//保存查询条件
    String starttime = RequestUtil.getPara2String(request,"starttime");
    String endtime = RequestUtil.getPara2String(request,"endtime");
    String app=request.getContextPath(); 
    List list = (List)request.getAttribute("list");

	StringBuffer sbs = new StringBuffer(800);	
	sbs.append("<chart xAxisName='联名类别统计' yAxisName='联名类别统计：件' formatNumberScale='0' shownames='1' ");
	sbs.append("showValues='0' bgColor='FFFFFF,CC3300' bgAngle='270' bgAlpha='10,10' showBorder='1' >");
	EnumService e=ComponentFactory.getEnumService();	
	List des= e.getValueDescsList("PROPOSALBUZI.TYPE");
	for(int i=0;i<des.size();i++){
		KeyValue key=(KeyValue)des.get(i);
		String sum = "0";
		for(int j=0;j<list.size();j++){
			Map map = (Map)list.get(j);
			String data=(String)map.get("TYPE");
			if(key.getKey().equals(data)){
				sum = (String)map.get("SUM");
				break;
			}
		}
		sbs.append("<set value='"+sum+"' label='"+key.getValue()+" (共"+sum+"件)' />");
	}	

	sbs.append("<styles><definition><style name='CaptionFont' type='font' font='SimSun' Color='000000' Bold='0' size='14'/></definition><application><apply toObject='xAxisName' styles='CaptionFont'/><apply toObject='yAxisName' styles='CaptionFont'/><apply toObject='LEGEND' styles='CaptionFont'/><apply toObject='DATALABELS' styles='CaptionFont'/><apply toObject='YAXISVALUES' styles='CaptionFont'/><apply toObject='TOOLTIP' styles='CaptionFont'/></application></styles></chart>");

%>


<HTML>
<HEAD>
<TITLE>联名类别统计</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
</HEAD>
<BODY topmargin="10px">
<script type="text/javascript" src="<%=app %>/Charts/FusionCharts.js"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>

<bsp:container title="联名类别统计" >

<html:messages></html:messages>
<html:form name="frmList" action="proposalstatisticquery_page_init.cmd?flag=TYPE">
<table id="tblSearch">
<flex:search>
	<tr>
     <td>提交开始日期：<data:date name="starttime" divname="starttime1" value="<%=starttime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date></td>
 	<td>
 	<td>提交结束日期：<data:date name="endtime" divname="endtime1" value="<%=endtime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date></td>
 	<td>
 	<flex:searchImg name="chaxun" action="proposalstatisticquery_page_init.cmd?flag=TYPE" image="search.gif"/></td>
 	
	</tr>
</flex:search>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
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
            <!-------- end: tab标签-------------------------------------->
            <!-------- start: 标签表格部分-------------------------------------------------->
            <table class="table4" width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                  <!-------------start---表格sa1部分--------------------------------------------------------------------------------->
                  <table width="100%" id="sa1" border="0" cellpadding="0" cellspacing="0">

                    <tr>
                      <td align="center"> 
                     <div id="chartdiv" align="center"> </div>
					     		<script type="text/javascript">
						   			var chart = new FusionCharts("<%=app%>/Charts/Pie3D.swf", "ChartId", "100%", "380", "0", "0");
						   			chart.setDataXML("<%=sbs.toString()%>");						   			
						   			chart.render("chartdiv");
								</script>
                       </td>
                    </tr>
                    <!----------end:数据记录部分----------------------------->

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
</html:form>
</bsp:container>
