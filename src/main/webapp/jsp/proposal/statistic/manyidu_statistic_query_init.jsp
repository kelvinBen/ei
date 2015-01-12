<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-date" prefix="data"%>
<%@page import="net.mast.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<%@page import="net.mast.waf.ext.service.enums.EnumService"%>
<%@page import="net.mast.waf.ComponentFactory"%>
<% 
//�����ѯ����
    String starttime = RequestUtil.getPara2String(request,"starttime");
    String endtime = RequestUtil.getPara2String(request,"endtime");
    String app=request.getContextPath(); 
    List list = (List)request.getAttribute("manyidulist");

	String state = "";
	StringBuffer sbs = new StringBuffer(800);	
	sbs.append("<chart xAxisName='�����ͳ��' yAxisName='�����ͳ�ƣ���' formatNumberScale='0' shownames='1' ");
	sbs.append("showValues='1' bgColor='FFFFFF,CC3300' bgAngle='270' bgAlpha='10,10' showBorder='1' ><categories>");
	EnumService e=ComponentFactory.getEnumService();	
	List des= e.getValueDescsList("BILLBUZI.SATISFY");
	String data="";
	for(int i=0;i<des.size();i++){
//	Map map = (Map)list.get(i);
//	String SATISFY= e.getDescByValue("BILLBUZI.SATISFY", String.valueOf(map.get("SATISFY")));
	KeyValue key=(KeyValue)des.get(i);
	sbs.append("<category label='"+key.getValue()+"'/>");	
	int sum = 0;
	for(int j=0;j<list.size();j++){		
		Map map = (Map)list.get(j);
		String SATISFY=(String)map.get("SATISFY");
		if(key.getKey().equals(SATISFY)){
			sum = Integer.parseInt((String)map.get("SUM"));
		}
		}	
	data+="<set value='"+sum+"'/>";
	}	
	sbs.append("</categories><dataset color='019B0C'>");
	sbs.append(data);
	sbs.append("</dataset><styles><definition><style name='CaptionFont' type='font' font='SimSun' Color='000000' Bold='0' size='14'/></definition><application><apply toObject='xAxisName' styles='CaptionFont'/><apply toObject='yAxisName' styles='CaptionFont'/><apply toObject='LEGEND' styles='CaptionFont'/><apply toObject='DATALABELS' styles='CaptionFont'/><apply toObject='YAXISVALUES' styles='CaptionFont'/><apply toObject='TOOLTIP' styles='CaptionFont'/></application></styles></chart>");

%>

<%@page import="net.mast.util.KeyValue"%>
<HTML>
<HEAD>
<TITLE>�����ͳ�Ʋ�ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='windowopen.js'/>"></script>
<script type="text/javascript" src="<%=app %>/Charts/FusionCharts.js"></script>
<script language="javascript" type="text/javascript" src="<mast:ui js='calendar.js'/>"></script>

<bsp:container title="�����ͳ�Ʋ�ѯ" >

<html:messages></html:messages>
<html:form name="frmList" action="proposalstatisticquery_page_init.cmd?flag=1">
<table id="tblSearch">
<flex:search>
	<tr>
     <td>�ύ��ʼ���ڣ�<data:date name="starttime" divname="starttime1" value="<%=starttime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date></td>
 	<td>
 	<td>�ύ�������ڣ�<data:date name="endtime" divname="endtime1" value="<%=endtime%>" readonly="true" sourceFormat="yyyy-MM-dd"></data:date></td>
 	<td>
 	<flex:searchImg name="chaxun" action="proposalstatisticquery_page_init.cmd?flag=1" image="search.gif"/></td>
 	
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
						   			var chart = new FusionCharts("<%=app%>/Charts/MSColumn3D.swf", "ChartId", "100%", "380", "0", "0");
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
