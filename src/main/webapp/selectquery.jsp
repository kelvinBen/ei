<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/pubcommonhelp" prefix="help"%>

<HTML>
<HEAD>
<TITLE>行政区划查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='pubcommonhelp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<% 
    String superCode = (String)request.getAttribute("superCode");
    String country = (String)request.getAttribute("country");	
    String parentCode = (String)request.getAttribute("parentCode");
        if(country==null || country.equals("")){
		country="CN";
      }
      if(superCode==null || superCode.equals("")){
		superCode=country;
      }
	  if(parentCode==null || parentCode.equals("")){
			parentCode="CN";
	}
  
  List s=new ArrayList();
  request.setAttribute("flexgrid.data",s);
  for(int i=0;i<10;i++){
	  Map m=new HashMap();
	 m.put("cantCode",i+"c");
	 m.put("cantName",i+"名称");
	 m.put("shortName",i+"简称");
	 s.add(m);
  }
  String 	SEL_OPTS=request.getParameter("SEL_OPTS");
	if(SEL_OPTS==null)SEL_OPTS="";	
 
%>  
<%
    Map map = new HashMap();
map.put("viewprop","参数值");
map.put("dateprop",new Date());
request.setAttribute("html.data", map);
%>
<widgets:container title="行政区划列表" >

<html:form name="frmList" action="cantquery.cmd">
<table width=100%>

<tr><td width=60%>
<support:flexgrid name="grid" height="340"  export="true" isSubmit="true">
   <flex:checkboxCol caption="选择" width="40" property="cantCode"  name="primaryKey" sortName="PUB_CANT.CANT_CODE" />
   <flex:flexCol caption='编码' width="100" property="cantCode" style="text-align:left;cursor:hand;color: #000000; text-decoration: underline" sortName="PUB_CANT.CANT_CODE" onclick="clickCant(this)"></flex:flexCol>
   <flex:flexCol caption='名称' width="200" property="cantName" style="text-align:left" sortName="PUB_CANT.CANT_NAME"></flex:flexCol>                          
   <flex:flexCol caption='名称' width="200" property="shortName" style="text-align:left" sortName="PUB_CANT.CANT_NAME"></flex:flexCol>                          

</support:flexgrid>

</td>
<td width=10% align="center">

<button name="btnUp" onclick="moveUp()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">∧</button>
<br><br>
<button name="btnRight" onclick="moveRight()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">＞</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">＜</button>
<br><br>
<button name="btnDown" onclick="moveDown()" onmouseover="this.className='advbutton-over';" onmouseout="this.className='advbutton';" class="advbutton">∨</button>
</td>
<td width=30% align=center valign="top" onkeydown="">
已选项<br>
<select name="SelOpts"  size="15"  style="width:150" multiple="multiple">
<%
%>

</select>
</td></tr>
</table>
<!--存放已经被选项，格式：选项1的值:选项1的显示名称,选项2的值:选项2的显示名称,  其中 值 的格式如果有多项则用 #号分隔......-->
<input type="text" name="SEL_OPTS" id="SEL_OPTS" value="<%=SEL_OPTS%>" size=50> 
<br/>
<input type="text" name="forhelp1" value="" onclick="postAddress_dialog()"  size=50> <input type="text" name="forhelp2" value="" > 
forhelp:
<div style="display:none" >
<help:helpsearch name="postAddress"  size="40"  helpid="test" ismulti="true" value="" changefield="forhelp1#1,forhelp2#2"/>
</div>
<br/>只显示选择按钮
<help:helpsearch name="postAddress2" style="display:none" size="40"  helpid="test" ismulti="true" value="" changefield="forhelp1#1,forhelp2#2"/>
<br/>包含文本框一起显示，当前文本框就是表单里面的要提交数据
<help:helpsearch name="postAddress3"  size="40"  helpid="test" param="CODE=2" ismulti="true" value="" changefield="forhelp1#1,forhelp2#2"/>

</html:form>
</widgets:container>

<script language="javascript">
grid.dblclickEvent=function()
{
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="cant.cmd?method=detail&country=<%=country%>&superCode=<%=superCode%>&primaryKey="+id;
}
grid.show();
grid.setSumText("");
grid.setTouAlign(2,"center");
grid.setTouAlign(3,"center");
var key;
//自己设置选中项
function setSEL_OPTS(){
	var SEL_OPTS="";
	var postAddress= $('postAddress').value;
	var postAddress_TEXT= $('postAddress_TEXT').value;
	var postAddressob= postAddress.split(",");
	var postAddress_TEXTob= postAddress_TEXT.split(",");
	for(var i=0;i<postAddress_TEXTob.length;i++){
		if(i>0)
			SEL_OPTS+=",";
		SEL_OPTS=SEL_OPTS+postAddressob[i]+"#"+postAddress_TEXTob[i];
		SEL_OPTS=SEL_OPTS+":"+postAddress_TEXTob[i];
	}
	//alert(SEL_OPTS);
	$('SEL_OPTS').value=SEL_OPTS;
	
}

function setSel(win){	 
	 var sel='';
	      for(i=0;i<win.length;i++){
			var line=win[i];
			 
			var selline='';	
			for(var j=0;j<line.length;j++){
				alert(line[j]);
					if(j>0)
						selline=selline+'#'+line[j];
					else
						selline=line[j];
				
			}
			//alert("selline:"+selline);
			selline=selline+':'+line[1];
			
			if(i>0)
				sel=sel+','+selline;
			else
				sel=selline;		
		//alert(sel);
		}
		d_form.postAddress_SEL_OPTS.value=sel;	 
		//alert(sel);
		$('SEL_OPTS').value=sel;
}



function getSelect(){
  var sel=grid.getCheckLine();
  key=sel;
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
function getDelete(){
var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择要删除的记录!");
    return false;
  }
  if (!confirm("真的要删除选中的记录吗？此操作不能恢复！")) {
   	     return false;
   	     }  
  return true;
}

function moveRight(){
	var sel=grid.getCheckLine();
	  if(sel==""){
	    alert("请选择记录!");
	    return false;
	  }
	  var selOpts=document.all("SelOpts");
	 var lines=grid.getCheckAll();
	 var LineArray = lines.split("|");//行数组
	 for(var i=0;i<LineArray.length;i++){
	 	var line=LineArray[i].split(","); 
	 	//如果已选项中已经存在，则忽略
	 	var exist=0;
	 	for(var j=selOpts.options.length-1;j>=0;j--)
	 	{
	 		var val=selOpts.options[j].value;
	 		if(val==line[1])exist=1;
	 			
	 	}
	 	if(exist==0){
		 	var opn=document.createElement("<OPTION>");
	 		selOpts.options.add(opn);
	 		opn.innerText=line[2];
	 		opn.value=line[1];	 		
	 	}
	 	

	 }
	 setSel();	  	
}
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
	 		tempSel=tempSel + "," + val+":"+showName;
	 
	}
	SEL_OPTS.value=tempSel;	
}
</script>