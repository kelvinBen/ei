<%@ page contentType="text/html;charset=GBK" %>

<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%
	String processName = request.getParameter("processName");
	if( processName == null ) processName="";
	String beginTime = request.getParameter("beginTime");
	if( beginTime == null ) beginTime="";
	String endTime = request.getParameter("endTime");
	if( endTime == null ) endTime="";
	String state = request.getParameter("state");
	if( state == null ) state="";
	String work_btn = "��   ��";
	if( state.equals("Done") || state.equals("Monitor")) work_btn="��  ��";
	
	//�������б����Ŀ��Ҫ�����б�����������
	String list_title = "���������б�";
	if(state.equals("Done"))
		list_title = "�Ѱ������б�";
	if(state.equals("Monitor"))
		list_title = "�������б�";
		
	String processtype = request.getParameter("processType");
	if (processtype == null)
		processtype = "";
%>
<HTML>
<HEAD>
<TITLE><%=list_title%></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<widgets:container title="<%=list_title%>" >
<widgets:containbutton onclick="doWork()" text="<%=work_btn%>"></widgets:containbutton>
<%if(state.equals("Monitor") || state.equals("Done") ){%>
<widgets:containbutton onclick="doLocation()" text="��ǰλ��"></widgets:containbutton>
<widgets:containbutton onclick="doHistory()" text="��ת��ʷ"></widgets:containbutton>
 <%}%>
<html:messages></html:messages>
<html:form name="frmList" action="" method="POST">
<input type="hidden" name="return_url" value="mofprocessquery.cmd?processName=<%=processName%>&beginTime=<%=beginTime%>&endTime=<%=endTime%>&state=<%=state%>" />

<table id="tblSearch" >
<html:hidden name="isSearch" value="1" />
<html:hidden name="state" property="state" />
<html:hidden name="processType" value="<%=processtype%>"/>
<tr>
<td class="tdRight" nowrap> ����ʱ�䣺<date:date name="beginTime" divname="beginTime_div" property="beginTime" zindex="70" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"/><input style="visibility:hidden"/>
��<date:date name="endTime" divname="endTime_div" property="endTime" zindex="73" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"/><input style="visibility:hidden"/>
</td>
<td class="tdRight"> �������̣�<html:select name="processName" property="processName" >
    <html:options  collection="process.Collection" labelProperty="description" property="name"  /> </html:select>
</td>
<td><flex:searchImg name="chaxun" action="mofprocessquery.cmd" image="search.gif"/></td>
</tr>
</table>
<flex:flexgrid name="grid" height="340" action="mofprocessquery.cmd" isSubmit="true">
							<flex:checkboxCol caption="ѡ��" width="50" property="primaryKey" name="primaryKey" canSort="false" sortName="s.n" ></flex:checkboxCol>
							<flex:flexCol caption='Window' width="100" property="windowName" canSort="false"  sortName="s.n" style="display:none;text-align:left" >
							</flex:flexCol>
							<flex:flexCol caption='����ID' width="120" property="queueId" canSort="false" sortName="s.n" style="display:none;text-align:left;cursor:hand"  onclick="doWork(true)" >
							</flex:flexCol>
							<flex:flexCol caption='�����ʶ' width="150" property="primaryKey" canSort="false" sortName="s.n" style="display:none;text-align:left;cursor:hand" onclick="doWork(true)" >
							</flex:flexCol>
							<flex:flexCol caption='�������' width="200" property="title" canSort="false" sortName="s.n" style="text-align:left;cursor:hand" onclick="doWork(true)" >
							</flex:flexCol>
							<flex:flexCol caption='������' width="140" property="initiator"   canSort="false" sortName="s.n" style="text-align:left" >
							</flex:flexCol>	
							<flex:flexCol caption='����ʱ��' width="150" property="queueCreateTime" canSort="false" sortName="s.n" style="text-align:left;cursor:hand" onclick="doWork(true)" >
							</flex:flexCol>
													
							<flex:flexCol caption='��ǰ����' width="110" property="activity"   canSort="false" sortName="s.n" style="text-align:left" >
							</flex:flexCol>
													
							<flex:flexCol caption='������' width="140" property="address"   canSort="false" sortName="s.n" style="text-align:left" >
							</flex:flexCol>	
							
							<flex:flexCol caption='����ʱ��' width="150" property="processCreateTime" canSort="false" sortName="s.n" style="text-align:left;cursor:hand" onclick="doWork(true)" >
							</flex:flexCol>
							
							<flex:flexCol caption='��������' width="150" property="processDescription"   canSort="false" sortName="s.n" style="text-align:left" >
							</flex:flexCol>
							<flex:flexCol caption='����ID' width="150" property="processId"   canSort="false" sortName="s.n" style="display:none;text-align:left" >
							</flex:flexCol>
							<flex:flexCol caption='workitemID' width="120" property="workitemId" canSort="false" sortName="s.n" style="display:none;text-align:left;cursor:hand"  onclick="doWork(true)" >
							</flex:flexCol>
							<%if(state.equals("Monitor")){%>
							<flex:flexCol caption='����״̬' width="120" property="state"   canSort="false" sortName="s.n" style="text-align:left" >
							</flex:flexCol>
							<%}%>
												
</flex:flexgrid>

</html:form>
</widgets:container>
<script language="javascript">
grid.show();
		grid.setTouAlign(1,"center");
		grid.setTouAlign(2,"center");
		grid.setTouAlign(3,"center");
		grid.setTouAlign(4,"center");
		grid.setTouAlign(5,"center");
		grid.setTouAlign(6,"center");
		grid.setTouAlign(7,"center");
		grid.setTouAlign(8,"center");
		grid.setTouAlign(9,"center");
		grid.setTouAlign(10,"center");
		grid.setTouAlign(11,"center");
		grid.setTouAlign(12,"center");
		grid.setTouAlign(13,"center");
		<%if(state.equals("Monitor")){%> grid.setTouAlign(14,"center"); <%}%>

function doWork(hand){
  if(!hand && !getSelect()) return;
  var sel;
  if( hand )
  	sel = grid.getCurrentLine();
  else
  	sel=grid.getCheckLineNo();
  //alert("sel:" +sel);
  var window = grid.getCellValue(sel,2);
  var queueId = grid.getCellValue(sel,3);
  var pk = grid.getCellValue(sel,1);
  var state = document.forms[0].state.value;
  if( state == "Done" || state=="Monitor")
	  document.forms[0].action ="mofexec.cmd?method=detail&window_name="+window+"&queueId="+queueId + "&primaryKey=" + pk;    
  else
	  document.forms[0].action ="mofexec.cmd?method=forupdate&window_name="+window+"&queueId="+queueId + "&primaryKey=" + pk;    
  document.forms[0].submit();	
}
//��ת��ʷ
function doHistory(){
  if(!getSelect()) return;
  var sel = grid.getCheckLineNo();  
  var queueId = grid.getCellValue(sel,3);
  var processId= grid.getCellValue(sel,12);
  var workitemId=grid.getCellValue(sel,13);
  //document.forms[0].action = "jsp/help.jsp?url=ecptaskhistorycmd.cmd&queueid="+queueId;
  //document.forms[0].action = "mofexecquery.cmd?window_name=wfqueuelog&workitemId="+workitemId;
  var url = "jsp/help/help.jsp?url=mofexecquery.cmd&window_name=wfqueuelog&parent_window=mof_wfprocess&main_primaryKey="+workitemId;
  showModalDialog(url,window,"scroll:auto;status:no;dialogWidth:600px;dialogHeight:500px");
  //document.forms[0].action = "mofexecquery.cmd?window_name=wfqueuelog&parent_window=mof_wfprocess&main_primaryKey="+workitemId;
  //document.forms[0].submit();
  
}
//��ǰλ��
function doLocation(){
  if(!getSelect()) return;
  var sel = grid.getCheckLineNo();  
  var queueId = grid.getCellValue(sel,3);
  var processId= grid.getCellValue(sel,12);
  document.forms[0].action = "jsp/help.jsp?url=caseappfunctioncmd.cmd&method=flowView&processid="+processId+"&queueid="+queueId;
  document.forms[0].submit();

}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
	alert("��ѡ��һ����¼!");
	return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
	alert("��ѡ��һ����¼!");
	return false;
  }  
  return true;
}

function checkSelect(count){
  if( count == "0" ) 	
  	return true;
  var sel=grid.getCheckLine();
  if(sel==""){
	alert("��ѡ��һ����¼!");
	return false;
  }
  if( count=="n")
  	return true;
  	
  var obj=sel.split(",");  
  if(obj.length*1>parseInt(count) ){
	alert("��ѡ��"+count+"��¼!");
	return false;
  }  
  return true;
}
</script>