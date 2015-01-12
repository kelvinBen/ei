<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>


<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='MultiSelect.js'/>"></script>

</HEAD>

<BODY topmargin="10px" style="padding:0;margin:0" scroll=no>
<html:form  name="frmList"  action=""> 
<html:messages/>
<%
	String id = (String)request.getAttribute("id");
	String name = (String)request.getAttribute("name");
	String msg = (String)request.getAttribute("msg");
	%>
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="name" value="<%=name%>">
<input type="hidden" name="msg" value="<%=msg%>">
<fieldset class="FieldsetCss" ><legend>把<%=msg%>添加到组</legend>
<table width="100%" cellpadding="0" height="50%" cellspacing="0"> 
  
  <tr>
          <td class="tdTitle"><%=ResourcesFactory.getString("MAIL_ADDRESS_CATEGORY.CATEGORY_NAME")%>:</td>
          <td class="tdRight">
          <html:multiSelect name="categoryId" property="categoryId"  onchange="onChangeCategory();">	
	               <html:multiOptions collection="MAILADDRESS_CATEGORY_COLLECTION" labelProperty="CATEGORY_NAME" property="CATEGORY_ID"/>               	                
	      </html:multiSelect>
	      </td>
   </tr>
  <tr>
          <td class="tdTitle">
          <html:radio name="chooseGroupType" value="1"  >存在分组:</html:radio>
          </td>
          <td class="tdRight">
         <html:multiSelect name="groupName" property="groupName" > 
         
         </html:multiSelect>
	      </td>
   </tr>   
    <tr>
           <td class="tdTitle">
           <html:radio name="chooseGroupType" value="2" >新建分组:</html:radio>
           </td>
           <td class="tdRight"><input name="groupName2" value="" size="26" /></td>
    </tr> 
  
</table>
  </fielset>
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
var ss=new MultiSelect("ss");
document.all("chooseGroupType")[0].checked=true;
this.onChangeCategory();

function onChangeCategory(){
 ss.fillData('categoryId','groupName',"mailaddress.cmd?method=forGroupList&categoryId="+document.all('categoryId').value);  
}
function showcheckdata(){
	var id = document.all("id");
	var name = document.all("name");
	var msg = document.all("msg");
	var categoryId = document.all("categoryId");
	var groupName2 = document.all("groupName2");
	var groupId = document.all("groupName").value;
	var chooseGroup= document.all("chooseGroupType")[0].checked;
        if(categoryId.value==null || ""==categoryId.value){
		alert("个人地址本中还没有设置地址类别，请先设置地址类别");
		return false;
	}
	//如果选择存在的组
	if(chooseGroup==true){
	if(groupId==""){
	alert("不可选择空组！");
	return false;
	}else{
	self.location="mailaddress.cmd?method=insertGroupAndCard&id="+id.value+"&name="+name.value+"&groupId="+groupId + "&categoryId=" + categoryId.value + "&msg=" + msg.value+"&gtype=1" ;
	}
	}
	//如果新建组
	else{	
	if(groupName2.value==null || ""==groupName2.value){
		alert("请输入组名称!");
		return false;
	}
	self.location="mailaddress.cmd?method=insertGroupAndCard&id="+id.value+"&name="+name.value+"&groupName="+groupName2.value + "&categoryId=" + categoryId.value + "&msg=" + msg.value+"&gtype=2" ;
	}
}

function forCancel(){
	var msg =document.all("msg");
	parent.display(msg.value);
}


</script>
</BODY>

</HTML>
