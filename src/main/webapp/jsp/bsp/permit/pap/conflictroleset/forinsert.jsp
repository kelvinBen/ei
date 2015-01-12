<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-list" prefix="list"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>
<%@ page import="net.mast.web.taglib.util.Global"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>

<%
     String refreshId = (String)request.getAttribute("refreshId");
%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='date.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='list.js'/>"></script>
<script language="javascript" src="<%=SkinUtils.getJS(request,"tab.js")%>"></script>
<TITLE>�����ݽ�ɫ��ά������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript">
function checkPubConfRoleset(){
	  var setName = document.forms[0].setName;
	  //add by ë���� 20051129 ���ӶԽ�ɫ�����Ƶ�У�飬�������������ַ���
	  if ( __isQuoteIn(setName.value) )
	  {
		alert("��ɫ�����Ʋ��ܺ��������ַ���");
		tab1.doCardShow("card0");
		setName.value="";
		setName.select();
		setName.focus();
		return false;
		}
		//!!!
	  if (trim(setName.value)=="")
	  {
	     alert("�������ɫ�����ƣ�");  
	     tab1.doCardShow("card0");
	     setName.select();
	     setName.focus(); 
	     return false;
	  }
      setName.value = trim(setName.value) ;
	  var cardinality = document.forms[0].cardinality;
	  if (trim(cardinality.value)=="")
	  {
	     alert("�����������"); 
	     tab1.doCardShow("card0");
	     cardinality.select();
	     cardinality.focus(); 	        
	     return false;
	  }
      cardinality.value = trim(cardinality.value) ;
      if(!__isNum(cardinality.value) ||(cardinality.value<2) ){
         alert("���������Ǵ��ڻ����2��������");
         tab1.doCardShow("card0");
         cardinality.value="";
	     cardinality.select();
	     cardinality.focus(); 	
         return false;
      }
      var conflictRolesId = document.forms[0].conflictRolesId;
      if(conflictRolesId.options.length<cardinality.value){
        alert("��������С�ڵ��ڲ����ݽ�ɫ���Ľ�ɫ�ĸ�����");
        //20051129 ���Ӷԡ��������ľ۽�
        tab1.doCardShow("card0");
	    cardinality.select();
	    cardinality.focus(); 
	    //������
        return false ;
      }
      if(!stringLengthCheck(setName,30,"��ɫ�����Ƶĳ��Ȳ��ܳ���15���ֻ���30��Ӣ���ַ���")){
      	 tab1.doCardShow("card0");
      	 setName.value="";
	     setName.select();
	     setName.focus(); 
         return false;
  }
	  return true;
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="���������ݽ�ɫ��" >
<input type="hidden" name="refreshId" value="<%=refreshId%>">
<input type="hidden" name="conflictRolesIdList" value="">
<bsp:containbutton text="����" onclick="forSave()" action="conflictRoleSet.cmd?method=insert"></bsp:containbutton>
<bsp:containbutton text="�ָ�" onclick="forReset()"></bsp:containbutton>
<html:messages></html:messages>
<tab:tab  id="tab1" type="table">
   <tab:card id="card0" text="��ɫ��������Ϣ">
          <table width="100%" cellpadding="0" class="tblContent">                                  
		        <tr>
                   <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CONF_ROLESET.SET_NAME")%>��</td>
                   <td class="tdRight"><html:text name="setName" property="setName" size="30" maxlength="30" /><FONT COLOR=#ff0000>*</FONT></td>
                </tr>                    
		        <tr>
                   <td class="tdTitle"><%=ResourcesFactory.getString("PUB_CONF_ROLESET.CARDINALITY")%>��</td>
                   <td class="tdRight"><html:text name="cardinality" property="cardinality" size="8" maxlength="8" /><FONT COLOR=#ff0000>*����������</FONT></td>
                </tr>    
          </table>    
   </tab:card>
   <tab:card id="card1" text="�����ݽ�ɫ" > 	
                <table width="100%" cellpadding="0" class="tblContent" >    
                 <tr>
	                   <td class="tdLeft">���ý�ɫ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ݽ�ɫ��</td>
	             </tr> 
                   <tr>
                      <td>
	                    <list:pageToPage style="width:400"  type="multiImg" name="multi_0">
                                    <list:left size="10" name="availableRolesId"  multiple="true" property="availableRolesId" styleTd="align:center;width:40%" style="width:100%">
                                        <html:optionsCollection property="availableRoles" label="roleAlias" value="roleId"/>
                                    </list:left>
                                    <list:right size="10" name="conflictRolesId" multiple="true"  property="conflictRolesId" styleTd="align:center;width:40%" value="" style="width:100%">                             
                                    </list:right>
                            </list:pageToPage>
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

function forSave()
{
    if(!checkPubConfRoleset()) return;
    var rightListValue_conflictRoles="";
	var select_conflictRoles=document.all("conflictRolesId");
	var lens=select_conflictRoles.options.length;
	for(var i=0;i<=lens-1;i++)
	{
		if (i==lens-1)
		  rightListValue_conflictRoles=rightListValue_conflictRoles+select_conflictRoles[i].value;
		else 
		  rightListValue_conflictRoles=rightListValue_conflictRoles+select_conflictRoles[i].value+",";
	}
	document.all.conflictRolesIdList.value=rightListValue_conflictRoles;
    document.forms[0].action ="conflictRoleSet.cmd?method=insert";    
    document.forms[0].submit();	
	
  }
function forReset()
{  
  document.forms[0].reset();	
}
</script>