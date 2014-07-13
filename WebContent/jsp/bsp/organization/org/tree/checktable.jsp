<%@ page contentType="text/html;charset=GBK" %>
<%@page import="net.mast.util.RequestUtil"%>
<%@page import="net.mast.bsp.util.StringUtil"%>
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
	 // 保存所选中的数据
		String 	SEL_OPTS=request.getParameter("SEL_OPTS");
		if(SEL_OPTS==null)SEL_OPTS="";	
    String exceptOrganType = (String)request.getAttribute("exceptOrganType");
    String isExact = (String)request.getAttribute("isExact");
    
    String organCode = RequestUtil.getAttrOrPara2String(request,"organCode");
    String organName = RequestUtil.getAttrOrPara2String(request,"organName");
    organCode = organCode==null?"":organCode;
    organName = organName==null?"":organName;
    
    //是否执行过了查询 标识，如果执行过查询，翻页应该不限制BU,rootId应该为1
    boolean isQueried = false;
    if("1".equals(rootId)){
    	isQueried = true;
    }
    
    
    String isIncludeSubCorporation = request.getParameter("isIncludeSubCorporation");
    
%>

<%@page import="java.util.StringTokenizer"%>
<HTML>
<HEAD>
<TITLE>选择组织结构</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<widgets:container title="组织结构" >
<html:form name="form1" action="">
<input type="hidden" name="rootId" value="<%=rootId%>">
<input type="hidden" name="organType" value="<%=organTypeStr%>">
<input type="hidden" name="isCheckBox" value="<%=isCheckBox%>">
<input type="hidden" name="isIncludeSelf" value="<%=isIncludeSelf%>">
<input type="hidden" name="isIncludeStruPath" value="<%=isIncludeStruPath%>">
<input type="hidden" name="parentOrganType" value="<%=parentOrganType%>">
<input type="hidden" name="underlingOrganType" value="<%=underlingOrganType%>">

<input type="hidden" name="exceptOrganType" value="<%=exceptOrganType%>">
<input type="hidden" name="isExact" value="<%=isExact%>">

<input type="hidden" name="isIncludeSubCorporation" value="<%=isIncludeSubCorporation%>">


<widgets:containbutton onclick="clickOk()" text="确定"></widgets:containbutton>
<widgets:containbutton onclick="forClose()" text="关闭"></widgets:containbutton>
<widgets:containbutton onclick="clickCancel()" text="清除"></widgets:containbutton>
<table border=0 width=100%>
<tr>
<td>
	<table border=0 width=400px>
	<tr>
	<td align="left">组织编码:</td>
	<td><html:text name="organCode" value="<%=organCode %>" size="10" maxlength="30"/>&nbsp;&nbsp;&nbsp;</td>
	<td>名称:</td>
	<td>
	<html:text name="organName" value="<%=organName %>" size="10" maxlength="30"/>
	&nbsp;&nbsp;&nbsp;
	
	</td>
	<td><flex:searchImg name="chaxun" action="javascript:search()" image="search.gif"/></td>
	</tr> 
	<tr><td colspan="5"  width=100%>
	
	<flex:flexgrid name="grid" height="360" hasSum="false" action="" isSubmit="false">
1 struId	   <flex:checkboxCol caption="选择" width="40" property="struId" onclick="moveRight()" name="primaryKey" sortName="stru.struId"></flex:checkboxCol>
2shortName		 <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.SHORT_NAME")%>' width="80" property="shortName" style="text-align:left" sortName="stru.shortName"></flex:flexCol>  
3 organName	   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_NAME")%>' width="120" property="organName" style="text-align:left" sortName="stru.organName"></flex:flexCol>                          
4 organId	   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_ID")%>' width="40" property="organId" style="display:none" sortName="stru.organId" ></flex:flexCol> 
5 所在部门和法人	   <flex:flexCol caption="所在部门和法人" width="200" property="corporationName"   sortName="stru.value" style="display:none"></flex:flexCol>                           
6 上级部门	   <flex:flexCol caption="上级" width="80" property="parentName"   sortName="stru.workplace" ></flex:flexCol>                           

7 workplace	   <flex:flexCol caption="所属地区" width="80" property="workplaceName"   sortName="stru.workplace" ></flex:flexCol>                           
8 organCode	   <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_STRU.ORGAN_CODE")%>' width="80" property="organCode" style="text-align:left" sortName="stru.organCode"></flex:flexCol>  
	   
	</flex:flexgrid>
<%
if(!isQueried){
	//如果执行过查询，翻页应该包括子公司
	 %>		
	<flex:pagePolit action="struEx.cmd?method=getSelectRoot" pageSize="15">
	</flex:pagePolit>	
<%
}else{
	 %>		
	<flex:pagePolit action="struEx.cmd?method=getSelectRootNoDupli&isIncludeSubCorporation=1" pageSize="15">
	</flex:pagePolit>	
	<%
}
%>			

	
	</td>
	</tr>
	</table>

<td width='20px' align="center">

<button name="btnUp" onclick="moveUp()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">∧</button>
<br><br>
<button name="btnRight" onclick="moveRight()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">＞</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">＜</button>
<br><br>
<button name="btnDown" onclick="moveDown()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">∨</button>
</td>
<td  align=center valign="top" width='140px' onkeydown="">
已选项<hr/>
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
<!--存放已经被选项，格式：选项1的值:选项1的显示名称,选项2的值:选项2的显示名称,......-->
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
	document.forms[0].action="struEx.cmd?method=getSelectRootNoDupli&organCode="+organCode+"&organName="+organName;
	var addStr = "&isIncludeSubCorporation=1&rootId=1";
  	document.forms[0].action+=addStr;
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
  //改成从 SEL_OPTS 中取值
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
  arrOut4+=arr[4]+","; //树形编码
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
	   // alert("请选择记录!");
	    return false;
	  }
	  var selOpts=document.all("SelOpts");
	 var lines=grid.getCheckAll();
	 var LineArray = lines.split("|");//行数组
	 for(var i=0;i<LineArray.length;i++){
	 	var line=LineArray[i].split(","); 
	 	//如果已选项中已经存在，则忽略 ,忽略原则： 按主键编码过滤
	 	var exist=0;
	 	//alert(line[1])
	 	for(var j=selOpts.options.length-1;j>=0;j--)
	 	{
	 		var val=selOpts.options[j].value;
	 		if(val==LineArray[i]){ //如果整行都相等,肯定不添加
	 			exist=1;
	 			break;
	 		}
	 		else {//如果不相等，那么就判断StruId,或者organcode是否相等,并置换当前项
	 			//判断是否包含当前数据
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
	 				selOpts.options[j].value=LineArray[i];// 一行的数据值,每项数据用 | 分割
		 			break;
		 		}
	 		}
	 	}
	 	if(exist==0){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);
	 		opn.innerText=line[2];
	 		//opn.value=line[1];  //将值都拼接起来
	 		//alert(LineArray[i]);
	 		opn.value=LineArray[i];// 一行的数据值,每项数据用 | 分割
	 		
	 	}
	 	
	 }
	 setSel();	 //保存选中项
}
//移除选中项
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
		  //生成
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
		  //生成
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
//设置选中的数据
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
	 		tempSel=tempSel + "|" + val+":"+showName; //每行数据用 | 分割
	}
	SEL_OPTS.value=tempSel;	
}

</script>
