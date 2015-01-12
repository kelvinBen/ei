<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-grid" prefix="support"%> 
<%@ page import="net.mast.waf.ResourcesFactory"%>

<%
     String rootId = (String)request.getAttribute("rootId"); 
	 String organType[] = (String[])request.getAttribute("organType");
     String isCheckBox = (String)request.getAttribute("isCheckBox");
     String isIncludeSelf = (String)request.getAttribute("isIncludeSelf");
     String isIncludeStruPath = (String)request.getAttribute("isIncludeStruPath");
 	 String organTypeStr="";
     if(organType!=null){
	 	for(int i=0;i<organType.length;i++){
	 		if(i==organType.length-1)
	 			organTypeStr=organType[i];
	 		else
	 			organTypeStr=organType[i]+",";
	 	}
	 }
	 String parentOrganType = request.getParameter("parentOrganType");
	 String underlingOrganType = request.getParameter("underlingOrganType");
	 // ������ѡ�е�����
		String 	SEL_OPTS=request.getParameter("SEL_OPTS");
		if(SEL_OPTS==null)SEL_OPTS="";	
		
%>

<%@page import="java.util.StringTokenizer"%>
<HTML>
<HEAD>
<TITLE>ѡ����֯�ṹ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

<widgets:container title="��֯�ṹ" >
<html:form name="form1" action="">
<input type="hidden" name="rootId" value="<%=rootId%>">
<input type="hidden" name="organType" value="<%=organTypeStr%>">
<input type="hidden" name="isCheckBox" value="<%=isCheckBox%>">
<input type="hidden" name="isIncludeSelf" value="<%=isIncludeSelf%>">
<input type="hidden" name="isIncludeStruPath" value="<%=isIncludeStruPath%>">
<input type="hidden" name="parentOrganType" value="<%=parentOrganType%>">
<input type="hidden" name="underlingOrganType" value="<%=underlingOrganType%>">

<widgets:containbutton onclick="clickOk()" text="ȷ��"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="�ر�"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="���"></widgets:containbutton>
<table border=0 width=100%>
<tr>
<td>
	<table border=0 width=400px>
	<tr>
	<td align="left">��֯����:</td>
	<td><html:text name="organCode" value="" size="10" maxlength="30"/>&nbsp;&nbsp;&nbsp;</td>
	<td>��֯����:</td>
	<td><html:text name="organName" value="" size="10" maxlength="30"/>&nbsp;&nbsp;&nbsp;</td>
	<td><flex:searchNoPageImg name="chaxun" action="javascript:search()" image="search.gif"/></td>
	</tr> 
	<tr><td colspan="5"  width=100%>
	<flex:flexgrid name="grid" height="360"  action="" isSubmit="false">
1 struId	   <flex:checkboxCol caption="ѡ��" width="40" property="struId" onclick="moveRight()" name="primaryKey" sortName="stru.struId"></flex:checkboxCol>
2 organCode	   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>' width="100" property="organCode" style="text-align:left" sortName="stru.organCode"></flex:flexCol>  
3 organName	   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>' width="150" property="organName" style="text-align:left" sortName="stru.organName"></flex:flexCol>                          
4 organId	   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_ID")%>' width="40" property="organId" style="display:none" sortName="stru.organId" ></flex:flexCol> 
5 ���δ���	   <flex:flexCol caption="���δ���" width="200" property="value" style="text-align:left" sortName="stru.value" style="display:none"></flex:flexCol>                           
6 workplace	   <flex:flexCol caption="��������" width="100" property="workplace" style="text-align:left" sortName="stru.workplace" ></flex:flexCol>                           
	   
	</flex:flexgrid>
<flex:pagePolit action="stru.cmd?method=getSelectRoot" pageSize="15">
</flex:pagePolit>	
	
	</td>
	</tr>
	</table>

<td width='20px' align="center">

<button name="btnUp" onclick="moveUp()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">��</button>
<br><br>
<button name="btnRight" onclick="moveRight()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">��</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">��</button>
<br><br>
<button name="btnDown" onclick="moveDown()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">��</button>
</td>
<td  align=center valign="top" width='140px' onkeydown="">
��ѡ��<hr/>
<select name="SelOpts" style="height: 340px;width: 140" size=15  multiple="multiple">
<%
		StringTokenizer sel= new StringTokenizer(SEL_OPTS,"|");
		while(sel.hasMoreTokens()){
			String opt=sel.nextToken();
			StringTokenizer o = new StringTokenizer(opt,":");
			String val=o.nextToken();
			String show=o.nextToken();
%>
<option  value="<%=val%>"><%=show%></option>		
<%			
		}
%>
</select>
</td>
</tr>
</table>
<!--����Ѿ���ѡ���ʽ��ѡ��1��ֵ:ѡ��1����ʾ����,ѡ��2��ֵ:ѡ��2����ʾ����,......-->
<input type="hidden" id="SEL_OPTS" name="SEL_OPTS" value='<%=SEL_OPTS%>'  > 

</html:form>
</widgets:container>
<script language="javascript">
grid.show();
grid.setSumText("");

document.onkeydown = keyDown;
function keyDown(){
  if(event.keyCode==13) {
    search();
  }
}
function search(){
  var organCode = document.all("organCode").value;
  var organName = document.all("organName").value;
  var organType = document.all("organType").value;
  if(organType==null||organType==""){
	document.forms[0].action="stru.cmd?method=getUnderlingByOrganType&organCode="+organCode+"&organName="+organName;
	}
else {
	document.forms[0].action="stru.cmd?method=getSelectRoot&organCode="+organCode+"&organName="+organName;
}
  
  document.forms[0].submit();
} 

function clickOk(){
	if(getSelect()==null) return;
	var returnV=getSelect();
	window.returnValue=returnV;
	parent.close();
}

function clickCancel(){
    var returnV=new Array(5);
    returnV[0]="";
    returnV[1]=""; 
    returnV[2]="";
    returnV[3]="";
    returnV[4]="";
    window.returnValue=returnV;
	parent.close();
}
function forClose(){
 parent.close();
}

function getSelect(){
  //�ĳɴ� SEL_OPTS ��ȡֵ
  //var myall=grid.getCheckAll();
  var myall= document.forms[0].SEL_OPTS.value;
  var arrOut="";
  var arrOut1="";
  var arrOut2="";
  var arrOut3="";
  var arrOut4="";
  var ob=myall.split("|");
  for(var i=0;i<ob.length;i++)
  {
  var arr=ob[i].split(",");
  if(i<ob.length-1){
  arrOut+=arr[3]+","; //organId
  arrOut1+=arr[2]+","; //organName
  arrOut2+=arr[0]+","; //struId
  arrOut3+=arr[1]+","; //OrganCode
  arrOut4+=arr[4]+","; //���α���
  }
  else{
  arrOut+=arr[3];
  arrOut1+=arr[2];
  arrOut2+=arr[0];
  arrOut3+=arr[1];
  arrOut4+=arr[4];
  }
  }
  
 return new Array(arrOut,arrOut1,arrOut2,arrOut3,arrOut4);
 
}

function moveRight(){
	var sel=grid.getCheckLine();
	  if(sel==""){
	   // alert("��ѡ���¼!");
	    return false;
	  }
	  var selOpts=document.all("SelOpts");
	 var lines=grid.getCheckAll();
	 var LineArray = lines.split("|");//������
	 for(var i=0;i<LineArray.length;i++){
	 	var line=LineArray[i].split(","); 
	 	//�����ѡ�����Ѿ����ڣ������ ,����ԭ�� �������������
	 	var exist=0;
	 	//alert(line[1])
	 	for(var j=selOpts.options.length-1;j>=0;j--)
	 	{
	 		var val=selOpts.options[j].value;
	 		if(val==LineArray[i]){ //������ж����,�϶������
	 			exist=1;
	 			break;
	 		}
	 		else {//�������ȣ���ô���ж�StruId,����organcode�Ƿ����,���û���ǰ��
	 			//�ж��Ƿ������ǰ����
	 			//alert(val.indexOf(","+line[1]+",")>=0);
	 			//0 struId 1 organCode 2 organName 3 organId 
	 			if(val.indexOf(line[0]+",")>=0)
	 			   exist=1;
	 			else if(val.indexOf(","+line[1]+",")>=0)
	 			   exist=1;
	 			else if(val.indexOf(","+line[3]+",")>=0)
	 			   exist=1; 
		 		if(exist==1){
		 			//alert("val="+val+"  \n,selline="+selOpts.options[j].value);
		 			selOpts.options[j].innerText=line[2];
	 				selOpts.options[j].value=LineArray[i];// һ�е�����ֵ,ÿ�������� | �ָ�
		 			break;
		 		}
	 		}
	 	}
	 	if(exist==0){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);
	 		opn.innerText=line[2];
	 		//opn.value=line[1];  //��ֵ��ƴ������
	 		//alert(LineArray[i]);
	 		opn.value=LineArray[i];// һ�е�����ֵ,ÿ�������� | �ָ�
	 	}
	 	
	 }
	 setSel();	 //����ѡ����
}
//�Ƴ�ѡ����
function moveLeft(){
	var selOpts=document.all("SelOpts");
	var lens=selOpts.options.length;
	for(var i=lens-1;i>=0;i--)
	{
	 if(selOpts.options[i].selected)
	 {
	 	selOpts.options.remove(i);
	 }
	}
	setSel();	
}

function moveUp(){
  var selOpts=document.all("SelOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  for(var i=1;i<len;i++){
  	if(selOpts.options[i].selected){
		  //����
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		 
		  selOpts.options(i).innerText = selOpts.options(i-1).innerText;
		  selOpts.options(i).value = selOpts.options(i-1).value;
		  
		  selOpts.options(i-1).innerText = tmpOption.innerText;
		  selOpts.options(i-1).value =  tmpOption.value;
		 
		  selOpts.options(i-1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
  }	

  setSel();
}
function moveDown(){
  var selOpts=document.all("SelOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  	
  if(selIndex==len-1)return;
  var len = selOpts.length;
  for(var i=len-2;i>=0;i--){
  	
  	if(selOpts.options[i].selected){
		  //����
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		  
		  selOpts.options(i).innerText = selOpts.options(i+1).innerText;
		  selOpts.options(i).value = selOpts.options(i+1).value;
		  
		  selOpts.options(i+1).innerText = tmpOption.innerText;
		  selOpts.options(i+1).value =  tmpOption.value;
		 
		  selOpts.options(i+1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
  }	

  setSel();
}
//����ѡ�е�����
function setSel(){
	
	var selOpts=document.all("SelOpts");
	
	var lens=selOpts.options.length;
	var SEL_OPTS=document.all("SEL_OPTS");
	var tempSel="";
	for(var i=0;i<lens;i++)
	{
	 	var val=selOpts.options[i].value;
	 	var showName=selOpts.options[i].innerText;
	 	if(tempSel=="") 
	 		tempSel=val+":"+showName;
	 	else
	 		tempSel=tempSel + "|" + val+":"+showName; //ÿ�������� | �ָ�
	}
	SEL_OPTS.value=tempSel;	
}

</script>