<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>


<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>

</HEAD>

<BODY topmargin="10px" style="padding:0;margin:0" scroll=no>
<html:form  name="frmList"  action=""> 
<html:messages/>
<%

String url = SkinUtils.getRootUrl(request)+(String)request.getAttribute("url");
String url1 = SkinUtils.getRootUrl(request)+(String)request.getAttribute("url1");
%>
<table width="100%" cellpadding="0" height="90%"> 
 <tr>
<td width="70%">
<tab:tab  id="tab1" type="table" height="400">

<tab:card id="card1" text=" 个人地址本  ">
 <iframe src="<%=url1%>" style="display:block" id="memberbbsFrame1" frameborder=0 width="100%" height="100%"></iframe>
       
</tab:card>

<tab:card id="card0" text=" 公共地址本  ">
<iframe src="<%=url%>" style="display:block" id="memberbbsFrame" frameborder=0 width="100%" height="100%"></iframe>   
  
</tab:card>
</tab:tab> 
</td>

<td width=30% align=center valign="top">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>
			<fieldset class="FieldsetCss" ><legend>收件人</legend>
				<select name="GGSelOpts"  size="11"  style="width:90" multiple="multiple">
				</select>
			</fieldset>
			</td>
			<td>
				<iframe name="add1" style="display:none" frameborder="0" src="jsp/blank.jsp"></iframe>
			</td>
		</tr>
		<tr>
			<td>
			 	<button name="addAddress1" onclick="addA1()" class="advbutton">把收件人添加到组</button>
			</td>
		</tr>

		<tr>
			<td>
			<fieldset class="FieldsetCss" ><legend>抄送人</legend>
				<select name="GGSelOpts1"  size="11"  style="width:90" multiple="multiple">
				</select>
			</fieldset>
			</td>
			<td>
				<iframe name="add2" style="display:none" frameborder="0" src="jsp/blank.jsp"></iframe>
			</td>
		</tr>
		<tr>
			<td>
			 	<button name="addAddress2" onclick="addA2()" class="advbutton">把抄送人添加到组</button>
			</td>
		</tr>
	</table>
</td>

</tr>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0"> 
           <tr>
           <td>
           <p align="center">
			 <button name="alldataOk" onclick="showcheckdata()" class="advbutton">确定</button>
			 <button name="alldataCa" onclick="forCancel()" class="advbutton">取消</button>
			 </p>
			<td>
           </tr>
           </table>     
</html:form>
<script language="javascript">

var pwin = window.dialogArguments;
var left=window.screenLeft;
var top=window.screenTop;
function showcheckdata(){
	var SelOpts = document.all("GGSelOpts");
	var SelOpts1 = document.all("GGSelOpts1");
	var returnV=new Array(4);
	if(SelOpts.options.length==0)
	{
		returnV[0]="";
		returnV[1]="";
	}
	else
	{	var tempStrIds = "";
		var tempStrId = "";
		var tempStrValue = "";
		for(var i=0;i<SelOpts.options.length;i++)
		{
			tempStrIds = SelOpts.options[i].value.split(MatrixCol);
			if(tempStrIds.length>1){
				tempStrId+=tempStrIds[1]+";";
			}
			else {
				tempStrId+=SelOpts.options[i].value+";";
			}
			tempStrValue+=SelOpts.options[i].text+";";
		}
		
		returnV[0]=tempStrId.substring(0,tempStrId.lastIndexOf(";"));
		
		returnV[1]=tempStrValue.substring(0,tempStrValue.lastIndexOf(";"));
	}
	if(SelOpts1.options.length==0)
	{
		returnV[2]="";
		returnV[3]="";
	}
	else
	{	var tempStrIds1 = "";
		var tempStrId1 = "";
		var tempStrValue1 = "";
		for(var i=0;i<SelOpts1.options.length;i++)
		{
			tempStrIds1 = SelOpts1.options[i].value.split(MatrixCol);
			if(tempStrIds1.length>1){
				tempStrId1+=tempStrIds1[1]+";";
			}
			else {
				tempStrId1+=SelOpts1.options[i].value+";";
			}
			tempStrValue1+=SelOpts1.options[i].text+";";
		}
		returnV[2]=tempStrId1.substring(0,tempStrId1.lastIndexOf(";"));
		returnV[3]=tempStrValue1.substring(0,tempStrValue1.lastIndexOf(";"));
	}
	
	window.returnValue=returnV;
	
	parent.close();
}



function forCancel(){
	parent.close();
}
//把收件人添加到组
function addA1(){
	var SelOpts1 = document.all("GGSelOpts");
	var returnV=new Array(2);
	if(SelOpts1.options.length==0)
	{
		returnV[0]="";
		returnV[1]="";
	}
	else
	{	var tempStrIds = "";
		var tempStrId = "";
		var tempStrValue = "";
		for(var i=0;i<SelOpts1.options.length;i++)
		{	tempStrIds = SelOpts1.options[i].value.split(MatrixCol);
			if(tempStrIds.length>1){
				tempStrId+=tempStrIds[1]+";";
			}
			else {
				tempStrId+=SelOpts1.options[i].value+";";
			}
			tempStrValue+=SelOpts1.options[i].text+";";
			//从树中取得的组的邮箱为其地址类别编号，因此用0来做判断
			if (SelOpts1.options[i].value==null || SelOpts1.options[i].value=="" || SelOpts1.options[i].value.substr(0,1)=="0"){
				alert("不能把组"+SelOpts1.options[i].text+"加入到组中！");
				return false;
			}
		}
		returnV[0]=tempStrId.substring(0,tempStrId.lastIndexOf(";"));
		returnV[1]=tempStrValue.substring(0,tempStrValue.lastIndexOf(";"));
	}
	if (returnV[0]==null||""==returnV[0]){
		alert("请选择收件人！");
		return false;
	}
	this.dialogWidth=850+"px";
	document.all.add1.style.display="block";
	if(document.all.add1.src==null ||document.all.add1.src=="" || document.all.add1.src=="jsp/blank.jsp")
	document.all.add1.src="mailaddress.cmd?method=forward&id=" + returnV[0]+"&name="+returnV[1]+ "&msg=" + "收件人";
}
//把抄送人添加到组
function addA2(){
	var SelOpts2 = document.all("GGSelOpts1");
	var returnV=new Array(2);
	if(SelOpts2.options.length==0)
	{
		returnV[0]="";
		returnV[1]="";
	}
	else
	{	var tempStrIds = "";
		var tempStrId = "";
		var tempStrValue = "";
		for(var i=0;i<SelOpts2.options.length;i++)
		{	tempStrIds = SelOpts2.options[i].value.split(MatrixCol);
			if(tempStrIds.length>1){
				tempStrId+=tempStrIds[1]+";";
			}
			else {
				tempStrId+=SelOpts2.options[i].value+";";
			}
			tempStrValue+=SelOpts2.options[i].text+";";
			if (SelOpts2.options[i].value==null || SelOpts2.options[i].value=="" || SelOpts2.options[i].value.substr(0,1)=="0"){
				alert("不能把组"+SelOpts2.options[i].text+"加入到组中！");
				return false;
			}
		}
		returnV[0]=tempStrId.substring(0,tempStrId.lastIndexOf(";"));
		returnV[1]=tempStrValue.substring(0,tempStrValue.lastIndexOf(";"));
	}
	if (returnV[0]==null||""==returnV[0]){
		alert("请选择抄送人！");
		return false;
	}
	this.dialogWidth=850+"px";
	document.all.add2.style.display="block";
	if(document.all.add2.src==null ||document.all.add2.src=="" || document.all.add2.src=="jsp/blank.jsp")
	document.all.add2.src="mailaddress.cmd?method=forward&id=" + returnV[0]+"&name="+returnV[1]+ "&msg=" + "抄送人";
}
function display(condision){
     
	if (condision=="收件人"){
		document.all.add1.style.display="none";		
	}
	if (condision=="抄送人"){
		document.all.add2.style.display="none";		
	}	
	if(document.all.add1.style.display!="none" || document.all.add2.style.display!="none")
	{
		document.all.add1.contentWindow.dialogWidth=850+"px";
    }else {
    	document.all.add1.contentWindow.dialogWidth=550+"px";
    }
     document.all.add1.contentWindow.dialogLeft=left;
     document.all.add1.contentWindow.dialogTop=top;
}

	var SelOpts = document.all("GGSelOpts");
	var SelOpts1 = document.all("GGSelOpts1");
	if(pwin.winArr!=null)
	{

		var v1 = pwin.winArr[1].split(";");
		var v2 = pwin.winArr[3].split(";");
		var v3 = pwin.winArr[0].split(";");
		var v4 = pwin.winArr[2].split(";");

		for(var i=0;i<v1.length;i++)
		{
			if(v1[i]!=""&&v3[i]!="")
			{
				SelOpts.options[SelOpts.options.length] = new Option(v1[i],v3[i]);
			}
		}
		for(var j=0;j<v2.length;j++)
		{
			if(v2[j]!=""&&v4[j]!="")
			{
				SelOpts1.options[SelOpts1.options.length] = new Option(v2[j],v4[j]);
			}
		}
		
		
	}	



</script>
</BODY>

</HTML>
