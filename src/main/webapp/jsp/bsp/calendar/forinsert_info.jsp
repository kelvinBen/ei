<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="java.util.*"%>

<%
String organName = (String) request.getAttribute("organName");
%>
<script language="javascript">
function check(){
    var year = document.all.year.value;
    if(trim(year)==""){
       alert("请输入年份！");
       document.all.year.focus();
       return false;
    }
    if(!__isNum(year)){
       alert("输入年份不是合法数字！");
       document.all.year.value="";
       document.all.year.focus();
       return false;
    }
    var year_exit = document.all.year_exit;
    for(var i=0;i<year_exit.options.length;i++){
       if(year==year_exit.options[i].value.substring(0,4)){
          alert("已经存在该年份！");
          document.all.year.value="";
          document.all.year.focus();
          return false;
       } 
    }
    return true;
}
</script>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css"
	href="<mast:ui css='css-xp4.css'/>">
<script language="javascript"
	src="<mast:ui js='mastfunction.js'/>"></script>
</HEAD>

<BODY topmargin="10px" onkeydown="forKey()">
	<bsp:container title="增加工作日历">
		<bsp:containbutton text="确定" onclick="forinsert()"></bsp:containbutton>
		<bsp:containbutton text="关闭" onclick="forReset()"></bsp:containbutton>
		<table width="100%" cellpadding="0" class="tblContent">
			<tr>
				<td>机构名称：<%=organName%></td>
				<td></td>
			</tr>
			<tr>
				<td>输入年份：<input type="text" name="year" value="" size="4"
					maxlength="4">(比如:2004)<FONT COLOR=#ff0000>*</FONT></td>
				<td>已有年份： <html:select name="year_exit" value="">
					<html:options collection="list" labelProperty="OBJECTNAME"
						property="OBJECTID" />
				</html:select></td>

			</tr>
		</table>
	</bsp:container>
</BODY>
</HTML>
<script language="javascript">
  function forinsert(){
     if(!check()) return;
     var returnV = document.all("year").value;
     window.returnValue=returnV;
     parent.close();
  }
  function forReset(){  
        parent.close();	
  }
  function forKey(){  
     if(event.keyCode==13)
        return;
        }
</script>
