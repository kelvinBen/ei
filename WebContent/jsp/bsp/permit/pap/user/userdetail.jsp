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

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<link rel="stylesheet" type="text/css" href="<%=SkinUtils.getCSS(request,"editgrid.css")%>">
<script language="javascript" src="<%=SkinUtils.getJS(request,"grid.js")%>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
</HEAD>
<% 
    String refreshId = (String) request.getAttribute("refreshId");
	String corporationId = (String) request.getAttribute("corporationId");
%>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<input type="hidden" name="grantedRolesIdList" value="">
<input type="hidden" name="agentUsersIdList" value="">

<bsp:container title="��ϸ�û�" >
<bsp:containbutton text="�޸�" onclick="forupdate()" action ="user.cmd?method=forupdateuser"></bsp:containbutton>
<html:messages/>


<tab:tab  id="tab1" type="table">

<tab:card id="card0" text=" һ����Ϣ  ">
  <table width="100%" cellpadding="0" class="tblContent">
  
  		<tr>
                <td class="tdTitle">�ʻ���</td>
                <td class="tdRight"><html:hidden name="userId"  property="userId" write="true"/></td>
                </tr>  
                    
                <tr>
                <td class="tdTitle">�������ƣ�</td>
                <td class="tdRight"><html:hidden name="userName"  property="userName" write="true" /></td>
                </tr> 
                      

                <tr>   
                <td class="tdTitle">��ȫ����</td>
                <td class="tdRight"> <html:label name="securityLevel"  property="securityLevel" collection="securityLevelCollection" labelProperty="LEVEL_NAME"  labelKey="SECURITY_LEVEL"/> </td>
               </tr>
                
                <tr>
                <td class="tdTitle">�������ˣ�</td>
                <td class="tdRight"><html:hidden name="corporationName"  property="corporationName" write="true"/></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">�������ţ�</td>
                <td class="tdRight"><html:hidden name="departmentName"  property="departmentName" write="true" /></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">Ա���ţ�</td>
                <td class="tdRight"><html:hidden name="employeeName"  property="employeeName" write="true" /></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">�����������Ự����</td>
                <td class="tdRight"><html:hidden name="maxSessions"  property="maxSessions"  write="true"/></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">E_MAIL��</td>
                <td class="tdRight"><html:hidden name="email"  property="email" write="true"/></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">MSN��</td>
                <td class="tdRight"><html:hidden name="msn"  property="msn" write="true"/></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">QQ��</td>
                <td class="tdRight"><html:hidden name="qq"  property="qq"  write="true"/></td>
                </tr> 
                
                <tr>
                <td class="tdTitle">MOBILE��</td>
                <td class="tdRight"><html:hidden name="mobile"  property="mobile" write="true"/></td>
                </tr> 
                
              
                <html:hidden name="char1"  property="char1" />
                <html:hidden name="char2"  property="char2" />
                <html:hidden name="num1"  property="num1" />
                <html:hidden name="num2"  property="num2"  />
                
                <tr>
                <td class="tdTitle">״̬</td>
                <td class="tdRight">
                <html:radio name="accountStatus" property="accountStatus" value="00"/>����
                <html:radio name="accountStatus" property="accountStatus" value="11" />��
                </td>
                </tr>
                
   </table>
</tab:card>

<tab:card id="card1" text=" ��ɫ  " >
  <table width="100%" cellpadding="0" class="tblContent" >
          <tr>
          <td class="tdLeft">���ý�ɫ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ľ�ɫ��</td>
          </tr>  
	  <tr>
    	  <td> 
	   <list:pageToPage style="width:400"  type="multiImg" name="multi_0" disabled="true" >
            <list:left size="10" name="availableRolesId"  multiple="true" property="userId" styleTd="align:center;width:40%" style="width:100%">
                 <html:optionsCollection property="availableRoles" label="roleAlias" value="roleId"/>
           </list:left>
           <list:right size="10" name="grantedRolesId" multiple="true" styleTd="align:center;width:40%" value="" style="width:100%">
                <html:optionsCollection property="grantedRoles" label="roleAlias" value="roleId"/>
           </list:right>
          </list:pageToPage>
         </td>
         </tr>               
 </table>
 </tab:card>
	<tab:card id="card2" text=" �����û�  ">
	<table cellpadding="0" class="tblContent"><tr>
	<td class="tdLeft">
		 <table width="200" cellpadding="0">
		 <tr class="tdLeft">�Ѿ������˵�ǰ�ʻ����û���</tr>
		 <tr>
			<td>
			<html:select   name="agentUsersId" value="" size="10" style="width:100%">
				<html:optionsCollection property="agentUsers" label="userName" value="userId"/>
			</html:select>
			</td>
	  	</tr>
     	 </table>
	</td>

</tr></table>
</tab:card>

<tab:card id="card3" text=" ����Ȩ��  ">
   
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
		f.src = "userselfdatarefquery.cmd?userId="+userId+"&corporationId="+"<%=corporationId%>&update=false";
		tab1.doCardShow("card0");	
		//var refreshId ="<%=refreshId%>";
		//if(getTreeFrame().seltree!=null)
		//getTreeFrame().seltree.refreshNodeById(refreshId);
	}
		tab1.doCardClick=function(card){
		if (card.id=="card3"){
		      //����һ�³�ʱ����,��ֹ�״ν���̫��ʱ�ű���ʾ����  ������2006-02-09
              setTimeout(dataRefShow,100);  
			}
	}
	
   function dataRefShow(){
      if(document.frames["dataFrame0"].dataResources !=null){
	    document.frames["dataFrame0"].dataResources.show();
	    document.frames["dataFrame0"].dataResources.setSumText("");
	  }
  }
  function forupdate(){
       document.forms[0].action ="user.cmd?method=forupdateuser";    
       document.forms[0].submit();	
  }
</script>
