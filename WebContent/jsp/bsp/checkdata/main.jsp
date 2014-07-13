<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>

<HTML> 
<HEAD>
<TITLE>数据冗余的检查</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>

<script language="javascript">
function checkPubResources(){
      var table = document.forms[0].table;
	  if (__isQuoteIn(table.value) ){
	    alert("检查的表名不能含有特殊字符！");
	    table.value="";
	    table.select();
	    table.focus();
	    return false;
	  }
	  if (trim(table.value)==""){
	    alert("请输入需要检查的表名！");    
	    return false;
	  }
      table.value = trim(table.value) ;

	  var idName = document.forms[0].idName;
	  if (trim(idName.value)==""){
	    alert("请输入检查的字段！");    
	    return false;
	  }
      idName.value = trim(idName.value) ;
 if (__isQuoteIn(idName.value) ){
	    alert("检查的表名不能含有特殊字符！");
	    idName.value="";
	    idName.select();
	    idName.focus();
	    return false;
	  }

	  var foreignTable = document.forms[0].foreignTable;	
      if (trim(foreignTable.value)==""){
	    alert("请输入检查外键相关联的表名！");    
	    return false;
	  }
      foreignTable.value = trim(foreignTable.value) ;
	   if (__isQuoteIn(foreignTable.value) ){
	    alert("检查外键相关联的表名不能含有特殊字符！");
	    foreignTable.value="";
	    foreignTable.select();
	    foreignTable.focus();
	    return false;
	  }
	  
	  var foreignKeyName = document.forms[0].foreignKeyName;
	  if (trim(foreignKeyName.value)==""){
	    alert("请输入外键字段名称！");    
	    return false;
	  }
      foreignKeyName.value = trim(foreignKeyName.value) ;
        
	   if ( __isQuoteIn(foreignKeyName.value) ){
	    alert("外键字段名称不能含有特殊字符！");
	    foreignKeyName.value="";
	    foreignKeyName.select();
	    foreignKeyName.focus();
	    return false;
	  }

      if(!stringLengthCheck(table,60,"检查的表名不能超过60个字符!")){
        table.value="";
        table.select();
        table.focus();
        return false;
      }
      if(!stringLengthCheck(idName,60,"检查的字段不能超过60个字符!")){
        idName.value="";
        idName.select();
        idName.focus();
        return false;
      }
      if(!stringLengthCheck(foreignTable,60,"检查外键相关联的表名不能超过60个字符!")){
        foreignTable.value="";
        foreignTable.select();
        foreignTable.focus();
        return false;
      }
      if(!stringLengthCheck(foreignKeyName,60,"外键字段名称不能超过60个字符!")){
        foreignKeyName.value="";
        foreignKeyName.select();
        foreignKeyName.focus();
        return false;
      }    
	  return true
}

</script>
</HEAD>
<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="数据冗余的检查" >

<div align="center">
  <table width="100%" cellpadding="0" class="tblContent"> 
  
		    <html:hidden name="checkMethod" value="" write="true"/>
		    <tr>
                    <td class="tdTitle">检查的表名：</td>
                    <td class="tdRight"><html:text name="table"  size="40" maxlength="60" value=""/><FONT COLOR=#ff0000>*<BR>（例如检查工作地点表：PUB_WORKPLACE ）</FONT></td>
                    </tr>     
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>               
		    
		    <tr>
                    <td class="tdTitle">检查的字段：</td>
                    <td class="tdRight"><html:text name="idName"  size="40" maxlength="60" value="" /><FONT COLOR=#ff0000>*<BR>（例如检查工作地点的CANT_CODE字段：CANT_CODE）</FONT></td>
                    </tr>  
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>                   
		    
		    <tr>
                    <td class="tdTitle">检查外键相关联的表名：</td>
                    <td class="tdRight"><html:text name="foreignTable"  size="40" maxlength="60" value=""/><FONT COLOR=#ff0000>*<BR>（在PUB_CANT表中的：PUB_CANT）</FONT></td>
                    </tr>        
                    
                    <tr>
                    <td class="tdRight">&nbsp </td>
                    </tr>             
		    
		    <tr>
                    <td class="tdTitle">外键字段名称：</td>
                    <td class="tdRight"><html:text name="foreignKeyName" size="40" maxlength="60" value=""/><FONT COLOR=#ff0000>*<BR>（CANT_CODE字段是否有不存在的记录：CANT_CODE）</FONT></td>
                    </tr>         
   <tr>
                    <td class="tdTitle">说明：</td>
                    <td class="tdRight">按上面的例子填下来，即为检查在PUB_WORKPLACE表中的CANT_CODE字段是否存在这个字段的纪录在另一个外键关联的表：PUB_CANT表中没有的CANT_CODE的记录。
					<BR>换句话说，检查的结果即为PUB_WORKPLACE表存在PUB_CANT表中没有的CANT_CODE记录，如果查出记录，这些记录就是冗余的数据。</td>
                    </tr>
  </table>

  <table width="100%" cellpadding="0" class="tblContent"> 
  <tr>
  <td align="center" >
  <html:button name="button" onclick="forSave()" value="自定义检查执行"></html:button>
  <html:button name="button" onclick="forReset()" value=" 重 置 "></html:button>
</td></tr>
  </table>
<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    &nbsp;
	</td></tr>
   <tr>
   <td class="tdTitle">内置的系统检查：</td>
    <td class="tdTitle">&nbsp;</td>
   </tr>
  <tr> 
   <td align="right">
  <html:button name="button" onclick="checkOrgenaztion()" value="组织结构数据冗余的检查"></html:button>
  </td>
  <td align="Left">
  <html:button name="button" onclick="checkUser()" value="用户数据冗余度的检查    "></html:button>
</td>
</tr>
   <tr>
   <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr> 
 <tr> 
   <td align="right">
  <html:button name="button" onclick="checkRole()" value="角色数据冗余度的检查  "></html:button>
  </td>
  <td align="Left">
 <html:button name="button" onclick="checkResources()" value="功能资源数据冗余度的检查"></html:button>
 </td>
 </tr>



 
  </table>
</div>
<table width="100%" cellpadding="0" class="tblContent"> 
    <tr><td>
    &nbsp;
	</td></tr>
	  </table>

</bsp:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forSave(){
  if(!checkPubResources()) return;	
  
  document.forms[0].action ="checkDataCmd.cmd?method=userDefineCheck";
  document.forms[0].submit();

}

function forReset(){  
  document.forms[0].reset();	
}

function checkOrgenaztion(){  
  document.all("checkMethod").value="checkOrgenaztion";

	//document.forms[0].action ="check.jsp";
	document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

function checkUser(){  
  document.all("checkMethod").value="checkUser";	

  //document.forms[0].action ="check.jsp";
  document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

function checkRole(){  
 document.all("checkMethod").value="checkRole";
 
 // document.forms[0].action ="check.jsp";
  document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

function checkResources(){  
  document.all("checkMethod").value="checkResources";	

 // document.forms[0].action ="check.jsp";
  document.forms[0].action ="checkDataCmd.cmd?method=check";
  document.forms[0].submit();
}

</script>