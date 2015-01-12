<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.bsp.permit.pap.view.UserView"%>
<%@ page import="net.mast.bsp.permit.pap.view.AgentUserView"%> 

<HTML>   
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<script language="javascript">
function checkPubUsers(){
      var email= document.forms[0].email;
      if(trim(email.value)!=""){
        if(!__checkEmail(email.value)){
          alert("E_MAIL的格式不正确,请重新输入。");
           tab1.doCardShow("card0");
          email.value="";
          email.select();
          email.focus();
          return false;
        }
      }
      var msn = document.forms[0].msn;
      if(trim(msn.value)!=""){
        if(!__checkEmail(msn.value)){
          alert("MSN的格式不正确,请重新输入。");
           tab1.doCardShow("card0");
          msn.value="";
          msn.select();
          msn.focus();
          return false;
        }
     }
     var qq = document.forms[0].qq;
      if(trim(qq.value)!=""){
        if(!__isNum(qq.value)){
          alert("QQ必须是数字。");
           tab1.doCardShow("card0");
          qq.value="";
          qq.select();
          qq.focus();
          return false;
        }
      }
      var mobile = document.forms[0].mobile;
      if(trim(mobile.value)!=""){
        if(!__isNum(mobile.value)){
          alert("MOBILE必须是数字。");
           tab1.doCardShow("card0");
          mobile.value="";
          mobile.select();
          mobile.focus();
          return false;
        }
      }
	return true
}

</script>
</HEAD>
<% 
    String refreshId = (String) request.getAttribute("refreshId");
	String corporationId = (String) request.getAttribute("corporationId");
	UserView userView = (UserView)request.getAttribute(Global.getString("html.data"));
	List availableAgentUsersList = (List)userView.getAvailableAgentUsers();
 
		String name = "";
		String id = ""; 
		for(int i=0;i<availableAgentUsersList.size();i++){
			AgentUserView view =(AgentUserView)availableAgentUsersList.get(i);
	 
			name = name+ view.getUserName();
			id = id+ view.getUserId();
			if(i!=availableAgentUsersList.size()-1){
				name = name + ",";
				id = id + ",";
			} 
		}
%>

<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<input type="hidden" name="grantedRolesIdList" value="">
<input type="hidden" name="agentUsersIdList" value="">
<input type="hidden" name="beAgentUsersIdList" value="">
<input type="hidden" name="user_name" value="<%=name%>">
<input type="hidden" name="user_id" value="<%=id%>"> 

<bsp:container title="修改用户" >
<bsp:containbutton text="确定" onclick="forSave()" action ="user.cmd?method=updateuser"></bsp:containbutton>


<html:messages/>


<tab:tab  id="tab1" type="table">

<tab:card id="card0" text=" 一般信息  ">
  <table width="100%" cellpadding="0" class="tblContent">
  
  		<tr>
                <td class="tdTitle">帐户：</td>
                <td class="tdRight"><html:hidden name="userId"  property="userId" write="true"/></td>
                </tr>  
                    
                <tr>
                <td class="tdTitle">中文名称：</td>
                <td class="tdRight"><html:hidden name="userName"  property="userName" write="true"/></td>
                </tr> 
                <html:hidden name="password" property="password" />
                
                <html:hidden name="accountStatus" property="accountStatus" />            
              
               <tr>   
                <td class="tdTitle">安全级别：</td>
                <td class="tdRight"> <html:label name="securityLevel"  property="securityLevel" collection="securityLevelCollection" labelProperty="LEVEL_NAME"  labelKey="SECURITY_LEVEL"/>
               </td>
               </tr>
                
                <tr>
                <td class="tdTitle">允许创建的最大会话数：</td>
                <td class="tdRight"><html:hidden name="maxSessions"  property="maxSessions" write="true" /></td>
                </tr> 
                
                 
                <html:hidden name="isCpublic" property="isCpublic" />
        
                
                <html:hidden name="createTime" property="createTime"/>
                
                <tr>
                <td class="tdTitle">所属法人：</td>
                <td class="tdRight"><html:hidden name="corporationName" property="corporationName" write="true"/></td>
                </tr>   
				<html:hidden name="employeeId" property="employeeId" />
                <html:hidden name="departmentId"  property="departmentId" />  
                <html:hidden name="corporationId"  property="corporationId" write="false" />  
                <tr>
                <td class="tdTitle">E_MAIL：</td>
                <td class="tdRight"><html:text name="email"  property="email" size="20" maxlength="30" /></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">MSN：</td>
                <td class="tdRight"><html:text name="msn"  property="msn" size="20" maxlength="30" /></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">QQ：</td>
                <td class="tdRight"><html:text name="qq"  property="qq" size="20" maxlength="30" /></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">MOBILE：</td>
                <td class="tdRight"><html:text name="mobile"  property="mobile" size="20" maxlength="30" /></td>
                </tr> 
                
                <html:hidden name="char1"  property="char1" />
                <html:hidden name="char2"  property="char2" />
                <html:hidden name="num1"  property="num1" />
                <html:hidden name="num2"  property="num2"  />
                <html:hidden name="accountStatus" property="accountStatus"/>

                
   </table>
</tab:card>

<tab:card id="card1" text=" 代理用户  ">
	 <table width="" cellpadding="0" class="tblContent">
		<tr><td  class="tdLeft">
			 <table width="200" cellpadding="0">
			 <tr class="tdLeft">已经代理了当前帐户的用户：</tr>
			 <tr>
				<td>
				<html:select  name="agentUsersId" value="" size="10"  multiple="true" style="width:200">
					<html:optionsCollection property="agentUsers" label="userName" value="userId" />
				</html:select>
				</td>

				<td>
				<html:button name="" value="增加" onclick="addAgentUser()" />
				<br>
				<br>
				<html:button name="" value="删除" onclick="delAgentUser()" />
				</td>
			</tr>
			</table></td>
			<td width="100%" class="tdLeft">&nbsp;</td>
		</tr>
	 </table>
</tab:card>
<tab:card id="card2" text=" 数据权限  ">
   <table width="100%" cellpadding="0" class="tblContent" >    
	      <tr>
	         <td>
               <iframe style="display:block" id="dataFrame0" width="100%" height="350" frameborder="0"></iframe>
	         </td>
          </tr>  
   </table> 
</tab:card>
</tab:tab>
</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
init();
	function init(){				
		var userId = document.all("userId").value;
		var f = document.getElementById("dataFrame0");
		f.src = "userselfdatarefquery.cmd?userId="+userId+"&update=true&addnobuttom=true";
			tab1.doCardShow("card0");		
			//var refreshId ="<%=refreshId%>";
			//if(getTreeFrame().seltree!=null)
			//getTreeFrame().seltree.refreshNodeById(refreshId); 		
	}
  tab1.doCardClick=function(card){
  	if (card.id=="card2"){
	  document.frames["dataFrame0"].dataResources.show();
	  document.frames["dataFrame0"].dataResources.setSumText("");
    } 
  }
function forquery(){
    var queryUserName = document.forms[0].queryUserName.value;
	
	var user_name = document.all("user_name").value;
	var user_id = document.all("user_id").value;
	
	var nameObj1 = user_name.split(",");
	var idObj1 = user_id.split(",");
	
	var nameObj2 = Array();
	var idObj2 = Array();
	var num = 0; 
	for(var i = 0;i<nameObj1.length;i++){
		if(nameObj1[i].indexOf(queryUserName.trim())!=-1){
			nameObj2[num] = nameObj1[i];
			idObj2[num] = idObj1[i];
			num++;
		}
	}				 
	var sel=document.all("availableAgentUsersId");
	var len=sel.options.length;
	for(var i=0;i<len;i++)
	{	
		var opt=sel.options[0];
		opt.removeNode(true);
	}
	for(var i=0;i<num;i++){
		var newopt=document.createElement("OPTION");
		newopt.innerText=nameObj2[i];
		newopt.value=idObj2[i];
		sel.appendChild(newopt);
	}
}

  function  isDefault(){
      var row = dataResources.getCurrentLine();
      var type = dataResources.getCellValue(row,3);
      var value = dataResources.getCellValue(row,5);
      var select = dataResources.getCellObject(row,5);
      if(value=="0") {
           alert("有且仅有一个缺省值！");
           select.options[0].selected =true;
           select.onblur();
           return;
        }
      else {
          var total = dataResources.returnRowCount();
          for(var i=1;i<row;i++){
             var type1 = dataResources.getCellValue(i,3);
             var default1 = dataResources.getCellValue(i,5);
             var select1 = dataResources.getCellObject(i,5);
             if(type1==type && default1==value){
                select1.options[1].selected = true;
                select1.onblur();
                return ;
             }
           }
           for(var i=row+1;i<total+1;i++){
             var type1 = dataResources.getCellValue(i,3);
             var default1 = dataResources.getCellValue(i,5);
             var select1 = dataResources.getCellObject(i,5);
             if(type1==type && default1==value){
                select1.options[1].selected = true;
                select1.onblur();
                return ;
             }
           }
      }
  }
  function forSave(){
    if(!checkPubUsers()) return;  
    tab1.doCardShow("card0");    
	var rightListValue_agentUsers="";
	var select_agentUsers=document.all("agentUsersId");
	var lens=select_agentUsers.options.length;
	for(var i=0;i<=lens-1;i++)
	{
		if (i==lens-1)
		  rightListValue_agentUsers=rightListValue_agentUsers+select_agentUsers.options[i].value;
		else 
		  rightListValue_agentUsers=rightListValue_agentUsers+select_agentUsers.options[i].value+",";
	}
	document.all.agentUsersIdList.value=rightListValue_agentUsers;
	   document.frames["dataFrame0"].document.forms[0].action="userdataref.cmd?method=update";
	   document.frames["dataFrame0"].document.forms[0].submit();
       document.forms[0].action ="user.cmd?method=updateuser";    
       document.forms[0].submit();	
  }
  var delagentopts = "";//代理用户删除的option应该在树中显示出来
  
  	function getSelOpis(list){
		var len=list.options.length;
		var opis=new Array();
		var j=0;
		for(var i=0;i<len;i++){
			if(list.options[i].selected)
				opis[j++]=list.options[i];
		}
		return opis;
	}

	function addOptions(list,opiVals,opiTits){
		if(opiVals!=""&&opiTits!=""){
			var vals=opiVals.split(",");
			var tits=opiTits.split(",");
			var len=vals.length>tits.length?tits.length:vals.length;
			for(var i=0;i<len;i++){
				var newOpi=document.createElement("<OPTION>");
				list.options.add(newOpi);
				newOpi.value=vals[i];
				newOpi.innerText=tits[i];
				
			}
		}	
	}
  
  //增加代理用户
	function addAgentUser(){
		var list = document.all("agentUsersId");
		var viewagentopts = "";//界面上显示的option
		for(var i=0;i<list.options.length;i++){
			viewagentopts = viewagentopts+list.options[i].value+",";
		}
		var userId = document.all("userId").value;
		var cmdUrl="user.cmd&method=getAvailableAgentUsersCheckRoot&userId="+userId+"&viewagentopts="+viewagentopts.substring(0,viewagentopts.length-1)+"&delagentopts="+delagentopts.substring(0,delagentopts.length-1);
		var url ="jsp/help.jsp?url="+cmdUrl;  
		var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
		if (win == null) {  
			return;
	  	}else{
			addOptions(list,win[0],win[1]);
	  	}
	  	delagentopts="";//清空删除的option
	}

	//删除代理用户
	function delAgentUser(){
		var list = document.all("agentUsersId");
		var dels=getSelOpis(list);
		var len=dels.length;
		var i=0;
		for(var j=0;j<list.options.length;j++)
			if(list.options[j]==dels[i]){
				delagentopts = delagentopts+list.options[j].value+",";
				list.options.remove(j--);
				i++;
		}
	}
</script>
