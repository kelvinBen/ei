<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>发送</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
	<%
		String extUrl="";
	    String queueId = (String)request.getAttribute("queueId");
		String windowName=(String)request.getAttribute("window_name");
		String isStart=(String)request.getAttribute("isStart");
		String isQuery=(String)request.getAttribute("isQuery");
		String pk=(String)request.getAttribute("primaryKey");
		String pf=(String)request.getAttribute("processField");
		if(null==queueId){
		    queueId=(String)request.getParameter("queueId");
		}if(null==windowName){
			windowName=(String)request.getParameter("window_name");
		}if(null==isStart){
			isStart=(String)request.getParameter("isStart");
		}if(null==isQuery){
		    isQuery=(String)request.getParameter("isQuery");
		}if(null==pk){
		    pk=(String)request.getParameter("primaryKey");
		}if(null==pf){
		    pf=(String)request.getParameter("processField");
		}
		extUrl="isStart="+isStart+"&isQuery="+isQuery+"&window_name="+windowName+"&primaryKey="+pk+"&queueId="+queueId+"&processField="+pf;
       // String t_curActDefId = request.getParameter("curActDefId");
	%>
function forReturn(){

	if(document.forms[0].partyId.value==""){
		if(!confirm("确定不选择参与者吗？"))return;
	
	}
	var result = new Array();
	var actInfo=document.all("acts").value.split("|");
	result[0]=actInfo[0];

	result[1]=actInfo[1];
	result[2]=document.forms[0].partyId.value;
	result[3]=document.forms[0].partyName.value;	
	var url="mofprocess.cmd?method=send&<%=extUrl%>";
	url+="&nextActivityName="+result[0];
	url+="&nextActivityDisName="+result[1];
	url+="&nextActivityPartyName="+result[2];
	url+="&nextActivityPartyDisName="+result[3];
	document.forms[0].action=url;
	document.forms[0].submit();
}

function actsChange(){
document.forms[0].partyId.value="";
document.forms[0].partyName.value="";
document.getElementById("partysIdName").innerHTML="";
var actInfo=document.all("acts").value.split("|");
	var optlen=document.forms[0].limitTimeUnit.options.length;
	for(var i=0;i<optlen;i++)
	{
		var opt=document.forms[0].limitTimeUnit.options[i];
		if(opt.value==actInfo[4])opt.selected=true;
	}
	document.forms[0].limitTime.value=actInfo[2];
	document.forms[0].warnTime.value=actInfo[3];
}

function doimgclickt(){
	

	var queueId="<%=queueId%>";
	var processId=queueId.substring(0,queueId.indexOf("|"));
	//alert(processId);
	var actInfo=document.all("acts").value.split("|");
	var haveSelect="";
	if(document.forms[0].partyId.value!=""){
		var ids=document.forms[0].partyId.value.split(","); 
		var names=document.forms[0].partyName.value.split(","); 
		
		for(var i=0;i<ids.length;i++){
			if(i>0)haveSelect+="|";
			
			haveSelect+=ids[i]+","+names[i];
		}	
	}
	var url ="jsp/help.jsp?url=partynextactivityquery.cmd&processId="+processId+"&curActDefId=" + actInfo[0]+"&haveSelect="+haveSelect;      
  	//alert(actInfo[0]);
  	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	 var curobj=window.event.srcElement;
 	 if(win==null)return;
  	 var result=parseTree(win);
  	document.forms[0].partyId.value=result[0];
  	document.forms[0].partyName.value=result[1];
 	curobj.nextSibling.innerHTML=result[1];
	}
function checkInt(){
if(window.event.srcElement.value=="")return;
if(!isInteger(window.event.srcElement)){
	alert("请输入整数！");
	window.event.srcElement.focus();
	window.event.srcElement.value="";
	
}
}	
</script>
</HEAD>

<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<div class="btnareaCss">
		<html:button name="发送" value="发送" onclick="forReturn()"></html:button>
		<html:button name="取消" value="取消" onclick="javascript:window.close();"></html:button>
</div>
<div align="center">

<br><fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
		<tr>
		<td class="tdLeft">是否需要回执：</td>
			<td class="TdRight"><INPUT TYPE=RADIO NAME="revert" VALUE="0" checked>否 &nbsp;&nbsp;<INPUT TYPE=RADIO NAME="revert" VALUE="1">是</td>
		</tr>
		<tr>
		<td class="tdLeft">选择消息提醒：</td>
		
			<td class="TdRight">			
			<%
				List msgTypeList=(List)request.getAttribute("messageTypeList");
				for(int i=0;i<msgTypeList.size();i++){
					Map msgm=(Map)msgTypeList.get(i);
					String msgTypeId=(String)msgm.get("msgTypeId");
					String msgTypeName=(String)msgm.get("msgTypeName");
					%>
					<input type="checkbox" name="msgType" value="<%=msgTypeId%>"><%=msgTypeName%>&nbsp;&nbsp;
					<%
				}
			%>
			</td>
		</tr>			
		<tr>
		<td class="tdLeft">选择环节：</td>
			<td class="TdRight">
									
	          <select name="acts" onChange="actsChange()">
	         
				<%
					List nextActivities=(List)request.getAttribute("nextActivities");
					for(int i=0;i<nextActivities.size();i++){
						Map am=(Map)nextActivities.get(i);
						String actDefId=(String)am.get("activityDefId");
						String actDisName=(String)am.get("activityDefName");
						String limitTime=(String)am.get("limitTime");
						String warnTime=(String)am.get("warnTime");
						String durationUnit=(String)am.get("durationUnit");
					%>
					
					<option value="<%=actDefId%>|<%=actDisName%>|<%=limitTime%>|<%=warnTime%>|<%=durationUnit%>"><%=actDisName%></option>
					<%	

					}
				%>
			 </select>	 

	        </td>
		</tr> 
		<tr>
		<td class="tdLeft">选择参与者：</td>
			<td class="TdRight">
			     <input type="hidden" name="partyId" value="">
                 <input type="hidden" name="partyName" value="">
                   	 <img src="skins/default/images/liulan.gif" onclick="doimgclickt()" style="cursor:hand;" border="0"><span id="partysIdName"></span>
	        </td>
		</tr>
		<tr>
		<td class="tdLeft">限时单位：</td>
			<td class="TdRight">
     <html:select name="limitTimeUnit"  property="limitTimeUnit">
        <html:options collection="WF_TASKINFO_LIMIT_TIME_UNIT_COLLECTION" property="key" labelProperty="value"/>
     </html:select> 			
			</td>
		</tr>
		<tr>
			<td class="tdLeft">限制时间：</td>
			<td class="TdRight">
			<html:text name="limitTime" property="limitTime" onblur="checkInt()"></html:text>	
			</td>
		</tr>	
		<tr>
			<td class="tdLeft">警告时间：</td>
			<td class="TdRight">
			<html:text name="warnTime" property="warnTime" onblur="checkInt()"></html:text>	
			</td>
		</tr>	 			                  
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
actsChange();
</script>
