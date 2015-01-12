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
<title>公共地址本/个人地址本</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='XMLSelTree.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>

</HEAD>
<%
    String type=(String)request.getAttribute("type");
%>
<BODY topmargin="10px">
<html:form  name="frmList"  action=""> 
<html:messages/>
  <table width="100%" cellpadding="0" cellspacing="0" border="0"> 
	      <tr>
	      
	         <td width="70%">
	         
	         <fieldset class="FieldsetCss" ><legend>组织树</legend>
                <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="true" type="checkbox" hasRoot="false"  style="width:100%;height:350;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="organName" nodeId="struId" nodeValue="organType" collection="functree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc" checkData="CheckData"  caption="organName">
	    </tree:selNode>
	</tree:selTree>
			</fieldset>
	         
	       
	       </td>
	         <td width=10% align=center>

<button name="btnRight" onclick="moveRight()"  class="advbutton">＞</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()"  class="advbutton">＜</button>
<br><br><br><br>
<button name="btnRight1" onclick="moveRight1()"  class="advbutton">＞</button>
<br><br>
<button name="btnLeft1" onclick="moveLeft1()"  class="advbutton">＜</button>
</td>
	      
	   
          </tr>  
        
   </table> 

<input type="hidden" name="nodeid" value="">    
<input type="hidden" name="nodevalue" value="">
<input type="hidden" name="nodename" value="">     
</html:form>
<script language="javascript">


function split(node){
  var nodeId=node;
  var arr = new Array(3);
  var i=nodeId.indexOf(',');
  var l=nodeId.length;
  if(i==-1) {
    arr[0]="-1";
    arr[1]="-1";
    arr[2]="-1";
    return arr;
  }
  else{
    arr[0]=nodeId.substring(0,i);
    arr[1]=nodeId.substring(i+1,nodeId.lastIndexOf(","));
    arr[2]=nodeId.substring(nodeId.lastIndexOf(",")+1,l);
    return arr;
  }
}

seltree.clickImg=function(node)
{
//alert(node.NodeId+","+node.outerHTML);
//如果是机构则列出下级  右边变成空白窗口
//如果是用户则显示用户明细
 if(node.NodeValue!=null){
 var arr = split(node.NodeValue);
 if(arr[1]=="8")
 {
 	
 	document.forms[0].nodevalue.value = arr[2];
 	//document.forms[0].nodevalue.value = node.NodeId+"^"+arr[2];
 	document.forms[0].nodeid.value=node.NodeId;
 	document.forms[0].nodename.value=arr[0];

 }
  var nodeId=node.NodeId;
  seltree.xmlsrc="mailaddress.cmd?method=getChoiceNode&reqtype=<%=type%>&parentId="+node.NodeId;
 }
 
}

seltree.clickText=function(node)
{

 if(node.NodeValue!=null){
var arr = split(node.NodeValue);
 if(arr[1]=="8")
 {
 	document.forms[0].nodevalue.value = arr[2];
 	//document.forms[0].nodevalue.value = node.NodeId+"^"+arr[2];
 	document.forms[0].nodeid.value=node.NodeId;
 	document.forms[0].nodename.value=arr[0];

 }


  var nodeId=node.NodeId;
  seltree.xmlsrc="mailaddress.cmd?method=getChoiceNode&reqtype=<%=type%>&parentId="+node.NodeId;  
 } 

}


function moveRight(node)
{	
	var returndata=seltree.GetAllCheckData(MatrixCol);
	var returntext=seltree.GetAllCheckText(MatrixCol); 
	var returnstruId=seltree.GetAllCheckNodeId(MatrixCol);
	var returnorgantype=seltree.GetAllCheckNodeValue(MatrixCol);
	var SelOpts = parent.document.all("GGSelOpts");
	var ids=returndata.split(MatrixCol);
	if(ids=="" || ids==null || ids.length==0)
				{
					alert('你没有选择右移的人员！');
					return;
				}
	var names=returntext.split(MatrixCol);
	var struId=returnstruId.split(MatrixCol);
	var organtype=returnorgantype.split(MatrixCol);
	A:
   for(var i=0;i<ids.length;i++)
		{
			var organTy=organtype[i].split("#")[1];
			if(organTy==2 || organTy==6)
			{   var arr = seltree.getChildrenNodes(struId[i]);
				B:
				  for(var k=0;k<arr.length;k++)
						{
							var nodeValue=arr[k].nodeValue.split("#")[1];
							var email=arr[k].nodeValue.split("#")[2];
							if(nodeValue==8 && email!="" && email!="null" && email!="-1")
							{	var exist=0;
								var SelOpts = parent.document.all("GGSelOpts");
								
								{
								var temp=new Option(arr[k].text,arr[k].checkData+MatrixCol+arr[k].nodeValue.split("#")[2]);
								var SelOpts1 = parent.document.all("GGSelOpts1");
								for(m=0;m<SelOpts1.options.length;m++){
									if(temp.value ==SelOpts1.options[m].value || email==SelOpts1.options[m].value)
									{	//alert("收件人和抄送人不能重复选择！");
										continue B;
									}
										
								}
								for(l=0;l<SelOpts.options.length;l++){
								if(email== SelOpts.options[l].value)
								{		
									alert("收件人不能重复选择！");
									continue B;
								}									
								}
								for(var j=SelOpts.options.length-1;j>=0;j--)
								{	
									var organIds=SelOpts.options[j].value.split(MatrixCol);
									for(var h=0;h<organIds.length;h=h+2)
									{	
										var organId=organIds[h];
										if(arr[k].checkData==organId)
										{	
											exist=1;
											continue;
										}
									
									}
									
								}
								if(exist==1)
									{
										continue;
									}
								if(exist==0)
								{
									SelOpts.options[SelOpts.options.length] = temp;
								}
							
						}
						
					}
			}
	}	 
	if(organTy==8)
			{	var email=organtype[i].split("#")[2];
				if(email!="" && email!="null" && email!="-1"){
					var exist=0;
				var temp=new Option(names[i],ids[i]+MatrixCol+email);
				var SelOpts1 = parent.document.all("GGSelOpts1");
				for(k=0;k<SelOpts1.options.length;k++){
					if(temp.value ==SelOpts1.options[k].value || email==SelOpts1.options[k].value)
					{
						alert("收件人和抄送人不能重复选择！");
						continue A;
					}
				}
				for(l=0;l<SelOpts.options.length;l++){
					if(email== SelOpts.options[l].value)
					{		
						alert("收件人不能重复选择！");
						continue A;
					}
						
				}
				var id=ids[i];
				if(id==null || id.length==0)
				{
					alert('你没有选择右移的人员！');
					return;
				}
				else
				{ 
					for(var j=SelOpts.options.length-1;j>=0;j--)
					{	
						var organIds=SelOpts.options[j].value.split(MatrixCol);
						for(var h=0;h<organIds.length;h=h+2)
						{	
							var organId=organIds[h];
							if(id==organId)
							{	
								exist=1;
								continue;
							}
						
						}
						
					}
					if(exist==1)
						{
							continue;
						}
					if(exist==0)
					{
						SelOpts.options[SelOpts.options.length] = temp;
					}
				  
				}
				}else{					
						alert("只能选择有Email地址的人员");
						continue A;
				}
				
			}
}
}
function moveRight1()
{
	var returndata=seltree.GetAllCheckData(MatrixCol);
	var returntext=seltree.GetAllCheckText(MatrixCol); 
	var returnstruId=seltree.GetAllCheckNodeId(MatrixCol);
	var returnorgantype=seltree.GetAllCheckNodeValue(MatrixCol);
	var SelOpts1 = parent.document.all("GGSelOpts1");
	var ids=returndata.split(MatrixCol);
	if(ids=="" || ids==null || ids.length==0)
				{
					alert('你没有选择右移的人员！');
					return;
				}
	var names=returntext.split(MatrixCol);
	var struId=returnstruId.split(MatrixCol);
	var organtype=returnorgantype.split(MatrixCol);
	A:
   for(var i=0;i<ids.length;i++)
		{
			var organTy=organtype[i].split("#")[1];
			if(organTy==2 || organTy==6)
			{   var arr = seltree.getChildrenNodes(struId[i]);
				B:
				  for(var k=0;k<arr.length;k++)
						{
							var nodeValue=arr[k].nodeValue.split("#")[1];
							var email=arr[k].nodeValue.split("#")[2];
							if(nodeValue==8 && email!="" && email!="null" && email!="-1")
							{	var exist=0;
								var SelOpts1 = parent.document.all("GGSelOpts1");
								
								{
								var temp=new Option(arr[k].text,arr[k].checkData+MatrixCol+arr[k].nodeValue.split("#")[2]);
								var SelOpts = parent.document.all("GGSelOpts");
								for(m=0;m<SelOpts.options.length;m++){
									if(temp.value ==SelOpts.options[m].value || email==SelOpts.options[m].value)
									{
										//alert("收件人和抄送人不能重复选择！");
										continue B;
									}
										
								}
								for(l=0;l<SelOpts1.options.length;l++){
								if(email== SelOpts1.options[l].value)
								{		
									alert("收件人不能重复选择！");
									continue B;
								}									
								}
								
								for(var j=SelOpts1.options.length-1;j>=0;j--)
								{	
									var organIds=SelOpts1.options[j].value.split(MatrixCol);
									for(var h=0;h<organIds.length;h=h+2)
									{	
										var organId=organIds[h];
										if(arr[k].checkData==organId)
										{	
											exist=1;
											continue;
										}
									
									}
									
								}
								if(exist==1)
									{
										continue;
									}
								if(exist==0)
								{
									SelOpts1.options[SelOpts1.options.length] = temp;
								}
							
						}
						
					}
			}
	}	 
	if(organTy==8)
			{	var email=organtype[i].split("#")[2];
				if(email!="" && email!="null" && email!="-1"){
					var exist=0;
				var temp=new Option(names[i],ids[i]+MatrixCol+email);
				var SelOpts = parent.document.all("GGSelOpts");
				for(k=0;k<SelOpts.options.length;k++){
					if(temp.value ==SelOpts.options[k].value || email==SelOpts.options[k].value)
					{
						alert("收件人和抄送人不能重复选择！");
						continue A;
					}
				}
				for(l=0;l<SelOpts1.options.length;l++){
					if(email== SelOpts1.options[l].value)
					{		
						alert("收件人不能重复选择！");
						continue A;
					}
						
				}
				var id=ids[i];
				if(id==null || id.length==0)
				{
					alert('你没有选择右移的人员！');
					return;
				}
				else
				{ 
					for(var j=SelOpts1.options.length-1;j>=0;j--)
					{	
						var organIds=SelOpts1.options[j].value.split(MatrixCol);
						for(var h=0;h<organIds.length;h=h+2)
						{	
							var organId=organIds[h];
							if(id==organId)
							{	
								exist=1;
								continue;
							}
						
						}
						
					}
					if(exist==1)
						{
							continue;
						}
					if(exist==0)
					{
						SelOpts1.options[SelOpts1.options.length] = temp;
					}
				  
				}
				}else{					
						alert("只能选择有Email地址的人员");
						continue A;	
				}
				
			}
}
}
function moveLeft()
{
	var SelOpts = parent.document.all("GGSelOpts");
	if (SelOpts.options.length != 0)
	{
		if (SelOpts.selcetedIndex != -1)
		{

			for (var i=0;i<SelOpts.options.length;i=i+1)
			{ 
			if (SelOpts.options[i].selected)
				{
				SelOpts.options[i]=null;
				return;
				}
			}
		}
		
	}
	
	if(SelOpts.options.length == 0)
	{
		
		alert("没有人员可以取消，请添加人员！");
		return;
	}
}
function moveLeft1()
{
	var SelOpts = parent.document.all("GGSelOpts1");
	if (SelOpts.options.length != 0)
	{
		if (SelOpts.selcetedIndex != -1)
		{

			for (var i=0;i<SelOpts.options.length;i=i+1)
			{ 
			if (SelOpts.options[i].selected)
				{
				SelOpts.options[i]=null;
				return;
				}
			}
		}
		
		
	}
	
	if(SelOpts.options.length == 0)
	{
		
		alert("没有人员可以取消，请添加人员！");
		return;
	}
}

seltree.openNodeById("1");
</script>
</BODY>

</HTML>
