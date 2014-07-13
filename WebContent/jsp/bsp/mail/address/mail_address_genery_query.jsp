<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<HTML>
<HEAD>
<TITLE>查询联系人</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<%
	String url="<img src=\""+SkinUtils.getImage(request, "322.gif")+"\">";
	String addressName = "";
	String addressEmail = "";
	String addressType = "";

	if(request.getParameter( "personBack" )!=null && request.getParameter( "personBack" ).equals("1"))
	{
		if(request.getParameter("addressName_1")!=null)
		{
			//addressName = (String)request.getAttribute("addressName_1");
			addressName = request.getParameter("addressName_1");
		}
		if(request.getParameter("addressEmail_1")!=null)
		{
			//addressEmail = (String)request.getAttribute("addressEmail_1");
			addressEmail = request.getParameter("addressEmail_1");
		}
		if(request.getParameter("addressType_1")!=null)
		{
			//addressType = (String)request.getAttribute("addressType_1");
			addressType = request.getParameter("addressType_1");
		}
	}
	else
	{
		if(request.getAttribute("addressName")!=null)
		{
			addressName = (String)request.getAttribute("addressName");
		}
		if(request.getAttribute("addressEmail")!=null)
		{
			addressEmail = (String)request.getAttribute("addressEmail");
		}
		if(request.getAttribute("addressType")!=null)
		{
			addressType = (String)request.getAttribute("addressType");
		}
	}
%>


<bsp:container title="查询联系人" >
<html:form name="frmList" action="">
<bsp:containbutton onclick="forAllSelect()" name="btn_all_select" text="全部选择" ></bsp:containbutton>
<bsp:containbutton name="butt" text="新建邮件" onclick="forInsert()" ></bsp:containbutton>
<bsp:containbutton name="butt1" text="修改联系人" onclick="forUpdatePerson()" ></bsp:containbutton>
<table id="tblSearch">
	<tr>
    		<td nowrap>地址类别：</td>
            <td>
            <html:select name="addressType" value="<%=addressType%>">
	                        <html:options collection="MAILADDRESS_CATEGORY_COLLECTION" labelProperty="categoryName" property="categoryId"/>
	                    </html:select>
	                    </td>
            <td nowrap>联系人/组名：</td>
            <td><html:text name="addressName"  size="20" maxlength="80" value="<%=addressName%>"></html:text>
            </td>
            <td nowrap>邮箱地址：</td>
            <td><html:text name="addressEmail" size="20" maxlength="35" value="<%=addressEmail%>" ></html:text>
            </td>
            
            <td>
            <flex:searchImg name="chaxun" action="" image="search.gif"/>
            </td>
     </tr>  
</table>

<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
                       <flex:checkboxCol caption="选择" width="50" property="addressId" canSort="false"  name="primaryKey" sortName="PUB_MAIL_ADDRESS.ADDRESS_ID"></flex:checkboxCol>
                          <flex:flexCol caption='姓名' width="200" property="addressName" name="addressName" sortName="PUB_MAIL_ADDRESS.ADDRESS_NAME" ></flex:flexCol>
                          <flex:flexCol caption='邮箱地址' width="160" property="addressEmail" name="addressEmail" sortName="PUB_MAIL_ADDRESS.ADDRESS_EMAIL" ></flex:flexCol>
                          <flex:flexCol caption='联系人/组Type' width="100" property="addressType" name="addressType" sortName="PUB_MAIL_ADDRESS.ADDRESS_TYPE" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='联系人/组' width="100" property="addressType" name="addressType" sortName="PUB_MAIL_ADDRESS.ADDRESS_TYPE" type="enum" enumCollection="MAILADDRESS_ADDRESSTYPE_COLLECTION" enumKey="key" enumValue="value" ></flex:flexCol>
                          <flex:flexCol caption='地址类别' width="200" property="categoryId" name="categoryId" sortName="PUB_MAIL_ADDRESS.CATEGORY_ID" type="enum" enumCollection="MAILADDRESS_CATEGORY_COLLECTION" enumKey="categoryId" enumValue="categoryName"></flex:flexCol>
                          
</flex:flexgrid>
<flex:pagePolit action="" pageSize="15" nextPageClick="javascript:search()" turnPageClick="javascript:search()" previusPageClick="javascript:search()">
</flex:pagePolit>
</html:form>
</bsp:container>

<script language="javascript">
grid.show();
grid.setSumText("");

function search()
{
		//document.forms[0].action ="mailaccountgeneryquery.cmd";    
	    //document.forms[0].submit();	
		window.location.href="mailaccountgeneryquery.cmd?addressType=<%=addressType%>&addressName=<%=addressName%>&addressEmail=<%=addressEmail%>";	
}

function forUpdatePerson()
{
	if(!getSelect()) return;
	//var rowIndex=grid.getCurrentLine();
	//document.forms[0].action ="mailaddress.cmd?method=forupdate&primaryKey="+grid.getCellValue(rowIndex,1);
	document.forms[0].action="mailaddress.cmd?method=forupdate&personBack=1";
	document.forms[0].submit();	
}

function forInsert(){
	
	if(!getSelect1()) return;
	var dataAll=grid.getCheckAll();
	var nameStr = "";
	var mailOrId = "";
	var arrF = dataAll.split("|");
	var arrS1 = new Array();
	for(var i=0;i<arrF.length;i++)
	{
		arrS1 = arrF[i].split(",");
		if(arrS1[3]=="0")
		{
			nameStr+=arrS1[1]+";";
			mailOrId+=arrS1[0]+";";
		}
		else
		{
			nameStr+=arrS1[1]+";";
			mailOrId+=arrS1[2]+";";
		}
	}
	var name = nameStr.substring(0,nameStr.lastIndexOf(";"));
	var mail = mailOrId.substring(0,mailOrId.lastIndexOf(";"));
	document.forms[0].action ="mailresource.cmd?method=forinsertAddrss&name="+name+"&mail="+mail;    
    document.forms[0].submit();	
}

function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条纪录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条纪录!");
    return false;
  }  
  return true;
}
function getSelect1()
{
	var sel=grid.getCheckLine();
  	if(sel==""){
    alert("请选择一条纪录或多条纪录!");
    return false;
  }
  return true;
}
var flag=true;
function forAllSelect(){
	var btn_all_select=event.srcElement;
  	if(flag==true){
  		btn_all_select.value="取消全选";
  		grid.doCheckAllLine(true);
  		flag=false;
  	}else{
  		btn_all_select.value="全部选择";
  		grid.doCheckAllLine(false);
  		flag=true;
  	}
}
</script>