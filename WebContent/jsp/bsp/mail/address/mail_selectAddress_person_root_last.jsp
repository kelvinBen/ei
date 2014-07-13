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
<title>������ַ��/���˵�ַ��</title>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"XMLSelTree.js")%>"></script>

</HEAD>

<BODY topmargin="10px">
<html:form  name="frmList"  action=""> 
<html:messages/>

  <table width="100%" cellpadding="0" cellspacing="0" border="0"> 
	      <tr>
	      
	         <td width="70%">
	         
	         <fieldset class="FieldsetCss" ><legend>��֯��</legend>
                <tree:selTree treeName="seltree" containId="SrcDiv" isShowElseBranch="false" type="href" hasRoot="false"  style="width:100%;height:350;overflow:auto;white-space:nowrap;" isDataAsync="false">
	  	<tree:selNode title="categoryName" nodeId="categoryId" nodeValue="categoryValue" collection="personTree" nodeXmlSrc="isLeaf" perImgSrc="perImgSrc" checkData="CheckData"  caption="">
	    </tree:selNode>
	</tree:selTree>
			</fieldset>
	         
	       
	       </td>
	         <td width=10% align=center>

<button name="btnRight" onclick="moveRight()"  class="advbutton">��</button>
<br><br>
<button name="btnLeft" onclick="moveLeft()"  class="advbutton">��</button>
<br><br><br><br>
<button name="btnRight1" onclick="moveRight1()"  class="advbutton">��</button>
<br><br>
<button name="btnLeft1" onclick="moveLeft1()"  class="advbutton">��</button>
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
//����ǻ������г��¼�  �ұ߱�ɿհ״���
//������û�����ʾ�û���ϸ
 if(node.NodeValue!=null){
 var arr = split(node.NodeValue);
 if(arr[1]!="-1")
 {
	 if(arr[1]=="0")
	 {
	 	document.forms[0].nodevalue.value = node.NodeId;
	 	//document.forms[0].nodevalue.value = arr[0]+"^"+node.NodeId;
	 	document.forms[0].nodeid.value=node.NodeId;
	 	document.forms[0].nodename.value=arr[0];
	
	 }
	 else
	 {
	 	document.forms[0].nodevalue.value = arr[2];
	 	//document.forms[0].nodevalue.value = node.NodeId+"^"+arr[2];
	 	document.forms[0].nodeid.value=node.NodeId;
	 	document.forms[0].nodename.value=arr[0];
	 }
 }else{
	 	document.forms[0].nodevalue.value = "";
 }
 
	if( arr[1] == "-1" )//����ǵ�ַ���
	{
		var nodeId=node.NodeId;
  		seltree.xmlsrc="mailaddress.cmd?method=getPersonAddressNode&parentId="+node.NodeId;
	}
		else//����ǵ�ַ�����������ϵ��
	{
		seltree.xmlsrc = "";
	}

 }
 
}

seltree.clickText=function(node)
{

 if(node.NodeValue!=null){

 var arr = split(node.NodeValue);
 
if(arr[1]!="-1")
{
	 if(arr[1]=="0")
	 {
	 	document.forms[0].nodevalue.value = node.NodeId;
	 	//document.forms[0].nodevalue.value = arr[0]+"^"+node.NodeId;
	 	document.forms[0].nodeid.value=node.NodeId;
	 	document.forms[0].nodename.value=arr[0];
	
	 }
	 else
	 {
	 	
	 	document.forms[0].nodevalue.value = arr[2];
	 	//document.forms[0].nodevalue.value = node.NodeId+"^"+arr[2];
	 	document.forms[0].nodeid.value=node.NodeId;
	 	document.forms[0].nodename.value=arr[0];
	 }
 }else{
	 	document.forms[0].nodevalue.value = "";
 }
  if(arr[1] == "-1" )//����ǵ�ַ���
	{
		var nodeId=node.NodeId;
  		seltree.xmlsrc="mailaddress.cmd?method=getPersonAddressNode&parentId="+node.NodeId;
	}
		else//����ǵ�ַ�����������ϵ��
	{
		seltree.xmlsrc = "";
	}

 } 

}


function moveRight()
{
	
	var SelOpts = parent.document.all("GGSelOpts");

	if(document.forms[0].nodevalue.value!="" && document.forms[0].nodevalue.value!="null")
	{  
	    if(document.forms[0].nodevalue.value.indexOf("@")==-1){
	        var rootUrl = '<%=SkinUtils.getRootUrl(request)%>';
            var xmlObj = new ActiveXObject("Microsoft.XMLHTTP"); 
            var url = rootUrl + "mailresource.cmd?method=getEmailAddresses&GroupId="+document.forms[0].nodevalue.value;
            var post="";
            xmlObj.open("POST",url,false);
            xmlObj.setrequestheader("content-length",post.length); 
            xmlObj.setrequestheader("content-type","application/x-www-form-urlencoded"); 
            xmlObj.send(post);     
            var msgCount = xmlObj.responseText; 
            var msgArray=msgCount.split(";");  
            for(var i=0;i<msgArray.length;i++){
            if(msgArray[i]==""||msgArray[i]=="null"){
            alert("���д���û��email��ַ����ϵ�ˣ�����޷����룡");
            return false;
                                                    }
            }	
                
	    }		
		var temp = document.createElement("OPTION");
		temp.text = document.forms[0].nodename.value;	
        temp.value = document.forms[0].nodevalue.value;
		for(i=0;i<SelOpts.options.length;i++){
		var address = "";
		if(SelOpts.options[i].value.split(MatrixCol).length>1){
			address = SelOpts.options[i].value.split(MatrixCol)[1];
		}else {
			address = SelOpts.options[i].value;
		}
		 
			if(temp.value== address)
			{		
				alert("�ռ��˲����ظ�ѡ��");
				return;
			}
				
		}
		var SelOpts1 = parent.document.all("GGSelOpts1");
		for(i=0;i<SelOpts1.options.length;i++){
		var address1 = "";
		if(SelOpts1.options[i].value.split(MatrixCol).length>1){
			address1 = SelOpts1.options[i].value.split(MatrixCol)[1];
		}else {
			address1 = SelOpts1.options[i].value;
		}
		 
			if(temp.value== address1)
			{
				alert("�ռ��˺ͳ����˲����ظ�ѡ��");
				return;
			}
				
		}
	    if(document.forms[0].nodevalue.value.indexOf("@")==-1&&SelOpts.options.length!=0){
		SelOpts.options.add(temp,0);
		}
		else{
		SelOpts.options.add(temp);
		}
	}
	else
	{
		alert("��ѡ�������Ա����ӣ�������ѡ�����Աû��E-MAIL");
		return;
	}
}
function moveRight1()
{
	var SelOpts1 = parent.document.all("GGSelOpts1");
	
	if(document.forms[0].nodevalue.value!="" && document.forms[0].nodevalue.value!="null")
	{
		if(document.forms[0].nodevalue.value.indexOf("@")==-1){
	        var rootUrl = '<%=SkinUtils.getRootUrl(request)%>';
            var xmlObj = new ActiveXObject("Microsoft.XMLHTTP"); 
            var url = rootUrl + "mailresource.cmd?method=getEmailAddresses&GroupId="+document.forms[0].nodevalue.value;
            var post="";
            xmlObj.open("POST",url,false);
            xmlObj.setrequestheader("content-length",post.length); 
            xmlObj.setrequestheader("content-type","application/x-www-form-urlencoded"); 
            xmlObj.send(post);     
            var msgCount = xmlObj.responseText; 
            var msgArray=msgCount.split(";");  
            for(var i=0;i<msgArray.length;i++){
            if(msgArray[i]==""||msgArray[i]=="null"){
            alert("���д���û��email��ַ����ϵ�ˣ�����޷����룡");
            return false;
                                                    }
            }	    
	    }
	    var temp = document.createElement("OPTION");
		temp.text = document.forms[0].nodename.value;	
        temp.value = document.forms[0].nodevalue.value;
		for(i=0;i<SelOpts1.options.length;i++){
		var address = "";
		if(SelOpts1.options[i].value.split(MatrixCol).length>1){
			address = SelOpts1.options[i].value.split(MatrixCol)[1];
		}else {
			address = SelOpts1.options[i].value;
		}		 
			if(temp.value== address)
			{
				alert("�����˲����ظ�ѡ��");
				return;
			}
				
		}
		var SelOpts = parent.document.all("GGSelOpts");
		for(i=0;i<SelOpts.options.length;i++){
		var address1 = "";
		if(SelOpts.options[i].value.split(MatrixCol).length>1){
			address1 = SelOpts.options[i].value.split(MatrixCol)[1];
		}else {
			address1 = SelOpts.options[i].value;
		}
		 
			if(temp.value== address1)
			{
				alert("�����˺��ռ��˲����ظ�ѡ��");
				return;
			}
				
		}
	    if(document.forms[0].nodevalue.value.indexOf("@")==-1&&SelOpts1.options.length!=0){
		SelOpts1.options.add(temp,0);
		}
		else{
		SelOpts1.options.add(temp);
		}
	}
	else
	{
		alert("��ѡ�������Ա����ӣ�������ѡ�����Աû��E-MAIL");
		return;
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
		
		alert("û����Ա����ȡ�����������Ա��");
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
		
		alert("û����Ա����ȡ�����������Ա��");
		return;
	}
}

</script>
</BODY>

</HTML>
