<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.bsp.calendar.cmd.CalendarShow"%>

<%
    String year_s = (String)request.getAttribute("year");
    String organId = (String)request.getAttribute("organId");
    String organName = (String)request.getAttribute("organName");
    String cur_year_s = (String)request.getAttribute("cur_year");
    String cur_month_s = (String)request.getAttribute("cur_month");
    String cur_day_s = (String)request.getAttribute("cur_day");
    List strHoliday = (List)request.getAttribute("strHoliday");
    int year = Integer.parseInt(year_s);
    int cur_year = Integer.parseInt(cur_year_s);
    int cur_month = Integer.parseInt(cur_month_s);
    int cur_day = Integer.parseInt(cur_day_s);   
    int month=0;
    String s ="";
    CalendarShow calendarShow = new CalendarShow();
    
%>
<%
   String refreshId = (String)request.getAttribute("refreshId");
%>	 
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<bsp:container title="工作日历" >
<html:form  name="frmList"  action="">
<input type="hidden" name="year" value="<%=year_s%>">
<input type="hidden" name="organId" value="<%=organId%>">

<table id="tblSearch">
	<tr>
	<td>机构名称：<%=organName%></td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td>年份：<%=year_s%></td>
        </tr>
</table>


<tab:tab  id="tab1" type="table">
<tab:card id="card0" text=" 一、二月  ">
<table width="100%" cellpadding="0" class="tblContent">
         <tr>
            <td id="tdWorkArea" class="tdWorkArea"> 
              <%
               month=0;
               s = calendarShow.getShow(year,month,strHoliday,cur_year,cur_day,cur_month);
               out.println(s);
              %>
            </td>
        </tr>
</table>
</tab:card>
<tab:card id="card1" text=" 三、四月  ">
<table width="100%" cellpadding="0" class="tblContent">
         <tr>
            <td id="tdWorkArea" class="tdWorkArea"> 
              <%
               month=2;
               s = calendarShow.getShow(year,month,strHoliday,cur_year,cur_day,cur_month);
               out.println(s);
              %>
            </td>
        </tr>
</table>
</tab:card>
<tab:card id="card0" text=" 五、六月  ">
<table width="100%" cellpadding="0" class="tblContent">
         <tr>
            <td id="tdWorkArea" class="tdWorkArea"> 
              <%
               month=4;
               s = calendarShow.getShow(year,month,strHoliday,cur_year,cur_day,cur_month);
               out.println(s);
              %>
            </td>
        </tr>
</table>
</tab:card>
<tab:card id="card0" text=" 七、八月  ">
<table width="100%" cellpadding="0" class="tblContent">
         <tr>
            <td id="tdWorkArea" class="tdWorkArea"> 
              <%
               month=6;
               s = calendarShow.getShow(year,month,strHoliday,cur_year,cur_day,cur_month);
               out.println(s);
              %>
            </td>
        </tr>
</table>
</tab:card>
<tab:card id="card0" text=" 九、十月  ">
<table width="100%" cellpadding="0" class="tblContent">
         <tr>
            <td id="tdWorkArea" class="tdWorkArea"> 
              <%
               month=8;
               s = calendarShow.getShow(year,month,strHoliday,cur_year,cur_day,cur_month);
               out.println(s);
              %>
            </td>
        </tr>
</table>
</tab:card>
<tab:card id="card0" text=" 十一、十二月  ">
<table width="100%" cellpadding="0" class="tblContent">
         <tr>
            <td id="tdWorkArea" class="tdWorkArea"> 
              <%
               month=10;
               s = calendarShow.getShow(year,month,strHoliday,cur_year,cur_day,cur_month);
               out.println(s);
              %>
            </td>
        </tr>
</table>
</tab:card>
</tab:tab>
</html:form>
</bsp:container>
</BODY>
</HTML>

<script language="javascript">
function forSave(){
   
   document.forms[0].action ="workday.cmd?method=insert";    
   document.forms[0].submit();	
}
function init(){
     var refreshId ="<%=refreshId%>";
     getTreeFrame().seltree.refreshNodeById(refreshId); 
}
init();

</script>
